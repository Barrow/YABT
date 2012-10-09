YABT - Yet Another Borderless-window Toggle

Written by Barrow

http://www.barrowdev.com

http://www.autohotkey.com/community/viewtopic.php?t=84446



Updates:

	04/13/12 - Allowed for multi-monitor configurations, provided all monitors are of identical resolution.



Hotkey usage:

	Win-W: Toggle active window to/from a fullscreen borderless window.

	Ctrl-Alt-W: Toggle window currently under the mouse.



About:

	YABT fixes a few long-standing problems with the other similar scripts found on the AutoHotkey forums. First and foremost, due to an error made in one of the original versions of this script, some bad binary addition occurred which led to the proliferation of "0xC00000" as the style required for such a window; in actuality, this just removes the tool/movebar and sets a tooltip border around the window. This corrects it by using the correct "0x840000" style.


	Additionally, YABT expands on the originals in two capacities. First, when leaving fullscreen, it will restore the original size and position of the bordered window. Secondly, it has two methods of choosing the window to toggle.


	For most applications, Win-W will be the ideal hotkey; it will simply toggle the currently active window. Some applications, however, will block the keystroke while active. In these cases, I've implemented Ctrl-Alt-W, which will toggle the window currently under the mouse. In this way, you can shift focus from the desired window (ie pull up the taskbar), hover over the window, and press the second shortcut.