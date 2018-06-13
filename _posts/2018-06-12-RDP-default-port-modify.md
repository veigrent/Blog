---
title: 修改windows远程桌面默认端口脚本
date: 2018-06-12
comment: windows、rdp、mstsc
---

安全起见，修改下服务的默认端口。照猫画虎写个bat脚本。 win下编码格式ANSI，不然中文乱码。

## 创建bat文件
<pre><code>
@echo off
echo 修改远程桌面3389端口(支持Windows 2003 2008 2008R2 2012 2012R2 7 8 10)
echo 自动添加防火墙规则
echo %date%   %time%

set /p c= 请输入新的端口:
echo 新端口 %c%

if "%c%"=="" goto end
goto edit:

:edit
echo 添加防火墙
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=UDP localport="%c%"
echo 修改注册表
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp" /v "PortNumber" /t REG_DWORD /d "%c%" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "PortNumber" /t REG_DWORD /d "%c%" /f
echo 修改成功
echo 重启后生效
pause

shutdown /r /t 300
exit

:end
echo 修改失败
pause
</pre></code>

* 放了一份在这里，可以直接获取[mstsc_port.bat](https://raw.githubusercontent.com/veigrent/Blog/master/src/mstsc_port.bat)


