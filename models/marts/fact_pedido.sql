with orders as (
    select *
    from {{ref('stg_orders')}}
), 

clientes as (
    select *
    from {{ref('dim_clientes')}}
), 

funcionarios as (
    select *
    from {{ref('dim_funcionarios')}}

),

transportadores as (
    select *
    from {{ref('dim_transportador')}}

),

juntar_chaves as (
    select
        clientes.empresa,
        id_pedido,
        funcionarios.nome as nome_funcionario,
        funcionarios.sobrenome as sobrenome_funcionario,
        transportadores.nome_transportadora as transportadora,
        data_pedido,
        regiao_entrega,
        data_expedicao,
        pais_entrega,
        nome_entrega,
        cep_entrega,
        cidade_entrega,
        frete,
        endereco_entrega, 
        data_prevista,
        quantidade_total,
        valor_faturado,
        quantidade_itens
    from orders
    left join clientes on orders.id_cliente = clientes.id_cliente
    left join funcionarios on orders.id_funcionario = funcionarios.id_funcionario
    left join transportadores on orders.id_transportador = transportadores.id_transportador
)

select * from juntar_chaves