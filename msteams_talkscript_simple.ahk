/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <Julien Milletre "Akipe"> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Milletre Akipe
 * ----------------------------------------------------------------------------
 */

; Constante
KEY_TO_BIND := "F4" ; Raccourcie clavier pour le script, pour le changer : https://www.autohotkey.com/docs/KeyList.htm



#Persistent  ; Keep the script running until the user exits it.
Menu, Tray, Add  ; Creates a separator line.
Menu, Tray, Add, Change key binding, MenuKeyBindingChange  ; Creates a new menu item.
return

MenuKeyBindingChange:
Gui, Add, Text,, Set the key to bind:
Gui, Add, Edit, vKEY_TO_BIND, %KEY_TO_BIND%       ; The ym option starts a new column of controls.
Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, Show,, msteams-talkscript key binding
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.
Gui, Destroy



Hotkey,%KEY_TO_BIND%,ButtonStartScript
return

;Mutes/demute Teams, v1
ButtonStartScript: ; Raccourcie clavier pour le script, pour le changer : https://www.autohotkey.com/docs/KeyList.htm
  WinGet, currentWinId ,, A ; Récupération de la fenêtre active en cours
  ;MsgBox, winid=%currentWinId% ; Debug, affichage de l'id de la fenêtre d'origine, non nécessaire
  WinGet teamsWinId, ID,ahk_exe Teams.exe ; Récupération de la fenêtre de Teams
  WinActivate ahk_id %teamsWinId% ; Activer la fenêtre de Teams
  Send ^+m ; Exécuter le raccourcie clavier pour mute/démute Teams
  WinActivate ahk_id %currentWinId% ; Retourner sur la fenêtre d'origine
Return
