#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


global L_RedCircle_with__underButton := "Zoom"


#HotIf WinActive("ahk_exe CLIPStudioPaint.exe")
;defoult : rotete
;DButton : Zoom
;Up Button : BrushSize

~Space & '::{
    global L_RedCircle_with__underButton
    switch [L_RedCircle_with__underButton, 0] {
        case "Zoom" :
            send("{WheelUp 1}")
            
        default:
            
    }
    
}

~Space & -::{
    global L_RedCircle_with__underButton
    switch [L_RedCircle_with__underButton, 0] {
        case "Zoom" :
            send("{WheelDown 1}")
        default:
    }
}



/*
~Space & '::{
    global L_Normal_RedCircleMode
    switch [L_Normal_RedCircleMode, 0] {
        case "Zoom" :
            send("{WheelUp 1}")
            
        default:
            
    }
    
}

~Space & -::{
    global L_Normal_RedCircleMode
    switch [L_Normal_RedCircleMode, 0] {
        case "Zoom" :
            send("{WheelDown 1}")
        default:
    }
}
*/