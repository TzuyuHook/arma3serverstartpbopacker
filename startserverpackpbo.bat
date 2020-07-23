:: Setup
@echo off
color 0a
title Arma 3 Server

:: Importing & Packing the Missionfile and Life Server
echo Packing Files from GitHub...

"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Users\mllev\Documents\GitHub\Exalia-Altis-Framework\@life_server\life_server" "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\@life_server\addons\life_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Users\mllev\Documents\GitHub\Exalia-Altis-Framework\mpmissions\Exalia_Altis.Altis" "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\mpmissions\Exalia_Altis.Altis.VR.pbo"

:: Start Server
echo Server is Starting.
C:\Windows\System32\mode con cols=50 lines=10 >nul
set /a var=0
:start
echo Server instance started.
start "" /wait /realtime /affinity F "arma3server_x64.exe" -port=2302 "-config=Config\cfg\server.cfg" "-profiles=Config\log" "-cfg=Config\cfg\basic.cfg" -name=ExaliaRP "-servermod=@life_server;@extDB3" "-bepath=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Server\battleye"  -autoinit -enableHT -malloc=system
set /a var+=1
cls
echo The server has shutdown %var% times.
goto start
