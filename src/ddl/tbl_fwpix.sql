
CREATE TABLE fwpix (
    date timestamp without time zone,
    ip_address inet,
    message text
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) DISTRIBUTED BY (ip_address);
