@echo off
REM Coded by Soldier
:ini
cls
mode con cols=65 lines=35
color 0e
title //Customize USB\\
echo.
echo.
echo.                                      
echo         ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ººÄÄÄÄÄÄÄÄÄÄ¿
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ºº²²²²²²²²²²³
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ºº²²²²ÍÍ²²²²³
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ºº²²²²²²²²²²³
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ºº²²²²²²²²²²³
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ºº²²²²ÍÍ²²²²³
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±ºº²²²²²²²²²²³
echo        ºº±±±±±±±±±±±±±±±±±±±±±±±±CUSTOMIZE±USB±ººÄÄÄÄÄÄÄÄÄÄÙ
echo         ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo.
echo.
echo.
echo.
echo Que desea insertar o cambiar en su USB:
echo.
echo      ÚÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      º 1 ºº      Icono-Nombre      º
echo      ÀÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo      ÚÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      º 2 ºº  Fondo-Color de texto  º
echo      ÀÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo      ÚÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      º 3 ºº          About         º
echo      ÀÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo      ÚÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      º 0 ºº          Salir         º
echo      ÀÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
set func=ini
set /p opc=">> "
IF not defined opc (GOTO:INI)
IF %opc%==1 (GOTO:ICON)
IF %opc%==2 (GOTO:WALL)
IF %opc%==3 (GOTO:ABOUT)
IF %opc%==0 (GOTO:EXIT) else (GOTO:ERROR)
:ICON
set func=icon
cls
title //Customize USB\\ Icono y Nombre
GOTO:CQ
:DEFI
cls
echo [-]COLOCANDO ICONO Y NOMBRE[-]
echo.
echo.
CALL:USB
:CONTI
echo Arrastre aqui su icono
set /p ico=">> "
IF NOT DEFINED ico (GOTO:CONTI)
set cIni=%ico:~0,1%
set cEnd=%ico:~-1%
set quotes=false
IF \^%cIni% == \^" set quotes=true
IF \^%cEnd% == \^" set quotes=true
IF %quotes% == true (GOTO:QUOTESI) ELSE (GOTO:WQUOTESI)
:QUOTESI
IF NOT %ico:~-5,4% == .ico (GOTO:ERROR3) ELSE (GOTO:CONTI2)
:WQUOTESI
IF NOT %ico:~-4,5% == .ico (GOTO:ERROR3) ELSE (GOTO:CONTI2)
:CONTI2
CD /D %unit%:
attrib -h iconusb.ico 2>nul >nul
del iconusb.ico 2>nul >nul
copy /y %ico% iconusb.ico 2>nul >nul
attrib +h iconusb.ico 2>nul >nul
:ALIAS
echo Nombre para su Pendrive
set /p name=">> " 
IF NOT DEFINED name (GOTO:ALIAS)
attrib -h -r -s "%unit%:\autorun.inf" 2>nul >nul
echo [AutoRun] > "%unit%:\autorun.inf"
echo icon=iconusb.ico >> "%unit%:\autorun.inf"
echo label=%name% >> "%unit%:\autorun.inf"
attrib +h +s +r "%unit%:\autorun.inf"
cd /d C:
echo.
echo El icono y nombre para su Pendrive han sido establecidos.
echo Para visualizar los cambios, retire y vuelva a conectar 
echo su dispositivo.
PAUSE>NUL
GOTO:INI

:QUITI
set func=iq
cls
echo [-]QUITANDO ICONO Y NOMBRE[-]
echo.
echo.
CALL:USB
CD /D %unit%:
echo Eliminando los archivos de personalizacion...
echo.
ping -n 4 localhost >nul
IF EXIST iconusb.ico (
attrib -h iconusb.ico && del iconusb.ico 2>nul >nul
) ELSE (
echo    !! Icono no encontrado&&GOTO:D)
echo    !! Icono eliminado
:D
IF EXIST autorun.inf (
attrib -h -r -s autorun.inf && del autorun.inf 2>nul >nul
) ELSE (
echo    !! Archivo de personalizacion no encontrado&&PAUSE>NUL&&goto:ini)
echo    !! Archivo de personalizacion eliminado
CD /D C:
PAUSE>NUL&&GOTO:INI

:WALL
set func=wall
title //Customize USB\\ Fondo y Color de texto
cls
GOTO:CQ
:DEFW
cls
echo [-]COLOCANDO FONDO Y COLOR DE TEXTO[-]
echo.
echo.
CALL:USB
:CONTW
echo Arrastre aqui su imagen de fondo
set /p fondo=">> "
IF NOT DEFINED fondo (GOTO:CONTW)
set cIni=%ico:~0,1%
set cEnd=%ico:~-1%
IF \^%cIni% == \^" set quotes=true
IF \^%cEnd% == \^" set quotes=true
IF %quotes% == true (set ext=%fondo:~-5,4%) ELSE (set ext=%fondo:~-4,5%)
FOR %%w in (.jpg .jpeg .png .bmp .gIF .tIf .tIff) do (
IF /I NOT %ext%==%%w (GOTO:ERROR3) ELSE (GOTO:CONTW2))
:CONTW2
CD /D %unit%:
attrib -h *wallusb* 2>nul >nul
del *wallusb* 2>nul >nul
copy /y %fondo% wallusb%ext% 2>nul >nul
echo.
echo [-]COLOR DE LETRA
echo.
echo Colores disponibles:
FOR %%c IN ([1]Negro,[2]Rojo,[3]Azul,[4]Blanco,[5]Verde,[6]Anaranjado,[7]Gris,[8]Amarillo,[9]Rosa,[10]Cafe) DO (
echo %%c)
echo.
:COLOR
echo Escribe el numero del color que desees
set /p color=">> "
IF %color%==1 (set c=000000)
IF %color%==2 (set c=0000FF)
IF %color%==3 (set c=FF0000)
IF %color%==4 (set c=FFFFFF)
IF %color%==5 (set c=00FF00)
IF %color%==6 (set c=0066FF)
IF %color%==7 (set c=848484)
IF %color%==8 (set c=00FFFF)
IF %color%==9 (set c=FF00FF)
IF %color%==10 (set c=336699)
IF NOT DEFINED color (GOTO:COLOR)
attrib -h -r -s desktop.ini 2>nul >nul
echo ^[^{BE098140-A513-11D0-A3A4-00C04FD706EC^}^] > desktop.ini
echo Attributes=1 >> desktop.ini
echo IconArea_Image=wallusb%ext% >> desktop.ini
echo IconArea_Text=0x%c% >> desktop.ini
attrib +h wallusb%ext%
attrib +h +r +s desktop.ini
cd\
echo.
echo El fondo y el color de texto para su Pendrive han sido 
echo establecidos. Para visualizar los cambios, retire y vuelva
echo a conecar su dospositivo
CD /D C:
PAUSE>NUL&&goto :ini

:QUITW
set func=wq
cls
echo [-]QUITANDO FONDO Y COLOR DE TEXTO[-]
echo.
echo.
CALL:USB
CD /D %unit%:
echo Eliminando archivos de personalizacion...
echo.
ping -n 4 localhost >nul
IF EXIST *wallusb* (
attrib -h *wallusb* && del *wallusb*
) ELSE (
echo    !! Wallpaper no encontrado&&GOTO:D2)
echo    !! Wallpaper eliminado
:D2
IF EXIST desktop.ini (
attrib -h -r -s desktop.ini && del desktop.ini
) ELSE (
echo    !! Archivo de personalizacion no encontrado..&&PAUSE>NUL&&goto:ini)
echo    !! Archivo de personalizacion eliminado
CD /D C:
PAUSE>NUL&&GOTO:INI

:ABOUT
cls
title //Customize Pendrive\\ About
echo.
echo.
echo.
echo.
echo              ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo              º                                      º
echo              º  Personalizador de Pendrives creado  º
echo              º  para poder darle estilo unico a tu  º
echo              º   dispositivo portatil tal como un   º
echo              º MP4, MP3, Memoria USB o Memory Stick º
echo              º                                      º
echo              ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo.
echo.
echo     Soldier Corp.
PAUSE>NUL
GOTO:INI

:CQ
echo.
echo.
echo      ÚÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      º 1 ºº         Colocar        º
echo      ÀÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo      ÚÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      º 2 ºº         Quitar         º
echo      ÀÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ 
echo.
echo.
echo.
IF %func%==icon (GOTO:OI) else (GOTO:OW)
:OI
set /p opc2=">> "
IF NOT DEFINED opc2 (GOTO:OI)
IF %opc2%==1 (GOTO:DEFI)
IF %opc2%==2 (GOTO:QUITI) else (GOTO:ERROR)

:OW
set /p opc2=">> "
IF NOT DEFINED opc2 (GOTO:OW)
IF %opc2%==1 (GOTO:DEFW) 
IF %opc2%==2 (GOTO:QUITW) else (GOTO:ERROR) 


:USB
echo Estas son las unidades extraibles disponibles
FOR /F "tokens=1 skip=2" %%u IN ('fsutil fsinfo drives ^| more') DO (
fsutil fsinfo drivetype %%u | find /i "extra" >nul 2>&1 && (
echo %%u)
)
IF %errorlevel%==1 (
echo.
echo    !!! No hay ninguna unidad extraible o USB conectada al equipo&&pause>nul&&GOTO:INI)
echo En que unidad desea realizar los cambios?
echo Ejem E F G, etc.
set /p unit=">> "
IF NOT DEFINED unit (GOTO:ERROR2)
FOR %%e IN (D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
IF /i %unit%==%%e (GOTO:EOF)
)
GOTO:ERROR2

:ERROR
echo.
echo    !!! Opcion invalida, vuelva a intentarlo 
PAUSE>NUL
IF %func%==icon (cls&&GOTO:CQ)
IF %func%==wall (cls&&GOTO:CQ) ELSE (GOTO:INI)

:ERROR2
echo    !!! Escriba una unidad valida
PAUSE>NUL
IF %func%==iq (GOTO:QUITI)
IF %func%==icon (GOTO:DEFI) 
IF %func%==wq (GOTO:QUITW) ELSE (GOTO:DEFW)

:ERROR3
echo    !!! Extension no valida
PAUSE>NUL
IF %func%==icon (GOTO:CONTI) ELSE (GOTO:CONTW)

:exit
cls
echo.
echo.
echo.
echo.
echo              ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo              º                                      º
echo              º           Gracias por usar           º
echo              º            Customize USB             º
echo              º                                      º
echo              ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo.
echo.
echo    Soldier Corp.
PAUSE>NUL
EXIT    

