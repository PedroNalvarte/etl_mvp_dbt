
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_640b7aa56f31cb513756ce48a6d9694a]
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

    [dbt_test__audit.testview_640b7aa56f31cb513756ce48a6d9694a]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_640b7aa56f31cb513756ce48a6d9694a]
  ;')