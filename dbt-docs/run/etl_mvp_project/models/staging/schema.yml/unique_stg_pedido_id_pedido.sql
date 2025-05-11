
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_62d58740b40f617ab0ed32aaa6c8a388]
   as 
    
    

select
    id_pedido as unique_field,
    count(*) as n_records

from "etl-server"."staging"."stg_pedido"
where id_pedido is not null
group by id_pedido
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

    [dbt_test__audit.testview_62d58740b40f617ab0ed32aaa6c8a388]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_62d58740b40f617ab0ed32aaa6c8a388]
  ;')