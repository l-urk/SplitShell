::reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
%SystemRoot%\System32\rundll32.exe user32.dll,UpdatePerUserSystemParameters 1, True
taskkill /im explorer.exe /f
start explorer.exe