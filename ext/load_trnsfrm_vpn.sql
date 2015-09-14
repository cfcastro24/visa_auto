insert into vpn
select
to_timestamp('<CHANGE_YEAR> '||col_01, 'YYYY Mon DD HH24:MI:SS'),
col_02::inet,
col_03::int,
to_timestamp(col_04||' '||col_05, 'MM/DD/YYYY HH24:MI:SS'),
col_06::int,
col_07
from gphdfs.ext_vpn_<CHANGE_MONTHDAY>;
