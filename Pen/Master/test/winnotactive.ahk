#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>



m := 1

MsgBox( m.__Class) ;/report int

MsgBox(m.HasProp("global")) ;/dosnt work

MsgBox(m.__Init())