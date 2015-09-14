--
-- Greenplum Database database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: vpn; Type: TABLE; Schema: public; Owner: gpadmin; Tablespace: 
--

CREATE TABLE vpn (
    timestamp_1 timestamp without time zone ENCODING (compresstype=quicklz,compresslevel=1,blocksize=32768),
    ip_address inet ENCODING (compresstype=quicklz,compresslevel=1,blocksize=32768),
    port integer ENCODING (compresstype=quicklz,compresslevel=1,blocksize=32768),
    timestamp_2 timestamp without time zone ENCODING (compresstype=quicklz,compresslevel=1,blocksize=32768),
    event integer ENCODING (compresstype=quicklz,compresslevel=1,blocksize=32768),
    message text ENCODING (compresstype=quicklz,compresslevel=1,blocksize=32768)
)
WITH (appendonly=true, orientation=column, compresstype=quicklz) DISTRIBUTED RANDOMLY;


ALTER TABLE public.vpn OWNER TO gpadmin;

--
-- Name: vpn; Type: ACL; Schema: public; Owner: gpadmin
--

REVOKE ALL ON TABLE vpn FROM PUBLIC;
REVOKE ALL ON TABLE vpn FROM gpadmin;
GRANT ALL ON TABLE vpn TO gpadmin;
GRANT ALL ON TABLE vpn TO ilaiy;
GRANT ALL ON TABLE vpn TO pgovinda;
GRANT ALL ON TABLE vpn TO rdevireddy;
GRANT ALL ON TABLE vpn TO smannem;
GRANT ALL ON TABLE vpn TO btsai;
GRANT ALL ON TABLE vpn TO aneelam;
GRANT ALL ON TABLE vpn TO pdesch;
GRANT ALL ON TABLE vpn TO yzhai;
GRANT ALL ON TABLE vpn TO ccastro;
GRANT ALL ON TABLE vpn TO tgruber;
GRANT ALL ON TABLE vpn TO dminer;
GRANT ALL ON TABLE vpn TO dlin;
GRANT ALL ON TABLE vpn TO vfang;
GRANT ALL ON TABLE vpn TO ppandey;
GRANT ALL ON TABLE vpn TO vikulkar;
GRANT ALL ON TABLE vpn TO mkozikow;
GRANT ALL ON TABLE vpn TO vsirt;
GRANT ALL ON TABLE vpn TO sohalder;
GRANT ALL ON TABLE vpn TO visa;


--
-- Greenplum Database database dump complete
--

