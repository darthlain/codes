@echo off
robocopy C:\Users\kk F:\backups\user-backup /MIR /R:5 /W:0 /NP /NDL /TEE /XJD /XJF /XO /LOG:"c:\Users\kk\backup1.log"
robocopy F:\ G:\ /MIR /R:5 /W:0 /NP /NDL /TEE /XJD /XJF /XO /LOG:"c:\Users\kk\backup2.log"
