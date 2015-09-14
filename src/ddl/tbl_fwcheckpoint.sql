
CREATE TABLE fwcheckpoint (
    date timestamp without time zone,
    type character varying(25),
    opsec integer,
    opsecserver inet,
    "time" timestamp without time zone,
    action character varying(15),
    has_accounting character varying(5),
    uuid character varying(40),
    sport character varying(10),
    dport character varying(10),
    proto character varying(11),
    orig inet,
    ifdir character varying(10),
    ifname text,
    product text,
    policyidtag text,
    src inet,
    dst inet,
    service character varying(5),
    rule character varying(20),
    xlatesrc character varying(20),
    xlatesport character varying(20),
    xlatedst character varying(15),
    xlatesdport character varying(15),
    message text
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) DISTRIBUTED RANDOMLY;
