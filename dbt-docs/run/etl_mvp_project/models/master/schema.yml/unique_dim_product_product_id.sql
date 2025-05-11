
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_ecd5afb58a0bd5570715b6e505830985]
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

    [dbt_test__audit.testview_ecd5afb58a0bd5570715b6e505830985]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_ecd5afb58a0bd5570715b6e505830985]
  ;')