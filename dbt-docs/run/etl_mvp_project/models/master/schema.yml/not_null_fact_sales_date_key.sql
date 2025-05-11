
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_60ebd9d81a698f2380377e6d17635c2b]
   as 
    
    



select date_key
from "etl-server"."master"."fact_sales"
where date_key is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_60ebd9d81a698f2380377e6d17635c2b]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_60ebd9d81a698f2380377e6d17635c2b]
  ;')