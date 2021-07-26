/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <Julien Milletre "Akipe"> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Milletre Akipe
 * ----------------------------------------------------------------------------
 */

;Push to talk for Teams, v1

KEY_TO_BIND := "F4" ; Raccourcie clavier pour le script, pour le changer : https://www.autohotkey.com/docs/KeyList.htm
userModeChoose := 1 ; 1 = pushtotalk, 2 = simplemode

Hotkey,%KEY_TO_BIND%,ButtonStartScript


; GUI
#Persistent  ; Keep the script running until the user exits it.
Menu, Tray, Add  ; Creates a separator line.
Menu, Tray, Add, Options, MenuKeyOptions  ; Creates a new menu item.
return

MenuKeyOptions:
if (userModeChoose == "") {
 userModeChoose := 1
}
if (userModeChoose = 1) {
  enablePushToTalk := 1
  enableSimpleBind := 0
} else if (userModeChoose = 2) {
  enablePushToTalk := 0
  enableSimpleBind := 1
}
Gui, Add, Text,, Mode selection
Gui, Add, Radio, vuserModeChoose  Checked%enablePushToTalk%, Push to talk
Gui, Add, Radio,                  Checked%enableSimpleBind%, Simple mute / unmute
Gui, Add, Text,, Key to bind
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

ButtonStartScript: ; Quand on appuye sur la touche...
teamsHasNotBeenDown := true ; Pour vérifier qu'on n'active le micro qu'une seul fois quand la touche est appuyé.

if (userModeChoose == "") {
 userModeChoose := 1
}

if (userModeChoose = 1)
{
  Loop {
    GetKeyState, keyState, %KEY_TO_BIND%, p ; On récupére l'état de la touche, si elle est appuyé ou relaché

    if (keyState = "D") AND (teamsHasNotBeenDown) ; Quand on reste appuyé sur la touche, mais une seul fois
    {
      setTeamsMicAndRefocusToOrigin()
      teamsHasNotBeenDown := false
    }
    
    if (keyState = "U") ; Quand on relache le raccourcie
    {
      setTeamsMicAndRefocusToOrigin()
      teamsHasNotBeenDown := true
    }

    Sleep, 100
  } Until teamsHasNotBeenDown
} else {
  setTeamsMicAndRefocusToOrigin()
}
Return

setTeamsMicAndRefocusToOrigin()
{
  WinGet, currentWinId ,, A ; Récupération de la fenêtre active en cours
  ;MsgBox, winid=%currentWinId% ; Debug, affichage de l'id de la fenêtre d'origine, non nécessaire
  WinGet teamsWinId, ID,ahk_exe Teams.exe ; Récupération de la fenêtre de Teams
  WinActivate ahk_id %teamsWinId% ; Activer la fenêtre de Teams
  Send ^+m ; Exécuter le raccourcie clavier pour mute/démute Teams
  WinActivate ahk_id %currentWinId% ; Retourner sur la fenêtre d'origin
}
