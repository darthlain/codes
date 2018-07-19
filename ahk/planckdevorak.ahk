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

;Single
vk1Dsc07B::vk1Dsc07B
vk1Csc079::vk1Csc079
vkF3sc029::send,#d
vkF4sc029::send,#d

q::'
Shift & q::send,{Blind}"
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
@::BackSpace

a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
vkBAsc028::Enter

z::;
Shift & z::send,`:
x::q
c::j
v::k
b::x
n::b
m::m
,::w
.::v
/::z
vkE2sc073::Shift

;Lower
vk1Dsc07B & TAB::send,{blind}{Esc}
vk1Dsc07B & q:: send,{blind}1
vk1Dsc07B & w:: send,{blind}2
vk1Dsc07B & e:: send,{blind}3
vk1Dsc07B & r:: send,{blind}4
vk1Dsc07B & t:: send,{blind}5
vk1Dsc07B & y:: send,{blind}6
vk1Dsc07B & u:: send,{blind}7
vk1Dsc07B & i:: send,{blind}8
vk1Dsc07B & o:: send,{blind}9
vk1Dsc07B & p:: send,{blind}0
vk1Dsc07B & @:: send,{blind}{Appskey}

vk1Dsc07B & a:: send,{blind}-
vk1Dsc07B & s:: send,{blind}=
vk1Dsc07B & d:: send,{blind}/
vk1Dsc07B & f:: send,{blind}\
vk1Dsc07B & g:: send,{blind}``
vk1Dsc07B & h:: send,{blind}{Left}
vk1Dsc07B & j:: send,{blind}{Down}
vk1Dsc07B & k:: send,{blind}{Up}
vk1Dsc07B & l:: send,{blind}{Right}
vk1Dsc07B & +:: send,{blind}[
vk1Dsc07B & *:: send,{blind}]
 
vk1Dsc07B & z:: send,{blind}{F1}
vk1Dsc07B & x:: send,{blind}{F2}
vk1Dsc07B & c:: send,{blind}{F3}
vk1Dsc07B & v:: send,{blind}{F4}
vk1Dsc07B & b:: send,{blind}{F5}
vk1Dsc07B & n:: send,{blind}{F6}
vk1Dsc07B & m:: send,{blind}{F7}
vk1Dsc07B & <:: send,{blind}{F8}
vk1Dsc07B & >:: send,{blind}{F9}
vk1Dsc07B & /:: send,{blind}{F10}

;Riser
vk1Csc079 & TAB:: send,{blind}{Ins}
vk1Csc079 & q:: send,{blind}{!}
vk1Csc079 & w:: send,{blind}@
vk1Csc079 & e:: send,{blind}{#}
vk1Csc079 & r:: send,{blind}$
vk1Csc079 & t:: send,{blind}`%
vk1Csc079 & y:: send,{blind}{^}
vk1Csc079 & u:: send,{blind}&
vk1Csc079 & i:: send,{blind}*
vk1Csc079 & o:: send,{blind}(
vk1Csc079 & p:: send,{blind})
vk1Csc079 & @:: send,{blind}{Del}

vk1Csc079 & a:: send,{blind}_
vk1Csc079 & s:: send,{blind}{+}
vk1Csc079 & d:: send,{blind}?
vk1Csc079 & f:: send,{blind}|
vk1Csc079 & g:: send,{blind}~
vk1Csc079 & h:: send,{blind}{Left}
vk1Csc079 & j:: send,{blind}{Down}
vk1Csc079 & k:: send,{blind}{Up}
vk1Csc079 & l:: send,{blind}{Right}
vk1Csc079 & +:: send,{blind}{{}
vk1Csc079 & *:: send,{blind}{}}

vk1Csc079 & z:: send,{blind}{F11}
vk1Csc079 & x:: send,{blind}{F12}
vk1Csc079 & c:: ShiftAltTab
vk1Csc079 & v:: AltTab
vk1Csc079 & b:: send,#d
vk1Csc079 & n:: send,!^+#r
vk1Csc079 & m:: send,!^+#f
vk1csc079 & ,:: send,{Volume_Down}
vk1Csc079 & .:: send,{Volume_Up}
vk1Csc079 & /:: send,{Volume_Mute}
