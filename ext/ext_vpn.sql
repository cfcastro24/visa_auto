DROP EXTERNAL TABLE if exists gphdfs.ext_vpn_<CHANGE_MONTHDAY>;
CREATE EXTERNAL TABLE gphdfs.ext_vpn_<CHANGE_MONTHDAY> (
col_01 text,
col_02 text,
col_03 text,
col_04 text,
col_05 text,
col_06 text,
col_07 text
)
LOCATION ('gphdfs://hdm1:8020/data/output/vpn/<CHANGE_MONTHDAY>/*')
FORMAT 'TEXT'(delimiter '|')
log errors into error.vpn_<CHANGE_MONTHDAY>_err segment reject limit 10000 rows;

