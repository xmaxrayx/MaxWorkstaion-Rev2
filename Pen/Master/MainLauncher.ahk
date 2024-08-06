; #Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_3__v>
#Include  "specialLib\smallBoxLounchers.ahk"



;///////////Select a  screen//////////////////////


KScreenN := _KScreenN(2)






_KScreenN(ScreenSelect_Number){

    MonitorCount := MonitorGetCount()

    if ScreenSelect_Number > MonitorCount
        return MonitorCount

    else return ScreenSelect_Number

}




;///////////intiallzing classes and functions section//////////////

appList := DrawingAppListGUI([
    "ClipStudioPaint@C:\Program Files\CELSYS\CLIP STUDIO 1.5\CLIP STUDIO PAINT\CLIPStudioPaint.exe"
    ,"Krita@C:\Program Files\Krita (x64)\bin\krita.exe@ahk_exe krita.exe"
    ,"MediBang Paint Pro@C:\Program Files\Medibang\MediBang Paint Pro\MediBangPaintPro.exe"
    ,"Sketchbook Pro@C:\Program Files\WindowsApps\Sketchbook.SketchbookPro_9.1.34.0_x64__k9x4nk31cvt0g\SketchBookPro\SketchbookPro.exe@ahk_exe SketchbookPro.exe"
    ,"One note@C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
    ,"ClipStudio@C:\Program Files\CELSY \CLIP STUDIO 1.5\CLIP STUDIO\CLIPStudio.exe"

])

;//---

ToolList := DrawingAppListGUI([
    "SnipTool@C:\Program Files\WindowsApps\Microsoft.ScreenSketch_11.2405.32.0_x64__8wekyb3d8bbwe\SnippingTool\SnippingTool.exe"
    ,"ClipStudio@C:\Program Files\CELSYS\CLIP STUDIO 1.5\CLIP STUDIO PAINT\CLIPStudioPaint.exe"
])

;//--



;/ MsgBox(User())
C_folderList := [ 
    {
        name : "Art Refrence"
        ,path : "\2DArt\ArtRefrence"

    }
    ,
    {
        name : "Main 2DArt"         ;? "2DArt" doesnt work seems regex issue in the library
        ,path : "\2DArt"
    }
    ,
    {
        name : "2DArt\ArtRefrence"
        ,path : "\2DArt\ArtRefrence"

    }

]

_folderList := []
_user := User()


for item in C_folderList
{   
    _folderList.Push(item.name 
        '@explore ' (_user  item.path) )

}




; i := 1
; loop C_folderList.Length {
;     b := C_folderList[i].name . '@explore ' _user . C_folderList[i].path
;     i := i + 1
;     _folderList.Push(b)
; }


FolderList := DrawingAppListGUI(_folderList)






listLoader__Object := [
    {
        ButtonName : "Run App:",
        ctrlType : "Button",
        action:  (parm)=> appList.show(parm)
    }
    ,

    {

        ButtonName : "Tool",
        ctrlType : "Button",
        action : (parm)=> ToolList.show(parm)


    }
    ,
    {

        ButtonName : "Folder",
        ctrlType : "Button",
        action : (parm)=> FolderList.show(parm)


    }



    ,
    {
        ButtonName : "lool",
        ctrlType : "text",
        action : (*)=> (MsgBox("no"))
    }

]


subMaster := SubMainGUIManger(listLoader__Object,"")
Main := overlayMainLauncher(subMaster,KScreenN)


;//////////////start////////////////

Main.show()





