#Email, estado (nombre), ganado(bit), perdido(bit), agendoVisita(bit)
select  
	m.real_estate_id IdInmobiliaria,
    m.property_id IdPropiedad,
    m.fecha Fecha,
    concat(md5(lower(SUBSTRING(m.email, 1, LOCATE('@', m.email) - 1))),SUBSTRING(m.email, LOCATE('@', m.email))) as Email, 
    m.source Fuente, 
    m.message_type_id IdTipoMensaje, 
    REPLACE(m.text,',',';') Text,
    ps.name Estado,
    pr.won Ganado,
    not pr.won Perdido,
    case when h.id is null then 0 else 1 end AgendoVisita
from messages m
join people p on m.email = p.email and m.real_estate_id = p.real_estate_id
left join (select * from people_trackings where active=1) as pt on pt.person_id = p.id
left join people_statuses ps on pt.person_status_id = ps.id
left join people_reasons pr on pr.id = pt.person_reason_id
left join historical h on h.person_id = p.id and h.type = 4
where m.fecha between '2019-01-01' and '2019-11-01' and m.source not in ('maixon','manager') 
order by email,idinmobiliaria,idpropiedad
limit 10;
#Sin joinear a pt 	637648
#joineando a pt 	637585

; 