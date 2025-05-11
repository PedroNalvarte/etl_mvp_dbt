
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_2e4681fbcbc9eeaade9b6a441649051f]
   as 
    
    



select ingreso_total
from "etl-server"."staging"."stg_detalle_pedido"
where ingreso_total is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_2e4681fbcbc9eeaade9b6a441649051f]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_2e4681fbcbc9eeaade9b6a441649051f]
  ;')