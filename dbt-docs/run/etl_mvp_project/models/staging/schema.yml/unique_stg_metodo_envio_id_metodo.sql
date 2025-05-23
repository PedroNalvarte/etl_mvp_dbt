
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_cff85249919934f9ec02aacb9b1c8ced]
   as 
    
    

select
    id_metodo as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_metodo_envio"
where id_metodo is not null
group by id_metodo
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

    [dbt_test__audit.testview_cff85249919934f9ec02aacb9b1c8ced]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_cff85249919934f9ec02aacb9b1c8ced]
  ;')