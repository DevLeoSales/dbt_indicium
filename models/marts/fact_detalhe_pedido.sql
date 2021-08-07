with produtos as(
    select *
    from {{ref('dim_produtos')}}
),
fornecedores as (
    select *
    from {{ref('dim_fornecedores')}}
),

pedidos as (
    select *
    from {{ref('stg_order_details')}}
),

detalhe_pedido as (
    select 
    produtos.nome_produto,
    produtos.id_produto,
    pedidos.desconto,
    pedidos.preco_unitario,
    pedidos.quantidade,
    pedidos.id_pedido,
    quantidade_por_unidade,
    fornecedores.nome_fornecedor,
    pais,
    discontinuado
    from {{ref('stg_order_details')}} as order_details
    left join produtos on order_details.id_produto = produtos.id_produto
    left join fornecedores on produtos.id_fornecedor = fornecedores.id_fornecedor
    left join pedidos on order_details.id_pedido = pedidos.id_pedido

)

select * from detalhe_pedido