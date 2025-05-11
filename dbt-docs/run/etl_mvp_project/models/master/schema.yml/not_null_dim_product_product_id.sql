
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_6579f45071f961ea701a4a3c2fd68e1b]
   as 
    
    



select product_id
from "etl-server"."master"."dim_product"
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

    [dbt_test__audit.testview_6579f45071f961ea701a4a3c2fd68e1b]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_6579f45071f961ea701a4a3c2fd68e1b]
  ;')