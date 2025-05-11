
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_77c7f0dc98694be1e2c9e16eb6d3d565]
   as 
    
    

select
    product_id as unique_field,
    count(*) as n_records

from "etl-server"."master"."dim_product"
where product_id is not null
group by product_id
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

    [dbt_test__audit.testview_77c7f0dc98694be1e2c9e16eb6d3d565]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_77c7f0dc98694be1e2c9e16eb6d3d565]
  ;')