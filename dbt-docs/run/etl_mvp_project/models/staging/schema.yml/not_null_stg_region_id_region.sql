
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_9c19ae4f2d886570c4ea35261b85bc84]
   as 
    
    



select id_region
from "etl-server"."staging"."stg_region"
where id_region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_9c19ae4f2d886570c4ea35261b85bc84]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_9c19ae4f2d886570c4ea35261b85bc84]
  ;')