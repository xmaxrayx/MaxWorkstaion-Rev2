#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>





g := Gui()



g.add("Button","V12").OnEvent("Click", MsgBox(button.name))