-- Universidad de San Carlos de Guatemala
-- Facultad de Ingenieria
-- Escuela de Ciencias y Sistemas
-- Laboratorio de sistemas de bases de datos 1
-- Gonzalo Antonio Garcia Solares - 201318652
-- Proyecto 1

-- :::::::::::::::::::::::::::    Consultas     :::::::::::::::::::::::::::
-- Instrucciones para las consultas que generan los reportes requeridos.

-- ********************************************CONSULTA 1********************************************************
SELECT p.nombre, p.telefono, t.id_transaccion, t.total FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        WHERE
            ti.nombre = 'P'
        ORDER BY
            t.total DESC
        FETCH FIRST ROW ONLY;
-- ********************************************CONSULTA 2********************************************************
SELECT p.id_persona, p.nombre, SUM(t.total) TOTAL FROM transaccion t
    INNER JOIN 
        persona p ON t.persona_id_persona = p.id_persona
    INNER JOIN 
        tipo ti ON p.tipo_id_tipo = ti.id_tipo
    WHERE
        ti.nombre = 'C'
    GROUP BY
        p.id_persona,
        p.nombre
    ORDER BY
        SUM(t.cantidad) DESC
    FETCH FIRST ROWS ONLY;
-- ********************************************CONSULTA 3********************************************************
(SELECT p.id_persona, p.direccion, r.nombre REGION, c.nombre CUIDAD, cp.numero CODIGO_POSTAL FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        INNER JOIN
            idigo_postal cp ON p.idpost_id_cp = cp.id_cp
        INNER JOIN
            ciudad c ON cp.ciudad_id_cuidad = c.id_ciudad
        INNER JOIN
            region r ON c.region_id_region = r.id_region
        WHERE
            ti.nombre = 'P'
        GROUP BY
                p.id_persona,
                p.direccion,
                r.nombre,
                c.nombre,
                cp.numero
        ORDER BY
            COUNT(t.id_transaccion) DESC
        FETCH FIRST ROW ONLY)
UNION ALL
(SELECT p.id_persona, p.direccion, r.nombre REGION, c.nombre CUIDAD, cp.numero CODIGO_POSTAL FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        INNER JOIN
            idigo_postal cp ON p.idpost_id_cp = cp.id_cp
        INNER JOIN
            ciudad c ON cp.ciudad_id_cuidad = c.id_ciudad
        INNER JOIN
            region r ON c.region_id_region = r.id_region
        WHERE
            ti.nombre = 'P'
        GROUP BY
                p.id_persona,
                p.direccion,
                r.nombre,
                c.nombre,
                cp.numero
        ORDER BY
            COUNT(t.id_transaccion) ASC
        FETCH FIRST ROW ONLY)
-- ********************************************CONSULTA 4********************************************************
SELECT p.id_persona, p.nombre, COUNT(t.id_transaccion) ORDENES, SUM(t.total) TOTAL FROM transaccion t
    INNER JOIN
        producto pro ON t.producto_id_producto = pro.id_producto
    INNER JOIN
        categoria c ON pro.categ_id_categoria = c.id_categoria
    INNER JOIN 
        persona p ON t.persona_id_persona = p.id_persona
    INNER JOIN 
        tipo ti ON p.tipo_id_tipo = ti.id_tipo
    WHERE
        c.nombre = 'Cheese' AND
        ti.nombre = 'C'
    GROUP BY
        p.id_persona,
        p.nombre
    ORDER BY
        SUM(t.cantidad) DESC
    FETCH FIRST 5 ROWS ONLY;
-- ********************************************CONSULTA 5********************************************************
(SELECT TO_CHAR(p.fecha_registro, 'mm') MES_REGISTRO, p.nombre FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        WHERE
            ti.nombre = 'C'
        GROUP BY
            TO_CHAR(p.fecha_registro, 'mm'),
            p.nombre
        ORDER BY
            SUM(t.total) DESC
        FETCH FIRST ROW ONLY)
UNION ALL
(SELECT TO_CHAR(p.fecha_registro, 'mm') MES_REGISTRO, p.nombre FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        WHERE
            ti.nombre = 'C'
        GROUP BY
            TO_CHAR(p.fecha_registro, 'mm'),
            p.nombre
        ORDER BY
            SUM(t.total) ASC
        FETCH FIRST ROW ONLY)
-- ********************************************CONSULTA 6********************************************************
(SELECT c.nombre, SUM(t.total) TOTAL
        FROM TRANSACCION t
        INNER JOIN
            producto p ON t.producto_id_producto = p.id_producto
        INNER JOIN
            categoria c ON p.CATEG_COD_CATEGORIA = c.id_categoria
        GROUP BY
            c.nombre
        ORDER BY 
            TOTAL DESC
        FETCH FIRST ROW ONLY)
UNION ALL
(SELECT c.nombre, SUM(t.total) TOTAL
        FROM TRANSACCION t
        INNER JOIN
            producto p ON t.producto_id_producto = p.id_producto
        INNER JOIN
            categoria c ON p.CATEG_COD_CATEGORIA = c.id_categoria
        GROUP BY
            c.nombre
        ORDER BY 
            TOTAL ASC
        FETCH FIRST ROW ONLY)
-- ********************************************CONSULTA 7********************************************************
SELECT p.nombre FROM transaccion t
    INNER JOIN
        producto pro ON t.producto_id_producto = pro.id_producto
    INNER JOIN
        categoria c ON pro.categ_id_categoria = c.id_categoria
    INNER JOIN 
        persona p ON t.persona_id_persona = p.id_persona
    INNER JOIN 
        tipo ti ON p.tipo_id_tipo = ti.id_tipo
    WHERE
        c.nombre = 'Fresh Vegetables' AND
        ti.nombre = 'P'
    GROUP BY
            p.nombre
    ORDER BY
        SUM(t.total) DESC
    FETCH FIRST 5 ROWS ONLY;
-- ********************************************CONSULTA 8********************************************************
(SELECT p.id_persona, p.direccion, r.nombre REGION, c.nombre CUIDAD, cp.numero CODIGO_POSTAL FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        INNER JOIN
            idigo_postal cp ON p.idpost_id_cp = cp.id_cp
        INNER JOIN
            ciudad c ON cp.ciudad_id_cuidad = c.id_ciudad
        INNER JOIN
            region r ON c.region_id_region = r.id_region
        WHERE
            ti.nombre = 'C'
        GROUP BY
                p.id_persona,
                p.direccion,
                r.nombre,
                c.nombre,
                cp.numero
        ORDER BY
            SUM(t.total) DESC
        FETCH FIRST ROW ONLY)
UNION ALL
(SELECT p.id_persona, p.direccion, r.nombre REGION, c.nombre CUIDAD, cp.numero CODIGO_POSTAL FROM transaccion t
    INNER JOIN 
        persona p ON t.persona_id_persona = p.id_persona
    INNER JOIN 
        tipo ti ON p.tipo_id_tipo = ti.id_tipo
    INNER JOIN
        idigo_postal cp ON p.idpost_id_cp = cp.id_cp
    INNER JOIN
        ciudad c ON cp.ciudad_id_cuidad = c.id_ciudad
    INNER JOIN
        region r ON c.region_id_region = r.id_region
    WHERE
        ti.nombre = 'C'
    GROUP BY
            p.id_persona,
            p.direccion,
            r.nombre,
            c.nombre,
            cp.numero
    ORDER BY
        SUM(t.total) ASC
    FETCH FIRST ROW ONLY)
-- ********************************************CONSULTA 9********************************************************
SELECT p.nombre, p.telefono, t.id_transaccion, t.total FROM transaccion t
        INNER JOIN 
            persona p ON t.persona_id_persona = p.id_persona
        INNER JOIN 
            tipo ti ON p.tipo_id_tipo = ti.id_tipo
        WHERE
            ti.nombre = 'P'
        ORDER BY
            t.cantidad ASC
        FETCH FIRST ROW ONLY;
-- ********************************************CONSULTA 10*******************************************************
SELECT p.nombre FROM transaccion t
    INNER JOIN
        producto pro ON t.producto_id_producto = pro.id_producto
    INNER JOIN
        categoria c ON pro.categ_id_categoria = c.id_categoria
    INNER JOIN 
        persona p ON t.persona_id_persona = p.id_persona
    INNER JOIN 
        tipo ti ON p.tipo_id_tipo = ti.id_tipo
    WHERE
        c.nombre = 'Seafood' AND
        ti.nombre = 'C'
    GROUP BY
            p.nombre
    ORDER BY
        SUM(t.cantidad) DESC
    FETCH FIRST 10 ROWS ONLY;