CREATE VIEW AS total_ventas AS 
    SELECT p.titulo, p.descripcion FROM producto AS p 
    INNER JOIN proveedor AS prov ON p.proveedor = prov.username WHERE p.categoría = "ropa"
    
CREATE VIEW AS comentario_product AS
    SELECT c.* from Comentario AS c
    INNER JOIN producto AS prov ON prov.id = c.producto
    WHERE p.marca = "ferrari"
    

CREATE INDEX dato_envio ON compra(direccionenvio);
CREATE INDEX titulo_producto ON producto(titulo);
CREATE INDEX tipo_tarjeta_credito ON TarCredito(tipo);