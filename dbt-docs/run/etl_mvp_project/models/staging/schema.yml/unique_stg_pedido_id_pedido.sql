
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_336f407534888060e442ead0223596e6]
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

    [dbt_test__audit.testview_336f407534888060e442ead0223596e6]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_336f407534888060e442ead0223596e6]
  ;')