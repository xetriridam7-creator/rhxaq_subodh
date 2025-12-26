# Attendance Tracker

Tracks who attends classes.  
Rules enforced:
- no duplicate attendance records
- can't exceed class capacity

JSON shows status transitions:
```json
{
  "status": "present",
  "allowed_next": ["absent", "late"]
}
