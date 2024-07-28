#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>



;/add exe path after @

AppList__Array := [

    "ClipStudio@C:\Program Files\CELSYS\CLIP STUDIO 1.5\CLIP STUDIO\CLIPStudio.exe"
    ,"Krita@C:\Program Files\Krita (x64)\bin\krita.exe@ahk_exe krita.exe"
    ,"MediBang Paint Pro@C:\Program Files\Medibang\MediBang Paint Pro\MediBangPaintPro.exe"
    ,"Sketchbook Pro@C:\Program Files\WindowsApps\Sketchbook.SketchbookPro_9.1.34.0_x64__k9x4nk31cvt0g\SketchBookPro\SketchbookPro.exe@ahk_exe SketchbookPro.exe"
    ,"One note@C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
]




ListGUI:= {
    overlayMiniGUI__return_info : overlayMiniGUI() ;small square loancher
    ,MangerMainGUI__info : MangerMainGUI()
    ,RunMainSmallGUi__return_info : RunMainSmallGUi("Run App:")


}


; MsgBox(ListGUI.overlayMiniGUI__return_info.width)






overlayMiniGUI()


overlayMiniGUI(){ ;did


    location :={
        x : 0,
        y : A_ScreenHeight*0.3
    }

    mainGUI := Gui("AlwaysOnTop   -Caption")
    mainGUI.MarginX := 0 , mainGUI.Marginy := 0
    mainGUI.BackColor := "09d709"
    WinSetTransparent(250,mainGUI)
    
    mainGUI.SetFont("s20")
    startButton := mainGUI.Add("Text",,"    ")
    mainGUI.SetFont()

    ; startButton.OnEvent("Click",(*)=> ListGUI.RunMainSmallGUi__return_info.thisGUI.show())
    mainGUI.Show( "x" location.x " y" location.y )   
    WinGetPos(,,&_W,&_H,mainGUI)
    thisGui := {
        w : _w,
        h : _h
    }
    
    
    startButton.OnEvent("Click",(*)=> ListGUI.MangerMainGUI__info.thisGUI.Show( "x" (thisGui.w + 4)  "y" location.y))


    _mainGUI__button__Click(){
        
    }


    return { width : thisGui.w , height : thisGui.h }



}


; oevrlayMainGUI()







class MangerMainGUI { ;did

    mainGUI := 0
    showStatus := 0
    __New(){
    this.showStatus := 0
    this.mainGui := Gui("AlwaysOnTop   -Caption")
    this.mainGui.Add("Button" , ,"Run App:")
        .OnEvent("Click",(*)=> do )
    MangerMainGUI.isSHow := 0

    do(*){
        if ListGUI.RunMainSmallGUi__return_info.showStatus == 0 {
            
        }
        
        ListGUI.RunMainSmallGUi__return_info
    }

    show(){
        this.mainGui.Show()
        this.showStatus := 1
    }

    hide(){
        this.mainGui.Hide()
        this.showStatus := 0
    }




    return { thisGUI : this.mainGui , showStatus : MangerMainGUI.isSHow }
    } ;end of __new




}





























RunMainSmallGUi(title){
    mainGui := Gui(,title)
    showStatus:= 0

    loop AppList__Array.Length {
        nameAndPath__Array__oneAppOnly := StrSplit(AppList__Array[A_Index],"@")
        mainGui.Add("Button", ,nameAndPath__Array__oneAppOnly[1]).OnEvent("Click" , SearchWithTextInTextList )
    }




    SearchWithTextInTextList(btn, *){
        

        loop AppList__Array.Length {
            if RegExMatch( AppList__Array[A_Index] ,"\Q" btn.Text "\E.+", &SearchResult__ref){
                break
            }
        }
        SearchResult__AppPath__str := RegExReplace( SearchResult__ref[] ,"\Q" btn.Text "\E@",,,1) ,OutputDebug("[" SearchResult__AppPath__str "]`n")



        if RegExMatch(SearchResult__AppPath__str,"@.+",&OptionSearchResult__ref){
            SearchResult__MoreOption__str := (RegExReplace(OptionSearchResult__ref[],"@","")) ,OutputDebug("[" SearchResult__MoreOption__str "]")
            SearchResult__AppPath__str := (RegExReplace(SearchResult__AppPath__str,"\Q" OptionSearchResult__ref[] "\E",""))


            if WinExist(SearchResult__MoreOption__str){
                MsgBoxResult := MsgBox("Detected old window do you want open them?",,"Yn")

                if MsgBoxResult == "Yes"{
                    WinActivate(SearchResult__MoreOption__str)
                }else if MsgBoxResult == "No"{
                    run(SearchResult__AppPath__str)
                }



            }else{

                run(SearchResult__AppPath__str)
            }


            ; (OptionSearchResult__str) ,OutputDebug("[" OptionSearchResult__str "]")
        }else{
            run(SearchResult__AppPath__str)
        }

        SoundBeep()


    }




    mainGui__ID := ("ahk_id " WinGetID(mainGui))


    AutoCloseGUI(mainGui__ID)

    return {GuiID : mainGui__ID, Title : title , thisGUI : mainGui , showStatus : showStatus}
    
    



}





AutoCloseGUI(GuiID){
    SetTimer(_AutoCloseGUI , 500)
    
    _AutoCloseGUI(*) {
        if WinActive(GuiID){
            return
        }

        if WinExist(GuiID){
            WinKill(GuiID)
            SetTimer(,0)
        }
        
        SetTimer(,0)
    
    }
    
    
    }
    