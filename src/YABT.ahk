#SingleInstance Force																			; Personal preference
#NoTrayIcon																						; Personal preference
X := 0																							; Initialize variables
Y := 0
W := A_ScreenWidth
H := A_ScreenHeight
Return

#w::
	WinGet, window, ID, A																		; Use the ID of the active window.
	Toggle_Window(window)
Return


!^w::
	MouseGetPos,,, window																		; Use the ID of the window under the Mouse.
	Toggle_Window(window)
Return


Toggle_Window(window)
{
	global X, Y, W, H																			; Since Toggle_Window() is a function, set up X, Y, W, and H as globals
	WinGet, S, Style, % "ahk_id " window														; Get the Style of the window
	If (S & +0x840000)																			; If not Borderless
	{
		WinGetPos, X, Y, W, H, % "ahk_id " window												; Store window size/location
		XMed := (2* X + W) / 2																	; Find the middle of the window
		YMed := (2* Y + H) / 2																	; Find the middle of the window
																								; We check to see if the current window is outside of the default monitor.
																								; If it is, we increment our multiplier and try the next window (in all 4 directions).
																								; NOTE: This won't work for multi-monitor setups with different resolutions.
		Loop
		{
			If(XMed > A_ScreenWidth * A_Index || XMed < A_ScreenWidth * (-1 * A_Index))
			Continue
			If(XMed > A_ScreenWidth * (A_Index - 1))
			XPos := (A_Index - 1) * A_ScreenWidth
			Else
					XPos := (-1 * A_Index) * A_ScreenWidthsw
			Break
		}
		Loop
		{
			If(YMed > A_ScreenHeight * A_Index || YMed < A_ScreenHeight * (-1 * A_Index))
			Continue
			If(YMed > A_ScreenWidth * (A_Index - 1))
			YPos := (A_Index - 1) * A_ScreenHeight
			Else
					YPos := (-1 * A_Index) * A_ScreenHeight
			Break
		}
		WinSet, Style, -0x840000, % "ahk_id " window   ; Remove Borders
		WinMove, % "ahk_id " window,, %XPos%, %YPos%, %A_ScreenWidth%, %A_ScreenHeight%			; Stretch to Screen-size
		Return
	}
	If (S & -0x840000)																			; If Borderless
	{
		WinSet, Style, +0x840000, % "ahk_id " window											; Reapply Borders
		WinMove, % "ahk_id " window,, X, Y, W, H												; Return to original position
		Return
	}
	Return																						; Return if the other IF's don't fire (shouldn't be possible in most cases)
}