INSERT INTO dhcp
select
to_timestamp('<CHANGE_YEAR> '||col_01, 'YYYY Mon DD HH24:MI:SS'),
col_02::varchar(20),
col_03,
col_04,
col_05::varchar(15),
col_06::varchar(15),
col_07::varchar(30)
from gphdfs.ext_dhcp_<CHANGE_MONTHDAY>;
