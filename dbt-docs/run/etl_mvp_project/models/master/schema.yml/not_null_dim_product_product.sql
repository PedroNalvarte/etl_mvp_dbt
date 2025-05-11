
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_2a5c3f0431568aee311cb7dcf8dae441]
   as 
    
    



select product
from "etl-server"."master"."dim_product"
where product is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_2a5c3f0431568aee311cb7dcf8dae441]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_2a5c3f0431568aee311cb7dcf8dae441]
  ;')