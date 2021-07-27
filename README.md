# msteams-talkscript

![icon](icon/icon_200px.png)

**msteams-talkscript** is a script write with AutoHotkey language, for mute / unmute Microsoft Teams, when his window is not focus.
Current key is **F4**, but you can change it in the option.
The Teams call window need to be open, but he don't has to be focus.

There are two modes of operation :
- simple mude / unmute mode for using key like the current Teams implementation.
- push to talk mode for active mic only when key is pressed.

You can change the bind key for the mic and the operating mode in the options in the notification area.

## How to use

1. Download the application from the Github releases page : https://github.com/Akipe/msteams-talkscript/releases
2. Run the application
3. You should see an icon ![icon](icon/icon_20px.png) in the notifications area. To access the configuration, right click on this icon and click on "options".

Enjoy ;)

## How to build

1. Install AutoHotkey v1.1 ("current version"): https://www.autohotkey.com/
2. Clone the repository with git
3. Run the script in src directory, or compile it with make scripts. If you want to compress with UPX, you must unpack it in the AutoHotkey folder (download it on https://github.com/upx/upx/releases).

## Credits
This projet use this image for the icon : https://www.flaticon.com/free-icon/microphone_2097548 designed by Freepik (https://www.freepik.com) from Flaticon (https://www.flaticon.com/), FREE LICENSE (WITH ATTRIBUTION) https://media.flaticon.com/license/license.pdf.
