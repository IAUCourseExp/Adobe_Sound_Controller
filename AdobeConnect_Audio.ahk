;-----------------------------------------------------------------------------
; This script provides hotkeys to mute/unmute the volume of the Adobe Connect application only.
; It uses the NirCmd utility to interact with the Windows Volume Mixer.
;-----------------------------------------------------------------------------

; Set the title match mode to find partial window titles.
SetTitleMatchMode, 2

;-----------------------------------------------------------------------------
; Hotkey definition for Mute (Ctrl + Y)
;-----------------------------------------------------------------------------
^y::
; Check if the active window is Adobe Connect.
If WinActive("Adobe Connect")
{
    ; Get the Process ID (PID) of the active window (Adobe Connect)
    WinGet, pid, PID, A
    ; Use NirCmd to mute the application based on its PID
    Run, nircmd.exe mutesysapp 2 %pid% 1
}
Return

;-----------------------------------------------------------------------------
; Hotkey definition for Unmute (Ctrl + N)
;-----------------------------------------------------------------------------
^n::
; Check if the active window is Adobe Connect.
If WinActive("Adobe Connect")
{
    ; Get the Process ID (PID) of the active window (Adobe Connect)
    WinGet, pid, PID, A
    ; Use NirCmd to unmute the application based on its PID
    Run, nircmd.exe mutesysapp 2 %pid% 0
}
Return

; To quit the script, right-click the green 'H' icon in the system tray and select Exit.
