insert into dns
select
to_timestamp(substring(col_01 from 0 for 7)|| ' <CHANGE_YEAR>' ||substring(col_01 from 7 for 10), 'Mon DD YYYY HH24:MI:SS') as date,
col_02::varchar(25) as hostname,
col_03::integer as port,
col_04 as message
from gphdfs.ext_dns_<CHANGE_MONTHDAY>;
