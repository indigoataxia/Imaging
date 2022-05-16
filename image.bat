color 30
@ECHO OFF
CLS
setlocal enabledelayedexpansion
set count=0

for %%n in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do if exist %%n:\sources\start.bat set o=%%n
pushd %o%:\images

for /F "skip=1 delims=" %%A in (
  'wmic csproduct get name'
) do for /f "delims=" %%B in ("%%A") do set "model=%%~nxB"

CLS
ECHO.
wmic diskdrive where "MediaType='Fixed hard disk media'" get index,model,size
ECHO.
ECHO  Which disk number is HDD to reimage?
ECHO.
ECHO.(Press Enter for 0)
ECHO.

SET disk=0
SET /p disk=? 

for /d %%x in (*) do (

    set /a count=count+1
    set choice[!count!]=%%x
    for %%y in (!count!) do set "choice[%%y]=!choice[%%y]:%cd%\=!"

)
ECHO.
ECHO Select Image:ECHO.
ECHO.(Press Enter for 1)
ECHO.

for /l %%x in (1,1,!count!) do (
     ECHO  %%x] !choice[%%x]!
ECHO.
)
ECHO.

set select=1
set /p select=? 
ECHO.

ECHO You chose !choice[%select%]!
pause

cls
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
ECHO> x:\diskpart.txt select disk %disk%
ECHO>> x:\diskpart.txt clean
ECHO>> x:\diskpart.txt convert gpt
ECHO>> x:\diskpart.txt create partition efi size=500
ECHO>> x:\diskpart.txt format fs=fat32 quick label=System
ECHO>> x:\diskpart.txt assign letter=S
ECHO>> x:\diskpart.txt create partition msr size=128
ECHO>> x:\diskpart.txt create partition primary
ECHO>> x:\diskpart.txt format fs=ntfs quick label=Windows
ECHO>> x:\diskpart.txt assign letter=W
diskpart /s x:\diskpart.txt


Dism /Apply-Image /ImageFile:"%o%:\images\!choice[%select%]!\install.swm" /SWMFile:"%o%:\images\!choice[%select%]!\install*.swm" /Index:1 /ApplyDir:W:\

W:\Windows\System32\bcdboot W:\Windows 

ECHO.
ECHO Imaging Complete....Press Any Key to Restart....

pause
wpeutil reboot
