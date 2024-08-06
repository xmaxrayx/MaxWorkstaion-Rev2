#Requires AutoHotkey >=2.1- <3.0
#SingleInstance Off
#Include  <maxray\AHKPlusPlus___Folder\AHKPlusPlus___0_2__v>


WinHook.Shell.Add("Created",,, "NOTEPAD.EXE",1) ; Notepad Window Created


















Created(Win_Hwnd, Win_Title, Win_Class, Win_Exe, Win_Event)
{
	MsgBox Created
	WinGet, PID, PID, ahk_id %Win_Hwnd%
	WinHook.Event.Add(0x0016, 0x0016, "Minimized", PID) 
	WinHook.Event.Add(0x0017, 0x0017, "Restored", PID) 
}

Minimized(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime)
{
	MsgBox Minimized
}

Restored(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime)
{
	MsgBox Restored
}

; [Class] WinHook
; Fanatic Guru
; 2018 10 16
;
; Class to set hooks of windows or processes
;
;{-----------------------------------------------
;	
;	Class (Nested):		WinHook.Shell
;
;		Method:
; 			Add(Func, wTitle:="", wClass:="", wExe:="", Event:=1)
;
;		Desc: Add Shell Hook
;
;   	Parameters:
;		   	1) {Func}			Function name or Function object to call on event
;   		2) {wTitle}		window Title to watch for event (default = "", all windows)
;   		3) {wClass}		window Class to watch for event (default = "", all windows)
;   		4) {wExe}			window Exe to watch for event (default = "", all windows)
;   		5) {Event}			Event (default = 1, window created)
;
;				Shell Hook Events:
;				1 = HSHELL_WINDOWCREATED
;				2 = HSHELL_WINDOWDESTROYED
;				3 = HSHELL_ACTIVATESHELLWINDOW
;				4 = HSHELL_WINDOWACTIVATED
;				5 = HSHELL_GETMINRECT
;				6 = HSHELL_REDRAW
;				7 = HSHELL_TASKMAN
;				8 = HSHELL_LANGUAGE
;				9 = HSHELL_SYSMENU
;				10 = HSHELL_ENDTASK
;				11 = HSHELL_ACCESSIBILITYSTATE
;				12 = HSHELL_APPCOMMAND
;				13 = HSHELL_WINDOWREPLACED
;				14 = HSHELL_WINDOWREPLACING
;				15 = HSHELL_HIGHBIT
;				16 = HSHELL_FLASH
;				17 = HSHELL_RUDEAPPACTIVATED
;
;		Note: ObjBindMethod(obj, Method) can be used to create a function object to a class method
;					WinHook.Shell.Add(ObjBindMethod(TestClass.TestNestedClass, "MethodName"), wTitle, wClass, wExe, Event)
;
; ----------
;
;		Desc: Function Called on Event
;			FuncOrMethod(Win_Hwnd, Win_Title, Win_Class, Win_Exe, Win_Event)
;		
;		Parameters:
;		   	1) {Win_Hwnd}		window handle ID of window with event 
;   		2) {Win_Title}		window Title of window with event
;   		3) {Win_Class}		window Class of window with event
;   		4) {Win_Exe}			window Exe of window with event
;   		5) {Win_Event}		window Event
;
;}
;	Class (Nested):		WinHook.Event
;
;		Method:
;			Add(eventMin, eventMax, eventProc, idProcess, WinTitle := "") 			
;
;		Desc: Add Event Hook
;
;   	Parameters:
;		   	1) {eventMin}		lowest Event value handled by the hook function
;   		2) {eventMax}		highest event value handled by the hook function
;   		3) {eventProc}		event hook function, call be function name or function object
;   		4) {idProcess}		ID of the process from which the hook function receives events
;   		5) {WinTitle}			WinTitle to identify which windows to operate on, (default = "", all windows)
;
;				Event Hook Events:
;				0x8012 = EVENT_OBJECT_ACCELERATORCHANGE
;				0x8017 = EVENT_OBJECT_CLOAKED
;				0x8015 = EVENT_OBJECT_CONTENTSCROLLED
;				0x8000 = EVENT_OBJECT_CREATE
;				0x8011 = EVENT_OBJECT_DEFACTIONCHANGE
;				0x800D = EVENT_OBJECT_DESCRIPTIONCHANGE
;				0x8001 = EVENT_OBJECT_DESTROY
;				0x8021 = EVENT_OBJECT_DRAGSTART
;				0x8022 = EVENT_OBJECT_DRAGCANCEL
;				0x8023 = EVENT_OBJECT_DRAGCOMPLETE
;				0x8024 = EVENT_OBJECT_DRAGENTER
;				0x8025 = EVENT_OBJECT_DRAGLEAVE
;				0x8026 = EVENT_OBJECT_DRAGDROPPED
;				0x80FF = EVENT_OBJECT_END
;				0x8005 = EVENT_OBJECT_FOCUS
;				0x8010  = EVENT_OBJECT_HELPCHANGE
;				0x8003 = EVENT_OBJECT_HIDE
;				0x8020 = EVENT_OBJECT_HOSTEDOBJECTSINVALIDATED
;				0x8028 = EVENT_OBJECT_IME_HIDE
;				0x8027 = EVENT_OBJECT_IME_SHOW
;				0x8029 = EVENT_OBJECT_IME_CHANGE
;				0x8013 = EVENT_OBJECT_INVOKED
;				0x8019 = EVENT_OBJECT_LIVEREGIONCHANGED
;				0x800B = EVENT_OBJECT_LOCATIONCHANGE
;				0x800C = EVENT_OBJECT_NAMECHANGE
;				0x800F = EVENT_OBJECT_PARENTCHANGE
;				0x8004 = EVENT_OBJECT_REORDER
;				0x8006 = EVENT_OBJECT_SELECTION
;				0x8007 = EVENT_OBJECT_SELECTIONADD
;				0x8008 = EVENT_OBJECT_SELECTIONREMOVE
;				0x8009 = EVENT_OBJECT_SELECTIONWITHIN
;				0x8002 = EVENT_OBJECT_SHOW
;				0x800A = EVENT_OBJECT_STATECHANGE
;				0x8030 = EVENT_OBJECT_TEXTEDIT_CONVERSIONTARGETCHANGED
;				0x8014 = EVENT_OBJECT_TEXTSELECTIONCHANGED
;				0x8018 = EVENT_OBJECT_UNCLOAKED
;				0x800E = EVENT_OBJECT_VALUECHANGE
;				0x0002 = EVENT_SYSTEM_ALERT
;				0x8016 = EVENT_SYSTEM_ARRANGMENTPREVIEW
;				0x0009 = EVENT_SYSTEM_CAPTUREEND
;				0x0008 = EVENT_SYSTEM_CAPTURESTART
;				0x000D = EVENT_SYSTEM_CONTEXTHELPEND
;				0x000C = EVENT_SYSTEM_CONTEXTHELPSTART
;				0x0020 = EVENT_SYSTEM_DESKTOPSWITCH
;				0x0011 = EVENT_SYSTEM_DIALOGEND
;				0x0010 = EVENT_SYSTEM_DIALOGSTART
;				0x000F = EVENT_SYSTEM_DRAGDROPEND
;				0x000E = EVENT_SYSTEM_DRAGDROPSTART
;				0x00FF = EVENT_SYSTEM_END
;				0x0003 = EVENT_SYSTEM_FOREGROUND
;				0x0007 = EVENT_SYSTEM_MENUPOPUPEND
;				0x0006 = EVENT_SYSTEM_MENUPOPUPSTART
;				0x0005 = EVENT_SYSTEM_MENUEND
;				0x0004 = EVENT_SYSTEM_MENUSTART
;				0x0017 = EVENT_SYSTEM_MINIMIZEEND
;				0x0016 = EVENT_SYSTEM_MINIMIZESTART
;				0x000B = EVENT_SYSTEM_MOVESIZEEND
;				0x000A = EVENT_SYSTEM_MOVESIZESTART
;				0x0013 = EVENT_SYSTEM_SCROLLINGEND
;				0x0012 = EVENT_SYSTEM_SCROLLINGSTART
;				0x0001 = EVENT_SYSTEM_SOUND
;				0x0015 = EVENT_SYSTEM_SWITCHEND
;				0x0014 = EVENT_SYSTEM_SWITCHSTART
;	   
class WinHook
{
	class Shell
	{
		Add(Func, wTitle:="", wClass:="", wExe:="", Event:=1)
		{
			if !WinHook.Shell.Hooks
			{
				WinHook.Shell.Hooks := {}, WinHook.Shell.Events := {}
				DllCall("RegisterShellHookWindow", UInt, A_ScriptHwnd)
				MsgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")
				OnMessage(MsgNum, ObjBindMethod(WinHook.Shell, "Message"))
			}
			if !IsObject(Func)
				Func := Func(Func)
			WinHook.Shell.Hooks.Push({Func: Func, Title: wTitle, Class: wClass, Exe: wExe, Event: Event})
			WinHook.Shell.Events[Event] := true
			return
		}
		Deregister()
		{
			DllCall("DeregisterShellHookWindow", UInt, A_ScriptHwnd)
		}
		Message(Event, Hwnd)  ; Private Method
		{
			If WinHook.Shell.Events[Event] 
			{
				WinGetTitle, wTitle, ahk_id %Hwnd%
				WinGetClass, wClass, ahk_id %Hwnd%
				WinGet, wExe, ProcessName, ahk_id %Hwnd%
				for key, Hook in WinHook.Shell.Hooks
					if ((Hook.Title = wTitle or Hook.Title = "") and (Hook.Class = wClass or Hook.Class = "") and (Hook.Exe = wExe or Hook.Exe = "") and (Hook.Event = Event))
						Hook.Func.Call(Hwnd, wTitle, wClass, wExe, Event)
			}
		}
	}
	class Event
	{
		Add(eventMin, eventMax, eventProc, idProcess, WinTitle := "")
		{
			if !WinHook.Event.Hooks
			{
				WinHook.Event.Hooks := {}
				OnExit(ObjBindMethod(WinHook.Event, "UnHookAll"))
			}
			Hook := DllCall("SetWinEventHook"
				, "UInt",	eventMin								;  UINT eventMin
				, "UInt",	eventMax								;  UINT eventMax
				, "Ptr" ,	0x0											;  HMODULE hmodWinEventProc
				, "Ptr" ,	RegisterCallback(WinHook.Event.Message)	;  WINEVENTPROC lpfnWinEventProc
				, "UInt" ,	idProcess								;  DWORD idProcess
				, "UInt",	0x0											;  DWORD idThread
				, "UInt",	0x0|0x2)  								;  UINT dwflags, OutOfContext|SkipOwnProcess
			if !IsObject(eventProc)
				eventProc := Func(eventProc)
			WinHook.Event.Hooks[Hook] := {eventMin: eventMin, eventMax: eventMax, eventProc: eventProc, idProcess: idProcess, WinTitle: WinTitle}
		}
		UnHook(idProcess)
		{
			for key, Hook in WinHook.Event.Hooks
				if (Hook.idProcess = idProcess)
					DllCall("UnhookWinEvent", "Ptr",Hook.Handle)
		}
		UnHookAll()
		{
			for key, Hook in WinHook.Event.Hooks
				DllCall("UnhookWinEvent", "Ptr",Hook.Handle)
		}
		Message(event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime)  ; 'Private Method 
		{
			Hook := WinHook.Event.Hooks[hWinEventHook := this] ; this' is hidden param1 because method is called as func
			WinGet, List, List, % Hook.WinTitle
			Loop % List
				if  (List%A_Index% = hwnd)
				{
					Hook.eventProc.Call(hWinEventHook, event, hwnd, idObject, idChild, dwEventThread, dwmsEventTime)
					return
				}
		}
	}
}