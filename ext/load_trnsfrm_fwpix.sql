insert into fwpix
select 
to_timestamp('<CHANGE_YEAR> '||col_01, 'YYYY Mon DD HH24:MI:SS'),
col_02::inet,
col_03
from gphdfs.ext_fwpix_<CHANGE_MONTHDAY>;
