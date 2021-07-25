with funcionarios as (
    select *
    from {{ref('stg_employees')}}
)

select * from funcionarios