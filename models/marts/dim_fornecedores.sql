with fornecedores as (
    select *
    from {{ref('stg_suppliers')}}
)

select * from fornecedores