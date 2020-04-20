create table empleado_ext2 (
    num_empleado number(10,0) null,
    nombre varchar2(20) null,
    ap_paterno varchar2(20) null,
    ap_materno varchar2(20) null,
    fecha_nacimiento date null,
    email varchar2(20) null,
    sueldo_mensual number(8,2) null,
    comision number(5,2) null
)
organization external (
    type oracle_loader
    default directory tmp_dir
    access parameters(
        records delimited by newline
        badfile tmp_dir: 'empleado_ext2_bad.log'
        logile tmp_dir: 'empleado_ext2.log'
        fields terminated by ','
        lrtrim
        missing field values are null (
            num_empleado, nombre, ap_paterno, ap_materno,
            fecha_nacimieto date mask "dd/mm/yyyy",
            email, sueldo_mensual, comision
        )
    )
    location('empleado_ext2.csv')
)
reject limit unlimited;
