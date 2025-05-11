
    
    

select
    id_pedido as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_pedido"
where id_pedido is not null
group by id_pedido
having count(*) > 1


