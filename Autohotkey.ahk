#SingleInstance force
#NoEnv

#e::
	IfWinExist, ahk_class Nautilus
	{
		WinActivate
		Send, {LWin down}{Left}{LWin up}
		return
	} else {
		Run, /usr/bin/nautilus
		return
	}

#c::Run /usr/bin/gnome-calculator
+Backspace::Send, +{Home}{Del}
!d::
	IfWinExist, ahk_class Xournalpp
	{
		WinActivate
		Send, {LWin down}{Right}{LWin up}
		return
	} else {
		Run, /usr/bin/xournalpp
		return
	}


^+Enter::
Send, abc
	Run, %A_MyDocuments%/AutoHotkey/Autohotkey.ahk
	FileCopy, ~/Documents/AutoHotkey/Autohotkey.ahk, G:/Meu Drive/AWindowsDefault/AutoHotkeyUbuntu/AutoHotkey.ahk, 1
	;FileCopyDir, ~/Documents/AutoHotkey/Autohotkey/Scripts , G:/Meu Drive/AWindowsDefault/AutoHotkeyUbuntu/Scripts, 1
	return

!Esc::
	Send, {BS}
  	return

+F1::
	Send, {Left}
  	return

+F2::
	Send, {Right}
  	return

^Space::
	Send, {Enter}
  	return


;Hotstrings
:r*:a@::adrianowerneck@id.uff.br
:*:cpf@::16230304716
:*:ee@::2718281828


