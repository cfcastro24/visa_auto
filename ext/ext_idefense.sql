DROP EXTERNAL TABLE if exists gphdfs.ext_idefense_<CHANGE_MONTHDAY>; 
CREATE EXTERNAL TABLE gphdfs.ext_idefense_<CHANGE_MONTHDAY> (
col_01 text,	--DOMAIN,
col_02 text,	--STRING,
col_03 text,	--qetyvep.com,
col_04 text,	--MALWARE_C2,
col_05 text,	--12f99de3870a21780c7b6d0896a0d466,
col_06 timestamp,	--2012-11-13 19:37:57.126000,
col_07 text,	--Backdoor.Shiz,
col_08 text	--NULL	
)
LOCATION ('gphdfs://hdm1:8020/data/output/idefense/<CHANGE_MONTHDAY>/*')
FORMAT 'TEXT'(delimiter ',')
log errors into error.idefenese_<CHANGE_MONTHDAY>_err segment reject limit 10000 rows;

