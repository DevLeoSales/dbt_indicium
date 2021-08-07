with transportadores as (
    select 
    row_number() over (order by shipper_id) as sk_transportador,
    shipper_id as id_transportador,
    phone as telefone_transportadora,
    company_name as nome_transportadora
    from {{ source('northwind_rawdata', 'shippers')}}
)

select * from transportadores