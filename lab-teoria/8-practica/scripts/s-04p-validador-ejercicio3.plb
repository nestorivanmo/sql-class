
whenever sqlerror exit rollback

@s-04-variables-validador.sql

connect &&p_usuario/&&p_usuario_pass

set serveroutput on
prompt Creando procedimientos para Validar

@s-00-funciones-validacion.plb

create or replace procedure p_valida_ejercicio3 wrapped 
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
12df 697
JStdNXKrNS7wRasoZvB/Dcj4Ecowgw1U18CMVy8Zx+WbyxDvMWY+vaUgxVuslBOT/VT7MeW+
adhq/zDFmT6KRz6WgnJLxO2LlWFE4YoE2ghXDK0+kwl4D6pV8SIxhuKVYKgXpQQQ0Cxv/lKJ
zwybOuC8hfVLc+u2qZiFwIRJpkluVXw/MiPAwGrUYccjZjkQu9GbU8029/gFWOCwEQSw/oiJ
/7kDdrRJ1GIFwkxQjU7V3pXoR54OpRIzHq0O7brtgF+awL85RyhHytLv1ZHccBi5JBt090gz
gDPn13JN5SZFuA/mZRBPCI9ZnafcXEw7oxhOm7uaoUGvZnP5mx3MybhPZ8JxlQqwYyVTEVEG
+pyVwI0XDMg5DFoll2bsJGwpxadABrvtCFV1SkPfOJQPASFMUZ8mgz1K531yV5AX2dk8qcUd
bqfE1CsEsTEjIGc3zb73wZvdNDKwM6MRZDnlifNRJ86wtsCibgqV7+DU1AunZAadwgfpiCrk
orQV6nfO+6EZON4N6N88bPZRxOa59DCNJoibfx4oFmz1ZUVsourDAasjR4JbRgTCxw5NQwyN
WB5Yt8hpZVCg4E3WTsZr2oHXGakRosb/f6jX5SfOgif5X0CdJXnVbU4HRCtSwjRGzDTTkVYs
t3acu8DjV/LaqcEX9hV/ecEyjAGiUmgxsmCy6B9Cyd1ThhiLWd+ZZd9P37WXMjrdMnOgeB7i
K5YL1C4iwDgnwF68Yl0/V2ITBToR/gZYp7pHKJCXbQf0c1btfmxLVdkUdh+HyUjwlYIk6hR+
wUVVbZbvUrCCsZYHxjhwgoePMdHLVAV1n80nVDpltXxym3pYC0R2NM7QlvinZTz8ZTz8Zadt
CyCIasD35l8XL3rUQmj1cgOg3Q2TPWLnXLT7S/ChHoG6Bw56JAw0LMaGqAU1HU5UG0QBRLcF
aKjHBXXDMLYJmcc9uko4udiiXNftftI3KYTvZsVBbctLwzEYR/TZrblcQ27xEol6CcmmuXwd
UYaAOSB77xH3ZrFnE1JSub2Ex9fJpLEqddfEwPJ9tOID1ciG7l4jfOT+awfv7gX/pIYiq9Zz
YOFfxGZQxLZwu3Sv+Us2NNrh5XNP825qu/UuDTRrvTNI+wJL6aHdxX+mYC1pLGUtPRBC8fb+
hxZA7mvFa2tj51ITQLrJLkdaM9VLgBTDGHC6b93LTGniXVGYVy4+ND9pdcvRFq8oyK9Qymrc
F8RJjH1hlSTtlbbNTC/NrKtnEoTmpQPrtmP4f72u5wooicva9VqfC1GDE3Wi9fgAO0Nkzas4
jURmbPVfowi4PUu8QioXQU1K3V1PBErwtPDwpwY2GlXc0HRaTycwCYbWwSwqexoFHoakrHQj
zjS10gW60lGIqul/iZSeUV2LXFWwrhU0dUUYTiD6xRxITRixEVwRRJgTsTnWiQEtNHJzNmqB
uaChwkN7+3jVIyqMmnjRITUK4v3t+QL5N/XgqvGWH5a1GsBibTuR8ITkRZdS1YjmAh13pHyj
JqNOD+syfLq2BShxSIbpz8eEg6foVezWubokYuNTuEKmGE1kFr4Dz6iWsZhsQjtqDPu6E+li
nXt205qSbDTl4820g0ia+NwYz3PFs2hP71jxVu16VmgrLDvRuRhPWItlHink7r2db4JYgkWS
QyQynooy

/
show errors

exec spv_print_header

Prompt Iniciando validación.

exec p_valida_ejercicio3

Prompt Validación concluida!
exit