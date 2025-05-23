
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_e6cc97667768b7698475aa3406bd0e45]
   as 
    
    



select id_detalle
from "etl-server"."staging"."stg_detalle_pedido"
where id_detalle is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e6cc97667768b7698475aa3406bd0e45]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_e6cc97667768b7698475aa3406bd0e45]
  ;')