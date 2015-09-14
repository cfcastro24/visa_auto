DROP EXTERNAL TABLE if exists gphdfs.ext_dns_<CHANGE_MONTHDAY>;
CREATE EXTERNAL TABLE gphdfs.ext_dns_<CHANGE_MONTHDAY> (
col_01 text,
col_02 text,
col_03 text,
col_04 text
)
LOCATION ('gphdfs://hdm1:8020/data/output/dns/<CHANGE_MONTHDAY>/*')
FORMAT 'TEXT'(delimiter '	')
log errors into error.dns_<CHANGE_MONTHDAY>_err segment reject limit 10000 rows;

