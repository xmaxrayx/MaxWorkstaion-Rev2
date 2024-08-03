#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


i := 1
i?
    (
        (n := 1)
        (n += 11)
        Msgbox("yes n value :" N)
    )
:
    (
        Msgbox("No") 
        Msgbox("No")
        MsgBox()
    )