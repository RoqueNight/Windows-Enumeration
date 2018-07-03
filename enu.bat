@echo off
echo Hostname > output.txt
hostname >> output.txt
echo. >> output.txt

echo Current Logged on User Account >> output.txt
whoami >> output.txt
echo. >> output.txt

echo Username of User >> output.txt
echo %USERNAME% >> output.txt
echo. >> output.txt

echo User Accounts on the System >> output.txt
net users >> output.txt
echo. >> output.txt

echo Administrators Group Information >> output.txt
net localgroup administrators >> output.txt
echo. >> output.txt

echo System Domain/Workgroup Information >> output.txt
set userdomain >> output.txt
echo. >> output.txt

echo Current User Details >> output.txt
net user %USERNAME% >> output.txt
echo. >> output.txt

echo System Information >> output.txt
systeminfo >> output.txt
echo. >> output.txt

echo Drive Information >> output.txt
echo List of Mounted Drives >> output.txt
fsutil fsinfo drives >> output.txt
echo. >> output.txt

echo Path of User >> output.txt
echo %PATH% >> output.txt
echo. >> output.txt

echo List of All Tasks >> output.txt
tasklist /SVC >> output.txt
echo. >> output.txt

echo ##################################################### >> output.txt
echo ################## Checking for Credentials >> output.txt
echo ##################################################### >> output.txt

echo Displaying MetaData Information >> output.txt
type c:\sysprep.inf >> output.txt
echo. >> output.txt

echo Outlining System Information output.txt
type c:\sysprep\sysprep.xml >> output.txt
echo. >> output.txt

echo ##################################################### >> output.txt
echo  Network Information >> output.txt
echo ##################################################### >> output.txt

echo Interfaces Details >> output.txt
ipconfig /all >> output.txt
echo. >> output.txt

echo Current Connections >> output.txt
net use >> output.txt
echo. >> output.txt

echo Current Shares >> output.txt
net share >> output.txt
echo. >> output.txt

echo ARP Table Dump output.txt
arp -a >> output.txt
echo. >> output.txt

echo System Routing Table Dump output.txt
route print >> output.txt
echo. >> output.txt

echo Active Network Connections output.txt
netstat -nao >> output.txt
echo. >> output.txt

echo Current Windows Firewall Status output.txt
netsh firewall show state >> output.txt
echo. >> output.txt

echo Firewall Configuration Settings output.txt
netsh firewall show config >> output.txt
echo. >> output.txt

echo Wireless Information output.txt
echo List of All Wireless Connections & Profiles output.txt
netsh wlan export profile key=clear
type wi-fi*.xml >> output.txt
del wi-fi*.xml
echo. >> output.txt

echo ##################################################### >> output.txt
echo Task Scheduler Configuration >> output.txt
echo ##################################################### >> output.txt

echo List of All Tasks >> output.txt
schtasks /query /fo LIST /v >> output.txt
echo. >> output.txt

echo Windows Boot-Up Services >> output.txt
net start >> output.txt
echo. >> output.txt

echo List of Installed Drivers >> output.txt
DRIVERQUERY >> output.txt
echo. >> output.txt

echo Installed Software/Programs >> output.txt
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall temp1.txt
find "DisplayName" temp1.txt| find /V "ParentDisplayName" > temp2.txt
for /f "tokens=2,3 delims==" %%a in (temp2.txt) do (echo %%a >> output.txt)
del temp1.txt
del temp2.txt

echo.
echo.
echo Operation Complete


