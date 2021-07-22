﻿/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <Julien Milletre "Akipe"> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Milletre Akipe
 * ----------------------------------------------------------------------------
 */

;Push to talk for Teams, v1

KEY_TO_BIND := "F4" ; Raccourcie clavier pour le script, pour le changer : https://www.autohotkey.com/docs/KeyList.htm



Hotkey,%KEY_TO_BIND%,ButtonStartScript
return

ButtonStartScript: ; Quand on appuye sur la touche...
teamsHasNotBeenDown := true ; Pour vérifier qu'on n'active le micro qu'une seul fois quand la touche est appuyé.

Loop
{
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
