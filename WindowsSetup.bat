@ECHO OFF

:: Name of folder containing scrcpy.exe
cd scrcpy

:: Running Scrcpy over Wifi:
:: 1. Connect via USB
:: 2. In command prompt: adb tcpip 5555
:: 3. On the device, go to Settings-> About Device to find the device IP address
:: 4. Disconnect form USB
:: 5. In command prompt: adb connect 123.456.7.8:5555
:: 6. run scrcpy

:: Intro and ask to plug in headset
ECHO.
ECHO -------------- Welcome to Scrcpy Setup for Windows by ThirdEye Gen. --------------
ECHO.
ECHO Scrcpy will allow you to directly view and control your headset from your computer.
ECHO.
ECHO Please CONNECT your headset to your COMPUTER via USB before continuing.
ECHO.
PAUSE

:: Ask if connecting via USB or Wifi
CLS
ECHO.
ECHO -------------- Welcome to Scrcpy Setup for Windows by ThirdEye Gen. --------------
ECHO.
ECHO Select your conection type:
ECHO.
ECHO 1 - USB Connection Setup
ECHO 2 - Wifi Connection Setup
ECHO 3 - Launch Scrcpy Without Setup
ECHO.
SET /P M=TYPE 1 or 2 then press ENTER:
IF %M%==1 GOTO USB
IF %M%==2 GOTO WIFI
IF %M%==3 GOTO LAUNCH

:USB
CLS
ECHO.
ECHO -------------- Welcome to Scrcpy Setup for Windows by ThirdEye Gen. --------------
ECHO.
ECHO USB Selected. Launching Scrcpy...
GOTO LAUNCH

:WIFI
ECHO.
ECHO -------------- Welcome to Scrcpy Setup for Windows by ThirdEye Gen. --------------
ECHO.
ECHO Wifi Selected...
:: configure adb protocol
start adb.exe 
adb tcpip 5555
ECHO.
ECHO DISCONNECT device and ENTER headset IP address.
ECHO IP address can be found under headeset Settings -%> About Device:


SET /P M=Enter headset IP address: found under Settings -%> About Device
adb connect %M%
GOTO LAUNCH

:LAUNCH
start scrcpy-noconsole.exe

:END
EXIT