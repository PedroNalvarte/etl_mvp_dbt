
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_b1f47ebcd40ded7e5408f72f86ed1921]
   as 
    
    



select nombre_pais
from "etl-server"."staging"."stg_pais"
where nombre_pais is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b1f47ebcd40ded7e5408f72f86ed1921]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_b1f47ebcd40ded7e5408f72f86ed1921]
  ;')