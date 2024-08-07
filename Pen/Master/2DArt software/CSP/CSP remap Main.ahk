#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


global L_Normal_RedCircleMode := "Zoom"


#HotIf WinActive("ahk_exe CLIPStudioPaint.exe") && L_Normal_RedCircleMode == "Rotate"
;defoult : rotete
;DButton : Zoom
;Up Button : BrushSize


;--zoom in and out
~Space & '::{
    send("{WheelUp 1}")
}

~Space & -::{
    send("{WheelDown 1}")
}

;/---------------------








;///////////////////////////||||||||
;////////////////////////////|||||||
;////////////////////////////|||||||
;//////NEW SECTION////////||||||||||
;////////////////////////|||||||||||
;//////////////////////|||||||||||||
;/////////////////////////////||||||

#HotIf WinActive("ahk_exe CLIPStudioPaint.exe") && L_Normal_RedCircleMode == "Zoom"

;-------Zoom
'::{
    send("{WheelUp 1}")
}

-::{
    send("{WheelDown 1}")
}



;---------Rotate
~Space & '::{
    send("'")
}

~Space & -::{
    send("-")
}

;------------------