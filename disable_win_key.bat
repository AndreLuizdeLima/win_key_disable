@echo off
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d "00000000000000000300000000005BE000005CE000000000" /f
echo Tecla Windows desativada com sucesso!
pause
