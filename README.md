# X10DRG-Q_NVMe-boot
BIOS mod for the Supermicro X10DRG-Q motherboard that adds NVMe boot support.

I used [this](https://web.archive.org/web/20230402030107/https://winraid.level1techs.com/t/howto-get-full-nvme-support-for-all-systems-with-an-ami-uefi-bios/30901) guide (courtesy of the Internet Archive) to mod my BIOS.

I downloaded the official latest release of the X10DRG-Q BIOS from the [Supermicro official website](https://www.supermicro.com/en/support/resources/downloadcenter/firmware/MBD-X10DRG-Q/BIOS). 

I downloaded the NvmExpressDxe_5.ffs module from [tyami94](https://github.com/tyami94)'s [x10drh-rebar-nvme](https://github.com/tyami94/x10drh-rebar-nvme) repository, as the link to get it in the guide was broken.

I downloaded UEFITool version 0.25.1 (the same one used in the guide, [the latest one doesn't support the insertion of modules](https://github.com/LongSoft/UEFITool/issues/67)) from the [official repository](https://github.com/LongSoft/UEFITool)'s [corresponding release](https://github.com/LongSoft/UEFITool/releases/tag/0.25.1).

I used the Supermicro IPMI BIOS update feature to update the BIOS with my modded one on the board. This requires a license that can be generated with a website (https://cryptii.com/pipes/QiZmdA) I found in [manfromafar](https://github.com/manfromafar)'s [supermicro-ipmi-keygen](https://github.com/manfromafar/supermicro-ipmi-keygen) repository. It is important that you take the License Key this site gives you and capitalize all the letters, or it won't work (ask me how i know...). The site https://docs.telehouse.solutions/supermicro_ipmi_licenses.html also works perfectly.

The NvmExpressDxe_4.ffs module was not used in this project, as I downloaded it before finding the NvmExpressDxe_5.ffs one, but I will include it in the files anyway just in case somebody needs it.

After getting all the necessary tools, I followed the guide.

I will upload all the files I used, as well as the modded BIOS, in this repository.

With this, I was able to boot Proxmox from two Intel p4610 U.2 NVMe 1.6TB drives in RAID1.
