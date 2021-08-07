with funcionarios as (
    select 
    product_id as id_produto,
    discount as desconto,
    unit_price as preco_unitario,
    quantity as quantidade,
    order_id as id_pedido
    from {{ source('northwind_rawdata', 'order_details')}}
)

select * from funcionarios