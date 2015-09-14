insert into idefense
select
col_01,
col_02,
col_03,
col_04,
col_05,
to_timestamp(col_06, 'YYYY-MM-DD HH24:MI:SS'),
col_07,
col_08
from gphdfs.ext_idefense_<CHANGE_MONTHDAY>;
