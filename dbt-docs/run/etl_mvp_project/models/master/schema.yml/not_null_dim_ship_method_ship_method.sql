
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_c450239e75ef2ece78b6563815938790]
   as 
    
    



select ship_method
from "etl-server"."master"."dim_ship_method"
where ship_method is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_c450239e75ef2ece78b6563815938790]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_c450239e75ef2ece78b6563815938790]
  ;')