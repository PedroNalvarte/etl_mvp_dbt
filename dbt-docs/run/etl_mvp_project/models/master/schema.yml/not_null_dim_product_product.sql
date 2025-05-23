
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_a7ce8e14c7eae768ed51f9b45da977fe]
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

    [dbt_test__audit.testview_a7ce8e14c7eae768ed51f9b45da977fe]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_a7ce8e14c7eae768ed51f9b45da977fe]
  ;')