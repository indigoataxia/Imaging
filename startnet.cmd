wpeinit
@echo off

#find the drive with the imaging script, copy the image script to the WinPE boot drive X, and run the imaging script. I've had best results copying the script instead of running right from USB drive incase paths somehow change

#I have the script on my USB under Sources.

for %%p in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do if exist %%p:sources\start.bat set w=%%p
copy %w%:\sources\image.bat x:\image.bat
call x:\image.bat
