
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_bb298d7e123e91d3d88b2cf6023d63e3]
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

    [dbt_test__audit.testview_bb298d7e123e91d3d88b2cf6023d63e3]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_bb298d7e123e91d3d88b2cf6023d63e3]
  ;')