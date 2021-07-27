with clientes as (
    select *
    from {{ref('stg_customers')}}
)

select * from clientes