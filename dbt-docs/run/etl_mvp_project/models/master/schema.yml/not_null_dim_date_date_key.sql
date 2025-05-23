
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_7abd97dd4221fbeefa17f54fb14ad67b]
   as 
    
    



select date_key
from "etl-server"."master"."dim_date"
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

    [dbt_test__audit.testview_7abd97dd4221fbeefa17f54fb14ad67b]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_7abd97dd4221fbeefa17f54fb14ad67b]
  ;')