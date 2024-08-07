#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>

<<<<<<< HEAD
CSP_EXE := "ahk_exe CLIPStudioPaint.exe"
=======
>>>>>>> parent of 68e119c (add)

 

<<<<<<< HEAD
~f::SoundBeep()  ;


=======
>>>>>>> parent of 68e119c (add)
TapGui()

TapGui(){           
    static i :=  true
WS_EX_NOACTIVATE := 0x08000000   
    m := Gui("+AlwaysOnTop +E" WS_EX_NOACTIVATE)
    m.Add("Button" , , "Hello").OnEvent("Click" , shift_tap_full)


    shift_tap_full(*){
        if i == true{

            Sleep(50)
            SendInput("+{Tab}")
            Sleep(250)
            SendInput("+{Tab}")
            Sleep(50)
        }else{

            Sleep(50)
            SendInput("+{Tab}")             

       
            }

            i := !i
            
    
            
            
        }
        m.Show("NoActivate x1 x2" )
}


<<<<<<< HEAD

=======
>>>>>>> parent of 68e119c (add)

    
