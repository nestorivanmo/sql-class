Prompt =========================================================
Prompt Iniciando validador - Práctica 11 complementaria
Prompt Presionar Enter si los valores configurados son correctos.
Prompt De lo contario editar el archvo &&p_archivo_validador_main 
Prompt O en su defecto proporcionar nuevos valores
Prompt =========================================================
accept p_usuario default &&p_usuario  prompt '* Nombre de usuario de la práctica [&&p_usuario]: '
accept p_usuario_pass default  &&p_usuario_pass  prompt '* Password para &p_usuario [configurado en script]: ' hide
accept p_sys_password default '&&p_sys_password' prompt '* Password de sys [configurado en script]: ' hide
accept p_archivo_respuestas default '&&p_archivo_respuestas' Prompt '* Archivo de respuestas [&&p_archivo_respuestas]: ' 
define p_dir=/tmp/bd-unam/p11c 
host mkdir -p /tmp/bd-unam/p11c
host rm -f &&p_dir/&&p_archivo_respuestas
host cp &&p_archivo_respuestas &&p_dir/&&p_archivo_respuestas
host chmod 444 &&p_dir/&&p_archivo_respuestas
connect sys/&&p_sys_password as sysdba
create or replace directory bd_unam_tmp as '&&p_dir';
grant read on directory bd_unam_tmp to &&p_usuario; 
Prompt conectando como &p_usuario
connect &p_usuario/&p_usuario_pass
Prompt creando procedimientos de validación.
@s-00-funciones-validacion.plb
Prompt creando tablas de respuesta
create or replace procedure spv_elimina_tablas wrapped 
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
fc 107
kwcizHeQwYv/QFDGdlfgW/ZNrBIwgwFK2ssVfC+iJscYecja0Y+XUt9w7q5d0A4DrFrzPmei
L1zL0KTICWnNERcZ/988uNis6XXUv4pA+TyaBc4nloTaN7hppqVwkC1ConLy9MyCAtFY+h24
FvcSVJABurqMylfkqJp9KakmFy6sjoA2FfCfNSNvxEZvbLkC/yl7XKMvkmTqq+tWwaVfejA2
a44rrGzp4nLG5zo6y4V6BVWXs18O4m9ub6Gz11sh8IR4

/
show errors
exec spv_elimina_tablas;
Prompt cargando archivo de respuestas
@&p_archivo_respuestas
create or replace procedure spv_crea_tablas_respuesta wrapped 
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
b22 2f6
Nrniy+ePfC8ANG7u1ujpOf+buDswgw0r2UgFfC+KMQ+vuo7dW6FKJW+tbC1pzsigWrYOeODp
fz6ZGBQWl5oP5eiRxiMMJq7fv1eYA5aSxuv++DD4m46Mcc1/s45LN0aESirXXDXHHRH+xzIf
qgUA4ivnlZ0G+JzBBM0cHAbNuTw/mEuwQwCEzEK3Zmbph7gdVFuFA9Sb7xh01t9fjnGLQ2RG
/A0DfwjJED3GM9KbBsnCZEszARr7Sv7DGlZMl0VSGlguWuGrX9uiyfJqErJjWKm530WY3xbr
MoF334KDCsVERoLZYH8MpGsfzva1073eivvB/3jXqVKgWy4/1svtfBirLxKQg490fSR3QOoL
1h7vjtd0eKs9HEA+k/3MKVWZqzijlUuwxqVmqkIwsdF7qAOiT7hbP4K3ZHeDfLZffPQl8c10
3W14UHN2jEY81+2g6iLaMqQ7wkixHD1vaYnH2nBUk59ikZYbHtTSiflPPAHFnXdipx+9tAHf
IdPcf5+l+RiynO1RCtmD2n4H0Uj7WxMbYaN2xjakZSEq6Q+azdfHYSb9mk9YpTeiqkffKKwm
r7IfU8U8kZA7sg4hDUHLyx7giUY4/SvJIQHAONzmnLZEViTz82ERV7rC6i6i8sdRWMKrooDp
s4pgsuXGMJEIIpEgT4oFY9fqnf9iDA0xKxAeDf2Q8DXEvKhOIem1F2gHxrmpMAFRVXoGvuka
aT2KMBMyBSxAzlISTimWTwgrdw==

/
show errors
exec spv_crea_tablas_respuesta
Prompt cargando datos de validacion
set define off
create or replace procedure spv_carga_datos wrapped 
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
2f90 bcd
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
8WJiMN52B5XGv90qLLUzD66l73Q=

/
show errors
exec spv_carga_datos
set define on
create or replace procedure spv_valida_estructura_archivo_resp wrapped 
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
332 25c
ha1+ImE0SyZ0PI1rd6GfBH8gWlQwgwIJLvaGfI5oxz+VmJP7zPFWfmtrW8Y/eTZKkRQxLq7m
MkT2hXuvn8D80A8x3GhG0bqk0gghgqveifLzOG6hRou4ZUmY1Zo7Ui66LG0zVLoLHga/QoMT
gypbyia9AaDJvnzTXOxrJWusNAoCwH9E6BumvqEExi3yP9G5qlWunHP/tgwvZZDSt5jigpIq
lTi3CATEvOqj4XLf1YmRNRdBrZPugoZP4SjQ6qtm6dysXH5lHEhfGRr7c5wMq4UOePfn95L7
j2aDDcy5iDIgT3SAs+5lAC32xBvt0D/m0wgG10EtIRYK1D1iiVyYKH1u/4BF8se2xQIJtkFJ
XWDXmtJSYBfSYTAb4TZT1uhN2YSZu8tFIUoibAXOPRPW4A8N4sAqdgrCS6puDzqG+I5twA++
OazMKYbvFicXAFENINpbh4xS2uqgv7F1EWL6z9/tyWwBQ9icpCL6HeQsIjTU6oU6f7j9OOVY
UxSlwmDLcXVXd2tC04jQNfglhbV0evJGRV2CTBXj3WLr2fYq7kQa/AGPupDzyoTopYr3xlXb
KHNkk9xFFdCdJ8c8Tg==

/
show errors
create or replace procedure spv_valida_respuestas wrapped 
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
d58 4d0
Lh2g0BzUIWiRrr7JOhlwF2IBZscwg0PqDCDrZy+LaA9/eNppUUbGbMz33zPmO3tSRYdbI8Kn
kfvvscs/oqmShlhMSUrNYSGelFtL8ScDgpo0n7wIn/96bYP7jMhkeO5g27PyRlhHsWNHmfcT
uOHOR2rdKOfHelQvyZC2MwaO/nclkzCojPl6DiJJP2K5N4bv0yRtyLf0DObgCKlTDaw6wFD9
eNsRrGXgt+KsK750FpieecHNh5InfLSISzRw1A31b1lJiVhqrybxKg5HEru1OQqVebhskV+j
z0lCN+EEkK8O8XuCEz9TgNQA3HHbcuTdXAEpEbIPCkcb0pCC1uXy+c/z0eMetOXTbkRUVmCj
RN+75cTLwzjBR696NJnrDkL3jdlRRzbYkXRmuj/03z7iOKrlS1kDWdFtd02X0jwLMuYEJUua
nZCsHkLHVZl7fu0JrsEwf60LB73wExM7PQhic5I0uuc8RiF88F7Dkr5ffyNHUVmeTt4oURpa
OKD50/ykzoljsXCpZT10SCw2c2c7qV646F4n2jbqYh9U8mQ9/b/bUYPN7mlfq1sESmvvgpgT
Sw0I9f0wDGg+uB8jpGwBP26vVb2grwDO3yH8zyhNdcWiCnBTf7kVzLAu35Gepcd79lfESV4k
0uEiKDAsnWseR03eeiSbfyOGW3mCWJxSqCvey2XZJaIG4GLIVy3dHS6gL19I/aRwtJRp49At
tMLin6xo1vBUYFGqWjDQ93syECoq/YKb1yRMQhg8ZS9/p6QPASTpK5M0K9SczOzSr5zKttLM
keGkasWSFIJo46I/UGtQZMCTb4NIy0LSvl+RCYV2QmTB4puoxL7YkTdWoj1AKFfbgAe8gInu
h5naJbVCjrLPKjLSFgkj0AZz9+xP33YNmrcrVclpncd3MCGflsbRof7++274+CxycLSlVwM1
8J23VXegfW7aGUF+u/dCj6i1dbUkA6VLfd/MhzVD+dxOHeBfwGyegeonb/zMBUN2hxDD3DF9
ytQIBesjw4RKJmfrcDIpFRQ8ZbbVf3vx8ytFGCKwBKcnVKWWTNkDKftTJlnACFxKJ3YBfpJ8
3CA5aFKkPz3GmQaJpS/3HJlJ20WPX1TSllAEvSriINMYTPyro/SOkPS7XtTXAP1ySA+8rruD
MfxPSLZ8ff4WlpEJxO1FZklcW4EeyycoyAL5D6ENAyVM1Gz5JfA74D+bmVu7N48=

/
show errors
set appinfo on
exec spv_print_header
host sha256sum &&p_archivo_validador
exec spv_valida_respuestas('&&p_usuario','&&p_archivo_respuestas')
host rm -f &&p_dir/&&p_archivo_respuestas
