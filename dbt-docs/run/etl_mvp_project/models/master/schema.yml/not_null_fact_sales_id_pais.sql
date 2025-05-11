
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_81b165edf6e7411dec1680b3e8f95846]
   as 
    
    



select id_pais
from "etl-server"."master"."fact_sales"
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

    [dbt_test__audit.testview_81b165edf6e7411dec1680b3e8f95846]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_81b165edf6e7411dec1680b3e8f95846]
  ;')