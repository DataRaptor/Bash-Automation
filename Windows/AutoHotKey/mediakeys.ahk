!z::Send "{Volume_Down}"
!x::Send "{Volume_Up}"
!s::Send "{Media_Play_Pause}"
!a::Send "{Media_Prev}"
!d::Send "{Media_Next}"
F12::
{
  WinActivate "ahk_class Shell_TrayWnd"
  Send "#x"
  Sleep 100
  Send "us"
}