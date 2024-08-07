hParent := WinExist("ahk_exe excel.exe")

Gui, Margin, 0, 0
Gui, Add, Button,, Test
Gui, +AlwaysOnTop -Caption HWNDhChild
DllCall("SetParent", Ptr, hChild, Ptr, hParent)
Gui, Show, x450 y1
Return

ButtonTest:
    Gui, +OwnDialogs ; no taskbar button for this MsgBox
	MsgBox,,Test Button, I'm here!
Return