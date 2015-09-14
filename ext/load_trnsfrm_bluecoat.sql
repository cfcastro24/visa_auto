insert into bluecoat_new 
select
    date1::date,
    time1::time,
    c_ip::inet,
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
    s_ip::inet,
    sc_bytes::bigint,
    cs_bytes::bigint,
    virus_id text,
    app_name text,
    app_operation text
from gphdfs.ext_bluecoat_<CHANGE_MONTHDAY>;