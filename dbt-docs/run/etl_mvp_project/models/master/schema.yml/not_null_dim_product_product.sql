
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_f80f93591e0bf53c94d265da855a91b2]
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

    [dbt_test__audit.testview_f80f93591e0bf53c94d265da855a91b2]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_f80f93591e0bf53c94d265da855a91b2]
  ;')