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

!+Left::Send, {Home}
!+Right::Send, {End}
!w::Send, {Up 5}
!s::Send, {Down 5}

^+Enter::
Send, abc
	Run, %A_MyDocuments%/AutoHotkey/Autohotkey.ahk
	FileCopy, ~/Documents/AutoHotkey/Autohotkey.ahk, G:/Meu Drive/AWindowsDefault/AutoHotkeyUbuntu/AutoHotkey.ahk, 1
	;FileCopyDir, ~/Documents/AutoHotkey/Autohotkey/Scripts , G:/Meu Drive/AWindowsDefault/AutoHotkeyUbuntu/Scripts, 1
	return

+Escape::
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
:*:cowl::Console.WriteLine
:*:corl::Console.ReadLine
:*:sebg::Serial.begin(115200);
:*:sepp::Serial.print
:*:sepl::Serial.printlnd
:*:sewr::Serial.write
:*:sepf::Serial.printf
:*:piop::pio device monitor -b 115200 -p COM
:r*:a@::adrianowerneck@id.uff.br
:*:cpf@::16230304716
:*:ee@::2718281828
:*:ahks::
	Run, https://www.autohotkey.com/docs/Tutorial.html
	Sleep, 2250
	Send, {WheelDown 25}
	return
:*:piodl::pio device list
:*:piodm::pio device monitor
:*:i@::innoboat
:*:hu@::husarnet status
:*:mav@::mavproxy.py --baudrate=921600 --out=tcpin:0.0.0.0:14580

:*:uint8_T::uint8_t
:*:uint16_T::uint16_t
:*:uint32_T::uint32_t
:*:uint64_T::uint64_t
:*:int8_T::int8_t
:*:int16_T::int16_t
:*:int32_T::int32_t
:*:int64_T::int64_t
:*:uint8__T::uint8_t
:*:uint16__T::uint16_t
:*:uint32__T::uint32_t
:*:uint64__T::uint64_t
:*:int8__T::int8_t
:*:int16__T::int16_t
:*:int32__T::int32_t
:*:int64__T::int64_t
:*:uint8__t::uint8_t
:*:uint16__t::uint16_t
:*:uint32__t::uint32_t
:*:uint64__t::uint64_t
:*:int8__t::int8_t
:*:int16__t::int16_t
:*:int32__t::int32_t
:*:int64__t::int64_t


