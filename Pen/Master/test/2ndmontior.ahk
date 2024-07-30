#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


; MsgBox SysGet(78) " x " SysGet(79)

; SysGet("")



MsgBox(MonitorGetCount())



;  MsgBox(monitorGetWorkArea(,&x1,&y1,&x2,&y2))


; MsgBox(monitorGetSize(1).width  "`n" monitorGetSize(1).high)


monitorGetSize(N){
    (monitorGetWorkArea(N,&x1,&y1,&x2,&y2))
    high := y2 - y1,
    width := x2 - x1
    return {
        high : high,
        width : width
    }
    
}





; MsgBox(high "`n" width)

; MsgBox(l "`n" t "`n" r "`n" b)


f::{
    ImageSearch &FoundX, &FoundY, 0, 0, 2000, 2200, "C:\Users\Max_Laptop\Pictures\OIP (1).jpg"
    Sleep(1000)
    x := FoundX
    y := FoundY
    MsgBox(x, y)
}