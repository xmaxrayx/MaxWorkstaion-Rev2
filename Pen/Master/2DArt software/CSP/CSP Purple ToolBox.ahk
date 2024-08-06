#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


CSP_EXE := "ahk_exe CLIPStudioPaint.exe"
while _fakeVar??1==1{
    if WinWaitActive("ahk_exe CLIPStudioPaint.exe",,){
        
        MsgBox()
        
        
        
        WinWaitNotActive("ahk_exe CLIPStudioPaint.exe")
    }

}


f::MsgBox("you press f")