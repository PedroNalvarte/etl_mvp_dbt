

select
  id_producto as product_id,
  tipo_producto as product,
  precio_unitario,
  costo_unitario
from "etl-server"."staging"."stg_producto"