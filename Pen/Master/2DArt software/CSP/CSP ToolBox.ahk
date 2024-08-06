#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>

CSP_EXE := "ahk_exe CLIPStudioPaint.exe"
SetTimer(()=>,1000)
MsgBox("timer started")


MsgboxOnaActiveWindow(){
        if  WinActive(CSP_EXE)
        {
            MsgBox("start")
        }
        
}

~f::SoundBeep()  ;

/*
TapGui()

TapGui(){
    static i :=  true
    WS_EX_NOACTIVATE := 0x08000000
    m := Gui("+AlwaysOnTop +E" WS_EX_NOACTIVATE)
    m.Add("Button" , , "Hello").OnEvent("Click" , shift_tap_full)


    shift_tap_full(*){
        if i == true{
            MsgBox("yes i")
            Sleep(50)
            SendInput("+{Tab}")
            Sleep(250)
            SendInput("+{Tab}")
            Sleep(50)
        }else{
            MsgBox("n")
            Sleep(50)
            SendInput("+{Tab}")

       
            }

            i := !i
            
            
            
            
        }
        m.Show()
}


*/

; while WinActive("C")