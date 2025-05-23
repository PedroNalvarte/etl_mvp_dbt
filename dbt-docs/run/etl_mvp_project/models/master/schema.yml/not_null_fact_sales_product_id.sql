
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_71a3550e54b555a90880626a5fe9455c]
   as 
    
    



select product_id
from "etl-server"."master"."fact_sales"
where product_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_71a3550e54b555a90880626a5fe9455c]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_71a3550e54b555a90880626a5fe9455c]
  ;')