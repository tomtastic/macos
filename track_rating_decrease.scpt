# Decrease the ★s

set star to "★"
set nostar to "☆"
set stars to ""
set btt_secret to "your_bettertouchtool_secret_here"

tell application "Music"
	if running then
		set state to player state
		if state = playing then
			set track_props to (properties of current track)
			set t_Rating_old to the rating in track_props
			set t_Name to the title in track_props
			set t_Album to the album in track_props
			set t_Rating_new to t_Rating_old - 20
			if t_Rating_new < 0 then
				set t_Rating_new to 0
			end if
			set rating of current track to t_Rating_new
		else
			set state to "none"
		end if
	else
		set state to "none"
	end if
end tell

log "Old track rating : " & t_Rating_old
log "New track rating : " & t_Rating_new

if t_Rating_new = 0 then
	set stars to nostar
else
	repeat while t_Rating_new > 0
		set stars to stars & star
		set t_Rating_new to t_Rating_new - 20
	end repeat
end if

tell application "BetterTouchTool"
	set_string_variable "stars" to stars shared_secret btt_secret
end tell

return stars
