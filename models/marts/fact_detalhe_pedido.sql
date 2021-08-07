with produtos as(
    select *
    from {{ref('dim_produtos')}}
),
fornecedores as (
    select *
    from {{ref('dim_fornecedores')}}
),

pedidos as (
    select 
    id_pedido,
    sum(quantidade) as quantitade_pedido,
    sum(detalhes_pedido.preco_unitario*(1-detalhes_pedido.desconto)*detalhes_pedido.quantidade) as valor_pedido,
    count(*) as itens_no_pedido
    from {{ref('stg_order_details')}} as detalhes_pedido
    group by id_pedido
),

detalhe_pedido as (
    select
    produtos.nome_produto,
    produtos.id_produto,
    pedidos.id_pedido,
    pedidos.quantitade_pedido,
    pedidos.valor_pedido,
    pedidos.itens_no_pedido,
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