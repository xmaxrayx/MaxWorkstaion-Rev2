#Requires AutoHotkey >=2.1- <3.0
#SingleInstance force
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>



appList := DrawingAppListGUI()


listLoader__Object := [
    {
        ButtonName : "Run App:",
        action : ()=> appList.show()
    }
    ,

    {
        ButtonName : "lool",
        action : ()=> (MsgBox("no"))
    }

]






subMaster := SubMainGUIManger(listLoader__Object,"")
Main := overlayMainLauncher(subMaster)


Main.show()

; subMaster.show()





; MsgBox(ss.showStatus)


; ss.show()




class DrawingAppListGUI {
    
    mainGui := 0
    showStatus := 0
    mainGui__ID := 0
    ; ; WinGetPos(,,&_W,&_H,this.mainGUI)
        
    ; this.GuiSize := {
    ;     w : _w,
    ;     h : _h
    ; }
    




    __New(){

        this.mainGui := Gui()

        AppList__Array := [

            "ClipStudio@C:\Program Files\CELSYS\CLIP STUDIO 1.5\CLIP STUDIO\CLIPStudio.exe"
            ,"Krita@C:\Program Files\Krita (x64)\bin\krita.exe@ahk_exe krita.exe"
            ,"MediBang Paint Pro@C:\Program Files\Medibang\MediBang Paint Pro\MediBangPaintPro.exe"
            ,"Sketchbook Pro@C:\Program Files\WindowsApps\Sketchbook.SketchbookPro_9.1.34.0_x64__k9x4nk31cvt0g\SketchBookPro\SketchbookPro.exe@ahk_exe SketchbookPro.exe"
            ,"One note@C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
        ]


        loop AppList__Array.Length {
            nameAndPath__Array__oneAppOnly := StrSplit(AppList__Array[A_Index],"@")
            this.mainGui.Add("Button", ,nameAndPath__Array__oneAppOnly[1]).OnEvent("Click" , SearchWithTextInTextList )
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
    
    


    this.mainGui__ID := ("ahk_id " WinGetID(this.mainGui))


    AutoCloseGUI(this.mainGui__ID)



    AutoCloseGUI(GuiID){
        SetTimer(___AutoCloseGUI , 500)
        
        ___AutoCloseGUI(*) {
            if WinActive(GuiID){
                return
            }
    
            if WinExist(GuiID){
                WinKill(GuiID)
                SetTimer(,0)
            }
            
            SetTimer(,0)
        
        }
        
        ; return {GuiID : mainGui__ID, Title : title , thisGUI : mainGui , showStatus : showStatus}
        
        }

    
    



}


    show(){
    this.showStatus := 1
     this.mainGui.Show()
     


    }






}









class SubMainGUIManger {
    mainGUI := 0
    showStatus := 0
    outsideGUICaller := 0
    listObject := 0

    __New(listObject,outsideGUICaller ){
        this.showStatus := 0
        this.mainGui := Gui("AlwaysOnTop   -Caption")
    ;    this.outsideGUICaller := outsideGUICaller
    ;     this.button1 := this.mainGui.Add("Button" , ,"Run App:")
    ;     this.button1.OnEvent("Click",(*)=> this.outsideGUICaller.show())
        this.listObject := listObject
       
        loop this.listObject.Length{
            i := A_Index
            this.mainGui.Add("Button","V" i  ,this.listObject[i].ButtonName)
            .OnEvent("Click", clickAction ) ;(this.listObject[i].action)
        }


        ; for item in this.listObject{
        ;     MsgBox(item.ButtonName)
        ;     this.mainGUI.AddButton("v" A_Index).OnEvent("Click",(*)=> clickAction)
        ; }


        clickAction(GuiCtrlObj,*){
            ; MsgBox(GuiCtrlObj.name)
            b := Number(GuiCtrlObj.name)
            (this.listObject[b].action)
            
            
            ; SetTimer(listLoader__Object[b].action ,-1) ;this work
            ; ()=> this.listObject[b].action.Call()

        }
        
        m(GuiCtrlObj, info){
            MsgBox(GuiCtrlObj.name)
        }



        ; for item in this.listObject{
        ;     this.mainGui.Add("Button",,item.ButtonName).OnEvent("Click",(*)=> item.action)
        ; }

    

}

    manageShow(opt := ""){
        if this.showStatus == 0{
            this.showStatus := 1
            this.Show(opt)
        }else{
            this.showStatus := 0
            this.Hide()
        }
    }
    
    show(option := ""){
        this.mainGui.Show(option)
        
        watchGUIandHideIt__timer(guiObj){
            if  WinActive(guiObj){
                return
            }

            else {
                guiObj.hide()
                SetTimer(,0)
            }

        }

        SetTimer(()=>watchGUIandHideIt__timer(this.mainGui),100)
    
        
    }

    hide(){
        this.showStatus := 0
        this.mainGui.Hide()
    }



}
















class overlayMainLauncher {
    
    startButton := 0
    fixGab := {
        x : 2,
        y : 0
    }
    mainGui := 0
    showStatus := 0
    
    location :={
        x : 0,
        y : A_ScreenHeight*0.3
    }

    guiSize := 0
    
    OutsideGUICaller := 0 ;use this to run outside gui when you click on the button

    __New(OutsideGUICaller, FontSize := 20) {
        this.mainGUI := Gui("AlwaysOnTop   -Caption")
        

        this.OutsideGUICaller := OutsideGUICaller


        this.mainGUI.MarginX := 0 , this.mainGUI.Marginy := 0
        this.mainGUI.BackColor := "09d709"
        WinSetTransparent(250,this.mainGUI)
        
        
        this.mainGUI.SetFont("s" FontSize )
        this.startButton := this.mainGUI.Add("Text",,"    ")
        this.mainGUI.SetFont()
    }


    manageShow(){ ;dont use this

       
            this.OutsideGUICaller.manageShow()



        ; if this.showStatus == 1{
        ;     this.show(this.OutsideGUICaller)
        ; }else{
        ;     this.hide(this.OutsideGUICaller)
        ; }
    }

    show(){
        this.showStatus := 1
        
        this.mainGUI.Show( "x" this.location.x " y" this.location.y )   
        WinGetPos(,,&_W,&_H,this.mainGUI)
        
        this.GuiSize := {
            w : _w,
            h : _h
        }
        
        this.startButton.OnEvent("Click",(*)=> 
        this.OutsideGUICaller.manageShow(
        "x" (this.location.x + this.guiSize.w + this.fixGab.x) 
        " y" (this.location.y )) 
    )


    }


    hide(){
        this.showStatus := 0
        this.mainGUI.Hide()
    }



}