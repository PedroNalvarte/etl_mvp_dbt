
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_1475f084980820f2ce7177d6664c5cf4]
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

    [dbt_test__audit.testview_1475f084980820f2ce7177d6664c5cf4]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_1475f084980820f2ce7177d6664c5cf4]
  ;')