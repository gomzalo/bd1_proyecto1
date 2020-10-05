OPTIONS (SKIP=1)
    LOAD DATA
    INFILE 'D:\G\Documents\FIUSAC\2020\16(2)\BD1\LAB (BD1)\Proyectos\1 - El eje del mundo\DataCenterData.csv'
    INTO TABLE temporal
    FIELDS TERMINATED BY ";"
    (
        nombre_compania     ,
        contacto_compania   ,
        correo_compania     ,
        telefono_compania   ,
        tipo                ,
        nombre              ,
        correo              ,
        telefono            ,
        fecha_registro "TO_DATE(:fecha_registro,'DD/MM/YYYY','NLS_DATE_LANGUAGE=ENGLISH')",
        direccion           ,
        ciudad              ,
        codigo_postal       ,
        region              ,
        producto            ,
        categoria_producto  ,
        cantidad            ,
        precio_unitario
    )