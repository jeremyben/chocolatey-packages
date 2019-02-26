@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem get packages in an array
rem https://stackoverflow.com/a/10167990/4776628
set count=0
for /d %%D in (*) do (
  set /a count+=1
  call set folder[!count!]=%%~nxD
)
if /i %count% equ 0 echo No packages found & goto:eof

rem list packages by index
echo Pick package to test:
set list=
for /l %%a in (1,1,%count%) do (
  set list=!list!%%a
  echo %%a. !folder[%%a]!
)
echo Q. cancel
echo(
choice /c:q%list%

set /a userchoice=%errorlevel%-1
if %userchoice% == 0 goto:eof

set package=!folder[%userchoice%]!
echo %package%

rem build package and install it
cd %package%
choco pack
choco install %package% -s .
cd ..

echo(
echo Don't forget to uninstall the tested package with:
echo choco uninstall %package%
