{{ config(
    schema='raw',
    alias='dbt_data'
) }}

select * from raw.data;2