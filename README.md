# Imaging

These files are used to deploy SWM (split WIM files) files to image Windows machines.

Start with a bootable WinPE https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-create-usb-bootable-drive

WinPE boots and runs the startnet.cmd https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/wpeinit-and-startnetcmd-using-winpe-startup-scripts

So start with mounting the Boot.WIM from the WinPE and editing that startnet.cmd file. I have mine looking for the image script on my USB and running that so I can easily view and edit it. You could just run the entire image script from here if you wanted.




USB Wim Deployment

![image](https://user-images.githubusercontent.com/12549223/168817516-6a655fc5-b522-469b-9926-313f4ab89107.png)

![image](https://user-images.githubusercontent.com/12549223/168817569-c186e19f-fd42-4442-8c06-cc4ff8d58266.png)
