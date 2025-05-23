
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_295487833c3a9c03a07f731f668f00bc]
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

    [dbt_test__audit.testview_295487833c3a9c03a07f731f668f00bc]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_295487833c3a9c03a07f731f668f00bc]
  ;')