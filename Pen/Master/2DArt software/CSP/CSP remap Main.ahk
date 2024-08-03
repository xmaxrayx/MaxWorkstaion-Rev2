#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


#HotIf WinActive("ahk_exe CLIPStudioPaint.exe")


;////////////////////////////zoom in and out
~Space & '::{
    send("{WheelUp 1}")
}

~Space & -::{
    send("{WheelDown 1}")
}

;//////////////////////////////