#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
#InstallKeybdHook
#Persistent
#UseHook

;# win
;! alt
;^ ctrl
;+ shift

Shift & 1:: send,{!}
Shift & 2:: send,@
Shift & 3:: send,{#}
Shift & 4:: send,$
Shift & 5:: send,`%
Shift & 6:: send,{^}
Shift & 7:: send,&
Shift & 8:: send,*
Shift & 9:: send,(
Shift & 0:: send,)
Shift & -:: send,_
^::=
Shift & ^:: send,{blind}{+}

@::[
Shift & @:: send,{blind}{{}
[::]
Shift & [:: send,{blind}{}}

Shift & vkBBsc027:: send,`:
vkBAsc028::'
Shift & vkBAsc028:: send,{blind}"
]::`
Shift & ]:: send,{blind}~

Shift & \:: send,{blind}|
