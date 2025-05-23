
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_750edf90290962b3dd192aec3292ca85]
   as 
    
    

select
    id_producto as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_producto"
where id_producto is not null
group by id_producto
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_750edf90290962b3dd192aec3292ca85]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_750edf90290962b3dd192aec3292ca85]
  ;')