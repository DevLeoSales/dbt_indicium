with produtos as (
    select 
    product_id as id_produto,
    units_in_stock as unidades_em_estoque,
    category_id as id_categoria,
    product_name as nome_produto,
    quantity_per_unit as quantidade_por_unidade,
    supplier_id as id_fornecedor,
    units_on_order as unidades_no_pedido,
    discontinued as discontinuado,
    reorder_level as quantidade_recompra
    from {{ source('northwind_rawdata', 'products')}}
)

select * from produtos