
  
  

  
  USE [etl-server];
  EXEC('create view 

    [dbt_test__audit.testview_cd3694e2932bd993c6695b6d2820ff27]
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

    [dbt_test__audit.testview_cd3694e2932bd993c6695b6d2820ff27]
  
  ) dbt_internal_test;

  USE [etl-server];
  EXEC('drop view 

    [dbt_test__audit.testview_cd3694e2932bd993c6695b6d2820ff27]
  ;')