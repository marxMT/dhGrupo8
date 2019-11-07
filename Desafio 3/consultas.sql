select 
	m.real_estate_id,
    m.property_id,
    m.fecha,
    concat(md5(lower(SUBSTRING(m.email, 1, LOCATE('@', m.email) - 1))),SUBSTRING(email, LOCATE('@', email))) as email, 
    m.source, 
    m.message_type_id, 
    REPLACE(m.text,',',';')
from messages m where m.fecha between '2019-01-01' and '2019-11-01' and source not in ('maixon','manager') limit 10 ;



