
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_ed3e76b604924df5654a7b29813aef3b]
   as 
    
    



select nombre_region
from "etl-server"."staging"."stg_region"
where nombre_region is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_ed3e76b604924df5654a7b29813aef3b]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_ed3e76b604924df5654a7b29813aef3b]
  ;')