{{ config(schema='raw', alias='dbt_data', materialized='table') }}

select * from raw.data