CREATE TABLE netscout (
    "timestamp" timestamp without time zone,
    name_01 text,
    name_02 text,
    name_03 text,
    name_04 text,
    name_05 text,
    name_06 text,
    name_07 text,
    name_08 text,
    name_09 text,
    src_ip inet,
    tgt_ip inet,
    src_dst_packets integer,
    src_dst_volume_bytes character varying(12),
    src_dst_utilization_pct character varying(15),
    src_dst_packet_rate character varying(25),
    src_dst_byte_rate character varying(20),
    src_dst_bit_rate character varying(20),
    src_dst_packet_size character varying(20),
    dst_src_packets integer,
    dst_src_volume character varying(15),
    dst_src_utilization_pct character varying(15),
    dst_src_packet_rate character varying(25),
    dst_src_byte_rate character varying(25),
    dst_src_bit_rate character varying(25),
    dst_src_packet_size character varying(25),
    name character varying(100)
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) DISTRIBUTED BY (src_ip);
