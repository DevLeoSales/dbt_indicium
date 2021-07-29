with funcionarios as (
    select 
    product_id as id_produto,
    discount as desconto,
    unit_price as preco_unitario,
    quantity as quantidade
    from {{ source('northwind_rawdata', 'order_details')}}
)

select * from funcionarios