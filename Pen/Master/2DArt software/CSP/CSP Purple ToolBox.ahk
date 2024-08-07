#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>

;// for test
#Include  "Lib\smallBoxLounchers__overlay.ahk"




;///////////Select a  screen//////////////////////


KScreenN := _KScreenN(2)






_KScreenN(ScreenSelect_Number){

    MonitorCount := MonitorGetCount()

    if ScreenSelect_Number > MonitorCount
        return MonitorCount

    else return ScreenSelect_Number

}

;/////////////////////////////////////////////////







CSP_EXE := "ahk_exe CLIPStudioPaint.exe"






listLoader__Object := [
    {
        ButtonName : "MinWindow:",
        ctrlType : "Button",
        action:  (parm)=> (Send("+{Tab}"))
    }
    ,

    {

        ButtonName : "Eagle",
        ctrlType : "Button",
        action : (parm)=> (run("explorer C:\Program Files\Eagle\Eagle.exe"))


    }
    ,
    {

        ButtonName : "Folder",
        ctrlType : "Button",
        action : (parm)=> (MsgBox("no"))
    }



    ,
    {
        ButtonName : "lool",
        ctrlType : "text",
        action : (*)=> (MsgBox("no"))
    }

]

;;;;




subMaster := SubMainGUIManger(listLoader__Object,"", CSP_EXE)
Main := overlayMainLauncher(subMaster,KScreenN,, "d51ead" , 0.1 ,CSP_EXE)






while _fakeVar??1==1{
    if WinWaitActive("ahk_exe CLIPStudioPaint.exe",,){
        Main.show()
        subMaster.showStatus := 1
        if WinWaitNotActive("ahk_exe CLIPStudioPaint.exe")
        Main.hide()
    }

}
