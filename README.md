USB Wim Deployment

These files are used to deploy SWM (split WIM files) files to image Windows machines.

Start with creating a FAT32 formatted (for UEFI compatability) bootable WinPE on a USB drive https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-create-usb-bootable-drive.

WinPE boots and runs the startnet.cmd https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/wpeinit-and-startnetcmd-using-winpe-startup-scripts.

Mount the Boot.WIM from the WinPE (ex. Dism /Mount-Image /ImageFile:"d:\sources\boot.wim" /index:1 /MountDir:C:\mount) and replace the startnet.cmd file. I have mine looking for the image script on my USB so I can easily view and edit it as apposed to mounting the WIM and editing everytime you need to. You could just run the entire image script from startnet.cmd if you wanted.

After startnet.cmd is replaced (or edited) commit the changes (eg. Dism /Unmount-Image /MountDir:C:\mount /commit).

Add the Image.bat file to the Sources folder on the bootable USB.

Create an Images folder and add the Image SWM files in its own subfolder inside the Images folder.

The USB should now be ready to boot and apply image.

![image](https://user-images.githubusercontent.com/12549223/168819514-284c5b39-dee7-43f5-a743-187749885b50.png)

When you boot from the USB it will first list the Fixed Hard Disks and prompt you to enter the disk number that you want to image. You can press Enter for Disk 0 default.

![image](https://user-images.githubusercontent.com/12549223/168829747-329d165a-9cab-4fba-bd4d-3e302efae747.png)

It will then list all the image folders in the USB\Images folder and ask you which you want to apply. You can press Enter for the default first image listed.

![image](https://user-images.githubusercontent.com/12549223/168831544-719e8139-82d9-4a8a-880f-32a73e7b34dc.png)

The script will then partition the hard drive and apply the image. When finished it will prompt for any key press to reboot to complete.

![image](https://user-images.githubusercontent.com/12549223/168840121-73b1a2ab-6fcd-4f72-bfcc-8ee004ae27cc.png)
