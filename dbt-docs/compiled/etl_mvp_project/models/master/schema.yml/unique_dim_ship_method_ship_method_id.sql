
    
    

select
    ship_method_id as unique_field,
    count(*) as n_records

from "etl-server"."master"."dim_ship_method"
where ship_method_id is not null
group by ship_method_id
having count(*) > 1


