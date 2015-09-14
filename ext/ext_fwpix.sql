DROP EXTERNAL TABLE if exists gphdfs.ext_fwpix_<CHANGE_MONTHDAY>;
CREATE EXTERNAL TABLE gphdfs.ext_fwpix_<CHANGE_MONTHDAY> (
col_01 text,
col_02 text,
col_03 text
)
LOCATION ('gphdfs://hdm1:8020/data/output/fwpix/<CHANGE_MONTHDAY>/*')
FORMAT 'TEXT'(delimiter '	' NULL AS '')
log errors into error.fwpix_<CHANGE_MONTHDAY>_err segment reject limit 10000 rows;

