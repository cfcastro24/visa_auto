DROP EXTERNAL TABLE if exists gphdfs.ext_fwcheckpoint_<CHANGE_MONTHDAY>;
CREATE EXTERNAL TABLE gphdfs.ext_fwcheckpoint_<CHANGE_MONTHDAY> (
col_01 text,
col_02 text,
col_03 text,
col_04 text,
col_05 text,
col_06 text,
col_07 text,
col_08 text,
col_09 text,
col_10 text,
col_11 text,
col_12 text,
col_13 text,
col_14 text,
col_15 text,
col_16 text,
col_17 text,
col_18 text,
col_19 text,
col_20 text,
col_21 text,
col_22 text,
col_23 text,
col_24 text,
col_25 text
)
LOCATION ('gphdfs://hdm1:8020/data/output/fwcheckpoint/<CHANGE_MONTHDAY>/*')
FORMAT 'TEXT'(delimiter '|' NULL '') 
log errors into error.fwcheckpoint_<CHANGE_MONTHDAY>_err segment reject limit 10000 rows;
