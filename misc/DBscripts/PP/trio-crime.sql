--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET default_tablespace = '';

SET default_with_oids = false;



--
-- Name: drives_raw; Type: TABLE; Schema: public; Owner: keulen; Tablespace:
--

DROP TABLE IF EXISTS drives_raw;
CREATE TABLE drives_raw (
    id integer,
    person text,
    color text,
    car text,
    p double precision
);



--
-- Name: saw_raw; Type: TABLE; Schema: public; Owner: keulen; Tablespace:
--

DROP TABLE IF EXISTS saw_raw;
CREATE TABLE saw_raw (
    id integer,
    witness text,
    color text,
    car text,
    p double precision
);


--
-- Data for Name: drives_raw; Type: TABLE DATA; Schema: public; Owner: keulen
--

COPY drives_raw (id, person, color, car, p) FROM stdin;
1	frank	red	toyota	0.8
1	frank	blue	toyota	0.2
2	billy	blue	honda	0.7
2	billy	\N	\N	0.3
3	jimmy	green	mazda	0.5
3	johnny	green	mazda	0.5
\.



--
-- Data for Name: saw_raw; Type: TABLE DATA; Schema: public; Owner: keulen
--

COPY saw_raw (id, witness, color, car, p) FROM stdin;
1	amy	blue	honda	0.7
1	amy	red	toyota	0.2
2	betty	green	mazda	0.25
2	betty	green	toyota	0.25
2	betty	green	honda	0.25
2	betty	green	acura	0.25
3	cathy	red	acura	0.6
4	diane	red	toyota	0.9
4	diane	blue	toyota	0.1
1	amy	\N	\N	0.1
3	cathy	\N	\N	0.4
\.

DROP TABLE IF EXISTS saw;
CREATE TABLE saw AS
REPAIR KEY id IN saw_raw WEIGHT BY p;

DROP TABLE IF EXISTS drives;
CREATE TABLE drives AS
REPAIR KEY id IN drives_raw WEIGHT BY p;


--
-- PostgreSQL database dump complete
--

