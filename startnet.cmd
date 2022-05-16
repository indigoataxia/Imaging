wpeinit
@echo off

#find and run the imaging script, I have it on my USB under Sources\.

for %%p in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do if exist %%p:sources\start.bat set w=%%p

call %w%:sources\start.bat
