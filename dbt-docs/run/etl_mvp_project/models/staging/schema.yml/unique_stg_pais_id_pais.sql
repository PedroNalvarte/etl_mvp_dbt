
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_c772d959c98f03dde8f7e644bba60634]
   as 
    
    

select
    id_pais as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_pais"
where id_pais is not null
group by id_pais
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

    [dbt_test__audit.testview_c772d959c98f03dde8f7e644bba60634]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_c772d959c98f03dde8f7e644bba60634]
  ;')