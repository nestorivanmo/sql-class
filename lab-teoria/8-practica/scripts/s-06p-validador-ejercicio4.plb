whenever sqlerror exit rollback

@s-04-variables-validador.sql

connect &&p_usuario/&&p_usuario_pass

set serveroutput on
prompt Creando procedimientos para Validar

@s-00-funciones-validacion.plb

create or replace procedure p_valida_ejercicio4 wrapped 
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
ac7 4dd
oeTF193RG1p02R7hcY/L8lIrbXgwgz0r10iDZy+5vgmaONGNoY0bBE2JLKg9KhPUYghmA1CM
DS141yvUbX62DVwPTQdBm+c0VBdz1rKovfprCfPTyb/BE1i7E1iBhYzfiFl64ce1QIBlXbzO
G/FnOQmB3YidIzr8bN13xCnbAY/c0SIvu8OWP8ospMS0pNDo+YXHcYvrcmJq9LOnxmus4ZbD
vciu2wOkBWtQgjPcmdV5WkDbycgLxBmK++ZQl5wiwIuzmUtJ2wFvfbUP/705GDXOQ+AsX4af
/rQhsu15vh3KC8kt+lN6j9odeus733LjEEg6Q/NocHcsVF+gX/+YhAPHtN4TgFApQTTa1GQt
IEbu7n6fzh0kuBBVKZBHXaHsiwgdw0K6hn8IVNmKnDi7E/g9tyLhcHStNpnzF3YYaaiOnGaT
+e7I9FQUyMl6uhpQRIx8zoHZ58N06mZTizBvokJwDF/4L9VaCFpfb5PCNETzNWa8lyEMd69g
Gg3mM6NXEZJconpdmMVehcC5X4iBdhOSHol4RicRUOWm6gwueXgyzerluXOdwtHgSkWRvdNt
naN19onpbGVpaWeK5WXkTSc2xyIW8FX4AnI3865jRR1cZiWwK+ZKS56/DEx6JcLv/H8eX8uk
/Nq5iTALB0Uyk3wXonOL82LJsFXiXX4naMXC7V4AlcCMQCeAQ4eM6E3Zem2zvDifI4CA7cSQ
NOvl2KvAxOrAxHhDG/NHXPEI1ZShY0TZXXE3gpAGxza+nnpeaUKp5YLvrbcIm2Fpj+KmjKsD
3awRXOrV2OE2Wz4hRmgyzyJm1CRmmGlvhC0Nc0msGUfmCGJlfh57YqkrylB3z7Z8wb2x6Z3R
8u7y1HhmoWw8pdaDpcq6j7KBtpgHgHtusdpNRtwnzsQT8kPw6+MJ1hWCIDR5JwDdS4uczMmy
/TtjB2tCntrzcbFC6GVdHbY7vi67CwmPSjTTvYvVoPST10lkdmA+TQx242XDKaEQalw+H0M0
3N/ZVXgQmoFtSNcX0qwA9ciTwMQGRdXmRRNGpjpK9OduwS+iZXK3B5LNFtQWraIET1rB4cF6
IojXJxlZvSk+8yGQKc8t5JCLbc+fPscEfSIkJkVaQNKZCKNdFcBAElB4i3ppuxdxYFs37Iiu
qyO5g3TrTAnMyA9/q448jwq/SvC6iziMI7xVhJohqtB0XZvfPAQ1oMhDBRjJGFPW6x+q+7//
CLY=

/

show errors

exec spv_print_header

Prompt Iniciando validación.

exec p_valida_ejercicio4

Prompt Validación concluida !
exit
