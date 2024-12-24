## 0.0.1

* TODO: Describe initial release.



## 0.0.2

- `formatTime(date,format)`: Add `formatTime` for localized date formatting and custom format support.
- `formatRelative(date,ref)`: Add `formatRelative` for formatting relative time like "2 hours ago" or "in 3 days".
- **deprecate**: `formatCustom` → Use `formatTime` instead.
- **deprecate**: `formatHour12` → Use `formatTime` instead.
- **deprecate**: `formatName` → Use `formatTime` instead.
- **fix**: Handle `null` `DateTime` values with fallback string in `formatTime`.
