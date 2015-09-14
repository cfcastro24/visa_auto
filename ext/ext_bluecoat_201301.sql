DROP EXTERNAL TABLE IF EXISTS gphdfs.ext_bluecoat_201301;
CREATE EXTERNAL TABLE gphdfs.ext_bluecoat_201301 (
    date1 text,
    time1 text,
    c_ip text,
    user1 text,
    auth text,
    exception1 text,
    filter1 text,
    category text,
    referer text,
    status text,
    action text,
    method text,
    content_type text,
    uri_scheme text,
    uri_host text,
    uri_port text,
    uri_path text,
    uri_query text,
    uri_extension text,
    user_agent text,
    s_ip text,
    sc_bytes text,
    cs_bytes text,
    virus_id text
) LOCATION (
        'gphdfs://hdm1:8020/data/output/bluecoat/201301/*'
) FORMAT 'text' (delimiter ',' null '' escape 'OFF')
ENCODING 'LATIN1'
LOG ERRORS INTO error.bluecoat_201301_err SEGMENT REJECT LIMIT 10000 ROWS;
