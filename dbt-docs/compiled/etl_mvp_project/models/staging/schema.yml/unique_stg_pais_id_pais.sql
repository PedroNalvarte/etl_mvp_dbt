
    
    

select
    id_pais as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_pais"
where id_pais is not null
group by id_pais
having count(*) > 1


