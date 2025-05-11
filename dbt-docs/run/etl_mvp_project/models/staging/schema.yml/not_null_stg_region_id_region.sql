
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_6d2b947453893a91f731be5172be0b65]
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

    [dbt_test__audit.testview_6d2b947453893a91f731be5172be0b65]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_6d2b947453893a91f731be5172be0b65]
  ;')