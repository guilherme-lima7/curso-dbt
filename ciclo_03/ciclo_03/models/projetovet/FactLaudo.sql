with dim_exame as (
    select * from {{ ref('DimExame') }}
),

dim_medico as (
    select * from {{ ref('DimMedico') }}
),

dim_paciente as (
    select * from {{ ref('DimPaciente') }}
),

exame_laudo_xml as (
    select
        row_number() over() as id_paciente,
        regexp_replace(replace(exame, '''', '"'), '0+', '')::json->>'codigoExame' as id_exame,
        replace("medicoSolicitante", '''', '"')::json->>'codigo' as id_medico,
        convert_from(decode("laudoXml", 'base64'), 'UTF-8')::xml as laudo
    from {{ source('StgLaudo', 'laudos') }}
),

exame_laudo_clinico as (
    select
        l.id_exame,
        l.id_medico,
        l.id_paciente,
        x.DT_Entrada,
        x.DT_Saida,
        x.Tipo,
        x.Versao,
        x.Diagnostica,
        x.Sintomas,
        x.Tratamento
    from exame_laudo_xml as l,
        xmltable(
            '/Laudo/Dados_Clinicos'
            passing laudo
            columns
                DT_Entrada date path '../DT_Entrada',
                DT_Saida date path '../DT_Saida',
                Tipo int path '../Tipo',
                Versao int path '../Versao',
                Diagnostica text path 'Diagnostica',
                Sintomas text path 'Sintomas',
                Tratamento text path 'Tratamento'
        ) as x
),

exame_laudo_final as (
    select
        row_number() over() as id_laudo,
        e.id_exame,
        p.id_paciente,
        m.id_medico,
        elc.DT_Entrada,
        elc.DT_Saida,
        elc.Tipo,
        elc.Versao,
        elc.Diagnostica,
        elc.Sintomas,
        elc.Tratamento
    from exame_laudo_clinico elc
    left join dim_exame e on elc.id_exame = e.id_exame
    left join dim_medico m on elc.id_medico = m.id_medico
    left join dim_paciente p on elc.id_paciente = p.id_paciente
)

select * from exame_laudo_final
