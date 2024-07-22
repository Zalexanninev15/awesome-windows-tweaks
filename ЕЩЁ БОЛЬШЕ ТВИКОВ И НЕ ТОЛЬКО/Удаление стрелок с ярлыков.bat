del "%SystemRoot%\\Blank.ico"
copy Blank.ico "%SystemRoot%"
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\explorer\Shell Icons" /v "29" /t REG_SZ /d "%%SystemRoot%%\Blank.ico,0" /f