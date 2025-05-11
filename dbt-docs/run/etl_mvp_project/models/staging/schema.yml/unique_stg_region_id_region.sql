
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_bedc8b204533d449b53188ee47cb2ebb]
   as 
    
    

select
    id_region as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_region"
where id_region is not null
group by id_region
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

    [dbt_test__audit.testview_bedc8b204533d449b53188ee47cb2ebb]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_bedc8b204533d449b53188ee47cb2ebb]
  ;')