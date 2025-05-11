
    
    

select
    id_region as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_region"
where id_region is not null
group by id_region
having count(*) > 1


