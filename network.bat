@echo off
mode 38,20
title NETWORK STATS
echo loading network infomation....
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set SSID=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set adpter=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set Signal=%%a
for /f "tokens=4 delims==" %%a in ('ping -n 2 8.8.8.8 ^| find "Average"') do set ping=%%a
for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Bytes"') do set rbytes=%%a
for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Bytes"') do set sbytes=%%a
cls
echo.
echo   NETWORK:
echo  -----------
echo  SSID:%SSID%
echo  NIC:%adpter%
echo  signal:%signal%
echo.
echo     SPEED:
echo  ------------
echo  PING:%ping%
echo  mbps rcecived:%rbytes%
echo  mbps sent:%sbytes%
goto loop
pause