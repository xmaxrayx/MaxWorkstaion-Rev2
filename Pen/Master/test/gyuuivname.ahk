#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>



m := Gui()

m.AddButton("Vgg" ,"hello")


MyGui := Gui()
MyGui.Add("Text",, "Please enter your name:")
MyGui.AddButton("vSecretName").OnEvent("Click", function)
tfunction(GuiCtrlObj, Info){
MsgBox(GuiCtrlObj.name , "`n" , Info)
}
MyGui.show()

m.Show()