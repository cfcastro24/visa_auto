DROP TABLE IF EXISTS bluecoat;

CREATE TABLE bluecoat (
    log_date timestamp,
    time_taken bigint,
    c_ip inet,
    cs_username character varying(50),
    cs_auth_grp character varying(50),
    exception_id character varying(100),
    sc_filter_result character varying(20),
    cs_categories character varying(255),
    url_ref text,
    url_ref_strp text,
    sc_status integer,
    s_action character varying(50),
    cs_method text,
    content_type text,
    cs_uri_scheme character varying(25),
    cs_host character varying(255),
    cs_uri_port integer,
    cs_uri_path text,
    cs_uri_query text,
    cs_uri_extension text,
    cs_user_agent text,
    s_ip inet,
    sc_bytes bigint,
    cs_bytes bigint,
    x_virus_id character varying(50)
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) 
DISTRIBUTED BY (url_ref_strp)

PARTITION BY RANGE (log_date) (
PARTITION "prt_201210" start ('2012-10-01'::timestamp) END ('2012-11-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201211" start ('2012-11-01'::timestamp) END ('2012-12-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201212" start ('2012-12-01'::timestamp) END ('2013-01-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201301" start ('2013-01-01'::timestamp) END ('2013-02-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201302" start ('2013-02-01'::timestamp) END ('2013-03-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201303" start ('2013-03-01'::timestamp) END ('2013-04-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201304" start ('2013-04-01'::timestamp) END ('2013-05-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201305" start ('2013-05-01'::timestamp) END ('2013-06-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
PARTITION "prt_201306" start ('2013-06-01'::timestamp) END ('2013-07-01'::timestamp) WITH (appendonly=true, orientation=column, compresstype=quicklz),
DEFAULT PARTITION OTHER WITH (appendonly=true, orientation=column, compresstype=quicklz)
);
