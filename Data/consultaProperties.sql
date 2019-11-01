#id_propiedad, tipopropiedad, operacion, monto normalizao, ubicacion hasta localidad o barrio

select id,type_property_id,operation_id,case when currency_id = 2 then price/60 else price end as price
from properties where id in (select distinct(m.property_id)
from messages m where m.fecha between '2019-01-01' and '2019-11-01' and source not in ('maixon','manager'))
limit 10;