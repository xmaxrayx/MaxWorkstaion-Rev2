#Requires AutoHotkey >=2.1- <3.0


class DrawingAppListGUI {
    
    mainGui := 0
    showStatus := 0
    mainGui__ID := 0
    ; ; WinGetPos(,,&_W,&_H,this.mainGUI)
        
    ; this.GuiSize := {
    ;     w : _w,
    ;     h : _h
    ; }
    




    __New(list){

        this.mainGui := Gui("AlwaysOnTop  -Caption +ToolWindow")
        AppList__Array := list



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
                ; MsgBox(SearchResult__AppPath__str)
                run(SearchResult__AppPath__str)
            }
    
            SoundBeep()
    
    
        }
    
    


    this.mainGui__ID := ("ahk_id " WinGetID(this.mainGui))


    AutoCloseGUI(this.mainGui__ID)



    AutoCloseGUI(GuiID){
        SetTimer(___AutoCloseGUI , 100)
        
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


    show(opt:= ""){
    this.showStatus := 1
     this.mainGui.Show(opt)
     watchGUIandHideIt__timer(guiObj){
        if  WinActive(guiObj){
            return
        }

        else {
            this.showStatus := 0
            guiObj.hide()
            SetTimer(,0)
        }

    }

    SetTimer(()=>watchGUIandHideIt__timer(this.mainGui),500)



    }






}









class SubMainGUIManger {
    mainGUI := 0
    showStatus := 0
    outsideGUICaller := 0
    listObject := 0
    gui := 0
    GUI__ID := 0
    overlay := 0
    oldGUIcall := 0

    __New(listObject,outsideGUICaller , Overlay:=0 ){
        this.showStatus := 0
        this.overlay := Overlay
        WS_EX_NOACTIVATE := 0x08000000

        this.mainGui := Gui("AlwaysOnTop  -Caption +E" WS_EX_NOACTIVATE)
        this.listObject := listObject

        ;//////////////// build section/////////////
        loop this.listObject.Length{
            this.mainGui.Add(this.listObject[A_Index].ctrlType ,"V" A_Index  ,this.listObject[A_Index].ButtonName)
            .OnEvent("Click", clickAction ) ;(this.listObject[i].action)
        }

        clickAction(GuiCtrlObj,*){
            i := Number(GuiCtrlObj.name)
            this.listObject[i].action.Call("x" this.oldGUIcall.x + this.guiSize.w " y" this.oldGUIcall.y )
        }
        
        m(GuiCtrlObj, info){
            MsgBox(GuiCtrlObj.name)
        }
        ;/////////////////////////end of building/////////////////////




}

    manageShow(x , y){
        this.oldGUIcall := {
            x  : x,
            y : y
        }

        if this.showStatus == 0{
            this.showStatus := 1
            this.Show(x , y)
        }else{
            this.showStatus := 0
            this.Hide()
        }
    }
    
    show(x , y){
        this.mainGui.Show("NoActivate x" x  " y" y )
        this.GUI__ID := WinGetID(this.mainGUI)
        WinGetPos(,,&_W,&_H,this.mainGUI)
        this.GuiSize := {
            w : _w,
            h : _h
        }


        watchGUIandHideIt__timer(guiObj){

            if this.overlay != 0{
                if WinActive(guiObj) || WinActive(this.overlay){
                    return
                }


                else{
                    this.showStatus := 0
                    guiObj.hide()
                    SetTimer(,0)
                }



            }




            if  WinActive(guiObj){
                return
            }

            else {
                this.showStatus := 0
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
    BackColor := 0

    location :={
        x : 0,
        ; y : A_ScreenHeight*0.3
        y: 0
    }

    guiSize := 0
    
    OutsideGUICaller := 0 ;use this to run outside gui when you click on the button

    __New(OutsideGUICaller, screenN , FontSize := 20 , BackColor := "09d709" , Y_Location_mod := 0.3){ 

        WS_EX_NOACTIVATE := 0x08000000
        this.mainGUI := Gui("AlwaysOnTop  -Caption +ToolWindow +E" WS_EX_NOACTIVATE)
        
        screenSize :=  monitorGetSize(screenN) 
        this.location.y := screenSize.y + (screenSize.high * Y_Location_mod)

        this.location.x := screenSize.x ;+ (screenSize.width /2)

        this.BackColor := BackColor
        ; MsgBox(this.location.x "`n" this.location.y)
        

        this.OutsideGUICaller := OutsideGUICaller


        this.mainGUI.MarginX := 0 , this.mainGUI.Marginy := 0
        this.mainGUI.BackColor := this.BackColor
        WinSetTransparent(250,this.mainGUI)
        
        
        this.mainGUI.SetFont("s" FontSize )
        this.startButton := this.mainGUI.Add("Text",,"    ")
        this.mainGUI.SetFont()


        monitorGetSize(N){
            (monitorGetWorkArea(N,&x1,&y1,&x2,&y2))
            high := y2 - y1,
            width := x2 - x1
            return {
                high : high,
                width : width,
                x : x1,
                y : y1
            }
            
        }



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
        
        this.mainGUI.Show( "x" this.location.x " y" this.location.y " NoActivate" )   
        WinGetPos(,,&_W,&_H,this.mainGUI)
        
        this.GuiSize := {
            w : _w,
            h : _h
        }
        
        this.startButton.OnEvent("Click",(*)=> 
        this.OutsideGUICaller.manageShow(
        (this.location.x + this.guiSize.w + this.fixGab.x) ,
        (this.location.y )) 
    )


    }


    hide(){
        this.showStatus := 0
        this.mainGUI.Hide()
    }



}