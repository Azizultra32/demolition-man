# Command Arena Dashboard

**Real-time visualization of Agent Life Force System activity**

---

## Overview

The Command Arena is a sophisticated, real-time web dashboard that visualizes:

- **Agent Life Force**: Active and standby agents with life force indicators
- **Ali Availability Status**: Real-time tracking of Grandmaster Ali's response status
- **Active Missions**: Current mission progress and status
- **Flash Messages**: Critical alerts and system notifications
- **System Statistics**: Builder ratios, total agents, mission counts

---

## Quick Start

### Method 1: Python Server (Recommended)

```bash
# From the mission-control directory
python3 dashboard-server.py

# Or specify custom port
python3 dashboard-server.py 9000
```

Then open your browser to:
```
http://localhost:8707
```

**Features**:
- ✅ Real-time data from actual files (state.json, AGENT_REGISTRY.md, SESSION_TIMELINE.md)
- ✅ API endpoints for programmatic access
- ✅ Auto-refresh every 5 seconds
- ✅ CORS enabled for development

### Method 2: Direct File Open

```bash
# Open the HTML file directly in your browser
open mission-control/command-arena.html
# or
firefox mission-control/command-arena.html
```

**Note**: This method uses mock data. For real-time data, use Method 1.

---

## Dashboard Sections

### 1. Ali Availability Status 👑
**Visual Indicators**:
- 🟢 **AVAILABLE** (<4hrs since last response) - Normal operations
- 🟡 **DELAYED** (4-24hrs) - Consigliere may approve time-sensitive matters
- 🟠 **UNAVAILABLE** (>24hrs) - Consigliere may approve all matters
- 🔴 **EXTENDED** (>72hrs or announced absence) - Emergency Tribunal available

**Data Source**: `SESSION_TIMELINE.md` (per CIP-05)

### 2. Flash Messages ⚡
Displays critical alerts and informational messages from Mission Control.

**Data Source**: `mission-control/state.json` → `flash_messages`

### 3. Active Agents 🤖
Shows all agents currently in active sessions.

**Displays**:
- Agent ID (AGENT-#####)
- Gender (broski/homeslice)
- Role (Builder, Librarian, Adjudicator, etc.)
- Performance rating (⭐ 0.0 - 5.0)
- Sessions completed
- Life Force bar (visual health indicator)

**Data Source**: `AGENT_REGISTRY.md` + `mission-control/state.json`

### 4. Standby Agents 💤
Shows all agents on standby awaiting activation.

**Visual Cues**:
- **Blue border-left**: BROSKI (male agents)
- **Pink border-left**: HOMESLICE (female agents)

### 5. Active Missions 🎯
Tracks all current missions with progress indicators.

**Data Source**: `mission-control/state.json` → `active_missions`

### 6. System Statistics 📊
Real-time metrics:
- **Total Agents**: Sum of active + standby
- **Active Missions**: Current mission count
- **Builder Ratio**: Builders:Librarians (constitutional requirement: ≤3:1)

---

## API Endpoints

The Python server provides RESTful API endpoints:

### GET /api/state
Returns full mission control state including agents, missions, messages.

**Response**:
```json
{
  "mission_control_id": "48707",
  "status": "OPERATIONAL",
  "active_missions": [...],
  "flash_messages": {...},
  "agent_status": {...}
}
```

### GET /api/ali-status
Returns current Ali availability status.

**Response**:
```json
{
  "status": "AVAILABLE",
  "last_response": "2025-11-10",
  "hours_since": 1
}
```

### GET /api/agents
Returns active and standby agents.

**Response**:
```json
{
  "active": [...],
  "standby": [...]
}
```

---

## Architecture

### Frontend
- **Technology**: Vanilla HTML5 + CSS3 + JavaScript (no frameworks)
- **Styling**: Custom gradient themes, dark mode optimized
- **Refresh**: Auto-refresh every 5 seconds via `setInterval`

### Backend
- **Server**: Python 3 `http.server` with custom handler
- **Data Sources**:
  - `mission-control/state.json` (primary state)
  - `AGENT_REGISTRY.md` (agent identity tracking)
  - `SESSION_TIMELINE.md` (Ali status)
  - `CURRENT_STATUS.md` (mission snapshot)

### Data Flow
```
┌─────────────────┐
│  File System    │
│ (state.json,    │
│  registries)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Python Server   │
│ (Parse & Serve) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Dashboard UI   │
│ (Auto-refresh)  │
└─────────────────┘
```

---

## Customization

### Change Refresh Interval
Edit `command-arena.html`:
```javascript
const REFRESH_INTERVAL = 5000; // Change to desired milliseconds
```

### Modify Styling
All styles are in `<style>` block in `command-arena.html`. Key variables:

```css
/* Color scheme */
background: linear-gradient(135deg, #0a0e27 0%, #1a1f3a 100%);
/* Ali status colors */
.status-available { color: #4ade80; } /* Green */
.status-delayed { color: #fbbf24; }   /* Yellow */
.status-unavailable { color: #fb923c; } /* Orange */
.status-extended { color: #ef4444; }  /* Red */
```

### Add New Sections
Follow the card structure:
```html
<div class="card">
  <div class="card-header">
    <span class="card-icon">📊</span>
    <span class="card-title">Your Section Title</span>
  </div>
  <div id="your-content">
    <!-- Content here -->
  </div>
</div>
```

---

## Production Deployment

For production use (not localhost):

### Option 1: Static Hosting
Deploy `command-arena.html` to:
- GitHub Pages
- Netlify
- Vercel
- Any static hosting

**Note**: You'll need to create a backend API to serve live data.

### Option 2: Full Stack Deployment
1. Deploy Python server to cloud (AWS, GCP, Heroku)
2. Set up file synchronization for state files
3. Add authentication if needed
4. Configure CORS for your domain

### Option 3: WebSocket Real-Time
For instant updates without polling:

```python
# Add to dashboard-server.py
import asyncio
import websockets

async def broadcast_updates():
    while True:
        state = get_state()
        await websocket.send(json.dumps(state))
        await asyncio.sleep(1)
```

---

## Troubleshooting

### Dashboard shows "Loading..." indefinitely
**Cause**: Server not running or fetch failing
**Fix**:
```bash
# Check if server is running
curl http://localhost:8707/api/state

# Restart server
python3 dashboard-server.py
```

### "Address already in use" error
**Cause**: Port 8707 already occupied
**Fix**:
```bash
# Use different port
python3 dashboard-server.py 9000

# Or kill process on port 8707
lsof -ti:8707 | xargs kill
```

### Agents not appearing
**Cause**: AGENT_REGISTRY.md not found or empty
**Fix**: Verify file exists at `/home/user/demolition-man/AGENT_REGISTRY.md`

### Ali status not updating
**Cause**: SESSION_TIMELINE.md not found
**Fix**: Verify file exists and has proper format (per CIP-05)

---

## Future Enhancements

**Planned features** (start simple, build sophisticated):

### Phase 1: Enhanced Visualization (Current)
- ✅ Real-time agent status
- ✅ Ali availability tracking
- ✅ Mission progress
- ✅ Flash messages

### Phase 2: Advanced Metrics
- [ ] Performance charts (agent ratings over time)
- [ ] Mission timeline visualization
- [ ] Builder ratio compliance graph
- [ ] Emergency level indicators

### Phase 3: Interactive Features
- [ ] Agent detail modal (click to see full MOJO)
- [ ] Mission control actions (broadcast flash message, summon agent)
- [ ] Constitutional search (precedents, CIPs)
- [ ] Logs viewer (daily log streaming)

### Phase 4: Advanced Integrations
- [ ] WebSocket real-time updates (no polling)
- [ ] Git integration (show recent commits)
- [ ] Notification system (browser alerts for critical events)
- [ ] Multi-Door view (if system expands to 10+ Doors)

---

## Design Philosophy

**"Start simple, build sophisticated"** - Grandmaster Ali

The dashboard begins with:
- ✅ Clean, readable HTML/CSS/JS (no build tools required)
- ✅ Clear visual hierarchy
- ✅ Responsive design (works on mobile)
- ✅ Dark mode optimized (matches terminal aesthetic)
- ✅ Real-time data (auto-refresh)

It can scale to:
- Advanced charting (D3.js, Chart.js)
- WebSocket streaming
- Multi-agent coordination visualization
- Graph-based MOJO relationship mapping

---

## Technical Specifications

**Browser Compatibility**:
- Chrome/Edge 90+
- Firefox 88+
- Safari 14+

**Server Requirements**:
- Python 3.7+
- No external dependencies (uses stdlib only)

**Performance**:
- Dashboard load: <500ms
- Refresh cycle: 5s (configurable)
- Memory footprint: ~5MB (browser)

**File Size**:
- HTML: ~15KB
- Python server: ~8KB
- Total: <25KB

---

**Built with constitutional precision for the Agent Life Force System**

`<<v3.1.0 | Mission Control 48707>>`
