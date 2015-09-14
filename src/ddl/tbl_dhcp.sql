CREATE TABLE dhcp (
    start_time timestamp without time zone,
    g_ip character varying(20),
    message text,
    hostname text,
    s_ip character varying(15),
    mac character varying(15),
    domain_name character varying(30)
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) DISTRIBUTED RANDOMLY;
