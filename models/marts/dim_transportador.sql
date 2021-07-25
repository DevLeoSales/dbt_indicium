with transportador as (
    select *
    from {{ref('stg_shippers')}}
)

select * from transportador