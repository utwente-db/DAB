--- Drop database dda000

DROP DATABASE dda000;

--- Drop database dda001

DROP DATABASE dda001;

--- Drop database dda002

DROP DATABASE dda002;

--- Drop database dda003

DROP DATABASE dda003;

--- Drop database dda004

DROP DATABASE dda004;

--- Drop database dda005

DROP DATABASE dda005;

--- Drop database dda006

DROP DATABASE dda006;

--- Drop database dda007

DROP DATABASE dda007;

--- Drop database dda008

DROP DATABASE dda008;

--- Drop database dda009

DROP DATABASE dda009;

--- Drop database dda010

DROP DATABASE dda010;

--- Drop database dda011

DROP DATABASE dda011;

--- Drop database dda012

DROP DATABASE dda012;

--- Drop database dda013

DROP DATABASE dda013;

--- Drop database dda014

DROP DATABASE dda014;

--- Drop database dda015

DROP DATABASE dda015;

--- Drop database dda016

DROP DATABASE dda016;

--- Drop database dda017

DROP DATABASE dda017;

--- Drop database dda018

DROP DATABASE dda018;

--- Drop database dda019

DROP DATABASE dda019;

--- Drop database dda020

DROP DATABASE dda020;

--- Drop database dda021

DROP DATABASE dda021;

--- Drop database dda022

DROP DATABASE dda022;

--- Drop database dda023

DROP DATABASE dda023;

--- Drop database dda024

DROP DATABASE dda024;

--- Drop database dda025

DROP DATABASE dda025;

--- Drop database dda026

DROP DATABASE dda026;

--- Drop database dda027

DROP DATABASE dda027;

--- Drop database dda028

DROP DATABASE dda028;

--- Drop database dda029

DROP DATABASE dda029;

--- Drop database dda030

DROP DATABASE dda030;

--- Drop database dda031

DROP DATABASE dda031;

--- Drop database dda032

DROP DATABASE dda032;

--- Drop database dda033

DROP DATABASE dda033;

--- Drop database dda034

DROP DATABASE dda034;

--- Drop database dda035

DROP DATABASE dda035;

--- Drop database dda036

DROP DATABASE dda036;

--- Drop database dda037

DROP DATABASE dda037;

--- Drop database dda038

DROP DATABASE dda038;

--- Drop database dda039

DROP DATABASE dda039;

--- Drop database dda040

DROP DATABASE dda040;

--- Drop database dda041

DROP DATABASE dda041;

--- Drop database dda042

DROP DATABASE dda042;

--- Drop database dda043

DROP DATABASE dda043;

--- Drop database dda044

DROP DATABASE dda044;

--- Drop database dda045

DROP DATABASE dda045;

--- Drop database dda046

DROP DATABASE dda046;

--- Drop database dda047

DROP DATABASE dda047;

--- Drop database dda048

DROP DATABASE dda048;

--- Drop database dda049

DROP DATABASE dda049;

--- Drop database dda050

DROP DATABASE dda050;

--- Drop database dda051

DROP DATABASE dda051;

--- Drop database dda052

DROP DATABASE dda052;

--- Drop database dda053

DROP DATABASE dda053;

--- Drop database dda054

DROP DATABASE dda054;

--- Drop database dda055

DROP DATABASE dda055;

--- Drop database dda056

DROP DATABASE dda056;

--- Drop database dda057

DROP DATABASE dda057;

--- Drop database dda058

DROP DATABASE dda058;

--- Drop database dda059

DROP DATABASE dda059;

--- Drop database dda060

DROP DATABASE dda060;

--- Drop database dda061

DROP DATABASE dda061;

--- Drop database dda062

DROP DATABASE dda062;

--- Drop database dda063

DROP DATABASE dda063;

--- Drop database dda064

DROP DATABASE dda064;

--- Drop database dda065

DROP DATABASE dda065;

--- Drop database dda066

DROP DATABASE dda066;

--- Drop database dda067

DROP DATABASE dda067;

--- Drop database dda068

DROP DATABASE dda068;

--- Drop database dda069

DROP DATABASE dda069;

--- Drop database dda070

DROP DATABASE dda070;

--- Drop database dda071

DROP DATABASE dda071;

--- Drop database dda072

DROP DATABASE dda072;

--- Drop database dda073

DROP DATABASE dda073;

--- Drop database dda074

DROP DATABASE dda074;

--- Drop database dda075

DROP DATABASE dda075;

--- Drop database dda076

DROP DATABASE dda076;

--- Drop database dda077

DROP DATABASE dda077;

--- Drop database dda078

DROP DATABASE dda078;

--- Drop database dda079

DROP DATABASE dda079;

--- Drop database dda080

DROP DATABASE dda080;

--- Drop database dda081

DROP DATABASE dda081;

--- Drop database dda082

DROP DATABASE dda082;

--- Drop database dda083

DROP DATABASE dda083;

--- Drop database dda084

DROP DATABASE dda084;

--- Drop database dda085

DROP DATABASE dda085;

--- Drop database dda086

DROP DATABASE dda086;

--- Drop database dda087

DROP DATABASE dda087;

--- Drop database dda088

DROP DATABASE dda088;

--- Drop database dda089

DROP DATABASE dda089;

--- Drop database dda090

DROP DATABASE dda090;

--- Drop database dda091

DROP DATABASE dda091;

--- Drop database dda092

DROP DATABASE dda092;

--- Drop database dda093

DROP DATABASE dda093;

--- Drop database dda094

DROP DATABASE dda094;

--- Drop database dda095

DROP DATABASE dda095;

--- Drop database dda096

DROP DATABASE dda096;

--- Drop database dda097

DROP DATABASE dda097;

--- Drop database dda098

DROP DATABASE dda098;

--- Drop database dda099

DROP DATABASE dda099;

--- Database for user dda000

CREATE DATABASE dda000 WITH OWNER dda000;

\c dda000
GRANT ALL PRIVILEGES ON DATABASE dda000 TO dda000;
REVOKE ALL PRIVILEGES ON DATABASE dda000 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda000;
ALTER SCHEMA dda000 OWNER TO dda000;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda000;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda000;
ALTER TABLE movies.certification OWNER TO dda000;
ALTER TABLE movies.directs OWNER TO dda000;
ALTER TABLE movies.genre OWNER TO dda000;
ALTER TABLE movies.language OWNER TO dda000;
ALTER TABLE movies.movie OWNER TO dda000;
ALTER TABLE movies.person OWNER TO dda000;
ALTER TABLE movies.runtime OWNER TO dda000;
ALTER TABLE movies.writes OWNER TO dda000;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda000;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda000;
ALTER TABLE srs.education OWNER TO dda000;
ALTER TABLE srs.courses OWNER TO dda000;

--- Database for user dda001

CREATE DATABASE dda001 WITH OWNER dda001;

\c dda001
GRANT ALL PRIVILEGES ON DATABASE dda001 TO dda001;
REVOKE ALL PRIVILEGES ON DATABASE dda001 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda001;
ALTER SCHEMA dda001 OWNER TO dda001;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda001;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda001;
ALTER TABLE movies.certification OWNER TO dda001;
ALTER TABLE movies.directs OWNER TO dda001;
ALTER TABLE movies.genre OWNER TO dda001;
ALTER TABLE movies.language OWNER TO dda001;
ALTER TABLE movies.movie OWNER TO dda001;
ALTER TABLE movies.person OWNER TO dda001;
ALTER TABLE movies.runtime OWNER TO dda001;
ALTER TABLE movies.writes OWNER TO dda001;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda001;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda001;
ALTER TABLE srs.education OWNER TO dda001;
ALTER TABLE srs.courses OWNER TO dda001;

--- Database for user dda002

CREATE DATABASE dda002 WITH OWNER dda002;

\c dda002
GRANT ALL PRIVILEGES ON DATABASE dda002 TO dda002;
REVOKE ALL PRIVILEGES ON DATABASE dda002 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda002;
ALTER SCHEMA dda002 OWNER TO dda002;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda002;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda002;
ALTER TABLE movies.certification OWNER TO dda002;
ALTER TABLE movies.directs OWNER TO dda002;
ALTER TABLE movies.genre OWNER TO dda002;
ALTER TABLE movies.language OWNER TO dda002;
ALTER TABLE movies.movie OWNER TO dda002;
ALTER TABLE movies.person OWNER TO dda002;
ALTER TABLE movies.runtime OWNER TO dda002;
ALTER TABLE movies.writes OWNER TO dda002;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda002;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda002;
ALTER TABLE srs.education OWNER TO dda002;
ALTER TABLE srs.courses OWNER TO dda002;

--- Database for user dda003

CREATE DATABASE dda003 WITH OWNER dda003;

\c dda003
GRANT ALL PRIVILEGES ON DATABASE dda003 TO dda003;
REVOKE ALL PRIVILEGES ON DATABASE dda003 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda003;
ALTER SCHEMA dda003 OWNER TO dda003;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda003;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda003;
ALTER TABLE movies.certification OWNER TO dda003;
ALTER TABLE movies.directs OWNER TO dda003;
ALTER TABLE movies.genre OWNER TO dda003;
ALTER TABLE movies.language OWNER TO dda003;
ALTER TABLE movies.movie OWNER TO dda003;
ALTER TABLE movies.person OWNER TO dda003;
ALTER TABLE movies.runtime OWNER TO dda003;
ALTER TABLE movies.writes OWNER TO dda003;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda003;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda003;
ALTER TABLE srs.education OWNER TO dda003;
ALTER TABLE srs.courses OWNER TO dda003;

--- Database for user dda004

CREATE DATABASE dda004 WITH OWNER dda004;

\c dda004
GRANT ALL PRIVILEGES ON DATABASE dda004 TO dda004;
REVOKE ALL PRIVILEGES ON DATABASE dda004 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda004;
ALTER SCHEMA dda004 OWNER TO dda004;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda004;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda004;
ALTER TABLE movies.certification OWNER TO dda004;
ALTER TABLE movies.directs OWNER TO dda004;
ALTER TABLE movies.genre OWNER TO dda004;
ALTER TABLE movies.language OWNER TO dda004;
ALTER TABLE movies.movie OWNER TO dda004;
ALTER TABLE movies.person OWNER TO dda004;
ALTER TABLE movies.runtime OWNER TO dda004;
ALTER TABLE movies.writes OWNER TO dda004;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda004;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda004;
ALTER TABLE srs.education OWNER TO dda004;
ALTER TABLE srs.courses OWNER TO dda004;

--- Database for user dda005

CREATE DATABASE dda005 WITH OWNER dda005;

\c dda005
GRANT ALL PRIVILEGES ON DATABASE dda005 TO dda005;
REVOKE ALL PRIVILEGES ON DATABASE dda005 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda005;
ALTER SCHEMA dda005 OWNER TO dda005;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda005;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda005;
ALTER TABLE movies.certification OWNER TO dda005;
ALTER TABLE movies.directs OWNER TO dda005;
ALTER TABLE movies.genre OWNER TO dda005;
ALTER TABLE movies.language OWNER TO dda005;
ALTER TABLE movies.movie OWNER TO dda005;
ALTER TABLE movies.person OWNER TO dda005;
ALTER TABLE movies.runtime OWNER TO dda005;
ALTER TABLE movies.writes OWNER TO dda005;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda005;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda005;
ALTER TABLE srs.education OWNER TO dda005;
ALTER TABLE srs.courses OWNER TO dda005;

--- Database for user dda006

CREATE DATABASE dda006 WITH OWNER dda006;

\c dda006
GRANT ALL PRIVILEGES ON DATABASE dda006 TO dda006;
REVOKE ALL PRIVILEGES ON DATABASE dda006 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda006;
ALTER SCHEMA dda006 OWNER TO dda006;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda006;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda006;
ALTER TABLE movies.certification OWNER TO dda006;
ALTER TABLE movies.directs OWNER TO dda006;
ALTER TABLE movies.genre OWNER TO dda006;
ALTER TABLE movies.language OWNER TO dda006;
ALTER TABLE movies.movie OWNER TO dda006;
ALTER TABLE movies.person OWNER TO dda006;
ALTER TABLE movies.runtime OWNER TO dda006;
ALTER TABLE movies.writes OWNER TO dda006;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda006;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda006;
ALTER TABLE srs.education OWNER TO dda006;
ALTER TABLE srs.courses OWNER TO dda006;

--- Database for user dda007

CREATE DATABASE dda007 WITH OWNER dda007;

\c dda007
GRANT ALL PRIVILEGES ON DATABASE dda007 TO dda007;
REVOKE ALL PRIVILEGES ON DATABASE dda007 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda007;
ALTER SCHEMA dda007 OWNER TO dda007;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda007;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda007;
ALTER TABLE movies.certification OWNER TO dda007;
ALTER TABLE movies.directs OWNER TO dda007;
ALTER TABLE movies.genre OWNER TO dda007;
ALTER TABLE movies.language OWNER TO dda007;
ALTER TABLE movies.movie OWNER TO dda007;
ALTER TABLE movies.person OWNER TO dda007;
ALTER TABLE movies.runtime OWNER TO dda007;
ALTER TABLE movies.writes OWNER TO dda007;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda007;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda007;
ALTER TABLE srs.education OWNER TO dda007;
ALTER TABLE srs.courses OWNER TO dda007;

--- Database for user dda008

CREATE DATABASE dda008 WITH OWNER dda008;

\c dda008
GRANT ALL PRIVILEGES ON DATABASE dda008 TO dda008;
REVOKE ALL PRIVILEGES ON DATABASE dda008 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda008;
ALTER SCHEMA dda008 OWNER TO dda008;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda008;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda008;
ALTER TABLE movies.certification OWNER TO dda008;
ALTER TABLE movies.directs OWNER TO dda008;
ALTER TABLE movies.genre OWNER TO dda008;
ALTER TABLE movies.language OWNER TO dda008;
ALTER TABLE movies.movie OWNER TO dda008;
ALTER TABLE movies.person OWNER TO dda008;
ALTER TABLE movies.runtime OWNER TO dda008;
ALTER TABLE movies.writes OWNER TO dda008;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda008;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda008;
ALTER TABLE srs.education OWNER TO dda008;
ALTER TABLE srs.courses OWNER TO dda008;

--- Database for user dda009

CREATE DATABASE dda009 WITH OWNER dda009;

\c dda009
GRANT ALL PRIVILEGES ON DATABASE dda009 TO dda009;
REVOKE ALL PRIVILEGES ON DATABASE dda009 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda009;
ALTER SCHEMA dda009 OWNER TO dda009;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda009;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda009;
ALTER TABLE movies.certification OWNER TO dda009;
ALTER TABLE movies.directs OWNER TO dda009;
ALTER TABLE movies.genre OWNER TO dda009;
ALTER TABLE movies.language OWNER TO dda009;
ALTER TABLE movies.movie OWNER TO dda009;
ALTER TABLE movies.person OWNER TO dda009;
ALTER TABLE movies.runtime OWNER TO dda009;
ALTER TABLE movies.writes OWNER TO dda009;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda009;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda009;
ALTER TABLE srs.education OWNER TO dda009;
ALTER TABLE srs.courses OWNER TO dda009;

--- Database for user dda010

CREATE DATABASE dda010 WITH OWNER dda010;

\c dda010
GRANT ALL PRIVILEGES ON DATABASE dda010 TO dda010;
REVOKE ALL PRIVILEGES ON DATABASE dda010 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda010;
ALTER SCHEMA dda010 OWNER TO dda010;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda010;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda010;
ALTER TABLE movies.certification OWNER TO dda010;
ALTER TABLE movies.directs OWNER TO dda010;
ALTER TABLE movies.genre OWNER TO dda010;
ALTER TABLE movies.language OWNER TO dda010;
ALTER TABLE movies.movie OWNER TO dda010;
ALTER TABLE movies.person OWNER TO dda010;
ALTER TABLE movies.runtime OWNER TO dda010;
ALTER TABLE movies.writes OWNER TO dda010;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda010;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda010;
ALTER TABLE srs.education OWNER TO dda010;
ALTER TABLE srs.courses OWNER TO dda010;

--- Database for user dda011

CREATE DATABASE dda011 WITH OWNER dda011;

\c dda011
GRANT ALL PRIVILEGES ON DATABASE dda011 TO dda011;
REVOKE ALL PRIVILEGES ON DATABASE dda011 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda011;
ALTER SCHEMA dda011 OWNER TO dda011;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda011;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda011;
ALTER TABLE movies.certification OWNER TO dda011;
ALTER TABLE movies.directs OWNER TO dda011;
ALTER TABLE movies.genre OWNER TO dda011;
ALTER TABLE movies.language OWNER TO dda011;
ALTER TABLE movies.movie OWNER TO dda011;
ALTER TABLE movies.person OWNER TO dda011;
ALTER TABLE movies.runtime OWNER TO dda011;
ALTER TABLE movies.writes OWNER TO dda011;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda011;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda011;
ALTER TABLE srs.education OWNER TO dda011;
ALTER TABLE srs.courses OWNER TO dda011;

--- Database for user dda012

CREATE DATABASE dda012 WITH OWNER dda012;

\c dda012
GRANT ALL PRIVILEGES ON DATABASE dda012 TO dda012;
REVOKE ALL PRIVILEGES ON DATABASE dda012 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda012;
ALTER SCHEMA dda012 OWNER TO dda012;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda012;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda012;
ALTER TABLE movies.certification OWNER TO dda012;
ALTER TABLE movies.directs OWNER TO dda012;
ALTER TABLE movies.genre OWNER TO dda012;
ALTER TABLE movies.language OWNER TO dda012;
ALTER TABLE movies.movie OWNER TO dda012;
ALTER TABLE movies.person OWNER TO dda012;
ALTER TABLE movies.runtime OWNER TO dda012;
ALTER TABLE movies.writes OWNER TO dda012;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda012;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda012;
ALTER TABLE srs.education OWNER TO dda012;
ALTER TABLE srs.courses OWNER TO dda012;

--- Database for user dda013

CREATE DATABASE dda013 WITH OWNER dda013;

\c dda013
GRANT ALL PRIVILEGES ON DATABASE dda013 TO dda013;
REVOKE ALL PRIVILEGES ON DATABASE dda013 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda013;
ALTER SCHEMA dda013 OWNER TO dda013;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda013;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda013;
ALTER TABLE movies.certification OWNER TO dda013;
ALTER TABLE movies.directs OWNER TO dda013;
ALTER TABLE movies.genre OWNER TO dda013;
ALTER TABLE movies.language OWNER TO dda013;
ALTER TABLE movies.movie OWNER TO dda013;
ALTER TABLE movies.person OWNER TO dda013;
ALTER TABLE movies.runtime OWNER TO dda013;
ALTER TABLE movies.writes OWNER TO dda013;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda013;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda013;
ALTER TABLE srs.education OWNER TO dda013;
ALTER TABLE srs.courses OWNER TO dda013;

--- Database for user dda014

CREATE DATABASE dda014 WITH OWNER dda014;

\c dda014
GRANT ALL PRIVILEGES ON DATABASE dda014 TO dda014;
REVOKE ALL PRIVILEGES ON DATABASE dda014 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda014;
ALTER SCHEMA dda014 OWNER TO dda014;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda014;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda014;
ALTER TABLE movies.certification OWNER TO dda014;
ALTER TABLE movies.directs OWNER TO dda014;
ALTER TABLE movies.genre OWNER TO dda014;
ALTER TABLE movies.language OWNER TO dda014;
ALTER TABLE movies.movie OWNER TO dda014;
ALTER TABLE movies.person OWNER TO dda014;
ALTER TABLE movies.runtime OWNER TO dda014;
ALTER TABLE movies.writes OWNER TO dda014;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda014;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda014;
ALTER TABLE srs.education OWNER TO dda014;
ALTER TABLE srs.courses OWNER TO dda014;

--- Database for user dda015

CREATE DATABASE dda015 WITH OWNER dda015;

\c dda015
GRANT ALL PRIVILEGES ON DATABASE dda015 TO dda015;
REVOKE ALL PRIVILEGES ON DATABASE dda015 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda015;
ALTER SCHEMA dda015 OWNER TO dda015;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda015;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda015;
ALTER TABLE movies.certification OWNER TO dda015;
ALTER TABLE movies.directs OWNER TO dda015;
ALTER TABLE movies.genre OWNER TO dda015;
ALTER TABLE movies.language OWNER TO dda015;
ALTER TABLE movies.movie OWNER TO dda015;
ALTER TABLE movies.person OWNER TO dda015;
ALTER TABLE movies.runtime OWNER TO dda015;
ALTER TABLE movies.writes OWNER TO dda015;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda015;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda015;
ALTER TABLE srs.education OWNER TO dda015;
ALTER TABLE srs.courses OWNER TO dda015;

--- Database for user dda016

CREATE DATABASE dda016 WITH OWNER dda016;

\c dda016
GRANT ALL PRIVILEGES ON DATABASE dda016 TO dda016;
REVOKE ALL PRIVILEGES ON DATABASE dda016 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda016;
ALTER SCHEMA dda016 OWNER TO dda016;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda016;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda016;
ALTER TABLE movies.certification OWNER TO dda016;
ALTER TABLE movies.directs OWNER TO dda016;
ALTER TABLE movies.genre OWNER TO dda016;
ALTER TABLE movies.language OWNER TO dda016;
ALTER TABLE movies.movie OWNER TO dda016;
ALTER TABLE movies.person OWNER TO dda016;
ALTER TABLE movies.runtime OWNER TO dda016;
ALTER TABLE movies.writes OWNER TO dda016;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda016;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda016;
ALTER TABLE srs.education OWNER TO dda016;
ALTER TABLE srs.courses OWNER TO dda016;

--- Database for user dda017

CREATE DATABASE dda017 WITH OWNER dda017;

\c dda017
GRANT ALL PRIVILEGES ON DATABASE dda017 TO dda017;
REVOKE ALL PRIVILEGES ON DATABASE dda017 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda017;
ALTER SCHEMA dda017 OWNER TO dda017;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda017;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda017;
ALTER TABLE movies.certification OWNER TO dda017;
ALTER TABLE movies.directs OWNER TO dda017;
ALTER TABLE movies.genre OWNER TO dda017;
ALTER TABLE movies.language OWNER TO dda017;
ALTER TABLE movies.movie OWNER TO dda017;
ALTER TABLE movies.person OWNER TO dda017;
ALTER TABLE movies.runtime OWNER TO dda017;
ALTER TABLE movies.writes OWNER TO dda017;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda017;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda017;
ALTER TABLE srs.education OWNER TO dda017;
ALTER TABLE srs.courses OWNER TO dda017;

--- Database for user dda018

CREATE DATABASE dda018 WITH OWNER dda018;

\c dda018
GRANT ALL PRIVILEGES ON DATABASE dda018 TO dda018;
REVOKE ALL PRIVILEGES ON DATABASE dda018 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda018;
ALTER SCHEMA dda018 OWNER TO dda018;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda018;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda018;
ALTER TABLE movies.certification OWNER TO dda018;
ALTER TABLE movies.directs OWNER TO dda018;
ALTER TABLE movies.genre OWNER TO dda018;
ALTER TABLE movies.language OWNER TO dda018;
ALTER TABLE movies.movie OWNER TO dda018;
ALTER TABLE movies.person OWNER TO dda018;
ALTER TABLE movies.runtime OWNER TO dda018;
ALTER TABLE movies.writes OWNER TO dda018;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda018;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda018;
ALTER TABLE srs.education OWNER TO dda018;
ALTER TABLE srs.courses OWNER TO dda018;

--- Database for user dda019

CREATE DATABASE dda019 WITH OWNER dda019;

\c dda019
GRANT ALL PRIVILEGES ON DATABASE dda019 TO dda019;
REVOKE ALL PRIVILEGES ON DATABASE dda019 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda019;
ALTER SCHEMA dda019 OWNER TO dda019;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda019;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda019;
ALTER TABLE movies.certification OWNER TO dda019;
ALTER TABLE movies.directs OWNER TO dda019;
ALTER TABLE movies.genre OWNER TO dda019;
ALTER TABLE movies.language OWNER TO dda019;
ALTER TABLE movies.movie OWNER TO dda019;
ALTER TABLE movies.person OWNER TO dda019;
ALTER TABLE movies.runtime OWNER TO dda019;
ALTER TABLE movies.writes OWNER TO dda019;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda019;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda019;
ALTER TABLE srs.education OWNER TO dda019;
ALTER TABLE srs.courses OWNER TO dda019;

--- Database for user dda020

CREATE DATABASE dda020 WITH OWNER dda020;

\c dda020
GRANT ALL PRIVILEGES ON DATABASE dda020 TO dda020;
REVOKE ALL PRIVILEGES ON DATABASE dda020 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda020;
ALTER SCHEMA dda020 OWNER TO dda020;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda020;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda020;
ALTER TABLE movies.certification OWNER TO dda020;
ALTER TABLE movies.directs OWNER TO dda020;
ALTER TABLE movies.genre OWNER TO dda020;
ALTER TABLE movies.language OWNER TO dda020;
ALTER TABLE movies.movie OWNER TO dda020;
ALTER TABLE movies.person OWNER TO dda020;
ALTER TABLE movies.runtime OWNER TO dda020;
ALTER TABLE movies.writes OWNER TO dda020;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda020;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda020;
ALTER TABLE srs.education OWNER TO dda020;
ALTER TABLE srs.courses OWNER TO dda020;

--- Database for user dda021

CREATE DATABASE dda021 WITH OWNER dda021;

\c dda021
GRANT ALL PRIVILEGES ON DATABASE dda021 TO dda021;
REVOKE ALL PRIVILEGES ON DATABASE dda021 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda021;
ALTER SCHEMA dda021 OWNER TO dda021;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda021;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda021;
ALTER TABLE movies.certification OWNER TO dda021;
ALTER TABLE movies.directs OWNER TO dda021;
ALTER TABLE movies.genre OWNER TO dda021;
ALTER TABLE movies.language OWNER TO dda021;
ALTER TABLE movies.movie OWNER TO dda021;
ALTER TABLE movies.person OWNER TO dda021;
ALTER TABLE movies.runtime OWNER TO dda021;
ALTER TABLE movies.writes OWNER TO dda021;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda021;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda021;
ALTER TABLE srs.education OWNER TO dda021;
ALTER TABLE srs.courses OWNER TO dda021;

--- Database for user dda022

CREATE DATABASE dda022 WITH OWNER dda022;

\c dda022
GRANT ALL PRIVILEGES ON DATABASE dda022 TO dda022;
REVOKE ALL PRIVILEGES ON DATABASE dda022 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda022;
ALTER SCHEMA dda022 OWNER TO dda022;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda022;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda022;
ALTER TABLE movies.certification OWNER TO dda022;
ALTER TABLE movies.directs OWNER TO dda022;
ALTER TABLE movies.genre OWNER TO dda022;
ALTER TABLE movies.language OWNER TO dda022;
ALTER TABLE movies.movie OWNER TO dda022;
ALTER TABLE movies.person OWNER TO dda022;
ALTER TABLE movies.runtime OWNER TO dda022;
ALTER TABLE movies.writes OWNER TO dda022;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda022;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda022;
ALTER TABLE srs.education OWNER TO dda022;
ALTER TABLE srs.courses OWNER TO dda022;

--- Database for user dda023

CREATE DATABASE dda023 WITH OWNER dda023;

\c dda023
GRANT ALL PRIVILEGES ON DATABASE dda023 TO dda023;
REVOKE ALL PRIVILEGES ON DATABASE dda023 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda023;
ALTER SCHEMA dda023 OWNER TO dda023;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda023;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda023;
ALTER TABLE movies.certification OWNER TO dda023;
ALTER TABLE movies.directs OWNER TO dda023;
ALTER TABLE movies.genre OWNER TO dda023;
ALTER TABLE movies.language OWNER TO dda023;
ALTER TABLE movies.movie OWNER TO dda023;
ALTER TABLE movies.person OWNER TO dda023;
ALTER TABLE movies.runtime OWNER TO dda023;
ALTER TABLE movies.writes OWNER TO dda023;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda023;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda023;
ALTER TABLE srs.education OWNER TO dda023;
ALTER TABLE srs.courses OWNER TO dda023;

--- Database for user dda024

CREATE DATABASE dda024 WITH OWNER dda024;

\c dda024
GRANT ALL PRIVILEGES ON DATABASE dda024 TO dda024;
REVOKE ALL PRIVILEGES ON DATABASE dda024 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda024;
ALTER SCHEMA dda024 OWNER TO dda024;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda024;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda024;
ALTER TABLE movies.certification OWNER TO dda024;
ALTER TABLE movies.directs OWNER TO dda024;
ALTER TABLE movies.genre OWNER TO dda024;
ALTER TABLE movies.language OWNER TO dda024;
ALTER TABLE movies.movie OWNER TO dda024;
ALTER TABLE movies.person OWNER TO dda024;
ALTER TABLE movies.runtime OWNER TO dda024;
ALTER TABLE movies.writes OWNER TO dda024;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda024;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda024;
ALTER TABLE srs.education OWNER TO dda024;
ALTER TABLE srs.courses OWNER TO dda024;

--- Database for user dda025

CREATE DATABASE dda025 WITH OWNER dda025;

\c dda025
GRANT ALL PRIVILEGES ON DATABASE dda025 TO dda025;
REVOKE ALL PRIVILEGES ON DATABASE dda025 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda025;
ALTER SCHEMA dda025 OWNER TO dda025;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda025;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda025;
ALTER TABLE movies.certification OWNER TO dda025;
ALTER TABLE movies.directs OWNER TO dda025;
ALTER TABLE movies.genre OWNER TO dda025;
ALTER TABLE movies.language OWNER TO dda025;
ALTER TABLE movies.movie OWNER TO dda025;
ALTER TABLE movies.person OWNER TO dda025;
ALTER TABLE movies.runtime OWNER TO dda025;
ALTER TABLE movies.writes OWNER TO dda025;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda025;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda025;
ALTER TABLE srs.education OWNER TO dda025;
ALTER TABLE srs.courses OWNER TO dda025;

--- Database for user dda026

CREATE DATABASE dda026 WITH OWNER dda026;

\c dda026
GRANT ALL PRIVILEGES ON DATABASE dda026 TO dda026;
REVOKE ALL PRIVILEGES ON DATABASE dda026 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda026;
ALTER SCHEMA dda026 OWNER TO dda026;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda026;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda026;
ALTER TABLE movies.certification OWNER TO dda026;
ALTER TABLE movies.directs OWNER TO dda026;
ALTER TABLE movies.genre OWNER TO dda026;
ALTER TABLE movies.language OWNER TO dda026;
ALTER TABLE movies.movie OWNER TO dda026;
ALTER TABLE movies.person OWNER TO dda026;
ALTER TABLE movies.runtime OWNER TO dda026;
ALTER TABLE movies.writes OWNER TO dda026;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda026;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda026;
ALTER TABLE srs.education OWNER TO dda026;
ALTER TABLE srs.courses OWNER TO dda026;

--- Database for user dda027

CREATE DATABASE dda027 WITH OWNER dda027;

\c dda027
GRANT ALL PRIVILEGES ON DATABASE dda027 TO dda027;
REVOKE ALL PRIVILEGES ON DATABASE dda027 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda027;
ALTER SCHEMA dda027 OWNER TO dda027;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda027;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda027;
ALTER TABLE movies.certification OWNER TO dda027;
ALTER TABLE movies.directs OWNER TO dda027;
ALTER TABLE movies.genre OWNER TO dda027;
ALTER TABLE movies.language OWNER TO dda027;
ALTER TABLE movies.movie OWNER TO dda027;
ALTER TABLE movies.person OWNER TO dda027;
ALTER TABLE movies.runtime OWNER TO dda027;
ALTER TABLE movies.writes OWNER TO dda027;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda027;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda027;
ALTER TABLE srs.education OWNER TO dda027;
ALTER TABLE srs.courses OWNER TO dda027;

--- Database for user dda028

CREATE DATABASE dda028 WITH OWNER dda028;

\c dda028
GRANT ALL PRIVILEGES ON DATABASE dda028 TO dda028;
REVOKE ALL PRIVILEGES ON DATABASE dda028 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda028;
ALTER SCHEMA dda028 OWNER TO dda028;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda028;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda028;
ALTER TABLE movies.certification OWNER TO dda028;
ALTER TABLE movies.directs OWNER TO dda028;
ALTER TABLE movies.genre OWNER TO dda028;
ALTER TABLE movies.language OWNER TO dda028;
ALTER TABLE movies.movie OWNER TO dda028;
ALTER TABLE movies.person OWNER TO dda028;
ALTER TABLE movies.runtime OWNER TO dda028;
ALTER TABLE movies.writes OWNER TO dda028;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda028;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda028;
ALTER TABLE srs.education OWNER TO dda028;
ALTER TABLE srs.courses OWNER TO dda028;

--- Database for user dda029

CREATE DATABASE dda029 WITH OWNER dda029;

\c dda029
GRANT ALL PRIVILEGES ON DATABASE dda029 TO dda029;
REVOKE ALL PRIVILEGES ON DATABASE dda029 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda029;
ALTER SCHEMA dda029 OWNER TO dda029;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda029;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda029;
ALTER TABLE movies.certification OWNER TO dda029;
ALTER TABLE movies.directs OWNER TO dda029;
ALTER TABLE movies.genre OWNER TO dda029;
ALTER TABLE movies.language OWNER TO dda029;
ALTER TABLE movies.movie OWNER TO dda029;
ALTER TABLE movies.person OWNER TO dda029;
ALTER TABLE movies.runtime OWNER TO dda029;
ALTER TABLE movies.writes OWNER TO dda029;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda029;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda029;
ALTER TABLE srs.education OWNER TO dda029;
ALTER TABLE srs.courses OWNER TO dda029;

--- Database for user dda030

CREATE DATABASE dda030 WITH OWNER dda030;

\c dda030
GRANT ALL PRIVILEGES ON DATABASE dda030 TO dda030;
REVOKE ALL PRIVILEGES ON DATABASE dda030 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda030;
ALTER SCHEMA dda030 OWNER TO dda030;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda030;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda030;
ALTER TABLE movies.certification OWNER TO dda030;
ALTER TABLE movies.directs OWNER TO dda030;
ALTER TABLE movies.genre OWNER TO dda030;
ALTER TABLE movies.language OWNER TO dda030;
ALTER TABLE movies.movie OWNER TO dda030;
ALTER TABLE movies.person OWNER TO dda030;
ALTER TABLE movies.runtime OWNER TO dda030;
ALTER TABLE movies.writes OWNER TO dda030;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda030;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda030;
ALTER TABLE srs.education OWNER TO dda030;
ALTER TABLE srs.courses OWNER TO dda030;

--- Database for user dda031

CREATE DATABASE dda031 WITH OWNER dda031;

\c dda031
GRANT ALL PRIVILEGES ON DATABASE dda031 TO dda031;
REVOKE ALL PRIVILEGES ON DATABASE dda031 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda031;
ALTER SCHEMA dda031 OWNER TO dda031;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda031;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda031;
ALTER TABLE movies.certification OWNER TO dda031;
ALTER TABLE movies.directs OWNER TO dda031;
ALTER TABLE movies.genre OWNER TO dda031;
ALTER TABLE movies.language OWNER TO dda031;
ALTER TABLE movies.movie OWNER TO dda031;
ALTER TABLE movies.person OWNER TO dda031;
ALTER TABLE movies.runtime OWNER TO dda031;
ALTER TABLE movies.writes OWNER TO dda031;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda031;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda031;
ALTER TABLE srs.education OWNER TO dda031;
ALTER TABLE srs.courses OWNER TO dda031;

--- Database for user dda032

CREATE DATABASE dda032 WITH OWNER dda032;

\c dda032
GRANT ALL PRIVILEGES ON DATABASE dda032 TO dda032;
REVOKE ALL PRIVILEGES ON DATABASE dda032 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda032;
ALTER SCHEMA dda032 OWNER TO dda032;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda032;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda032;
ALTER TABLE movies.certification OWNER TO dda032;
ALTER TABLE movies.directs OWNER TO dda032;
ALTER TABLE movies.genre OWNER TO dda032;
ALTER TABLE movies.language OWNER TO dda032;
ALTER TABLE movies.movie OWNER TO dda032;
ALTER TABLE movies.person OWNER TO dda032;
ALTER TABLE movies.runtime OWNER TO dda032;
ALTER TABLE movies.writes OWNER TO dda032;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda032;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda032;
ALTER TABLE srs.education OWNER TO dda032;
ALTER TABLE srs.courses OWNER TO dda032;

--- Database for user dda033

CREATE DATABASE dda033 WITH OWNER dda033;

\c dda033
GRANT ALL PRIVILEGES ON DATABASE dda033 TO dda033;
REVOKE ALL PRIVILEGES ON DATABASE dda033 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda033;
ALTER SCHEMA dda033 OWNER TO dda033;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda033;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda033;
ALTER TABLE movies.certification OWNER TO dda033;
ALTER TABLE movies.directs OWNER TO dda033;
ALTER TABLE movies.genre OWNER TO dda033;
ALTER TABLE movies.language OWNER TO dda033;
ALTER TABLE movies.movie OWNER TO dda033;
ALTER TABLE movies.person OWNER TO dda033;
ALTER TABLE movies.runtime OWNER TO dda033;
ALTER TABLE movies.writes OWNER TO dda033;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda033;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda033;
ALTER TABLE srs.education OWNER TO dda033;
ALTER TABLE srs.courses OWNER TO dda033;

--- Database for user dda034

CREATE DATABASE dda034 WITH OWNER dda034;

\c dda034
GRANT ALL PRIVILEGES ON DATABASE dda034 TO dda034;
REVOKE ALL PRIVILEGES ON DATABASE dda034 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda034;
ALTER SCHEMA dda034 OWNER TO dda034;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda034;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda034;
ALTER TABLE movies.certification OWNER TO dda034;
ALTER TABLE movies.directs OWNER TO dda034;
ALTER TABLE movies.genre OWNER TO dda034;
ALTER TABLE movies.language OWNER TO dda034;
ALTER TABLE movies.movie OWNER TO dda034;
ALTER TABLE movies.person OWNER TO dda034;
ALTER TABLE movies.runtime OWNER TO dda034;
ALTER TABLE movies.writes OWNER TO dda034;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda034;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda034;
ALTER TABLE srs.education OWNER TO dda034;
ALTER TABLE srs.courses OWNER TO dda034;

--- Database for user dda035

CREATE DATABASE dda035 WITH OWNER dda035;

\c dda035
GRANT ALL PRIVILEGES ON DATABASE dda035 TO dda035;
REVOKE ALL PRIVILEGES ON DATABASE dda035 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda035;
ALTER SCHEMA dda035 OWNER TO dda035;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda035;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda035;
ALTER TABLE movies.certification OWNER TO dda035;
ALTER TABLE movies.directs OWNER TO dda035;
ALTER TABLE movies.genre OWNER TO dda035;
ALTER TABLE movies.language OWNER TO dda035;
ALTER TABLE movies.movie OWNER TO dda035;
ALTER TABLE movies.person OWNER TO dda035;
ALTER TABLE movies.runtime OWNER TO dda035;
ALTER TABLE movies.writes OWNER TO dda035;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda035;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda035;
ALTER TABLE srs.education OWNER TO dda035;
ALTER TABLE srs.courses OWNER TO dda035;

--- Database for user dda036

CREATE DATABASE dda036 WITH OWNER dda036;

\c dda036
GRANT ALL PRIVILEGES ON DATABASE dda036 TO dda036;
REVOKE ALL PRIVILEGES ON DATABASE dda036 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda036;
ALTER SCHEMA dda036 OWNER TO dda036;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda036;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda036;
ALTER TABLE movies.certification OWNER TO dda036;
ALTER TABLE movies.directs OWNER TO dda036;
ALTER TABLE movies.genre OWNER TO dda036;
ALTER TABLE movies.language OWNER TO dda036;
ALTER TABLE movies.movie OWNER TO dda036;
ALTER TABLE movies.person OWNER TO dda036;
ALTER TABLE movies.runtime OWNER TO dda036;
ALTER TABLE movies.writes OWNER TO dda036;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda036;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda036;
ALTER TABLE srs.education OWNER TO dda036;
ALTER TABLE srs.courses OWNER TO dda036;

--- Database for user dda037

CREATE DATABASE dda037 WITH OWNER dda037;

\c dda037
GRANT ALL PRIVILEGES ON DATABASE dda037 TO dda037;
REVOKE ALL PRIVILEGES ON DATABASE dda037 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda037;
ALTER SCHEMA dda037 OWNER TO dda037;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda037;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda037;
ALTER TABLE movies.certification OWNER TO dda037;
ALTER TABLE movies.directs OWNER TO dda037;
ALTER TABLE movies.genre OWNER TO dda037;
ALTER TABLE movies.language OWNER TO dda037;
ALTER TABLE movies.movie OWNER TO dda037;
ALTER TABLE movies.person OWNER TO dda037;
ALTER TABLE movies.runtime OWNER TO dda037;
ALTER TABLE movies.writes OWNER TO dda037;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda037;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda037;
ALTER TABLE srs.education OWNER TO dda037;
ALTER TABLE srs.courses OWNER TO dda037;

--- Database for user dda038

CREATE DATABASE dda038 WITH OWNER dda038;

\c dda038
GRANT ALL PRIVILEGES ON DATABASE dda038 TO dda038;
REVOKE ALL PRIVILEGES ON DATABASE dda038 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda038;
ALTER SCHEMA dda038 OWNER TO dda038;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda038;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda038;
ALTER TABLE movies.certification OWNER TO dda038;
ALTER TABLE movies.directs OWNER TO dda038;
ALTER TABLE movies.genre OWNER TO dda038;
ALTER TABLE movies.language OWNER TO dda038;
ALTER TABLE movies.movie OWNER TO dda038;
ALTER TABLE movies.person OWNER TO dda038;
ALTER TABLE movies.runtime OWNER TO dda038;
ALTER TABLE movies.writes OWNER TO dda038;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda038;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda038;
ALTER TABLE srs.education OWNER TO dda038;
ALTER TABLE srs.courses OWNER TO dda038;

--- Database for user dda039

CREATE DATABASE dda039 WITH OWNER dda039;

\c dda039
GRANT ALL PRIVILEGES ON DATABASE dda039 TO dda039;
REVOKE ALL PRIVILEGES ON DATABASE dda039 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda039;
ALTER SCHEMA dda039 OWNER TO dda039;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda039;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda039;
ALTER TABLE movies.certification OWNER TO dda039;
ALTER TABLE movies.directs OWNER TO dda039;
ALTER TABLE movies.genre OWNER TO dda039;
ALTER TABLE movies.language OWNER TO dda039;
ALTER TABLE movies.movie OWNER TO dda039;
ALTER TABLE movies.person OWNER TO dda039;
ALTER TABLE movies.runtime OWNER TO dda039;
ALTER TABLE movies.writes OWNER TO dda039;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda039;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda039;
ALTER TABLE srs.education OWNER TO dda039;
ALTER TABLE srs.courses OWNER TO dda039;

--- Database for user dda040

CREATE DATABASE dda040 WITH OWNER dda040;

\c dda040
GRANT ALL PRIVILEGES ON DATABASE dda040 TO dda040;
REVOKE ALL PRIVILEGES ON DATABASE dda040 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda040;
ALTER SCHEMA dda040 OWNER TO dda040;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda040;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda040;
ALTER TABLE movies.certification OWNER TO dda040;
ALTER TABLE movies.directs OWNER TO dda040;
ALTER TABLE movies.genre OWNER TO dda040;
ALTER TABLE movies.language OWNER TO dda040;
ALTER TABLE movies.movie OWNER TO dda040;
ALTER TABLE movies.person OWNER TO dda040;
ALTER TABLE movies.runtime OWNER TO dda040;
ALTER TABLE movies.writes OWNER TO dda040;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda040;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda040;
ALTER TABLE srs.education OWNER TO dda040;
ALTER TABLE srs.courses OWNER TO dda040;

--- Database for user dda041

CREATE DATABASE dda041 WITH OWNER dda041;

\c dda041
GRANT ALL PRIVILEGES ON DATABASE dda041 TO dda041;
REVOKE ALL PRIVILEGES ON DATABASE dda041 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda041;
ALTER SCHEMA dda041 OWNER TO dda041;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda041;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda041;
ALTER TABLE movies.certification OWNER TO dda041;
ALTER TABLE movies.directs OWNER TO dda041;
ALTER TABLE movies.genre OWNER TO dda041;
ALTER TABLE movies.language OWNER TO dda041;
ALTER TABLE movies.movie OWNER TO dda041;
ALTER TABLE movies.person OWNER TO dda041;
ALTER TABLE movies.runtime OWNER TO dda041;
ALTER TABLE movies.writes OWNER TO dda041;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda041;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda041;
ALTER TABLE srs.education OWNER TO dda041;
ALTER TABLE srs.courses OWNER TO dda041;

--- Database for user dda042

CREATE DATABASE dda042 WITH OWNER dda042;

\c dda042
GRANT ALL PRIVILEGES ON DATABASE dda042 TO dda042;
REVOKE ALL PRIVILEGES ON DATABASE dda042 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda042;
ALTER SCHEMA dda042 OWNER TO dda042;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda042;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda042;
ALTER TABLE movies.certification OWNER TO dda042;
ALTER TABLE movies.directs OWNER TO dda042;
ALTER TABLE movies.genre OWNER TO dda042;
ALTER TABLE movies.language OWNER TO dda042;
ALTER TABLE movies.movie OWNER TO dda042;
ALTER TABLE movies.person OWNER TO dda042;
ALTER TABLE movies.runtime OWNER TO dda042;
ALTER TABLE movies.writes OWNER TO dda042;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda042;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda042;
ALTER TABLE srs.education OWNER TO dda042;
ALTER TABLE srs.courses OWNER TO dda042;

--- Database for user dda043

CREATE DATABASE dda043 WITH OWNER dda043;

\c dda043
GRANT ALL PRIVILEGES ON DATABASE dda043 TO dda043;
REVOKE ALL PRIVILEGES ON DATABASE dda043 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda043;
ALTER SCHEMA dda043 OWNER TO dda043;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda043;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda043;
ALTER TABLE movies.certification OWNER TO dda043;
ALTER TABLE movies.directs OWNER TO dda043;
ALTER TABLE movies.genre OWNER TO dda043;
ALTER TABLE movies.language OWNER TO dda043;
ALTER TABLE movies.movie OWNER TO dda043;
ALTER TABLE movies.person OWNER TO dda043;
ALTER TABLE movies.runtime OWNER TO dda043;
ALTER TABLE movies.writes OWNER TO dda043;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda043;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda043;
ALTER TABLE srs.education OWNER TO dda043;
ALTER TABLE srs.courses OWNER TO dda043;

--- Database for user dda044

CREATE DATABASE dda044 WITH OWNER dda044;

\c dda044
GRANT ALL PRIVILEGES ON DATABASE dda044 TO dda044;
REVOKE ALL PRIVILEGES ON DATABASE dda044 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda044;
ALTER SCHEMA dda044 OWNER TO dda044;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda044;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda044;
ALTER TABLE movies.certification OWNER TO dda044;
ALTER TABLE movies.directs OWNER TO dda044;
ALTER TABLE movies.genre OWNER TO dda044;
ALTER TABLE movies.language OWNER TO dda044;
ALTER TABLE movies.movie OWNER TO dda044;
ALTER TABLE movies.person OWNER TO dda044;
ALTER TABLE movies.runtime OWNER TO dda044;
ALTER TABLE movies.writes OWNER TO dda044;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda044;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda044;
ALTER TABLE srs.education OWNER TO dda044;
ALTER TABLE srs.courses OWNER TO dda044;

--- Database for user dda045

CREATE DATABASE dda045 WITH OWNER dda045;

\c dda045
GRANT ALL PRIVILEGES ON DATABASE dda045 TO dda045;
REVOKE ALL PRIVILEGES ON DATABASE dda045 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda045;
ALTER SCHEMA dda045 OWNER TO dda045;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda045;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda045;
ALTER TABLE movies.certification OWNER TO dda045;
ALTER TABLE movies.directs OWNER TO dda045;
ALTER TABLE movies.genre OWNER TO dda045;
ALTER TABLE movies.language OWNER TO dda045;
ALTER TABLE movies.movie OWNER TO dda045;
ALTER TABLE movies.person OWNER TO dda045;
ALTER TABLE movies.runtime OWNER TO dda045;
ALTER TABLE movies.writes OWNER TO dda045;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda045;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda045;
ALTER TABLE srs.education OWNER TO dda045;
ALTER TABLE srs.courses OWNER TO dda045;

--- Database for user dda046

CREATE DATABASE dda046 WITH OWNER dda046;

\c dda046
GRANT ALL PRIVILEGES ON DATABASE dda046 TO dda046;
REVOKE ALL PRIVILEGES ON DATABASE dda046 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda046;
ALTER SCHEMA dda046 OWNER TO dda046;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda046;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda046;
ALTER TABLE movies.certification OWNER TO dda046;
ALTER TABLE movies.directs OWNER TO dda046;
ALTER TABLE movies.genre OWNER TO dda046;
ALTER TABLE movies.language OWNER TO dda046;
ALTER TABLE movies.movie OWNER TO dda046;
ALTER TABLE movies.person OWNER TO dda046;
ALTER TABLE movies.runtime OWNER TO dda046;
ALTER TABLE movies.writes OWNER TO dda046;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda046;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda046;
ALTER TABLE srs.education OWNER TO dda046;
ALTER TABLE srs.courses OWNER TO dda046;

--- Database for user dda047

CREATE DATABASE dda047 WITH OWNER dda047;

\c dda047
GRANT ALL PRIVILEGES ON DATABASE dda047 TO dda047;
REVOKE ALL PRIVILEGES ON DATABASE dda047 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda047;
ALTER SCHEMA dda047 OWNER TO dda047;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda047;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda047;
ALTER TABLE movies.certification OWNER TO dda047;
ALTER TABLE movies.directs OWNER TO dda047;
ALTER TABLE movies.genre OWNER TO dda047;
ALTER TABLE movies.language OWNER TO dda047;
ALTER TABLE movies.movie OWNER TO dda047;
ALTER TABLE movies.person OWNER TO dda047;
ALTER TABLE movies.runtime OWNER TO dda047;
ALTER TABLE movies.writes OWNER TO dda047;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda047;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda047;
ALTER TABLE srs.education OWNER TO dda047;
ALTER TABLE srs.courses OWNER TO dda047;

--- Database for user dda048

CREATE DATABASE dda048 WITH OWNER dda048;

\c dda048
GRANT ALL PRIVILEGES ON DATABASE dda048 TO dda048;
REVOKE ALL PRIVILEGES ON DATABASE dda048 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda048;
ALTER SCHEMA dda048 OWNER TO dda048;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda048;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda048;
ALTER TABLE movies.certification OWNER TO dda048;
ALTER TABLE movies.directs OWNER TO dda048;
ALTER TABLE movies.genre OWNER TO dda048;
ALTER TABLE movies.language OWNER TO dda048;
ALTER TABLE movies.movie OWNER TO dda048;
ALTER TABLE movies.person OWNER TO dda048;
ALTER TABLE movies.runtime OWNER TO dda048;
ALTER TABLE movies.writes OWNER TO dda048;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda048;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda048;
ALTER TABLE srs.education OWNER TO dda048;
ALTER TABLE srs.courses OWNER TO dda048;

--- Database for user dda049

CREATE DATABASE dda049 WITH OWNER dda049;

\c dda049
GRANT ALL PRIVILEGES ON DATABASE dda049 TO dda049;
REVOKE ALL PRIVILEGES ON DATABASE dda049 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda049;
ALTER SCHEMA dda049 OWNER TO dda049;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda049;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda049;
ALTER TABLE movies.certification OWNER TO dda049;
ALTER TABLE movies.directs OWNER TO dda049;
ALTER TABLE movies.genre OWNER TO dda049;
ALTER TABLE movies.language OWNER TO dda049;
ALTER TABLE movies.movie OWNER TO dda049;
ALTER TABLE movies.person OWNER TO dda049;
ALTER TABLE movies.runtime OWNER TO dda049;
ALTER TABLE movies.writes OWNER TO dda049;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda049;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda049;
ALTER TABLE srs.education OWNER TO dda049;
ALTER TABLE srs.courses OWNER TO dda049;

--- Database for user dda050

CREATE DATABASE dda050 WITH OWNER dda050;

\c dda050
GRANT ALL PRIVILEGES ON DATABASE dda050 TO dda050;
REVOKE ALL PRIVILEGES ON DATABASE dda050 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda050;
ALTER SCHEMA dda050 OWNER TO dda050;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda050;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda050;
ALTER TABLE movies.certification OWNER TO dda050;
ALTER TABLE movies.directs OWNER TO dda050;
ALTER TABLE movies.genre OWNER TO dda050;
ALTER TABLE movies.language OWNER TO dda050;
ALTER TABLE movies.movie OWNER TO dda050;
ALTER TABLE movies.person OWNER TO dda050;
ALTER TABLE movies.runtime OWNER TO dda050;
ALTER TABLE movies.writes OWNER TO dda050;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda050;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda050;
ALTER TABLE srs.education OWNER TO dda050;
ALTER TABLE srs.courses OWNER TO dda050;

--- Database for user dda051

CREATE DATABASE dda051 WITH OWNER dda051;

\c dda051
GRANT ALL PRIVILEGES ON DATABASE dda051 TO dda051;
REVOKE ALL PRIVILEGES ON DATABASE dda051 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda051;
ALTER SCHEMA dda051 OWNER TO dda051;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda051;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda051;
ALTER TABLE movies.certification OWNER TO dda051;
ALTER TABLE movies.directs OWNER TO dda051;
ALTER TABLE movies.genre OWNER TO dda051;
ALTER TABLE movies.language OWNER TO dda051;
ALTER TABLE movies.movie OWNER TO dda051;
ALTER TABLE movies.person OWNER TO dda051;
ALTER TABLE movies.runtime OWNER TO dda051;
ALTER TABLE movies.writes OWNER TO dda051;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda051;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda051;
ALTER TABLE srs.education OWNER TO dda051;
ALTER TABLE srs.courses OWNER TO dda051;

--- Database for user dda052

CREATE DATABASE dda052 WITH OWNER dda052;

\c dda052
GRANT ALL PRIVILEGES ON DATABASE dda052 TO dda052;
REVOKE ALL PRIVILEGES ON DATABASE dda052 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda052;
ALTER SCHEMA dda052 OWNER TO dda052;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda052;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda052;
ALTER TABLE movies.certification OWNER TO dda052;
ALTER TABLE movies.directs OWNER TO dda052;
ALTER TABLE movies.genre OWNER TO dda052;
ALTER TABLE movies.language OWNER TO dda052;
ALTER TABLE movies.movie OWNER TO dda052;
ALTER TABLE movies.person OWNER TO dda052;
ALTER TABLE movies.runtime OWNER TO dda052;
ALTER TABLE movies.writes OWNER TO dda052;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda052;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda052;
ALTER TABLE srs.education OWNER TO dda052;
ALTER TABLE srs.courses OWNER TO dda052;

--- Database for user dda053

CREATE DATABASE dda053 WITH OWNER dda053;

\c dda053
GRANT ALL PRIVILEGES ON DATABASE dda053 TO dda053;
REVOKE ALL PRIVILEGES ON DATABASE dda053 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda053;
ALTER SCHEMA dda053 OWNER TO dda053;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda053;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda053;
ALTER TABLE movies.certification OWNER TO dda053;
ALTER TABLE movies.directs OWNER TO dda053;
ALTER TABLE movies.genre OWNER TO dda053;
ALTER TABLE movies.language OWNER TO dda053;
ALTER TABLE movies.movie OWNER TO dda053;
ALTER TABLE movies.person OWNER TO dda053;
ALTER TABLE movies.runtime OWNER TO dda053;
ALTER TABLE movies.writes OWNER TO dda053;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda053;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda053;
ALTER TABLE srs.education OWNER TO dda053;
ALTER TABLE srs.courses OWNER TO dda053;

--- Database for user dda054

CREATE DATABASE dda054 WITH OWNER dda054;

\c dda054
GRANT ALL PRIVILEGES ON DATABASE dda054 TO dda054;
REVOKE ALL PRIVILEGES ON DATABASE dda054 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda054;
ALTER SCHEMA dda054 OWNER TO dda054;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda054;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda054;
ALTER TABLE movies.certification OWNER TO dda054;
ALTER TABLE movies.directs OWNER TO dda054;
ALTER TABLE movies.genre OWNER TO dda054;
ALTER TABLE movies.language OWNER TO dda054;
ALTER TABLE movies.movie OWNER TO dda054;
ALTER TABLE movies.person OWNER TO dda054;
ALTER TABLE movies.runtime OWNER TO dda054;
ALTER TABLE movies.writes OWNER TO dda054;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda054;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda054;
ALTER TABLE srs.education OWNER TO dda054;
ALTER TABLE srs.courses OWNER TO dda054;

--- Database for user dda055

CREATE DATABASE dda055 WITH OWNER dda055;

\c dda055
GRANT ALL PRIVILEGES ON DATABASE dda055 TO dda055;
REVOKE ALL PRIVILEGES ON DATABASE dda055 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda055;
ALTER SCHEMA dda055 OWNER TO dda055;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda055;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda055;
ALTER TABLE movies.certification OWNER TO dda055;
ALTER TABLE movies.directs OWNER TO dda055;
ALTER TABLE movies.genre OWNER TO dda055;
ALTER TABLE movies.language OWNER TO dda055;
ALTER TABLE movies.movie OWNER TO dda055;
ALTER TABLE movies.person OWNER TO dda055;
ALTER TABLE movies.runtime OWNER TO dda055;
ALTER TABLE movies.writes OWNER TO dda055;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda055;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda055;
ALTER TABLE srs.education OWNER TO dda055;
ALTER TABLE srs.courses OWNER TO dda055;

--- Database for user dda056

CREATE DATABASE dda056 WITH OWNER dda056;

\c dda056
GRANT ALL PRIVILEGES ON DATABASE dda056 TO dda056;
REVOKE ALL PRIVILEGES ON DATABASE dda056 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda056;
ALTER SCHEMA dda056 OWNER TO dda056;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda056;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda056;
ALTER TABLE movies.certification OWNER TO dda056;
ALTER TABLE movies.directs OWNER TO dda056;
ALTER TABLE movies.genre OWNER TO dda056;
ALTER TABLE movies.language OWNER TO dda056;
ALTER TABLE movies.movie OWNER TO dda056;
ALTER TABLE movies.person OWNER TO dda056;
ALTER TABLE movies.runtime OWNER TO dda056;
ALTER TABLE movies.writes OWNER TO dda056;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda056;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda056;
ALTER TABLE srs.education OWNER TO dda056;
ALTER TABLE srs.courses OWNER TO dda056;

--- Database for user dda057

CREATE DATABASE dda057 WITH OWNER dda057;

\c dda057
GRANT ALL PRIVILEGES ON DATABASE dda057 TO dda057;
REVOKE ALL PRIVILEGES ON DATABASE dda057 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda057;
ALTER SCHEMA dda057 OWNER TO dda057;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda057;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda057;
ALTER TABLE movies.certification OWNER TO dda057;
ALTER TABLE movies.directs OWNER TO dda057;
ALTER TABLE movies.genre OWNER TO dda057;
ALTER TABLE movies.language OWNER TO dda057;
ALTER TABLE movies.movie OWNER TO dda057;
ALTER TABLE movies.person OWNER TO dda057;
ALTER TABLE movies.runtime OWNER TO dda057;
ALTER TABLE movies.writes OWNER TO dda057;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda057;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda057;
ALTER TABLE srs.education OWNER TO dda057;
ALTER TABLE srs.courses OWNER TO dda057;

--- Database for user dda058

CREATE DATABASE dda058 WITH OWNER dda058;

\c dda058
GRANT ALL PRIVILEGES ON DATABASE dda058 TO dda058;
REVOKE ALL PRIVILEGES ON DATABASE dda058 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda058;
ALTER SCHEMA dda058 OWNER TO dda058;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda058;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda058;
ALTER TABLE movies.certification OWNER TO dda058;
ALTER TABLE movies.directs OWNER TO dda058;
ALTER TABLE movies.genre OWNER TO dda058;
ALTER TABLE movies.language OWNER TO dda058;
ALTER TABLE movies.movie OWNER TO dda058;
ALTER TABLE movies.person OWNER TO dda058;
ALTER TABLE movies.runtime OWNER TO dda058;
ALTER TABLE movies.writes OWNER TO dda058;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda058;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda058;
ALTER TABLE srs.education OWNER TO dda058;
ALTER TABLE srs.courses OWNER TO dda058;

--- Database for user dda059

CREATE DATABASE dda059 WITH OWNER dda059;

\c dda059
GRANT ALL PRIVILEGES ON DATABASE dda059 TO dda059;
REVOKE ALL PRIVILEGES ON DATABASE dda059 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda059;
ALTER SCHEMA dda059 OWNER TO dda059;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda059;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda059;
ALTER TABLE movies.certification OWNER TO dda059;
ALTER TABLE movies.directs OWNER TO dda059;
ALTER TABLE movies.genre OWNER TO dda059;
ALTER TABLE movies.language OWNER TO dda059;
ALTER TABLE movies.movie OWNER TO dda059;
ALTER TABLE movies.person OWNER TO dda059;
ALTER TABLE movies.runtime OWNER TO dda059;
ALTER TABLE movies.writes OWNER TO dda059;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda059;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda059;
ALTER TABLE srs.education OWNER TO dda059;
ALTER TABLE srs.courses OWNER TO dda059;

--- Database for user dda060

CREATE DATABASE dda060 WITH OWNER dda060;

\c dda060
GRANT ALL PRIVILEGES ON DATABASE dda060 TO dda060;
REVOKE ALL PRIVILEGES ON DATABASE dda060 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda060;
ALTER SCHEMA dda060 OWNER TO dda060;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda060;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda060;
ALTER TABLE movies.certification OWNER TO dda060;
ALTER TABLE movies.directs OWNER TO dda060;
ALTER TABLE movies.genre OWNER TO dda060;
ALTER TABLE movies.language OWNER TO dda060;
ALTER TABLE movies.movie OWNER TO dda060;
ALTER TABLE movies.person OWNER TO dda060;
ALTER TABLE movies.runtime OWNER TO dda060;
ALTER TABLE movies.writes OWNER TO dda060;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda060;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda060;
ALTER TABLE srs.education OWNER TO dda060;
ALTER TABLE srs.courses OWNER TO dda060;

--- Database for user dda061

CREATE DATABASE dda061 WITH OWNER dda061;

\c dda061
GRANT ALL PRIVILEGES ON DATABASE dda061 TO dda061;
REVOKE ALL PRIVILEGES ON DATABASE dda061 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda061;
ALTER SCHEMA dda061 OWNER TO dda061;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda061;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda061;
ALTER TABLE movies.certification OWNER TO dda061;
ALTER TABLE movies.directs OWNER TO dda061;
ALTER TABLE movies.genre OWNER TO dda061;
ALTER TABLE movies.language OWNER TO dda061;
ALTER TABLE movies.movie OWNER TO dda061;
ALTER TABLE movies.person OWNER TO dda061;
ALTER TABLE movies.runtime OWNER TO dda061;
ALTER TABLE movies.writes OWNER TO dda061;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda061;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda061;
ALTER TABLE srs.education OWNER TO dda061;
ALTER TABLE srs.courses OWNER TO dda061;

--- Database for user dda062

CREATE DATABASE dda062 WITH OWNER dda062;

\c dda062
GRANT ALL PRIVILEGES ON DATABASE dda062 TO dda062;
REVOKE ALL PRIVILEGES ON DATABASE dda062 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda062;
ALTER SCHEMA dda062 OWNER TO dda062;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda062;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda062;
ALTER TABLE movies.certification OWNER TO dda062;
ALTER TABLE movies.directs OWNER TO dda062;
ALTER TABLE movies.genre OWNER TO dda062;
ALTER TABLE movies.language OWNER TO dda062;
ALTER TABLE movies.movie OWNER TO dda062;
ALTER TABLE movies.person OWNER TO dda062;
ALTER TABLE movies.runtime OWNER TO dda062;
ALTER TABLE movies.writes OWNER TO dda062;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda062;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda062;
ALTER TABLE srs.education OWNER TO dda062;
ALTER TABLE srs.courses OWNER TO dda062;

--- Database for user dda063

CREATE DATABASE dda063 WITH OWNER dda063;

\c dda063
GRANT ALL PRIVILEGES ON DATABASE dda063 TO dda063;
REVOKE ALL PRIVILEGES ON DATABASE dda063 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda063;
ALTER SCHEMA dda063 OWNER TO dda063;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda063;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda063;
ALTER TABLE movies.certification OWNER TO dda063;
ALTER TABLE movies.directs OWNER TO dda063;
ALTER TABLE movies.genre OWNER TO dda063;
ALTER TABLE movies.language OWNER TO dda063;
ALTER TABLE movies.movie OWNER TO dda063;
ALTER TABLE movies.person OWNER TO dda063;
ALTER TABLE movies.runtime OWNER TO dda063;
ALTER TABLE movies.writes OWNER TO dda063;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda063;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda063;
ALTER TABLE srs.education OWNER TO dda063;
ALTER TABLE srs.courses OWNER TO dda063;

--- Database for user dda064

CREATE DATABASE dda064 WITH OWNER dda064;

\c dda064
GRANT ALL PRIVILEGES ON DATABASE dda064 TO dda064;
REVOKE ALL PRIVILEGES ON DATABASE dda064 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda064;
ALTER SCHEMA dda064 OWNER TO dda064;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda064;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda064;
ALTER TABLE movies.certification OWNER TO dda064;
ALTER TABLE movies.directs OWNER TO dda064;
ALTER TABLE movies.genre OWNER TO dda064;
ALTER TABLE movies.language OWNER TO dda064;
ALTER TABLE movies.movie OWNER TO dda064;
ALTER TABLE movies.person OWNER TO dda064;
ALTER TABLE movies.runtime OWNER TO dda064;
ALTER TABLE movies.writes OWNER TO dda064;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda064;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda064;
ALTER TABLE srs.education OWNER TO dda064;
ALTER TABLE srs.courses OWNER TO dda064;

--- Database for user dda065

CREATE DATABASE dda065 WITH OWNER dda065;

\c dda065
GRANT ALL PRIVILEGES ON DATABASE dda065 TO dda065;
REVOKE ALL PRIVILEGES ON DATABASE dda065 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda065;
ALTER SCHEMA dda065 OWNER TO dda065;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda065;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda065;
ALTER TABLE movies.certification OWNER TO dda065;
ALTER TABLE movies.directs OWNER TO dda065;
ALTER TABLE movies.genre OWNER TO dda065;
ALTER TABLE movies.language OWNER TO dda065;
ALTER TABLE movies.movie OWNER TO dda065;
ALTER TABLE movies.person OWNER TO dda065;
ALTER TABLE movies.runtime OWNER TO dda065;
ALTER TABLE movies.writes OWNER TO dda065;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda065;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda065;
ALTER TABLE srs.education OWNER TO dda065;
ALTER TABLE srs.courses OWNER TO dda065;

--- Database for user dda066

CREATE DATABASE dda066 WITH OWNER dda066;

\c dda066
GRANT ALL PRIVILEGES ON DATABASE dda066 TO dda066;
REVOKE ALL PRIVILEGES ON DATABASE dda066 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda066;
ALTER SCHEMA dda066 OWNER TO dda066;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda066;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda066;
ALTER TABLE movies.certification OWNER TO dda066;
ALTER TABLE movies.directs OWNER TO dda066;
ALTER TABLE movies.genre OWNER TO dda066;
ALTER TABLE movies.language OWNER TO dda066;
ALTER TABLE movies.movie OWNER TO dda066;
ALTER TABLE movies.person OWNER TO dda066;
ALTER TABLE movies.runtime OWNER TO dda066;
ALTER TABLE movies.writes OWNER TO dda066;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda066;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda066;
ALTER TABLE srs.education OWNER TO dda066;
ALTER TABLE srs.courses OWNER TO dda066;

--- Database for user dda067

CREATE DATABASE dda067 WITH OWNER dda067;

\c dda067
GRANT ALL PRIVILEGES ON DATABASE dda067 TO dda067;
REVOKE ALL PRIVILEGES ON DATABASE dda067 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda067;
ALTER SCHEMA dda067 OWNER TO dda067;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda067;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda067;
ALTER TABLE movies.certification OWNER TO dda067;
ALTER TABLE movies.directs OWNER TO dda067;
ALTER TABLE movies.genre OWNER TO dda067;
ALTER TABLE movies.language OWNER TO dda067;
ALTER TABLE movies.movie OWNER TO dda067;
ALTER TABLE movies.person OWNER TO dda067;
ALTER TABLE movies.runtime OWNER TO dda067;
ALTER TABLE movies.writes OWNER TO dda067;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda067;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda067;
ALTER TABLE srs.education OWNER TO dda067;
ALTER TABLE srs.courses OWNER TO dda067;

--- Database for user dda068

CREATE DATABASE dda068 WITH OWNER dda068;

\c dda068
GRANT ALL PRIVILEGES ON DATABASE dda068 TO dda068;
REVOKE ALL PRIVILEGES ON DATABASE dda068 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda068;
ALTER SCHEMA dda068 OWNER TO dda068;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda068;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda068;
ALTER TABLE movies.certification OWNER TO dda068;
ALTER TABLE movies.directs OWNER TO dda068;
ALTER TABLE movies.genre OWNER TO dda068;
ALTER TABLE movies.language OWNER TO dda068;
ALTER TABLE movies.movie OWNER TO dda068;
ALTER TABLE movies.person OWNER TO dda068;
ALTER TABLE movies.runtime OWNER TO dda068;
ALTER TABLE movies.writes OWNER TO dda068;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda068;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda068;
ALTER TABLE srs.education OWNER TO dda068;
ALTER TABLE srs.courses OWNER TO dda068;

--- Database for user dda069

CREATE DATABASE dda069 WITH OWNER dda069;

\c dda069
GRANT ALL PRIVILEGES ON DATABASE dda069 TO dda069;
REVOKE ALL PRIVILEGES ON DATABASE dda069 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda069;
ALTER SCHEMA dda069 OWNER TO dda069;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda069;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda069;
ALTER TABLE movies.certification OWNER TO dda069;
ALTER TABLE movies.directs OWNER TO dda069;
ALTER TABLE movies.genre OWNER TO dda069;
ALTER TABLE movies.language OWNER TO dda069;
ALTER TABLE movies.movie OWNER TO dda069;
ALTER TABLE movies.person OWNER TO dda069;
ALTER TABLE movies.runtime OWNER TO dda069;
ALTER TABLE movies.writes OWNER TO dda069;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda069;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda069;
ALTER TABLE srs.education OWNER TO dda069;
ALTER TABLE srs.courses OWNER TO dda069;

--- Database for user dda070

CREATE DATABASE dda070 WITH OWNER dda070;

\c dda070
GRANT ALL PRIVILEGES ON DATABASE dda070 TO dda070;
REVOKE ALL PRIVILEGES ON DATABASE dda070 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda070;
ALTER SCHEMA dda070 OWNER TO dda070;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda070;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda070;
ALTER TABLE movies.certification OWNER TO dda070;
ALTER TABLE movies.directs OWNER TO dda070;
ALTER TABLE movies.genre OWNER TO dda070;
ALTER TABLE movies.language OWNER TO dda070;
ALTER TABLE movies.movie OWNER TO dda070;
ALTER TABLE movies.person OWNER TO dda070;
ALTER TABLE movies.runtime OWNER TO dda070;
ALTER TABLE movies.writes OWNER TO dda070;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda070;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda070;
ALTER TABLE srs.education OWNER TO dda070;
ALTER TABLE srs.courses OWNER TO dda070;

--- Database for user dda071

CREATE DATABASE dda071 WITH OWNER dda071;

\c dda071
GRANT ALL PRIVILEGES ON DATABASE dda071 TO dda071;
REVOKE ALL PRIVILEGES ON DATABASE dda071 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda071;
ALTER SCHEMA dda071 OWNER TO dda071;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda071;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda071;
ALTER TABLE movies.certification OWNER TO dda071;
ALTER TABLE movies.directs OWNER TO dda071;
ALTER TABLE movies.genre OWNER TO dda071;
ALTER TABLE movies.language OWNER TO dda071;
ALTER TABLE movies.movie OWNER TO dda071;
ALTER TABLE movies.person OWNER TO dda071;
ALTER TABLE movies.runtime OWNER TO dda071;
ALTER TABLE movies.writes OWNER TO dda071;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda071;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda071;
ALTER TABLE srs.education OWNER TO dda071;
ALTER TABLE srs.courses OWNER TO dda071;

--- Database for user dda072

CREATE DATABASE dda072 WITH OWNER dda072;

\c dda072
GRANT ALL PRIVILEGES ON DATABASE dda072 TO dda072;
REVOKE ALL PRIVILEGES ON DATABASE dda072 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda072;
ALTER SCHEMA dda072 OWNER TO dda072;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda072;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda072;
ALTER TABLE movies.certification OWNER TO dda072;
ALTER TABLE movies.directs OWNER TO dda072;
ALTER TABLE movies.genre OWNER TO dda072;
ALTER TABLE movies.language OWNER TO dda072;
ALTER TABLE movies.movie OWNER TO dda072;
ALTER TABLE movies.person OWNER TO dda072;
ALTER TABLE movies.runtime OWNER TO dda072;
ALTER TABLE movies.writes OWNER TO dda072;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda072;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda072;
ALTER TABLE srs.education OWNER TO dda072;
ALTER TABLE srs.courses OWNER TO dda072;

--- Database for user dda073

CREATE DATABASE dda073 WITH OWNER dda073;

\c dda073
GRANT ALL PRIVILEGES ON DATABASE dda073 TO dda073;
REVOKE ALL PRIVILEGES ON DATABASE dda073 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda073;
ALTER SCHEMA dda073 OWNER TO dda073;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda073;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda073;
ALTER TABLE movies.certification OWNER TO dda073;
ALTER TABLE movies.directs OWNER TO dda073;
ALTER TABLE movies.genre OWNER TO dda073;
ALTER TABLE movies.language OWNER TO dda073;
ALTER TABLE movies.movie OWNER TO dda073;
ALTER TABLE movies.person OWNER TO dda073;
ALTER TABLE movies.runtime OWNER TO dda073;
ALTER TABLE movies.writes OWNER TO dda073;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda073;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda073;
ALTER TABLE srs.education OWNER TO dda073;
ALTER TABLE srs.courses OWNER TO dda073;

--- Database for user dda074

CREATE DATABASE dda074 WITH OWNER dda074;

\c dda074
GRANT ALL PRIVILEGES ON DATABASE dda074 TO dda074;
REVOKE ALL PRIVILEGES ON DATABASE dda074 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda074;
ALTER SCHEMA dda074 OWNER TO dda074;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda074;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda074;
ALTER TABLE movies.certification OWNER TO dda074;
ALTER TABLE movies.directs OWNER TO dda074;
ALTER TABLE movies.genre OWNER TO dda074;
ALTER TABLE movies.language OWNER TO dda074;
ALTER TABLE movies.movie OWNER TO dda074;
ALTER TABLE movies.person OWNER TO dda074;
ALTER TABLE movies.runtime OWNER TO dda074;
ALTER TABLE movies.writes OWNER TO dda074;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda074;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda074;
ALTER TABLE srs.education OWNER TO dda074;
ALTER TABLE srs.courses OWNER TO dda074;

--- Database for user dda075

CREATE DATABASE dda075 WITH OWNER dda075;

\c dda075
GRANT ALL PRIVILEGES ON DATABASE dda075 TO dda075;
REVOKE ALL PRIVILEGES ON DATABASE dda075 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda075;
ALTER SCHEMA dda075 OWNER TO dda075;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda075;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda075;
ALTER TABLE movies.certification OWNER TO dda075;
ALTER TABLE movies.directs OWNER TO dda075;
ALTER TABLE movies.genre OWNER TO dda075;
ALTER TABLE movies.language OWNER TO dda075;
ALTER TABLE movies.movie OWNER TO dda075;
ALTER TABLE movies.person OWNER TO dda075;
ALTER TABLE movies.runtime OWNER TO dda075;
ALTER TABLE movies.writes OWNER TO dda075;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda075;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda075;
ALTER TABLE srs.education OWNER TO dda075;
ALTER TABLE srs.courses OWNER TO dda075;

--- Database for user dda076

CREATE DATABASE dda076 WITH OWNER dda076;

\c dda076
GRANT ALL PRIVILEGES ON DATABASE dda076 TO dda076;
REVOKE ALL PRIVILEGES ON DATABASE dda076 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda076;
ALTER SCHEMA dda076 OWNER TO dda076;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda076;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda076;
ALTER TABLE movies.certification OWNER TO dda076;
ALTER TABLE movies.directs OWNER TO dda076;
ALTER TABLE movies.genre OWNER TO dda076;
ALTER TABLE movies.language OWNER TO dda076;
ALTER TABLE movies.movie OWNER TO dda076;
ALTER TABLE movies.person OWNER TO dda076;
ALTER TABLE movies.runtime OWNER TO dda076;
ALTER TABLE movies.writes OWNER TO dda076;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda076;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda076;
ALTER TABLE srs.education OWNER TO dda076;
ALTER TABLE srs.courses OWNER TO dda076;

--- Database for user dda077

CREATE DATABASE dda077 WITH OWNER dda077;

\c dda077
GRANT ALL PRIVILEGES ON DATABASE dda077 TO dda077;
REVOKE ALL PRIVILEGES ON DATABASE dda077 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda077;
ALTER SCHEMA dda077 OWNER TO dda077;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda077;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda077;
ALTER TABLE movies.certification OWNER TO dda077;
ALTER TABLE movies.directs OWNER TO dda077;
ALTER TABLE movies.genre OWNER TO dda077;
ALTER TABLE movies.language OWNER TO dda077;
ALTER TABLE movies.movie OWNER TO dda077;
ALTER TABLE movies.person OWNER TO dda077;
ALTER TABLE movies.runtime OWNER TO dda077;
ALTER TABLE movies.writes OWNER TO dda077;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda077;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda077;
ALTER TABLE srs.education OWNER TO dda077;
ALTER TABLE srs.courses OWNER TO dda077;

--- Database for user dda078

CREATE DATABASE dda078 WITH OWNER dda078;

\c dda078
GRANT ALL PRIVILEGES ON DATABASE dda078 TO dda078;
REVOKE ALL PRIVILEGES ON DATABASE dda078 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda078;
ALTER SCHEMA dda078 OWNER TO dda078;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda078;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda078;
ALTER TABLE movies.certification OWNER TO dda078;
ALTER TABLE movies.directs OWNER TO dda078;
ALTER TABLE movies.genre OWNER TO dda078;
ALTER TABLE movies.language OWNER TO dda078;
ALTER TABLE movies.movie OWNER TO dda078;
ALTER TABLE movies.person OWNER TO dda078;
ALTER TABLE movies.runtime OWNER TO dda078;
ALTER TABLE movies.writes OWNER TO dda078;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda078;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda078;
ALTER TABLE srs.education OWNER TO dda078;
ALTER TABLE srs.courses OWNER TO dda078;

--- Database for user dda079

CREATE DATABASE dda079 WITH OWNER dda079;

\c dda079
GRANT ALL PRIVILEGES ON DATABASE dda079 TO dda079;
REVOKE ALL PRIVILEGES ON DATABASE dda079 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda079;
ALTER SCHEMA dda079 OWNER TO dda079;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda079;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda079;
ALTER TABLE movies.certification OWNER TO dda079;
ALTER TABLE movies.directs OWNER TO dda079;
ALTER TABLE movies.genre OWNER TO dda079;
ALTER TABLE movies.language OWNER TO dda079;
ALTER TABLE movies.movie OWNER TO dda079;
ALTER TABLE movies.person OWNER TO dda079;
ALTER TABLE movies.runtime OWNER TO dda079;
ALTER TABLE movies.writes OWNER TO dda079;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda079;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda079;
ALTER TABLE srs.education OWNER TO dda079;
ALTER TABLE srs.courses OWNER TO dda079;

--- Database for user dda080

CREATE DATABASE dda080 WITH OWNER dda080;

\c dda080
GRANT ALL PRIVILEGES ON DATABASE dda080 TO dda080;
REVOKE ALL PRIVILEGES ON DATABASE dda080 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda080;
ALTER SCHEMA dda080 OWNER TO dda080;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda080;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda080;
ALTER TABLE movies.certification OWNER TO dda080;
ALTER TABLE movies.directs OWNER TO dda080;
ALTER TABLE movies.genre OWNER TO dda080;
ALTER TABLE movies.language OWNER TO dda080;
ALTER TABLE movies.movie OWNER TO dda080;
ALTER TABLE movies.person OWNER TO dda080;
ALTER TABLE movies.runtime OWNER TO dda080;
ALTER TABLE movies.writes OWNER TO dda080;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda080;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda080;
ALTER TABLE srs.education OWNER TO dda080;
ALTER TABLE srs.courses OWNER TO dda080;

--- Database for user dda081

CREATE DATABASE dda081 WITH OWNER dda081;

\c dda081
GRANT ALL PRIVILEGES ON DATABASE dda081 TO dda081;
REVOKE ALL PRIVILEGES ON DATABASE dda081 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda081;
ALTER SCHEMA dda081 OWNER TO dda081;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda081;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda081;
ALTER TABLE movies.certification OWNER TO dda081;
ALTER TABLE movies.directs OWNER TO dda081;
ALTER TABLE movies.genre OWNER TO dda081;
ALTER TABLE movies.language OWNER TO dda081;
ALTER TABLE movies.movie OWNER TO dda081;
ALTER TABLE movies.person OWNER TO dda081;
ALTER TABLE movies.runtime OWNER TO dda081;
ALTER TABLE movies.writes OWNER TO dda081;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda081;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda081;
ALTER TABLE srs.education OWNER TO dda081;
ALTER TABLE srs.courses OWNER TO dda081;

--- Database for user dda082

CREATE DATABASE dda082 WITH OWNER dda082;

\c dda082
GRANT ALL PRIVILEGES ON DATABASE dda082 TO dda082;
REVOKE ALL PRIVILEGES ON DATABASE dda082 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda082;
ALTER SCHEMA dda082 OWNER TO dda082;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda082;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda082;
ALTER TABLE movies.certification OWNER TO dda082;
ALTER TABLE movies.directs OWNER TO dda082;
ALTER TABLE movies.genre OWNER TO dda082;
ALTER TABLE movies.language OWNER TO dda082;
ALTER TABLE movies.movie OWNER TO dda082;
ALTER TABLE movies.person OWNER TO dda082;
ALTER TABLE movies.runtime OWNER TO dda082;
ALTER TABLE movies.writes OWNER TO dda082;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda082;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda082;
ALTER TABLE srs.education OWNER TO dda082;
ALTER TABLE srs.courses OWNER TO dda082;

--- Database for user dda083

CREATE DATABASE dda083 WITH OWNER dda083;

\c dda083
GRANT ALL PRIVILEGES ON DATABASE dda083 TO dda083;
REVOKE ALL PRIVILEGES ON DATABASE dda083 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda083;
ALTER SCHEMA dda083 OWNER TO dda083;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda083;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda083;
ALTER TABLE movies.certification OWNER TO dda083;
ALTER TABLE movies.directs OWNER TO dda083;
ALTER TABLE movies.genre OWNER TO dda083;
ALTER TABLE movies.language OWNER TO dda083;
ALTER TABLE movies.movie OWNER TO dda083;
ALTER TABLE movies.person OWNER TO dda083;
ALTER TABLE movies.runtime OWNER TO dda083;
ALTER TABLE movies.writes OWNER TO dda083;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda083;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda083;
ALTER TABLE srs.education OWNER TO dda083;
ALTER TABLE srs.courses OWNER TO dda083;

--- Database for user dda084

CREATE DATABASE dda084 WITH OWNER dda084;

\c dda084
GRANT ALL PRIVILEGES ON DATABASE dda084 TO dda084;
REVOKE ALL PRIVILEGES ON DATABASE dda084 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda084;
ALTER SCHEMA dda084 OWNER TO dda084;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda084;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda084;
ALTER TABLE movies.certification OWNER TO dda084;
ALTER TABLE movies.directs OWNER TO dda084;
ALTER TABLE movies.genre OWNER TO dda084;
ALTER TABLE movies.language OWNER TO dda084;
ALTER TABLE movies.movie OWNER TO dda084;
ALTER TABLE movies.person OWNER TO dda084;
ALTER TABLE movies.runtime OWNER TO dda084;
ALTER TABLE movies.writes OWNER TO dda084;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda084;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda084;
ALTER TABLE srs.education OWNER TO dda084;
ALTER TABLE srs.courses OWNER TO dda084;

--- Database for user dda085

CREATE DATABASE dda085 WITH OWNER dda085;

\c dda085
GRANT ALL PRIVILEGES ON DATABASE dda085 TO dda085;
REVOKE ALL PRIVILEGES ON DATABASE dda085 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda085;
ALTER SCHEMA dda085 OWNER TO dda085;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda085;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda085;
ALTER TABLE movies.certification OWNER TO dda085;
ALTER TABLE movies.directs OWNER TO dda085;
ALTER TABLE movies.genre OWNER TO dda085;
ALTER TABLE movies.language OWNER TO dda085;
ALTER TABLE movies.movie OWNER TO dda085;
ALTER TABLE movies.person OWNER TO dda085;
ALTER TABLE movies.runtime OWNER TO dda085;
ALTER TABLE movies.writes OWNER TO dda085;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda085;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda085;
ALTER TABLE srs.education OWNER TO dda085;
ALTER TABLE srs.courses OWNER TO dda085;

--- Database for user dda086

CREATE DATABASE dda086 WITH OWNER dda086;

\c dda086
GRANT ALL PRIVILEGES ON DATABASE dda086 TO dda086;
REVOKE ALL PRIVILEGES ON DATABASE dda086 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda086;
ALTER SCHEMA dda086 OWNER TO dda086;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda086;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda086;
ALTER TABLE movies.certification OWNER TO dda086;
ALTER TABLE movies.directs OWNER TO dda086;
ALTER TABLE movies.genre OWNER TO dda086;
ALTER TABLE movies.language OWNER TO dda086;
ALTER TABLE movies.movie OWNER TO dda086;
ALTER TABLE movies.person OWNER TO dda086;
ALTER TABLE movies.runtime OWNER TO dda086;
ALTER TABLE movies.writes OWNER TO dda086;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda086;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda086;
ALTER TABLE srs.education OWNER TO dda086;
ALTER TABLE srs.courses OWNER TO dda086;

--- Database for user dda087

CREATE DATABASE dda087 WITH OWNER dda087;

\c dda087
GRANT ALL PRIVILEGES ON DATABASE dda087 TO dda087;
REVOKE ALL PRIVILEGES ON DATABASE dda087 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda087;
ALTER SCHEMA dda087 OWNER TO dda087;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda087;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda087;
ALTER TABLE movies.certification OWNER TO dda087;
ALTER TABLE movies.directs OWNER TO dda087;
ALTER TABLE movies.genre OWNER TO dda087;
ALTER TABLE movies.language OWNER TO dda087;
ALTER TABLE movies.movie OWNER TO dda087;
ALTER TABLE movies.person OWNER TO dda087;
ALTER TABLE movies.runtime OWNER TO dda087;
ALTER TABLE movies.writes OWNER TO dda087;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda087;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda087;
ALTER TABLE srs.education OWNER TO dda087;
ALTER TABLE srs.courses OWNER TO dda087;

--- Database for user dda088

CREATE DATABASE dda088 WITH OWNER dda088;

\c dda088
GRANT ALL PRIVILEGES ON DATABASE dda088 TO dda088;
REVOKE ALL PRIVILEGES ON DATABASE dda088 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda088;
ALTER SCHEMA dda088 OWNER TO dda088;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda088;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda088;
ALTER TABLE movies.certification OWNER TO dda088;
ALTER TABLE movies.directs OWNER TO dda088;
ALTER TABLE movies.genre OWNER TO dda088;
ALTER TABLE movies.language OWNER TO dda088;
ALTER TABLE movies.movie OWNER TO dda088;
ALTER TABLE movies.person OWNER TO dda088;
ALTER TABLE movies.runtime OWNER TO dda088;
ALTER TABLE movies.writes OWNER TO dda088;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda088;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda088;
ALTER TABLE srs.education OWNER TO dda088;
ALTER TABLE srs.courses OWNER TO dda088;

--- Database for user dda089

CREATE DATABASE dda089 WITH OWNER dda089;

\c dda089
GRANT ALL PRIVILEGES ON DATABASE dda089 TO dda089;
REVOKE ALL PRIVILEGES ON DATABASE dda089 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda089;
ALTER SCHEMA dda089 OWNER TO dda089;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda089;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda089;
ALTER TABLE movies.certification OWNER TO dda089;
ALTER TABLE movies.directs OWNER TO dda089;
ALTER TABLE movies.genre OWNER TO dda089;
ALTER TABLE movies.language OWNER TO dda089;
ALTER TABLE movies.movie OWNER TO dda089;
ALTER TABLE movies.person OWNER TO dda089;
ALTER TABLE movies.runtime OWNER TO dda089;
ALTER TABLE movies.writes OWNER TO dda089;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda089;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda089;
ALTER TABLE srs.education OWNER TO dda089;
ALTER TABLE srs.courses OWNER TO dda089;

--- Database for user dda090

CREATE DATABASE dda090 WITH OWNER dda090;

\c dda090
GRANT ALL PRIVILEGES ON DATABASE dda090 TO dda090;
REVOKE ALL PRIVILEGES ON DATABASE dda090 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda090;
ALTER SCHEMA dda090 OWNER TO dda090;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda090;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda090;
ALTER TABLE movies.certification OWNER TO dda090;
ALTER TABLE movies.directs OWNER TO dda090;
ALTER TABLE movies.genre OWNER TO dda090;
ALTER TABLE movies.language OWNER TO dda090;
ALTER TABLE movies.movie OWNER TO dda090;
ALTER TABLE movies.person OWNER TO dda090;
ALTER TABLE movies.runtime OWNER TO dda090;
ALTER TABLE movies.writes OWNER TO dda090;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda090;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda090;
ALTER TABLE srs.education OWNER TO dda090;
ALTER TABLE srs.courses OWNER TO dda090;

--- Database for user dda091

CREATE DATABASE dda091 WITH OWNER dda091;

\c dda091
GRANT ALL PRIVILEGES ON DATABASE dda091 TO dda091;
REVOKE ALL PRIVILEGES ON DATABASE dda091 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda091;
ALTER SCHEMA dda091 OWNER TO dda091;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda091;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda091;
ALTER TABLE movies.certification OWNER TO dda091;
ALTER TABLE movies.directs OWNER TO dda091;
ALTER TABLE movies.genre OWNER TO dda091;
ALTER TABLE movies.language OWNER TO dda091;
ALTER TABLE movies.movie OWNER TO dda091;
ALTER TABLE movies.person OWNER TO dda091;
ALTER TABLE movies.runtime OWNER TO dda091;
ALTER TABLE movies.writes OWNER TO dda091;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda091;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda091;
ALTER TABLE srs.education OWNER TO dda091;
ALTER TABLE srs.courses OWNER TO dda091;

--- Database for user dda092

CREATE DATABASE dda092 WITH OWNER dda092;

\c dda092
GRANT ALL PRIVILEGES ON DATABASE dda092 TO dda092;
REVOKE ALL PRIVILEGES ON DATABASE dda092 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda092;
ALTER SCHEMA dda092 OWNER TO dda092;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda092;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda092;
ALTER TABLE movies.certification OWNER TO dda092;
ALTER TABLE movies.directs OWNER TO dda092;
ALTER TABLE movies.genre OWNER TO dda092;
ALTER TABLE movies.language OWNER TO dda092;
ALTER TABLE movies.movie OWNER TO dda092;
ALTER TABLE movies.person OWNER TO dda092;
ALTER TABLE movies.runtime OWNER TO dda092;
ALTER TABLE movies.writes OWNER TO dda092;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda092;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda092;
ALTER TABLE srs.education OWNER TO dda092;
ALTER TABLE srs.courses OWNER TO dda092;

--- Database for user dda093

CREATE DATABASE dda093 WITH OWNER dda093;

\c dda093
GRANT ALL PRIVILEGES ON DATABASE dda093 TO dda093;
REVOKE ALL PRIVILEGES ON DATABASE dda093 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda093;
ALTER SCHEMA dda093 OWNER TO dda093;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda093;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda093;
ALTER TABLE movies.certification OWNER TO dda093;
ALTER TABLE movies.directs OWNER TO dda093;
ALTER TABLE movies.genre OWNER TO dda093;
ALTER TABLE movies.language OWNER TO dda093;
ALTER TABLE movies.movie OWNER TO dda093;
ALTER TABLE movies.person OWNER TO dda093;
ALTER TABLE movies.runtime OWNER TO dda093;
ALTER TABLE movies.writes OWNER TO dda093;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda093;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda093;
ALTER TABLE srs.education OWNER TO dda093;
ALTER TABLE srs.courses OWNER TO dda093;

--- Database for user dda094

CREATE DATABASE dda094 WITH OWNER dda094;

\c dda094
GRANT ALL PRIVILEGES ON DATABASE dda094 TO dda094;
REVOKE ALL PRIVILEGES ON DATABASE dda094 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda094;
ALTER SCHEMA dda094 OWNER TO dda094;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda094;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda094;
ALTER TABLE movies.certification OWNER TO dda094;
ALTER TABLE movies.directs OWNER TO dda094;
ALTER TABLE movies.genre OWNER TO dda094;
ALTER TABLE movies.language OWNER TO dda094;
ALTER TABLE movies.movie OWNER TO dda094;
ALTER TABLE movies.person OWNER TO dda094;
ALTER TABLE movies.runtime OWNER TO dda094;
ALTER TABLE movies.writes OWNER TO dda094;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda094;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda094;
ALTER TABLE srs.education OWNER TO dda094;
ALTER TABLE srs.courses OWNER TO dda094;

--- Database for user dda095

CREATE DATABASE dda095 WITH OWNER dda095;

\c dda095
GRANT ALL PRIVILEGES ON DATABASE dda095 TO dda095;
REVOKE ALL PRIVILEGES ON DATABASE dda095 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda095;
ALTER SCHEMA dda095 OWNER TO dda095;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda095;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda095;
ALTER TABLE movies.certification OWNER TO dda095;
ALTER TABLE movies.directs OWNER TO dda095;
ALTER TABLE movies.genre OWNER TO dda095;
ALTER TABLE movies.language OWNER TO dda095;
ALTER TABLE movies.movie OWNER TO dda095;
ALTER TABLE movies.person OWNER TO dda095;
ALTER TABLE movies.runtime OWNER TO dda095;
ALTER TABLE movies.writes OWNER TO dda095;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda095;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda095;
ALTER TABLE srs.education OWNER TO dda095;
ALTER TABLE srs.courses OWNER TO dda095;

--- Database for user dda096

CREATE DATABASE dda096 WITH OWNER dda096;

\c dda096
GRANT ALL PRIVILEGES ON DATABASE dda096 TO dda096;
REVOKE ALL PRIVILEGES ON DATABASE dda096 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda096;
ALTER SCHEMA dda096 OWNER TO dda096;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda096;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda096;
ALTER TABLE movies.certification OWNER TO dda096;
ALTER TABLE movies.directs OWNER TO dda096;
ALTER TABLE movies.genre OWNER TO dda096;
ALTER TABLE movies.language OWNER TO dda096;
ALTER TABLE movies.movie OWNER TO dda096;
ALTER TABLE movies.person OWNER TO dda096;
ALTER TABLE movies.runtime OWNER TO dda096;
ALTER TABLE movies.writes OWNER TO dda096;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda096;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda096;
ALTER TABLE srs.education OWNER TO dda096;
ALTER TABLE srs.courses OWNER TO dda096;

--- Database for user dda097

CREATE DATABASE dda097 WITH OWNER dda097;

\c dda097
GRANT ALL PRIVILEGES ON DATABASE dda097 TO dda097;
REVOKE ALL PRIVILEGES ON DATABASE dda097 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda097;
ALTER SCHEMA dda097 OWNER TO dda097;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda097;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda097;
ALTER TABLE movies.certification OWNER TO dda097;
ALTER TABLE movies.directs OWNER TO dda097;
ALTER TABLE movies.genre OWNER TO dda097;
ALTER TABLE movies.language OWNER TO dda097;
ALTER TABLE movies.movie OWNER TO dda097;
ALTER TABLE movies.person OWNER TO dda097;
ALTER TABLE movies.runtime OWNER TO dda097;
ALTER TABLE movies.writes OWNER TO dda097;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda097;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda097;
ALTER TABLE srs.education OWNER TO dda097;
ALTER TABLE srs.courses OWNER TO dda097;

--- Database for user dda098

CREATE DATABASE dda098 WITH OWNER dda098;

\c dda098
GRANT ALL PRIVILEGES ON DATABASE dda098 TO dda098;
REVOKE ALL PRIVILEGES ON DATABASE dda098 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda098;
ALTER SCHEMA dda098 OWNER TO dda098;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda098;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda098;
ALTER TABLE movies.certification OWNER TO dda098;
ALTER TABLE movies.directs OWNER TO dda098;
ALTER TABLE movies.genre OWNER TO dda098;
ALTER TABLE movies.language OWNER TO dda098;
ALTER TABLE movies.movie OWNER TO dda098;
ALTER TABLE movies.person OWNER TO dda098;
ALTER TABLE movies.runtime OWNER TO dda098;
ALTER TABLE movies.writes OWNER TO dda098;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda098;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda098;
ALTER TABLE srs.education OWNER TO dda098;
ALTER TABLE srs.courses OWNER TO dda098;

--- Database for user dda099

CREATE DATABASE dda099 WITH OWNER dda099;

\c dda099
GRANT ALL PRIVILEGES ON DATABASE dda099 TO dda099;
REVOKE ALL PRIVILEGES ON DATABASE dda099 FROM public;
DROP SCHEMA public;

CREATE SCHEMA dda099;
ALTER SCHEMA dda099 OWNER TO dda099;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO dda099;

SET search_path TO movies;
\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO dda099;
ALTER TABLE movies.certification OWNER TO dda099;
ALTER TABLE movies.directs OWNER TO dda099;
ALTER TABLE movies.genre OWNER TO dda099;
ALTER TABLE movies.language OWNER TO dda099;
ALTER TABLE movies.movie OWNER TO dda099;
ALTER TABLE movies.person OWNER TO dda099;
ALTER TABLE movies.runtime OWNER TO dda099;
ALTER TABLE movies.writes OWNER TO dda099;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO dda099;

SET search_path TO srs;
\i srs-dump-1617.sql
ALTER TABLE srs.grades OWNER TO dda099;
ALTER TABLE srs.education OWNER TO dda099;
ALTER TABLE srs.courses OWNER TO dda099;

