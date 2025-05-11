
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_9120a5d66e531d97276333799696be71]
   as 
    
    

select
    date_key as unique_field,
    count(*) as n_records

from "etl-server"."master"."dim_date"
where date_key is not null
group by date_key
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_9120a5d66e531d97276333799696be71]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_9120a5d66e531d97276333799696be71]
  ;')