
    
    

select
    id_metodo as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_metodo_envio"
where id_metodo is not null
group by id_metodo
having count(*) > 1


