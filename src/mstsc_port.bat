@echo off
color f0
echo �޸�Զ������3389�˿�(֧��Windows 2003 2008 2008R2 2012 2012R2 7 8 10 )
echo �Զ����ӷ���ǽ����
echo %date%   %time%

set /p c= �������µĶ˿�:
echo �¶˿� %c%

if "%c%"=="" goto end
goto edit:

:edit
echo ���ӷ���ǽ
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"
echo ����ע���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp" /v "PortNumber" /t REG_DWORD /d "%c%" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "PortNumber" /t REG_DWORD /d "%c%" /f
echo �޸ĳɹ�
echo ��������Ч�������������
pause

shutdown /r /t 300
exit

:end
echo �޸�ʧ��
pause