
with clientes as (
    select
    row_number() over (order by customer_id) as sk_cliente, --chave auto-incremental
    customer_id as id_cliente, 
    contact_name as nome_contato,
    contact_title as cargo, 
    phone as telefone, 
    company_name as empresa,
    city as cidade,
    region as regiao,
    country as pais,
    postal_code as cep,
    address as endereco

    from {{ source('northwind_rawdata', 'customers')}}
)

select * from clientes