with produtos as (
    select *
    from {{ref('stg_products')}}
)

select * from produtos