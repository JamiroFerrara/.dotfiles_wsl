;#HotIf WinActive("Plex")
;This is the shortcut key for ALT+Q
!q::
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
WinSet, Style, -0xC40000,
; WinMove, , , 0, 0, A_ScreenWidth, A_ScreenHeight
DllCall("SetMenu", "Ptr", WinExist(), "Ptr", 0)
return
