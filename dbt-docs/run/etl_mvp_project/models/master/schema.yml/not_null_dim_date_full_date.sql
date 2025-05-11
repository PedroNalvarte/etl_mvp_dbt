
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_b83b7cc06474843f7e17d41b5ac879c6]
   as 
    
    



select full_date
from "etl-server"."master"."dim_date"
where full_date is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b83b7cc06474843f7e17d41b5ac879c6]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_b83b7cc06474843f7e17d41b5ac879c6]
  ;')