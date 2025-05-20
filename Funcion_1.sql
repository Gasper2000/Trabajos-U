USE GAIT;

DELIMITER //

CREATE FUNCTION obtener_info_producto (id_producto INT) 
RETURNS VARCHAR(500) 
DETERMINISTIC 
BEGIN
    DECLARE nombre_producto VARCHAR(45);
    DECLARE precio DECIMAL(10, 2);
    DECLARE stock INT;

    -- Obtener información del producto
    SELECT name, price, stock INTO nombre_producto, precio, stock 
    FROM products 
    WHERE id = id_producto;

    -- Verificar si el producto existe
    IF nombre_producto IS NULL THEN
        RETURN 'Producto no encontrado';
    END IF;

    -- Devolver la información del producto
    RETURN CONCAT('Nombre: ', nombre_producto, ', Precio: ', precio, ', Stock: ', stock);
END //

DELIMITER ;