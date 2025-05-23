
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_07162b1fadd1158303fb58e7f9e90b22]
   as 
    
    



select tipo_producto
from "etl-server"."staging"."stg_producto"
where tipo_producto is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_07162b1fadd1158303fb58e7f9e90b22]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_07162b1fadd1158303fb58e7f9e90b22]
  ;')