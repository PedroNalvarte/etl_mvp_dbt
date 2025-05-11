
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_def71b10a66488a73468870cd6ed8437]
   as 
    
    

select
    ship_method_id as unique_field,
    count(*) as n_records

from "etl-server"."master"."dim_ship_method"
where ship_method_id is not null
group by ship_method_id
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

    [dbt_test__audit.testview_def71b10a66488a73468870cd6ed8437]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_def71b10a66488a73468870cd6ed8437]
  ;')