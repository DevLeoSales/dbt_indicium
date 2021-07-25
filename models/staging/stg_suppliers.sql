with fornecedores as (
    select
    country as pais,
    city as cidade,
    postal_code as cep,
    address as endereco,
    region as regiao,
    supplier_id as id_fornecedor,
    contact_name as contato_fornecedor,
    phone as telefone,
    company_name as nome_fornecedor,
    contact_title as cargo_fornecedor

    from {{ source('northwind_rawdata', 'suppliers')}}
)

select * from fornecedores