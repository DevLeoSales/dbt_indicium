with fornecedores as (
    select
    row_number() over (order by suppliers.supplier_id) as  sk_supplier,
    country as pais,
    city as cidade,
    postal_code as cep,
    address as endereco,
    region as regiao,
    supplier_id as id_fornecedor,
    contact_name as contato_fornecedor,
    phone as telefone,
    company_name as nome_fornecedor,
    contact_title as cargo_fornecedor, 
    case
        when country = "Australia" then "Asia"
        when country = "Brazil" then "LATAM"
        when country = "Denmark" then "Europe"
        when country = "Finland" then "Europe"
        when country = "France" then "Europe"
        when country = "Germany" then "Europe"
        when country = "Italy" then "Europe"
        when country = "Japan" then "Asia"
        when country = "Netherlands" then "Europe"
        when country = "Norway" then "Europe"
        when country = "Singapore" then "Asia"
        when country = "Spain" then "Europe"
        when country = "Sweden" then "Europe"
        when country = "UK" then "Europe"
        when country = "USA" then "North America"       
    end as divisao


    from {{ source('northwind_rawdata', 'suppliers')}}
)

select * from fornecedores


