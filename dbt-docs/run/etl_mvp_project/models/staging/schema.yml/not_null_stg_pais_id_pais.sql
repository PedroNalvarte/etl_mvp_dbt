
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_74238214d8b4c0d8a2f919d0d5fe7384]
   as 
    
    



select id_pais
from "etl-server"."staging"."stg_pais"
where id_pais is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_74238214d8b4c0d8a2f919d0d5fe7384]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_74238214d8b4c0d8a2f919d0d5fe7384]
  ;')