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

Shift & vkE2sc073:: send,{blind}|

vk1Dsc07B::vk1Dsc07B

vk1Dsc07B & a:: shiftalttab
vk1Dsc07B & s:: alttab
vk1Dsc07B & d:: send,#d
vk1Dsc07B & f:: send,!^+#f
vk1Dsc07B & g:: 
vk1Dsc07B & h:: send,{blind}{Left}
vk1Dsc07B & j:: send,{blind}{Down}
vk1Dsc07B & k:: send,{blind}{Up}
vk1Dsc07B & l:: send,{blind}{Right}
vk1Dsc07B & +:: send,{VOLUME_DOWN}
vk1Dsc07B & *:: send,{VOLUME_UP}
vk1Dsc07B & ]:: send,{VOLUME_MUTE}

vk1Dsc07B & z:: Reload
vk1Dsc07B & x:: send,!{f4}
vk1Dsc07B & c:: send,!^+#r
vk1Dsc07B & v:: 
vk1Dsc07B & b::
vk1Dsc07B & n:: send,{AppsKey}
vk1Dsc07B & m:: send,!{Space}
vk1Dsc07B & <:: send,#+{Left}
vk1Dsc07B & >:: send,#+{Right}
vk1Dsc07B & /:: Suspend
vk1Dsc07B & _:: Reload
