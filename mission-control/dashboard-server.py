#!/usr/bin/env python3
"""
Command Arena Dashboard Server

Serves the Command Arena dashboard and provides API endpoints
for real-time agent life force visualization.

Usage:
    python3 dashboard-server.py [port]

Default port: 8707 (Mission Control ID: 48707)
"""

import http.server
import socketserver
import json
import os
import sys
from datetime import datetime
from pathlib import Path

# Configuration
DEFAULT_PORT = 8707
BASE_DIR = Path(__file__).parent.parent
STATE_FILE = BASE_DIR / "mission-control" / "state.json"
CURRENT_STATUS_FILE = BASE_DIR / "CURRENT_STATUS.md"
SESSION_TIMELINE_FILE = BASE_DIR / "SESSION_TIMELINE.md"
AGENT_REGISTRY_FILE = BASE_DIR / "AGENT_REGISTRY.md"


class CommandArenaHandler(http.server.SimpleHTTPRequestHandler):
    """Custom HTTP handler for Command Arena dashboard"""

    def do_GET(self):
        """Handle GET requests"""

        # API endpoint for state
        if self.path == '/api/state':
            self.send_json(self.get_state())
            return

        # API endpoint for Ali status
        elif self.path == '/api/ali-status':
            self.send_json(self.get_ali_status())
            return

        # API endpoint for agents
        elif self.path == '/api/agents':
            self.send_json(self.get_agents())
            return

        # Serve HTML dashboard
        elif self.path == '/' or self.path == '/index.html':
            self.path = '/mission-control/command-arena.html'

        # Default file serving
        return super().do_GET()

    def send_json(self, data):
        """Send JSON response"""
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        self.wfile.write(json.dumps(data, indent=2).encode())

    def get_state(self):
        """Read and return mission control state"""
        try:
            if STATE_FILE.exists():
                with open(STATE_FILE, 'r') as f:
                    return json.load(f)
            else:
                return self.get_mock_state()
        except Exception as e:
            print(f"Error reading state: {e}")
            return self.get_mock_state()

    def get_ali_status(self):
        """Parse Ali status from SESSION_TIMELINE.md"""
        try:
            if not SESSION_TIMELINE_FILE.exists():
                return {
                    "status": "AVAILABLE",
                    "last_response": "2025-11-10",
                    "hours_since": 1
                }

            with open(SESSION_TIMELINE_FILE, 'r') as f:
                content = f.read()

            # Parse status line (simple regex would be better in production)
            status = "AVAILABLE"
            if "DELAYED" in content:
                status = "DELAYED"
            elif "UNAVAILABLE" in content:
                status = "UNAVAILABLE"
            elif "EXTENDED" in content:
                status = "EXTENDED"

            return {
                "status": status,
                "last_response": "2025-11-10",
                "hours_since": 1
            }
        except Exception as e:
            print(f"Error reading Ali status: {e}")
            return {"status": "AVAILABLE", "last_response": "Unknown", "hours_since": 0}

    def get_agents(self):
        """Parse agents from AGENT_REGISTRY.md"""
        try:
            if not AGENT_REGISTRY_FILE.exists():
                return {"active": [], "standby": []}

            with open(AGENT_REGISTRY_FILE, 'r') as f:
                content = f.read()

            # Simple parsing (would use proper markdown parser in production)
            agents = []

            # Look for AGENT-##### patterns
            lines = content.split('\n')
            current_agent = None

            for line in lines:
                if line.startswith('### AGENT-'):
                    # New agent entry
                    if current_agent:
                        agents.append(current_agent)

                    current_agent = {
                        "agent_id": line.split()[1],
                        "gender": "broski",
                        "role": "Unknown",
                        "rating": 0.0,
                        "sessions": 0,
                        "status": "STANDBY"
                    }

                elif current_agent:
                    if line.startswith('**Role(s)**:'):
                        current_agent['role'] = line.split(':')[1].strip()
                    elif line.startswith('**Performance Rating**:'):
                        try:
                            rating_str = line.split(':')[1].strip().split()[0]
                            current_agent['rating'] = float(rating_str)
                        except:
                            pass
                    elif line.startswith('**Status**:'):
                        status = line.split(':')[1].strip().upper()
                        current_agent['status'] = status

            if current_agent:
                agents.append(current_agent)

            # Separate into active and standby
            active = [a for a in agents if a['status'] == 'ACTIVE']
            standby = [a for a in agents if a['status'] == 'STANDBY']

            return {"active": active, "standby": standby}

        except Exception as e:
            print(f"Error parsing agents: {e}")
            return {"active": [], "standby": []}

    def get_mock_state(self):
        """Return mock state when real state unavailable"""
        return {
            "mission_control_id": "48707",
            "status": "OPERATIONAL",
            "active_missions": [
                {
                    "mission_id": "M-001",
                    "name": "Constitutional Gap Resolution",
                    "status": "COMPLETED",
                    "progress": "100%"
                }
            ],
            "flash_messages": {
                "critical": [],
                "info": [
                    "✅ All 5 CIPs successfully implemented",
                    "📜 Constitution updated to v3.1.0",
                    "🔄 Emergency procedures operational"
                ]
            },
            "agent_status": {
                "active": [],
                "standby": [
                    {
                        "agent_id": "AGENT-00001",
                        "gender": "broski",
                        "role": "Builder",
                        "rating": 0.0,
                        "sessions": 0,
                        "status": "STANDBY"
                    },
                    {
                        "agent_id": "AGENT-00002",
                        "gender": "homeslice",
                        "role": "Adjudicator",
                        "rating": 0.0,
                        "sessions": 1,
                        "status": "STANDBY"
                    }
                ],
                "ratio": {
                    "builders": 0,
                    "librarians": 0,
                    "compliant": True
                }
            },
            "ali_status": {
                "status": "AVAILABLE",
                "last_response": "2025-11-10",
                "hours_since": 1
            }
        }

    def log_message(self, format, *args):
        """Custom log format"""
        print(f"[{datetime.now().strftime('%H:%M:%S')}] {format % args}")


def run_server(port=DEFAULT_PORT):
    """Start the dashboard server"""

    # Change to base directory for file serving
    os.chdir(BASE_DIR)

    with socketserver.TCPServer(("", port), CommandArenaHandler) as httpd:
        print(f"""
╔═══════════════════════════════════════════════════════════════╗
║                   COMMAND ARENA DASHBOARD                      ║
║                  Agent Life Force System v3.1.0                ║
╚═══════════════════════════════════════════════════════════════╝

🌐 Dashboard running at: http://localhost:{port}

📊 API Endpoints:
   - GET /api/state         - Full mission control state
   - GET /api/ali-status    - Ali availability status
   - GET /api/agents        - Active and standby agents

🔄 Auto-refresh: Every 5 seconds
📁 Base directory: {BASE_DIR}

Press Ctrl+C to stop the server
""")

        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n⚔️ Command Arena dashboard shutting down...")
            print("Godspeed, Grandmaster.\n")


if __name__ == "__main__":
    # Get port from command line or use default
    port = int(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_PORT

    # Check if port is available
    try:
        run_server(port)
    except OSError as e:
        if "Address already in use" in str(e):
            print(f"\n❌ Error: Port {port} is already in use.")
            print(f"Try a different port: python3 {sys.argv[0]} <port>\n")
        else:
            raise
