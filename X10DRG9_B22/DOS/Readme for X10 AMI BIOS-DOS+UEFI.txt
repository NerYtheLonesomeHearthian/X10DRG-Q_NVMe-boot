***** Important Notice *****

On X10 DP Grantley platforms, Supermicro introduces a jumper-free solution that places ME into the manufacturing mode.
The user doesn't have to open the chassis to adjust the ME-related jumper on the motherboard any more.  The ME
manufacturing mode is required upon updating all software-strap settings in Flash Descriptor Table (FDT) inside ME region.

When user does not use Supermicro's Grantley BIOS flash package, the BIOS will ask AMI AFU tool to terminate the process
with below message:

 "- Error: Please use BIOS flash package from www.supermicro.com for BIOS update."

The following instruction describes the BIOS upgrade process of the X10 BIOS flash package.  Please follow the instruction
carefully to avoid any need of RMA repair or replacement.


================================================
Standard BIOS Update Procedure under DOS
================================================

1. Save this BIOS update package to your computer.

2. Extract the files from the DOS folder of the BIOS package to a bootable DOS USB stick. Recommended to use MS-DOS 8.0
   (created by Windows Millennium Edition and later) or FreeDOS.

3. Boot for USB stick into a DOS prompt and type FLASH.BAT BIOSname#.### to start the BIOS update.

4. The BIOS update script will compare Flash Descriptor Table (FDT) code in the new BIOS with the existing one in the
   motherboard:

   a. If a different FDT is found, a new file, AUTOEXEC.BAT, will be created, and the system will reboot in 10
      seconds if no key is pressed.  Press "Y" to go into system reboot right away.  At the reboot, hit "F11" key to
      invoke the boot menu & boot into the USB stick again.  The BIOS update will be resumed, automatically. 

   b. If the FDT is the same, the BIOS update will be started right away.  No reboot will be needed.

5. Do not interrupt the process until the BIOS update is complete.

6. After seeing the message indicating that BIOS update has completed, do the A/C power cycle.

7. Go to the BIOS configuration, and restore the BIOS setting.

================================================
Standard BIOS Update Procedure under UEFI Shell
================================================

1. Save this BIOS update package to your computer.

2. Extract the files from the UEFI folder of the BIOS package to a USB stick. (Note: The USB stick doesn't have to be
   bootable, but has to be formatted with FAT/FAT32 file system.)

3. Plug the USB stick into USB port, boot to the Build-In UEFI Shell, and type FLASH.nsh BIOSname#.### to start the BIOS
   update:

     Shell> cd fs0:
     fs0:\> cd UEFI
     fs0:\UEFI> flash.nsh X10DRC5.925

4. The FLASH.NSH script will compare Flash Descriptor Table (FDT) code in the new BIOS with the existing one in the
   motherboard:

   a. If a different FDT is found, a new file, STARTUP.NSH, will be created, and the system will go into reboot in 10
      seconds if no key is pressed.  Press "Y" to go into system reboot right away.  At the reboot, hit "F11" key to
      invoke the boot menu & boot into the build-in UEFI Shell again.  The BIOS update will be resumed, automatically. 

   b. If the FDT is the same, the BIOS update will be started right away.  No reboot will be needed.

5. Do not interrupt the process until the BIOS update is complete.

6. After the message indicating BIOS update has completed, do the A/C power cycle.

7. Go to the BIOS configuration, and restore the BIOS setting.

================================================
BIOS Recovery (see user's manual for details)
================================================

Recovery BIOS with an USB Drive

If the BIOS file is corrupted and the system is not able to boot up, this feature will allow you to recover the BIOS
image using an USB-attached device.  A USB flash drive or a USB CD/DVD ROM drive may be used for this purpose.  Please
note that the USB hard disk drive is NOT supported.  Please follow below procedure to recover the BIOS.

1. Use a different system, copy the standard BIOS binary image file into a USB flash drive or a writable CD/DVD disc's
   Root Directory, and rename the file to “SUPER.ROM”.

2. While the system is turned off, insert the USB device that contains the new BIOS binary image (“SUPER.ROM”).

3. Right after the system is turned on, press and hold <CTRL> and <HOME> keys together until the USB device's LED
   indicator comes on.  This may take a few seconds or a minute to start the process.

4. Once the USB device's LED is on, release the <Ctrl> and <Home> keys.  The system will enter the BIOS Recovery menu.
   Select "Proceed with flash update" to start the BIOS recovery process.  DO NOT INTERRUPT THIS PROCESS UNTIL IT’S 
   FINISHED!

5. After the Boot Sector Recovery Process is complete, press any key to reboot the system.

6. Boot into USB drive again.  When the DOS prompt appears, please type FLASH.BAT BIOSname#.### to start BIOS update,
   just like in standard BIOS update procedure.

7. Do not interrupt the process until the BIOS update is complete.

8. After you see the message of BIOS has completed the update, do the A/C power cycle & restore the BIOS setting.


Notes:

* If the BIOS flash failed, you may contact our RMA Dept. to have the BIOS chip reprogrammed.  This will require
shipping the board to our RMA Dept. for repair.  Please submit your RMA request at http://www.supermicro.com/support/rma/.



********* BIOS Naming Convention **********

BIOS name     : PPPPPSSY.MDD
PPPPP         : 5-Bytes for project name
SS            : 2-Bytes supplement for PPPPP
Y             : Year, 4 -> 2014, 5-> 2015, 6->2016
MDD           : Month / Date, For months, A -> Oct., B -> Nov., C -> Dec.

E.g.  BIOS with the build date: 9/25/2015:
        X10DRi-T -> X10DRi5.925
        X10DRT-P -> X10DRT5.925



---Last Update on: 10/26/2015---

