#Requires AutoHotkey >=2.1- <3.0
; #SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>



s := cls()
s.hide()


class cls{
    g := 0

    __New() {
        this.g := Gui()
        this.g.Add("Button",, "Hello")
    }

    show(){
        this.g.Show()
    }
    hide(){
        this.g.Hide()
    }

} 

