
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_3e26d13d66e43d029361f714d9731090]
   as 
    
    



select units_sold
from "etl-server"."master"."fact_sales"
where units_sold is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_3e26d13d66e43d029361f714d9731090]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_3e26d13d66e43d029361f714d9731090]
  ;')