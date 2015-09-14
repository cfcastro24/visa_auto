
CREATE TABLE dns (
    date timestamp with time zone,
    hostname character varying(25),
    port integer,
    message text
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) DISTRIBUTED BY (hostname);

