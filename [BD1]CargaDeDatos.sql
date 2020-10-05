-- Universidad de San Carlos de Guatemala
-- Facultad de Ingenieria
-- Escuela de Ciencias y Sistemas
-- Laboratorio de sistemas de bases de datos 1
-- Gonzalo Antonio Garcia Solares - 201318652
-- Proyecto 1

-- :::::::::::::::::::::::::::    Carga     :::::::::::::::::::::::::::
-- Instrucciones para la carga de los datos a las tablas en la base de datos.

INSERT INTO tipo(nombre)
	SELECT DISTINCT(tipo) FROM temporal;
INSERT INTO region(nombre)
	SELECT DISTINCT(region) from temporal;
INSERT INTO categoria(nombre)
	SELECT DISTINCT(categoria_producto) from temporal;
INSERT INTO compania(nombre, contacto, correo, telefono)
	SELECT temp.NOMBRE_COMPANIA, temp.CONTACTO_COMPANIA, temp.CORREO_COMPANIA, temp.TELEFONO_COMPANIA
	    FROM temporal temp
	    GROUP BY
		    temp.NOMBRE_COMPANIA,
		    temp.CONTACTO_COMPANIA,
		    temp.CORREO_COMPANIA,
		    temp.TELEFONO_COMPANIA;


INSERT INTO ciudad(nombre, REGION_COD_REGION)
	SELECT temp.ciudad, r.id_region
		FROM 
		    temporal temp
		INNER JOIN
		    region r ON temp.region = r.nombre
		GROUP BY 
		    r.id_region,
		    temp.ciudad;
INSERT INTO idigo_postal(NUMERO, CIUDAD_COD_CUIDAD)
	SELECT temp.idigo_postal, c.id_ciudad
		FROM 
		    temporal temp
		INNER JOIN
		    region r ON temp.region = r.nombre
		INNER JOIN
		    ciudad c ON temp.ciudad = c.nombre AND r.id_region = c.REGION_COD_REGION
		GROUP BY 
		    temp.idigo_postal,
		    c.id_ciudad;
INSERT INTO producto(NOMBRE, PRECIO, CATEG_COD_CATEGORIA)
	SELECT temp.producto, temp.precio_unitario, c.id_categoria
		FROM temporal temp
		INNER JOIN
		    categoria c ON temp.categoria_producto = c.nombre
		GROUP BY
		    temp.producto,
		    temp.precio_unitario,
		    c.id_categoria;
INSERT INTO persona(NOMBRE, CORREO, TELEFONO, FECHA_REGISTRO, DIRECCION, TIPO_COD_TIPO, CODPOST_COD_CP)
	SELECT temp.NOMBRE, temp.CORREO, temp.TELEFONO, temp.FECHA_REGISTRO, temp.DIRECCION, t.id_tipo, cp.id_cp 
        FROM temporal temp
        INNER JOIN
            tipo t ON temp.tipo = t.nombre
        INNER JOIN
            idigo_postal cp ON temp.idigo_postal = cp.numero
        GROUP BY
            temp.NOMBRE,
            temp.CORREO,
            temp.TELEFONO,
            temp.FECHA_REGISTRO,
            temp.DIRECCION,
            t.id_tipo,
            cp.id_cp;
INSERT INTO transaccion(CANTIDAD, TOTAL, PERSONA_COD_PERSONA, PRODUCTO_COD_PRODUCTO, COMPANIA_COD_COMPANIA)
	SELECT temp.CANTIDAD, temp.CANTIDAD*temp.PRECIO_UNITARIO  AS TOTAL, p.id_persona, pro.id_producto, c.id_compania
        FROM temporal temp
        INNER JOIN
            persona p ON temp.nombre = p.nombre
        INNER JOIN
            producto pro ON temp.producto = pro.nombre
        INNER JOIN
            compania c ON temp.nombre_compania = c.nombre