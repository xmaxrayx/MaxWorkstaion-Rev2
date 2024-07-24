#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Force
; #Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>



d :=  fgui()


d.f.Name





 fgui(){

   showStatius := 0
    m :=  Gui()
    m.Add("Button" , , "Hello")
    m.Add("ComboBox",, [1,2,3])
   

   f(){
      Show(){

         m.Show()
          showStatius := 1
     }
     Hide(){
       MsgBox()
       m.Hide()
       showStatius := 0
     }

   }


    return { gui : m , showStatius : showStatius, f : ()=> f }
 }