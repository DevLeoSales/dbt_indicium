with funcionarios as (
    select 
    country as pais,
    city as cidade,
    postal_code as cep,
    hire_date as data_admissao,
    address as endereco,
    birth_date as data_nasc,
    region as regiao,
    last_name as sobrenome,
    employee_id as id_funcionario,
    first_name as nome,
    title as cargo,
    title_of_courtesy as vocativo,
    notes as observacoes,
    home_phone as tel_residencial,
    reports_to as id_gestor
    from {{ source('northwind_rawdata', 'employees')}}
)

select * from funcionarios