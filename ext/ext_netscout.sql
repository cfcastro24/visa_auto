drop external table if exists gphdfs.ext_netscout_<CHANGE_MONTHDAY>;
create external table gphdfs.ext_netscout_<CHANGE_MONTHDAY> (
TimeStamp                       timestamp,
name_01 text,
name_02 text,
name_03 text,
name_04 text,
name_05 text,
name_06 text,
name_07 text,
name_08 text,
name_09 text,
Src_ip inet,
Dst_ip inet,
Src_Dst_Packets                 integer,
Src_Dst_Volume_bytes            varchar(12),
Src_Dst_Utilization_pct         varchar(15),
Src_Dst_Packet_Rate             varchar(25),
Src_Dst_Byte_Rate               varchar(20),
Src_Dst_Bit_Rate                varchar(20),
Src_Dst_Packet_Size             varchar(20),
Dst_Src_Packets                 integer,
Dst_Src_Volume                  varchar(15),
Dst_Src_Utilization_pct         varchar(15),
Dst_Src_Packet_Rate             varchar(25),
Dst_Src_Byte_Rate               varchar(25),
Dst_Src_Bit_Rate                varchar(25),
Dst_Src_Packet_Size             varchar(25),
Name                            varchar (100)
)
LOCATION ('gphdfs://hdm1:8020/data/output/netscout/<CHANGE_MONTHDAY>/*')
FORMAT 'TEXT'(delimiter ',' NULL AS '')
log errors into error.ext_netscout_<CHANGE_MONTHDAY>_err segment reject limit 10000 rows;
