@echo off

if exist fdt.smc ren fdt.smc fdt.exe
if exist afudosu.smc ren afudosu.smc afudos.exe
if exist choice.smc ren choice.smc choice.exe

if "%1"=="" goto Err_Print
if not exist %1  goto No_File


rem ##Read CMOS50 value
fdt -r 50
if errorlevel 90 if not errorlevel 91 goto FDT_Different
goto Compare_FDT_Table


:Compare_FDT_Table
echo ##########################################################################
echo #
echo #	Compare Flash Descriptor Table(FDT). Please wait...
echo #
echo ##########################################################################
rem echo afudos %1 /ME
fdt -w 50 A5
afudos %1 /ME
fdt -b 0
fdt -r 50
if errorlevel 165 if not errorlevel 166 goto Flash_BIOS
if errorlevel 90 if not errorlevel 91 goto FDT_Different

:Flash_BIOS
echo ##########################################################################
echo #
echo #	 FDT is same. Program BIOS and ME (excluding FDT) regions...
echo #
echo ##########################################################################
rem echo afudos %1 /P /B /N /K /R
fdt -w 50 A5
afudos %1 /P /B /N /K /R /ME
fdt -w 50 00
goto END

:FDT_Different
fdt -r 51
if errorlevel 24 if not errorlevel 25 goto Update_BIOS_ME
if errorlevel 0 if not errorlevel 1 goto Modify_Autoexec
goto CMOS51_Not_Equal_00h_OR_18h

:Update_BIOS_ME
echo ##########################################################################
echo #
echo #	 Program BIOS and ME (including FDT) regions...
echo #
echo ##########################################################################
rem echo afudos %1 /P /B /N /K /R /ME
fdt -w 50 A5
afudos %1 /P /B /N /K /R /ME
ren fdt.exe fdt.smc
ren afudos.exe afudosu.smc
ren choice.exe choice.smc
cd\
if exist autoexec.bat del autoexec.bat
if exist a.bat ren a.bat autoexec.bat
goto END1

:Modify_Autoexec
fdt -b 0
echo ##########################################################################
echo ##########################################################################
echo #
echo #	 FDT is different. Creating new autoexec.bat file...
echo #
echo ##########################################################################
echo ##########################################################################
fdt -mauto %1

:Reboot_System
echo ##########################################################################
echo #
echo #	 System will reboot to change the operating mode in 10 seconds....
echo #	 Or please press [Y] key to reboot now!!
echo #
echo ##########################################################################
choice /C:Y /T:Y,10
fdt -reset

:No_File
echo ##########################################################################
echo #
echo #	 %1 doesn't exist and please double check.
echo #
echo ##########################################################################
goto END

:CMOS51_Not_Equal_00h_OR_18h
rem echo CMOS51 doesn't equal 00h or 18h !
rem echo ManufacturingMode is Disabled.
echo ##########################################################################
echo #
echo #	 Current BIOS or hardware does not support software controllable
echo #	 ME Manufactuing mode.
echo #
echo ##########################################################################
ren fdt.exe fdt.smc
ren afudos.exe afudosu.smc
ren choice.exe choice.smc
cd\
if exist a.bat del autoexec.bat
if exist a.bat ren a.bat autoexec.bat
goto END1

:Err_Print
echo ##########################################################################
echo #
echo #	 Usage:
echo #		       flash.bat romfile
echo #
echo ##########################################################################


:END
ren fdt.exe fdt.smc
ren afudos.exe afudosu.smc
ren choice.exe choice.smc

:END1

