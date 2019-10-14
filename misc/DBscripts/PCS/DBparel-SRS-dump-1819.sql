--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

-- SET search_path = srs, pg_catalog;

-- ALTER TABLE ONLY srs.courses DROP CONSTRAINT courses_pkey;
-- ALTER TABLE ONLY srs.education DROP CONSTRAINT education_pkey;
-- ALTER TABLE ONLY srs.grades DROP CONSTRAINT grades_pkey;
-- DROP TABLE srs.courses;
-- DROP TABLE srs.education;
-- DROP TABLE srs.grades;
-- DROP SCHEMA srs;
--
-- Name: srs; Type: SCHEMA; Schema: -; Owner: db00
--

-- CREATE SCHEMA srs;

SET search_path = srs, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: grades; Type: TABLE; Schema: srs; Owner: db00; Tablespace: 
--

CREATE TABLE grades (
    student_id integer NOT NULL,
    student character varying,
    course_code integer NOT NULL,
    course character varying,
    grade integer,
    year integer NOT NULL,
    quarter integer NOT NULL
);


--
-- Name: education; Type: TABLE; Schema: srs; Owner: db00; Tablespace: 
--

CREATE TABLE education (
    course_code integer NOT NULL,
    course character varying,
    study character(3),
    teacher_id integer,
    teacher character varying,
    year integer NOT NULL,
    quarter integer NOT NULL
);


--
-- Name: courses; Type: TABLE; Schema: srs; Owner: db00; Tablespace: 
--

CREATE TABLE courses (
    course_code integer NOT NULL,
    description character varying,
    course character varying
);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: srs; Owner: db00
--

COPY grades (student_id, student, course_code, course, grade, year, quarter) FROM stdin;
1019515	HUISINGA Z	121004	Practicum elektronische functies	5	2003	4
1019819	WILKENS I	151044	Analyse C	5	2003	3
1019819	WILKENS I	237201	Oriëntatie ICT	5	2003	4
1022489	OOMCKENS F Q	121018	Stage	6	2003	3
1010191	TUSVELD M W	150526	Wiskundig modelleren I	5	2003	3
1038347	WAERBEKE C Z	125160	Mobiele communicatie	1	2003	3
1042262	EBBENS X N	121004	Practicum elektronische functies	9	2003	3
1010191	TUSVELD M W	150532	Maple practicum	4	2003	4
1041376	LUDEMAN U	239801	BIT-BV 2	8	2003	4
1042629	BOLDERING A	121004	Practicum elektronische functies	7	2003	4
1042386	GERRITS Y I	239801	BIT-BV 2	5	2003	2
1046870	SCHOUTEN F	232050	Electronic Commerce	4	2002	4
1010191	TUSVELD M W	150600	Mathematical methods	6	2003	3
1049479	PRINZEN I E	121004	Practicum elektronische functies	5	2003	3
1010191	TUSVELD M W	151033	Numerieke analyse	6	2003	3
1049824	RANNINK C	121018	Stage	8	2003	3
1052369	OOMKENS J O	239800	BIT-BV 1	5	2003	4
1053188	ALINCK I	121004	Practicum elektronische functies	9	2003	3
1010191	TUSVELD M W	151039	Algebra	4	2003	4
1057321	BARUCH I K	214012	Systeemvalidatie	9	2003	3
1010191	TUSVELD M W	151044	Analyse C	6	2003	3
1010191	TUSVELD M W	151082	Wiskunde II	5	2003	4
1068828	BEEKE L F	211129	Taaltechnologie	3	2003	4
1077961	DE JONG H A	156014	Analyse B	5	2003	4
1010191	TUSVELD M W	151092	Modelvorming II	7	2003	2
1010191	TUSVELD M W	151150	Wiskunde IV	8	2003	3
1080294	JANSDR C	153003	Kansrekening	7	2003	3
1081047	MEIJER N W	151070	Kwantitatieve methoden	9	2004	3
1010191	TUSVELD M W	151210	Wiskunde A	7	2003	4
1082226	OVERMAN Q P	213125	Computersystemen	4	2003	4
1010191	TUSVELD M W	151600	Modelleren en redeneren	7	2003	4
1010191	TUSVELD M W	152025	Complexe functietheorie	9	2003	3
1088682	BLOKKER K E	121004	Practicum elektronische functies	6	2003	3
1097865	HAEN D	121018	Stage	4	2003	1
1010191	TUSVELD M W	152027	Calculus II	8	2003	3
1010191	TUSVELD M W	153006	Kansrekening	6	2003	3
1010191	TUSVELD M W	153008	Kansrekening en statistiek	4	2003	3
1010191	TUSVELD M W	153038	Wiskundige statistiek	6	2003	4
1010191	TUSVELD M W	153081	Stochastische modellen v. telecommunicatie syst.	4	2003	2
1010191	TUSVELD M W	153088	Stochastische modellen voor Operations Management	9	2003	3
1010191	TUSVELD M W	153120	Statistiek	7	2003	4
1010191	TUSVELD M W	154021	Numerieke wiskunde en programmeermethoden	8	2003	3
1010191	TUSVELD M W	155009	Fundamenten van de methode der eindige elementen	9	2003	3
1010191	TUSVELD M W	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	2	2003	3
1010191	TUSVELD M W	155019	Practicum softwarepakketten PDV	8	2003	3
1010191	TUSVELD M W	156014	Analyse B	8	2003	4
1010191	TUSVELD M W	156062	Systeem- en besturingstheorie	9	2003	4
1010191	TUSVELD M W	211026	Theoretische informatica	7	2003	3
1010191	TUSVELD M W	211035	Vertalerbouw	9	2003	4
1010191	TUSVELD M W	211077	Database-ontwerp	9	2003	4
1010191	TUSVELD M W	211095	Gedistribueerde databases & middleware technologie	7	2003	4
1010191	TUSVELD M W	211096	XML & Databases	7	2003	1
1010191	TUSVELD M W	211098	Databasetransacties en -processen	6	2003	3
1010191	TUSVELD M W	213014	Procesbesturing en robotica	9	2003	3
1010191	TUSVELD M W	213120	Inleiding informatie- en communicatietechnologie	7	2003	2
1010191	TUSVELD M W	214030	Artificial Intelligence	5	2003	4
1010191	TUSVELD M W	214030	Artificial Intelligence	3	2002	1
1010191	TUSVELD M W	214511	Database Project	9	2003	3
1010191	TUSVELD M W	232020	Data warehousing & data mining	5	2002	3
1010191	TUSVELD M W	232081	Requirements Engineering	9	2003	4
1010191	TUSVELD M W	233035	Practicum Databases in Informatiesystemen	7	2002	1
1010191	TUSVELD M W	234010	Invoering van IT in organisaties	7	2002	4
1010191	TUSVELD M W	234026	Voortgezette informatiesysteemmodellering	9	2003	4
1010191	TUSVELD M W	239981	Integratieproject	5	2000	4
1010191	TUSVELD M W	239981	Integratieproject	8	2001	3
1010191	TUSVELD M W	239981	Integratieproject	6	2000	1
1011856	ZYTZES F D	234001	Productie-informatietechnologie	5	2003	3
1011856	ZYTZES F D	234007	Systemen voor cooperatief werk	8	2003	4
1011856	ZYTZES F D	237201	Oriëntatie ICT	8	2003	4
1011856	ZYTZES F D	239981	Integratieproject	5	2000	4
1011856	ZYTZES F D	239981	Integratieproject	5	2003	2
1011856	ZYTZES F D	262020	Bijzondere onderwerpen Telematica	9	2003	1
1011856	ZYTZES F D	265310	Internet management architecturen	7	2003	3
1011856	ZYTZES F D	269100	P-project TEL	8	2003	2
1011889	GREMMERT E Z	233035	Practicum Databases in Informatiesystemen	9	2003	4
1011889	GREMMERT E Z	235005	Inleiding bedrijfsinformatiesystemen	5	2003	3
1011889	GREMMERT E Z	236050	E-health Strategies	1	2003	4
1011889	GREMMERT E Z	237201	Oriëntatie ICT	8	2002	2
1011889	GREMMERT E Z	239805	BIT-BV	3	2003	4
1011889	GREMMERT E Z	239981	Integratieproject	8	1999	3
1011889	GREMMERT E Z	239981	Integratieproject	7	2002	3
1011889	GREMMERT E Z	239981	Integratieproject	9	2003	3
1011889	GREMMERT E Z	239981	Integratieproject	4	1999	1
1011889	GREMMERT E Z	239981	Integratieproject	6	2003	2
1011889	GREMMERT E Z	261000	Telematicasystemen en toepassingen	5	2003	3
1011889	GREMMERT E Z	265201	Middleware for distributed objects	5	2002	4
1011889	GREMMERT E Z	269100	P-project TEL	9	2003	2
1013780	BOS D T	129351	Fysiologie II	5	2003	1
1012192	GIFFEN V	123112	Moderne modulatie- en detectietechnieken	5	2003	4
1012192	GIFFEN V	124151	Mechatronica	4	2003	4
1012192	GIFFEN V	124151	Mechatronica	4	2003	2
1012192	GIFFEN V	124176	Digitale Regeltechniek	9	2003	3
1012192	GIFFEN V	125113	Analoge communicatietechniek	8	2003	4
1012192	GIFFEN V	125118	Practicum informatie-overdracht	8	2003	3
1012192	GIFFEN V	125118	Practicum informatie-overdracht	2	2003	2
1012192	GIFFEN V	125156	Transmissiemedia- en systemen	7	2003	4
1012192	GIFFEN V	150526	Wiskundig modelleren I	5	2003	3
1012192	GIFFEN V	150529	Wiskundig modelleren IV	5	2003	4
1012192	GIFFEN V	150539	Maple practicum	6	2003	4
1012192	GIFFEN V	150600	Mathematical methods	5	2003	3
1012192	GIFFEN V	151005	Calculus II-B	7	2003	3
1012192	GIFFEN V	151015	Numerieke lineaire algebra	2	2003	3
1012192	GIFFEN V	151070	Kwantitatieve methoden	3	2003	1
1012192	GIFFEN V	151073	Calculus III	6	2003	4
1012192	GIFFEN V	151081	Wiskunde I	8	2003	3
1012192	GIFFEN V	151150	Wiskunde IV	4	2003	3
1012192	GIFFEN V	151202	Calculus B	6	2003	3
1012192	GIFFEN V	151210	Wiskunde A	1	2003	1
1012192	GIFFEN V	151540	Computational Methods in Finance	10	2003	4
1012192	GIFFEN V	151570	Financial Engineering	5	2003	3
1012192	GIFFEN V	152027	Calculus II	9	2003	2
1012192	GIFFEN V	152056	Combinatoriek	7	2003	4
1012192	GIFFEN V	152068	Discrete wiskunde	4	2003	3
1012192	GIFFEN V	152070	Meetkunde	6	2003	4
1012192	GIFFEN V	153023	Statistiek II voor TBK	1	2003	3
1012192	GIFFEN V	153026	Asymptotische technieken in de statistiek	4	2003	3
1012192	GIFFEN V	153039	Kansrekening en statistiek	3	2003	3
1012192	GIFFEN V	153080	Stochastische modellen in de operationele research	6	2003	4
1012192	GIFFEN V	153086	Telecommunicatiesystemen	4	2003	1
1012192	GIFFEN V	154023	Numerieke wiskunde en programmeermethoden	3	2003	1
1012192	GIFFEN V	155010	Part. differentiaalverg. uit de math. fysica	6	2003	4
1012192	GIFFEN V	155010	Part. differentiaalverg. uit de math. fysica	5	2003	2
1012192	GIFFEN V	156014	Analyse B	7	2003	4
1012192	GIFFEN V	156057	Inleiding wiskundige systeemtheorie	4	2003	4
1012192	GIFFEN V	156062	Systeem- en besturingstheorie	7	2003	4
1012192	GIFFEN V	157009	Tijdreeksenanalyse en identificatietheorie	4	2003	3
1012192	GIFFEN V	158017	Operationele research I	5	2003	4
1012192	GIFFEN V	158018	Operationele research I, practicum	2	2003	4
1012192	GIFFEN V	158025	Mathematische programmering I	8	2003	3
1012192	GIFFEN V	158038	Discrete optimalisering	7	2003	3
1012192	GIFFEN V	211027	Inleiding programmeren met MATLAB	9	2003	3
1012192	GIFFEN V	211033	Neurale netwerken en neuro-computing	5	2003	3
1012192	GIFFEN V	211109	Voortgezette logica	8	2003	3
1012192	GIFFEN V	211133	Ontwerpen van Software Architecturen	5	2003	1
1012192	GIFFEN V	211205	Functioneel programmeren	7	2003	4
1012192	GIFFEN V	213005	Computerarchitectuur	9	2003	4
1012192	GIFFEN V	213505	Programmeren 2	8	2003	1
1012192	GIFFEN V	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	1
1012192	GIFFEN V	214510	MMI-project	5	2003	3
1012192	GIFFEN V	214510	MMI-project	8	2003	2
1012192	GIFFEN V	219910	Ontwerpproject	9	2003	3
1012192	GIFFEN V	232050	Electronic Commerce	7	2003	4
1012192	GIFFEN V	232085	Voortgezette Requirements Engineering	4	2003	4
1012192	GIFFEN V	233030	Specificeren van informatiesystemen	3	2003	1
1012192	GIFFEN V	234026	Voortgezette informatiesysteemmodellering	8	2003	4
1012192	GIFFEN V	236001	Kwaliteit van de informatievoorziening	3	2003	4
1012192	GIFFEN V	237201	Oriëntatie ICT	4	2002	3
1012192	GIFFEN V	237201	Oriëntatie ICT	6	2002	2
1012192	GIFFEN V	262000	Telematicanetwerken	8	2003	4
1012192	GIFFEN V	264001	Telematics and business strategies	7	2003	4
1012192	GIFFEN V	265201	Middleware for distributed objects	5	2003	3
1012192	GIFFEN V	265201	Middleware for distributed objects	8	2003	2
1012192	GIFFEN V	265300	Operationeel management van telematicasystemen	7	2003	3
1012192	GIFFEN V	269100	P-project TEL	9	2003	2
1013136	FOLKERTS I	121001	Elektronische basisschakelingen	6	2003	2
1013136	FOLKERTS I	121008	Practicum Elektromagnetische Veldtheorie	9	2002	4
1013136	FOLKERTS I	121018	Stage	8	2003	3
1013136	FOLKERTS I	121022	Neurofysiologie	6	2003	4
1013136	FOLKERTS I	121028	Computer vision	6	2003	4
1013136	FOLKERTS I	121035	Mid P-project	5	2002	4
1013136	FOLKERTS I	121043	Dynamische systemen	7	2003	4
1013136	FOLKERTS I	121049	Practicum Medische Elektronica	8	2003	3
1013136	FOLKERTS I	121050	Modern robotics	4	2003	3
1013136	FOLKERTS I	121052	Imaging	4	2003	3
1013136	FOLKERTS I	121053	Zekere- en onzekere informatie	5	2003	3
1013136	FOLKERTS I	121053	Zekere- en onzekere informatie	9	2003	2
1013136	FOLKERTS I	121060	Optische basisfuncties en microsystemen	5	2003	4
1013136	FOLKERTS I	121067	Signaal analyse practicum	5	2002	4
1013136	FOLKERTS I	121709	Reliability Engineering	8	2003	2
1013136	FOLKERTS I	122226	Project voortgezette elektronica	7	2003	3
1013136	FOLKERTS I	122481	Systems engineering	4	2003	3
1013136	FOLKERTS I	122815	Materiaalkunde van microsystemen	9	2003	4
1013136	FOLKERTS I	122821	Microtechnologie t.b.v. transducenten	4	2003	3
1013136	FOLKERTS I	122828	Practicum realiseren in materialen	8	2003	1
1013136	FOLKERTS I	122829	Systemen en technieken voor informatieopslag	9	2003	1
1013136	FOLKERTS I	123112	Moderne modulatie- en detectietechnieken	1	2003	4
1013136	FOLKERTS I	123140	Inleiding systeem- en signaaltheorie voor HBO	7	2003	3
1013136	FOLKERTS I	124151	Mechatronica	4	2002	4
1013136	FOLKERTS I	124153	Computer-aided design gereedschappen voor VLSI	6	2003	4
1013136	FOLKERTS I	124162	Modelvorming en simulatie	2	2003	4
1013136	FOLKERTS I	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	1
1013136	FOLKERTS I	125163	Electromagnetische compatibiliteit	6	2003	4
1013136	FOLKERTS I	127113	Elektrofysiologische signalen en bio-electriciteit	3	2003	4
1013136	FOLKERTS I	127116	Elektromagnetisme I voor HBO	6	2003	3
1013136	FOLKERTS I	127116	Elektromagnetisme I voor HBO	8	2003	2
1013136	FOLKERTS I	129344	Literatuuronderzoek	9	2003	3
1013136	FOLKERTS I	129351	Fysiologie II	3	2003	3
1013136	FOLKERTS I	129354	Literatuuronderzoek	7	2003	4
1013136	FOLKERTS I	150528	Wiskundig modelleren III	9	2003	3
1013136	FOLKERTS I	150539	Maple practicum	5	2003	4
1013136	FOLKERTS I	151007	Lineaire algebra	7	2003	4
1013136	FOLKERTS I	151025	Functionaalanalyse II	6	2003	3
1013136	FOLKERTS I	151072	Wiskunde II	4	2003	4
1013136	FOLKERTS I	151083	Wiskunde III	5	2003	3
1013136	FOLKERTS I	151208	Lineaire Algebra B	5	2003	3
1013136	FOLKERTS I	151210	Wiskunde A	6	2003	4
1013136	FOLKERTS I	151215	Wiskunde B	9	2003	4
1013136	FOLKERTS I	151250	Modellen en systemen	6	2003	4
1013136	FOLKERTS I	151530	Continuous Time Finance	7	2003	4
1013136	FOLKERTS I	151570	Financial Engineering	5	2003	3
1013136	FOLKERTS I	152025	Complexe functietheorie	3	2003	3
1013136	FOLKERTS I	152030	Tensoranalyse	7	2003	3
1013136	FOLKERTS I	152051	Voortgezette grafentheorie	9	2003	3
1013136	FOLKERTS I	152066	Capita selecta analyse	5	2003	2
1013136	FOLKERTS I	152100	Calculus I	6	2003	4
1013136	FOLKERTS I	153004	Statistiek I	6	2003	3
1013136	FOLKERTS I	153006	Kansrekening	8	2003	3
1013136	FOLKERTS I	153039	Kansrekening en statistiek	10	2003	3
1013136	FOLKERTS I	155010	Part. differentiaalverg. uit de math. fysica	8	2003	4
1013136	FOLKERTS I	155010	Part. differentiaalverg. uit de math. fysica	2	2003	2
1013136	FOLKERTS I	156012	Gewone differentiaalvergelijkingen	7	2003	3
1013136	FOLKERTS I	156014	Analyse B	9	2003	4
1013136	FOLKERTS I	157021	Analyse van signaaloverdracht in communicatienetw.	9	2003	4
1013136	FOLKERTS I	157030	Structured Products	6	2003	3
1013136	FOLKERTS I	159928	Doctoraalstage	4	2003	3
1013136	FOLKERTS I	159960	Multidisciplinaire ontwerpopdracht	5	2003	3
1013136	FOLKERTS I	211024	Programmeren in C++	3	2003	4
1013136	FOLKERTS I	211038	Spraak- en taaltechnologie	8	2002	1
1013136	FOLKERTS I	211054	Computersystemen	5	2003	2
1013136	FOLKERTS I	211081	Distributed E-business Techniques	6	2003	3
1013136	FOLKERTS I	211090	Databasetoepassingen	3	2003	4
1013136	FOLKERTS I	211098	Databasetransacties en -processen	6	2003	3
1013136	FOLKERTS I	211109	Voortgezette logica	5	2003	3
1013136	FOLKERTS I	213001	Basisbegrippen digitale techniek	6	2003	2
1013136	FOLKERTS I	213005	Computerarchitectuur	6	2003	1
1013136	FOLKERTS I	213125	Computersystemen	9	2003	4
1013136	FOLKERTS I	213510	Software Engineering Modellen	7	2003	4
1013136	FOLKERTS I	213540	Advanced Design of Software Architectures	7	2002	4
1013136	FOLKERTS I	214012	Systeemvalidatie	3	2003	3
1013136	FOLKERTS I	214020	Algoritmen,datastructuren en complexiteit	7	2003	4
1013136	FOLKERTS I	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1013136	FOLKERTS I	214030	Artificial Intelligence	7	2002	3
1013136	FOLKERTS I	214030	Artificial Intelligence	7	2002	1
1013136	FOLKERTS I	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2002	3
1013136	FOLKERTS I	214513	Internet & Web Architecturen	8	2002	2
1013136	FOLKERTS I	232011	Architectuur van informatiesystemen	8	2003	4
1013136	FOLKERTS I	232055	XML-technologie in E-Commerce	8	2003	1
1013136	FOLKERTS I	233030	Specificeren van informatiesystemen	6	2003	3
1013136	FOLKERTS I	234026	Voortgezette informatiesysteemmodellering	9	2003	1
1013136	FOLKERTS I	237201	Oriëntatie ICT	7	2003	4
1013136	FOLKERTS I	237201	Oriëntatie ICT	5	2003	2
1013136	FOLKERTS I	237400	BedrijfsProces Ondersteuning	4	2003	1
1013136	FOLKERTS I	237450	Bedrijfsfunctie ondersteuning	7	2003	3
1013136	FOLKERTS I	239981	Integratieproject	7	1999	3
1013136	FOLKERTS I	262001	Mobile and wireless networking	9	2003	4
1013136	FOLKERTS I	262001	Mobile and wireless networking	5	2003	2
1013136	FOLKERTS I	265100	Ontwerpen van telematicasystemen	2	2002	4
1013136	FOLKERTS I	265300	Operationeel management van telematicasystemen	5	2003	3
1013136	FOLKERTS I	269001	Portfolio ontwerp	6	2003	4
1013780	BOS D T	121002	Practicum elektronische basisschakelingen	6	2003	3
1013780	BOS D T	121007	Elektromagnetische Veldtheorie	5	2002	1
1013780	BOS D T	121008	Practicum Elektromagnetische Veldtheorie	5	2002	4
1013780	BOS D T	121026	Hands-on dig.image proces. and graphical pres.	4	2003	4
1013780	BOS D T	121034	Fysische modelvorming van embedded systemen	7	2003	4
1013780	BOS D T	121035	Mid P-project	5	2002	1
1013780	BOS D T	121041	Elektrodynamica	7	2003	4
1013780	BOS D T	121042	Meettechniek	7	2003	3
1013780	BOS D T	121052	Imaging	9	2003	3
1013780	BOS D T	121054	Neurotechnologie	5	2003	4
1013780	BOS D T	121067	Signaal analyse practicum	6	2002	4
1013780	BOS D T	122481	Systems engineering	1	2003	3
1013780	BOS D T	122711	Digitale meetsystemen	7	2003	4
1013780	BOS D T	122729	Image processing	6	2003	4
1013780	BOS D T	122816	Mechanica en transductietechniek	4	2003	4
1013780	BOS D T	122816	Mechanica en transductietechniek	7	2002	2
1013780	BOS D T	122833	Integratieproject	6	2003	2
1013780	BOS D T	123112	Moderne modulatie- en detectietechnieken	9	2003	4
1013780	BOS D T	123152	Signal processing in acoustics and audio	9	2002	4
1013780	BOS D T	123153	Embedded Signal Processing	5	2003	4
1013780	BOS D T	124151	Mechatronica	9	2002	4
1013780	BOS D T	124176	Digitale Regeltechniek	1	2003	3
1013780	BOS D T	125159	Optische communicatienetwerken	8	2003	4
1013780	BOS D T	127117	Biomechatronica	8	2001	3
1013780	BOS D T	129358	Maken van een scriptie	6	2003	3
1013780	BOS D T	150432	Maple practicum II	8	2003	4
1013780	BOS D T	150529	Wiskundig modelleren IV	8	2003	4
1013780	BOS D T	150539	Maple practicum	9	2003	4
1013780	BOS D T	150600	Mathematical methods	7	2003	3
1013780	BOS D T	151015	Numerieke lineaire algebra	5	2003	3
1013780	BOS D T	151025	Functionaalanalyse II	9	2003	3
1013780	BOS D T	151043	Seminarium mathematische fysica	3	2003	1
1013780	BOS D T	151051	Fundamentele analyse I	9	2003	1
1013780	BOS D T	151120	Wiskunde I	5	2003	4
1013780	BOS D T	151200	Calculus A	2	2003	3
1013780	BOS D T	151210	Wiskunde A	7	2003	4
1013780	BOS D T	151540	Computational Methods in Finance	6	2003	4
1013780	BOS D T	152006	Lineaire structuren	3	2003	4
1013780	BOS D T	152027	Calculus II	4	2003	3
1013780	BOS D T	152070	Meetkunde	6	2003	1
1013780	BOS D T	152080	Deterministische en stochastische speltheorie	5	2003	1
1013780	BOS D T	152100	Calculus I	4	2003	4
1013780	BOS D T	152130	Fundamentele analyse	9	2003	3
1013780	BOS D T	153029	Statistiek II	9	2003	4
1013780	BOS D T	153033	Statistiek	9	2003	4
1013780	BOS D T	153083	Stochastische modellen in productie en logistiek	4	2003	2
1013780	BOS D T	155009	Fundamenten van de methode der eindige elementen	9	2003	3
1013780	BOS D T	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	7	2003	3
1013780	BOS D T	156057	Inleiding wiskundige systeemtheorie	9	2003	4
1013780	BOS D T	156062	Systeem- en besturingstheorie	1	2003	4
1013780	BOS D T	157008	Stochastische processen in dynamische systemen	5	2003	3
1013780	BOS D T	157009	Tijdreeksenanalyse en identificatietheorie	9	2003	3
1013780	BOS D T	211038	Spraak- en taaltechnologie	4	2003	1
1013780	BOS D T	211074	Gegevensbanken	7	2003	4
1013780	BOS D T	211097	Bijzondere onderwerpen gegevensbanken	8	2003	3
1013780	BOS D T	211112	Inleiding Logica	6	2003	4
1013780	BOS D T	211123	Component- en aspect georienteerd progammeren	4	2003	3
1013780	BOS D T	211133	Ontwerpen van Software Architecturen	6	2003	1
1013780	BOS D T	211185	Taal- en rekenmodellen	4	2003	4
1013780	BOS D T	212018	Kennistechnologie voor bedrijfskundige toep.	4	2003	4
1013780	BOS D T	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	2
1013780	BOS D T	213001	Basisbegrippen digitale techniek	9	2003	2
1013780	BOS D T	213009	Fouten tolererende digitale systemen	7	2003	1
1013780	BOS D T	213505	Programmeren 2	4	2003	4
1013780	BOS D T	213530	Concurrent and distributed programming	3	2003	2
1013780	BOS D T	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2003	3
1013780	BOS D T	214510	MMI-project	9	2003	3
1013780	BOS D T	214513	Internet & Web Architecturen	9	2002	2
1013780	BOS D T	219910	Ontwerpproject	4	2003	3
1013780	BOS D T	232050	Electronic Commerce	7	2002	4
1013780	BOS D T	232055	XML-technologie in E-Commerce	9	2003	4
1013780	BOS D T	233030	Specificeren van informatiesystemen	5	2003	3
1013780	BOS D T	234020	Ontwerpen van mens-machine interactie	9	2003	4
1013780	BOS D T	237201	Oriëntatie ICT	5	2003	2
1013780	BOS D T	237400	BedrijfsProces Ondersteuning	7	2003	3
1013780	BOS D T	237400	BedrijfsProces Ondersteuning	3	2003	1
1013780	BOS D T	239800	BIT-BV 1	6	2003	4
1013780	BOS D T	262000	Telematicanetwerken	7	2003	4
1013780	BOS D T	263100	Mobile E-health application and services	6	2003	4
1013780	BOS D T	265100	Ontwerpen van telematicasystemen	7	2002	4
1015209	LEVERINK L	213005	Computerarchitectuur	1	2003	4
1015209	LEVERINK L	213005	Computerarchitectuur	6	2003	1
1015209	LEVERINK L	213505	Programmeren 2	7	2003	4
1015209	LEVERINK L	213505	Programmeren 2	5	2003	1
1015209	LEVERINK L	213510	Software Engineering Modellen	6	2003	4
1015209	LEVERINK L	214011	Tool Architectuur	5	2003	4
1015209	LEVERINK L	214030	Artificial Intelligence	9	2003	4
1015209	LEVERINK L	214030	Artificial Intelligence	4	2002	1
1015209	LEVERINK L	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2002	3
1015209	LEVERINK L	214513	Internet & Web Architecturen	9	2003	4
1015209	LEVERINK L	214513	Internet & Web Architecturen	7	2002	2
1015209	LEVERINK L	232016	Prestatie-analyse van informatiesystemen	7	2002	4
1015209	LEVERINK L	232055	XML-technologie in E-Commerce	9	2003	4
1015209	LEVERINK L	233030	Specificeren van informatiesystemen	3	2003	1
1015209	LEVERINK L	234007	Systemen voor cooperatief werk	6	2003	4
1015209	LEVERINK L	234010	Invoering van IT in organisaties	9	2003	4
1015209	LEVERINK L	237201	Oriëntatie ICT	9	2003	2
1015209	LEVERINK L	237600	Business Case Development for IT-projects	5	2003	3
1015209	LEVERINK L	239981	Integratieproject	1	2001	2
1015209	LEVERINK L	264002	Business process engineering	4	2003	4
1015209	LEVERINK L	269100	P-project TEL	8	2003	2
1015211	OVERMAN G	211123	Component- en aspect georienteerd progammeren	7	2003	1
1015211	OVERMAN G	211127	Formele analyse van natuurlijke taal	6	2003	4
1015211	OVERMAN G	211129	Taaltechnologie	6	2003	4
1015211	OVERMAN G	211130	Ubiquitous Computing	5	2003	3
1015211	OVERMAN G	211205	Functioneel programmeren	2	2003	4
1015211	OVERMAN G	212010	Informatiesystemen	8	2003	1
1015211	OVERMAN G	213009	Fouten tolererende digitale systemen	4	2003	1
1015211	OVERMAN G	213110	Computerorganisatie	6	2003	4
1015211	OVERMAN G	213130	Computer Organisatie INF/TEL	7	2003	3
1015211	OVERMAN G	213545	Advanced Design of Software Architectures 2	9	2003	3
1015211	OVERMAN G	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2001	3
1015211	OVERMAN G	232011	Architectuur van informatiesystemen	7	2003	4
1015211	OVERMAN G	234010	Invoering van IT in organisaties	4	2002	4
1015211	OVERMAN G	234020	Ontwerpen van mens-machine interactie	5	2003	4
1015211	OVERMAN G	237201	Oriëntatie ICT	1	2003	2
1015211	OVERMAN G	239981	Integratieproject	8	1998	3
1015211	OVERMAN G	239981	Integratieproject	5	2002	3
1015211	OVERMAN G	239981	Integratieproject	8	2003	2
1015211	OVERMAN G	262000	Telematicanetwerken	7	2003	4
1015211	OVERMAN G	263100	Mobile E-health application and services	3	2003	4
1015849	SIJSES Z	121001	Elektronische basisschakelingen	3	2003	4
1015849	SIJSES Z	121007	Elektromagnetische Veldtheorie	6	2002	4
1015849	SIJSES Z	121007	Elektromagnetische Veldtheorie	2	2003	1
1015849	SIJSES Z	121021	Inleiding in de biomedische technologie	8	2002	4
1015849	SIJSES Z	121025	Digitale beeldbewerking voor beta	5	2003	3
1015849	SIJSES Z	121041	Elektrodynamica	8	2003	4
1015849	SIJSES Z	121045	Project Mechatronica	5	2002	4
1015849	SIJSES Z	121706	Halfgeleiderdevices	6	2003	3
1015849	SIJSES Z	121706	Halfgeleiderdevices	5	2003	1
1015849	SIJSES Z	121709	Reliability Engineering	7	2003	2
1015849	SIJSES Z	122481	Systems engineering	8	2003	3
1015849	SIJSES Z	122816	Mechanica en transductietechniek	4	2002	3
1015849	SIJSES Z	122816	Mechanica en transductietechniek	9	2003	4
1015849	SIJSES Z	122831	Geintegreerde optica	9	2003	3
1015849	SIJSES Z	124151	Mechatronica	5	2002	4
1015849	SIJSES Z	124177	Inleiding elektrische energietechniek	4	2002	1
1015849	SIJSES Z	127116	Elektromagnetisme I voor HBO	9	2003	2
1015849	SIJSES Z	129351	Fysiologie II	6	2003	1
1015849	SIJSES Z	129362	Start P-project	3	2003	3
1015849	SIJSES Z	150528	Wiskundig modelleren III	4	2003	3
1015849	SIJSES Z	150529	Wiskundig modelleren IV	7	2003	4
1015849	SIJSES Z	150539	Maple practicum	7	2003	4
1015849	SIJSES Z	150700	Introduction to operations research	2	2003	4
1015849	SIJSES Z	151004	Calculus II-A	4	2003	4
1015849	SIJSES Z	151014	Analyse A	1	2003	3
1015849	SIJSES Z	151019	Analyse B	5	2003	4
1015849	SIJSES Z	151033	Numerieke analyse	8	2003	3
1015849	SIJSES Z	151070	Kwantitatieve methoden	8	2002	4
1015849	SIJSES Z	151070	Kwantitatieve methoden	8	2003	3
1015849	SIJSES Z	151085	Wiskunde I	7	2003	3
1015849	SIJSES Z	151091	Modelvorming I	6	2003	1
1015849	SIJSES Z	151140	Wiskunde III	8	2003	3
1015849	SIJSES Z	151204	Calculus C	6	2003	4
1015849	SIJSES Z	151208	Lineaire Algebra B	1	2003	3
1015849	SIJSES Z	151250	Modellen en systemen	1	2003	4
1015849	SIJSES Z	152006	Lineaire structuren	4	2003	4
1015849	SIJSES Z	152027	Calculus II	8	2003	3
1015849	SIJSES Z	152027	Calculus II	9	2003	2
1015849	SIJSES Z	152056	Combinatoriek	7	2003	4
1015849	SIJSES Z	152066	Capita selecta analyse	7	2003	3
1015849	SIJSES Z	152100	Calculus I	1	2003	4
1015849	SIJSES Z	153029	Statistiek II	9	2003	4
1015849	SIJSES Z	153032	Kansrekening en stochastische processen	9	2003	4
1015849	SIJSES Z	153036	Statistiek II	3	2003	4
1015849	SIJSES Z	153083	Stochastische modellen in productie en logistiek	9	2003	3
1015849	SIJSES Z	153083	Stochastische modellen in productie en logistiek	4	2003	2
1015849	SIJSES Z	153086	Telecommunicatiesystemen	9	2003	4
1015849	SIJSES Z	154021	Numerieke wiskunde en programmeermethoden	4	2003	3
1015849	SIJSES Z	155010	Part. differentiaalverg. uit de math. fysica	4	2003	4
1015849	SIJSES Z	156014	Analyse B	8	2003	4
1015849	SIJSES Z	157008	Stochastische processen in dynamische systemen	3	2003	3
1015849	SIJSES Z	158070	Grafentheorie en operationele research	5	2003	1
1015849	SIJSES Z	158075	Deterministische modellen in de OR	5	2002	4
1015849	SIJSES Z	211017	Inleiding programmeren met JAVA	4	2003	1
1015849	SIJSES Z	211027	Inleiding programmeren met MATLAB	7	2003	3
1015849	SIJSES Z	211032	Seminarium Taal, Kennis & Interactie	7	2003	1
1015849	SIJSES Z	211034	Spraaktechnologie	5	2003	2
1015849	SIJSES Z	211038	Spraak- en taaltechnologie	4	2003	1
1015849	SIJSES Z	211131	Statische Objectanalyse en Typering	7	2003	4
1015849	SIJSES Z	211133	Ontwerpen van Software Architecturen	3	2003	1
1015849	SIJSES Z	211185	Taal- en rekenmodellen	9	2003	1
1015849	SIJSES Z	212010	Informatiesystemen	4	2003	1
1015849	SIJSES Z	213002	Ontwerpen van digitale systemen	6	2003	4
1015849	SIJSES Z	213005	Computerarchitectuur	4	2003	1
1015849	SIJSES Z	213130	Computer Organisatie INF/TEL	6	2003	2
1015849	SIJSES Z	213530	Concurrent and distributed programming	9	2003	4
1015849	SIJSES Z	232081	Requirements Engineering	7	2003	4
1015849	SIJSES Z	233030	Specificeren van informatiesystemen	7	2003	3
1015849	SIJSES Z	234010	Invoering van IT in organisaties	7	2003	4
1015849	SIJSES Z	237201	Oriëntatie ICT	8	2002	3
1015849	SIJSES Z	237201	Oriëntatie ICT	8	2003	4
1015849	SIJSES Z	265200	Implementatie van telematicasystemen	9	2003	1
1015849	SIJSES Z	265201	Middleware for distributed objects	5	2002	4
1016091	GERRITSEN L	261010	Computer netwerken	7	2003	3
1016091	GERRITSEN L	262000	Telematicanetwerken	4	2003	4
1016091	GERRITSEN L	262020	Bijzondere onderwerpen Telematica	7	2003	1
1016091	GERRITSEN L	264001	Telematics and business strategies	5	2003	2
1016091	GERRITSEN L	265100	Ontwerpen van telematicasystemen	9	2003	1
1016091	GERRITSEN L	266100	Patterns of software development	8	2003	4
1017496	STALLMANN F	151052	Fundamentele analyse II	7	2003	3
1017496	STALLMANN F	151070	Kwantitatieve methoden	2	2002	4
1017496	STALLMANN F	151083	Wiskunde III	6	2003	3
1017496	STALLMANN F	151084	Wiskunde IV	9	2003	4
1017496	STALLMANN F	151150	Wiskunde IV	5	2003	3
1017496	STALLMANN F	151510	Introduction to Risk Theory	4	2003	3
1017496	STALLMANN F	152006	Lineaire structuren	6	2003	4
1017496	STALLMANN F	152038	Grafentheorie	7	2003	3
1017496	STALLMANN F	152061	Discrete wiskunde	9	2003	3
1017496	STALLMANN F	152068	Discrete wiskunde	9	2003	2
1017496	STALLMANN F	152075	Grafentheorie	9	2003	3
1017496	STALLMANN F	152080	Deterministische en stochastische speltheorie	8	2003	1
1017496	STALLMANN F	152150	Wiskundig modelleren I	8	2003	4
1017496	STALLMANN F	153031	Statistiek	4	2003	3
1017496	STALLMANN F	154021	Numerieke wiskunde en programmeermethoden	9	2003	1
1017496	STALLMANN F	156029	Analyse C	9	2003	3
1017496	STALLMANN F	158018	Operationele research I, practicum	4	2003	4
1017496	STALLMANN F	158075	Deterministische modellen in de OR	7	2002	4
1017496	STALLMANN F	159928	Doctoraalstage	8	2003	3
1017496	STALLMANN F	211017	Inleiding programmeren met JAVA	5	2003	3
1017496	STALLMANN F	211034	Spraaktechnologie	4	2003	2
1017496	STALLMANN F	211035	Vertalerbouw	7	2003	4
1017496	STALLMANN F	211045	Besturingssystemen	4	2003	3
1017496	STALLMANN F	211133	Ontwerpen van Software Architecturen	9	2003	1
1017496	STALLMANN F	213530	Concurrent and distributed programming	7	2002	4
1017496	STALLMANN F	214025	Algoritmen,datastructuren en complexiteit plus	3	2003	4
1017496	STALLMANN F	219801	Hypermedia structuren en systemen	3	2003	4
1017496	STALLMANN F	232012	Information retrieval en kennisbeheer	9	2003	3
1017496	STALLMANN F	232050	Electronic Commerce	1	2003	2
1017496	STALLMANN F	232055	XML-technologie in E-Commerce	9	2003	1
1017496	STALLMANN F	232080	Requirements Engineering	9	2003	3
1017496	STALLMANN F	232081	Requirements Engineering	1	2003	4
1017496	STALLMANN F	233030	Specificeren van informatiesystemen	8	2003	3
1017496	STALLMANN F	234010	Invoering van IT in organisaties	7	2002	4
1017496	STALLMANN F	236050	E-health Strategies	6	2003	4
1017496	STALLMANN F	237201	Oriëntatie ICT	4	2003	2
1017496	STALLMANN F	237400	BedrijfsProces Ondersteuning	9	2003	3
1017496	STALLMANN F	237600	Business Case Development for IT-projects	8	2003	3
1017496	STALLMANN F	239981	Integratieproject	5	2001	2
1017496	STALLMANN F	262001	Mobile and wireless networking	6	2003	4
1017496	STALLMANN F	262020	Bijzondere onderwerpen Telematica	7	2003	1
1017496	STALLMANN F	264001	Telematics and business strategies	8	2003	4
1017496	STALLMANN F	265300	Operationeel management van telematicasystemen	9	2003	3
1017496	STALLMANN F	266100	Patterns of software development	6	2003	4
1017815	TUSVELD T	121003	Elektronische functies	9	2003	3
1017815	TUSVELD T	121005	Netwerkanalyse	5	2003	1
1017815	TUSVELD T	121026	Hands-on dig.image proces. and graphical pres.	2	2002	3
1017815	TUSVELD T	121035	Mid P-project	7	2002	4
1017815	TUSVELD T	121035	Mid P-project	5	2003	1
1017815	TUSVELD T	121038	Elektronica voor industrieel ontwerpers	8	2003	4
1017815	TUSVELD T	121039	Biomedische signaal- en systeemanalyse	1	2003	3
1017815	TUSVELD T	121041	Elektrodynamica	7	2003	2
1017815	TUSVELD T	121045	Project Mechatronica	1	2002	2
1017815	TUSVELD T	121045	Project Mechatronica	2	2003	1
1017815	TUSVELD T	121062	Eind P-project	3	2003	4
1017815	TUSVELD T	122226	Project voortgezette elektronica	6	2003	3
1017815	TUSVELD T	122481	Systems engineering	9	2003	3
1017815	TUSVELD T	122634	Real-time software development	4	2003	3
1017815	TUSVELD T	122728	Classification, Estimation and Data Analysis	1	2003	4
1017815	TUSVELD T	122733	VLSI signal processing	9	2003	4
1017815	TUSVELD T	122733	VLSI signal processing	9	2003	2
1017815	TUSVELD T	122815	Materiaalkunde van microsystemen	9	2003	2
1017815	TUSVELD T	122833	Integratieproject	7	2003	2
1017815	TUSVELD T	124176	Digitale Regeltechniek	2	2003	3
1017815	TUSVELD T	124176	Digitale Regeltechniek	9	2003	2
1017815	TUSVELD T	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	1
1017815	TUSVELD T	125156	Transmissiemedia- en systemen	4	2003	1
1017815	TUSVELD T	125160	Mobiele communicatie	1	2003	3
1017815	TUSVELD T	125163	Electromagnetische compatibiliteit	5	2003	4
1017815	TUSVELD T	129348	Maken van een scriptie	8	2003	3
1017815	TUSVELD T	150529	Wiskundig modelleren IV	5	2003	4
1017815	TUSVELD T	150539	Maple practicum	4	2003	4
1017815	TUSVELD T	151043	Seminarium mathematische fysica	9	2003	4
1017815	TUSVELD T	151120	Wiskunde I	4	2003	4
1017815	TUSVELD T	151140	Wiskunde III	9	2003	3
1017815	TUSVELD T	151510	Introduction to Risk Theory	6	2003	3
1017815	TUSVELD T	151570	Financial Engineering	5	2003	3
1017815	TUSVELD T	151600	Modelleren en redeneren	8	2003	4
1017815	TUSVELD T	152025	Complexe functietheorie	3	2003	3
1017815	TUSVELD T	152150	Wiskundig modelleren I	8	2003	4
1017815	TUSVELD T	153003	Kansrekening	1	2003	3
1017815	TUSVELD T	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	2
1017815	TUSVELD T	153086	Telecommunicatiesystemen	4	2003	1
1017815	TUSVELD T	154021	Numerieke wiskunde en programmeermethoden	9	2003	3
1017815	TUSVELD T	154021	Numerieke wiskunde en programmeermethoden	6	2003	1
1017815	TUSVELD T	154023	Numerieke wiskunde en programmeermethoden	9	2003	3
1017815	TUSVELD T	155009	Fundamenten van de methode der eindige elementen	1	2003	3
1017815	TUSVELD T	155010	Part. differentiaalverg. uit de math. fysica	3	2003	2
1017815	TUSVELD T	156014	Analyse B	8	2003	4
1017815	TUSVELD T	156016	Analyse B	8	2003	1
1017815	TUSVELD T	156033	Bifurcatie theorie	3	2003	4
1017815	TUSVELD T	156062	Systeem- en besturingstheorie	8	2003	4
1017815	TUSVELD T	156066	Besturingstheorie van economische systemen	7	2003	4
1017815	TUSVELD T	156068	Niet-lineaire besturingstheorie	7	2003	3
1017815	TUSVELD T	158017	Operationele research I	6	2003	4
1017815	TUSVELD T	158061	Inleiding wiskundige economie	7	2003	4
1017815	TUSVELD T	158075	Deterministische modellen in de OR	4	2003	1
1017815	TUSVELD T	211026	Theoretische informatica	8	2003	3
1017815	TUSVELD T	211027	Inleiding programmeren met MATLAB	8	2003	3
1017815	TUSVELD T	211035	Vertalerbouw	1	2003	4
1017815	TUSVELD T	211054	Computersystemen	9	2003	3
1017815	TUSVELD T	211090	Databasetoepassingen	8	2003	4
1017815	TUSVELD T	211109	Voortgezette logica	9	2003	3
1019515	HUISINGA Z	121018	Stage	7	2003	3
1017815	TUSVELD T	211133	Ontwerpen van Software Architecturen	5	2003	3
1017815	TUSVELD T	211185	Taal- en rekenmodellen	5	2003	1
1017815	TUSVELD T	213002	Ontwerpen van digitale systemen	4	2003	4
1017815	TUSVELD T	213005	Computerarchitectuur	8	2003	4
1017815	TUSVELD T	213005	Computerarchitectuur	2	2003	1
1017815	TUSVELD T	213014	Procesbesturing en robotica	9	2003	3
1017815	TUSVELD T	213500	Programmeren 1	1	2003	4
1017815	TUSVELD T	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2002	3
1017815	TUSVELD T	214513	Internet & Web Architecturen	2	2002	4
1017815	TUSVELD T	232080	Requirements Engineering	6	2003	3
1017815	TUSVELD T	232085	Voortgezette Requirements Engineering	8	2003	4
1017815	TUSVELD T	234010	Invoering van IT in organisaties	1	2003	4
1017815	TUSVELD T	236002	Beheer van ICT voorzieningen	8	2003	3
1017815	TUSVELD T	236050	E-health Strategies	6	2003	4
1017815	TUSVELD T	237201	Oriëntatie ICT	6	2002	2
1017815	TUSVELD T	239981	Integratieproject	7	1999	3
1017815	TUSVELD T	262001	Mobile and wireless networking	9	2003	4
1017815	TUSVELD T	262001	Mobile and wireless networking	7	2003	2
1017815	TUSVELD T	265100	Ontwerpen van telematicasystemen	6	2003	1
1018412	BOS D	121000	Instrumentatie van embedded systemen	4	2003	3
1018412	BOS D	121004	Practicum elektronische functies	8	2003	2
1018412	BOS D	121006	Practicum Meetinstrumenten/Netwerkanalyse	2	2003	3
1018412	BOS D	121017	D1-project	9	2003	4
1018412	BOS D	121018	Stage	8	2003	3
1018412	BOS D	121042	Meettechniek	8	2003	3
1018412	BOS D	121043	Dynamische systemen	6	2003	2
1018412	BOS D	121045	Project Mechatronica	5	2002	4
1018412	BOS D	121049	Practicum Medische Elektronica	4	2003	3
1018412	BOS D	121067	Signaal analyse practicum	4	2002	4
1018412	BOS D	121706	Halfgeleiderdevices	2	2003	3
1018412	BOS D	121706	Halfgeleiderdevices	6	2003	1
1018412	BOS D	121709	Reliability Engineering	5	2003	4
1018412	BOS D	121709	Reliability Engineering	9	2003	2
1018412	BOS D	121714	I.C. technologie	6	2003	2
1018412	BOS D	122821	Microtechnologie t.b.v. transducenten	4	2003	3
1018412	BOS D	122828	Practicum realiseren in materialen	1	2003	3
1018412	BOS D	122828	Practicum realiseren in materialen	9	2003	1
1018412	BOS D	122833	Integratieproject	6	2003	2
1018412	BOS D	124151	Mechatronica	8	2003	4
1018412	BOS D	124151	Mechatronica	1	2003	2
1018412	BOS D	124153	Computer-aided design gereedschappen voor VLSI	8	2003	4
1018412	BOS D	125113	Analoge communicatietechniek	6	2003	4
1018412	BOS D	125119	Signaaltheorie	6	2003	4
1018412	BOS D	127116	Elektromagnetisme I voor HBO	2	2003	2
1018412	BOS D	127117	Biomechatronica	7	2001	3
1018412	BOS D	127117	Biomechatronica	7	2002	3
1018412	BOS D	129344	Literatuuronderzoek	8	2003	3
1018412	BOS D	129351	Fysiologie II	6	2003	3
1018412	BOS D	150500	Presentatie van een wiskundig onderwerp	5	2003	3
1018412	BOS D	150500	Presentatie van een wiskundig onderwerp	6	2003	1
1018412	BOS D	150539	Maple practicum	9	2003	4
1018412	BOS D	150700	Introduction to operations research	8	2003	4
1018412	BOS D	151004	Calculus II-A	7	2003	4
1018412	BOS D	151012	Calculus I	1	2003	4
1018412	BOS D	151043	Seminarium mathematische fysica	4	2003	4
1018412	BOS D	151070	Kwantitatieve methoden	5	2003	1
1018412	BOS D	151083	Wiskunde III	2	2003	3
1018412	BOS D	151091	Modelvorming I	4	2003	3
1018412	BOS D	151150	Wiskunde IV	7	2003	3
1018412	BOS D	151210	Wiskunde A	5	2003	1
1018412	BOS D	151520	Mathematical Finance	5	2003	4
1018412	BOS D	152068	Discrete wiskunde	6	2003	3
1018412	BOS D	153002	Discrete kansrekening	9	2003	3
1018412	BOS D	153006	Kansrekening	5	2003	3
1018412	BOS D	154021	Numerieke wiskunde en programmeermethoden	4	2003	3
1018412	BOS D	156012	Gewone differentiaalvergelijkingen	4	2003	3
1018412	BOS D	156067	Robust Control	7	2003	4
1018412	BOS D	157016	Stochastische filter- en besturingstheorie	7	2003	3
1018412	BOS D	159928	Doctoraalstage	6	2003	3
1018412	BOS D	211034	Spraaktechnologie	4	2003	3
1018412	BOS D	211035	Vertalerbouw	8	2003	4
1018412	BOS D	211081	Distributed E-business Techniques	5	2003	1
1018412	BOS D	211090	Databasetoepassingen	2	2003	4
1018412	BOS D	211096	XML & Databases	5	2003	3
1018412	BOS D	211131	Statische Objectanalyse en Typering	5	2003	4
1018412	BOS D	213001	Basisbegrippen digitale techniek	4	2003	2
1018412	BOS D	213005	Computerarchitectuur	1	2003	1
1018412	BOS D	213009	Fouten tolererende digitale systemen	7	2003	1
1018412	BOS D	213013	Real-time embedded systemen	4	2003	3
1018412	BOS D	213500	Programmeren 1	5	2003	1
1018412	BOS D	213540	Advanced Design of Software Architectures	1	2002	4
1018412	BOS D	213540	Advanced Design of Software Architectures	2	2003	3
1018412	BOS D	214025	Algoritmen,datastructuren en complexiteit plus	6	2003	4
1018412	BOS D	214510	MMI-project	9	2003	3
1018412	BOS D	232012	Information retrieval en kennisbeheer	9	2003	3
1018412	BOS D	232016	Prestatie-analyse van informatiesystemen	9	2002	4
1018412	BOS D	232060	Multi-agent systemen	5	2003	4
1018412	BOS D	232085	Voortgezette Requirements Engineering	9	2003	4
1018412	BOS D	233035	Practicum Databases in Informatiesystemen	9	2003	1
1018412	BOS D	234010	Invoering van IT in organisaties	7	2003	4
1018412	BOS D	261000	Telematicasystemen en toepassingen	7	2003	2
1018412	BOS D	265100	Ontwerpen van telematicasystemen	5	2003	3
1018412	BOS D	265200	Implementatie van telematicasystemen	9	2003	4
1018460	NIEBORG I	121001	Elektronische basisschakelingen	9	2003	2
1018460	NIEBORG I	121007	Elektromagnetische Veldtheorie	9	2003	3
1018460	NIEBORG I	121007	Elektromagnetische Veldtheorie	8	2003	1
1018460	NIEBORG I	121009	Inleiding telecommunicatie	7	2003	4
1018460	NIEBORG I	121022	Neurofysiologie	8	2003	4
1018460	NIEBORG I	121035	Mid P-project	4	2002	1
1018460	NIEBORG I	121044	Regeltechniek	9	2003	4
1018460	NIEBORG I	121054	Neurotechnologie	7	2003	4
1018460	NIEBORG I	121056	Laboratorium op een chip	2	2003	3
1018460	NIEBORG I	121062	Eind P-project	8	2003	4
1018460	NIEBORG I	121714	I.C. technologie	5	2003	2
1018460	NIEBORG I	122226	Project voortgezette elektronica	6	2003	3
1018460	NIEBORG I	122227	Voortgezette analoge IC elektronica	6	2003	4
1018460	NIEBORG I	122227	Voortgezette analoge IC elektronica	9	2003	2
1018460	NIEBORG I	122230	Integrated circuits and systems for mixed signals	7	2003	2
1018460	NIEBORG I	122481	Systems engineering	6	2003	3
1018460	NIEBORG I	122728	Classification, Estimation and Data Analysis	8	2003	4
1018460	NIEBORG I	122815	Materiaalkunde van microsystemen	6	2003	4
1018460	NIEBORG I	122816	Mechanica en transductietechniek	1	2003	4
1018460	NIEBORG I	122821	Microtechnologie t.b.v. transducenten	6	2003	3
1018460	NIEBORG I	122828	Practicum realiseren in materialen	8	2003	3
1018460	NIEBORG I	122829	Systemen en technieken voor informatieopslag	5	2003	1
1018460	NIEBORG I	124113	Optimal estimation in dynamic systems	4	2003	3
1018460	NIEBORG I	124151	Mechatronica	8	2003	4
1018460	NIEBORG I	124177	Inleiding elektrische energietechniek	8	2002	4
1018460	NIEBORG I	125114	Prestatieanalyse van communicatienetwerken	9	2003	4
1018460	NIEBORG I	127116	Elektromagnetisme I voor HBO	7	2003	3
1018460	NIEBORG I	127117	Biomechatronica	5	2002	3
1018460	NIEBORG I	129358	Maken van een scriptie	2	2003	3
1018460	NIEBORG I	129362	Start P-project	5	2003	2
1018460	NIEBORG I	150432	Maple practicum II	6	2003	4
1018460	NIEBORG I	150529	Wiskundig modelleren IV	3	2003	1
1018460	NIEBORG I	150600	Mathematical methods	4	2003	3
1018460	NIEBORG I	150910	Advanced modelling	4	2003	4
1018460	NIEBORG I	151014	Analyse A	9	2003	3
1018460	NIEBORG I	151043	Seminarium mathematische fysica	6	2003	4
1018460	NIEBORG I	151044	Analyse C	8	2003	3
1018460	NIEBORG I	151088	Practicum Wiskundig modelleren	6	2003	4
1018460	NIEBORG I	151206	Lineaire Algebra A	9	2003	3
1018460	NIEBORG I	151570	Financial Engineering	5	2003	3
1018460	NIEBORG I	151600	Modelleren en redeneren	8	2003	4
1018460	NIEBORG I	152027	Calculus II	6	2003	3
1018460	NIEBORG I	152061	Discrete wiskunde	6	2003	3
1018460	NIEBORG I	153006	Kansrekening	5	2003	3
1018460	NIEBORG I	153028	Statistiek I	9	2003	4
1018460	NIEBORG I	153083	Stochastische modellen in productie en logistiek	3	2003	2
1018460	NIEBORG I	153088	Stochastische modellen voor Operations Management	9	2003	3
1018460	NIEBORG I	153135	Statistical techniques	6	2003	4
1018460	NIEBORG I	154021	Numerieke wiskunde en programmeermethoden	6	2003	3
1018460	NIEBORG I	154023	Numerieke wiskunde en programmeermethoden	5	2003	1
1018460	NIEBORG I	155010	Part. differentiaalverg. uit de math. fysica	6	2003	4
1018460	NIEBORG I	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	5	2003	3
1018460	NIEBORG I	156012	Gewone differentiaalvergelijkingen	4	2003	3
1018460	NIEBORG I	156067	Robust Control	9	2003	4
1018460	NIEBORG I	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1018460	NIEBORG I	158006	Operationele research II	6	2003	4
1018460	NIEBORG I	159960	Multidisciplinaire ontwerpopdracht	6	2003	3
1018460	NIEBORG I	211022	Programmeren in C++	5	2003	3
1018460	NIEBORG I	211081	Distributed E-business Techniques	4	2003	1
1018460	NIEBORG I	211097	Bijzondere onderwerpen gegevensbanken	3	2003	1
1018460	NIEBORG I	211180	Basismodellen in de informatica	1	2003	4
1018460	NIEBORG I	213001	Basisbegrippen digitale techniek	1	2002	3
1018460	NIEBORG I	213001	Basisbegrippen digitale techniek	4	2003	4
1018460	NIEBORG I	213002	Ontwerpen van digitale systemen	5	2003	4
1018460	NIEBORG I	213011	Gedistribueerde systemen	6	2003	4
1018460	NIEBORG I	213130	Computer Organisatie INF/TEL	7	2003	3
1018460	NIEBORG I	213510	Software Engineering Modellen	9	2003	4
1018460	NIEBORG I	214030	Artificial Intelligence	4	2002	3
1018460	NIEBORG I	214030	Artificial Intelligence	9	2002	1
1018460	NIEBORG I	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2001	3
1018460	NIEBORG I	214500	Communicatie en ontwerpen in ICT-projecten 1	1	2002	3
1018460	NIEBORG I	217001	Testtechnieken	1	2003	3
1018460	NIEBORG I	232055	XML-technologie in E-Commerce	5	2003	4
1018460	NIEBORG I	233035	Practicum Databases in Informatiesystemen	9	2002	3
1018460	NIEBORG I	234010	Invoering van IT in organisaties	4	2002	4
1018460	NIEBORG I	234010	Invoering van IT in organisaties	9	2003	4
1018460	NIEBORG I	234020	Ontwerpen van mens-machine interactie	5	2003	4
1018460	NIEBORG I	235005	Inleiding bedrijfsinformatiesystemen	9	2003	3
1018460	NIEBORG I	237201	Oriëntatie ICT	3	2002	2
1018460	NIEBORG I	237600	Business Case Development for IT-projects	5	2003	3
1018460	NIEBORG I	239800	BIT-BV 1	5	2003	4
1018460	NIEBORG I	239981	Integratieproject	4	2003	2
1018460	NIEBORG I	261010	Computer netwerken	8	2003	1
1018460	NIEBORG I	262020	Bijzondere onderwerpen Telematica	9	2003	4
1018460	NIEBORG I	262020	Bijzondere onderwerpen Telematica	5	2003	1
1018460	NIEBORG I	265200	Implementatie van telematicasystemen	6	2003	4
1018460	NIEBORG I	265200	Implementatie van telematicasystemen	3	2003	1
1019046	WOLTERINK Z V	239981	Integratieproject	3	2002	3
1019046	WOLTERINK Z V	264000	Telematicatoepassingen	8	2003	3
1019046	WOLTERINK Z V	265310	Internet management architecturen	4	2003	3
1019046	WOLTERINK Z V	269001	Portfolio ontwerp	6	2003	4
1019515	HUISINGA Z	121008	Practicum Elektromagnetische Veldtheorie	5	2003	3
1019515	HUISINGA Z	121019	D-opdracht	9	2003	3
1019515	HUISINGA Z	121025	Digitale beeldbewerking voor beta	9	2003	3
1019515	HUISINGA Z	121028	Computer vision	9	2003	4
1019515	HUISINGA Z	121035	Mid P-project	9	2002	4
1019515	HUISINGA Z	121043	Dynamische systemen	7	2003	2
1019515	HUISINGA Z	121050	Modern robotics	6	2003	3
1019515	HUISINGA Z	121067	Signaal analyse practicum	9	2002	4
1019515	HUISINGA Z	121713	VLSI system design	7	2003	4
1019515	HUISINGA Z	122230	Integrated circuits and systems for mixed signals	9	2003	4
1019515	HUISINGA Z	122230	Integrated circuits and systems for mixed signals	8	2003	2
1019515	HUISINGA Z	122814	Elektromagnetisme II voor HBO	4	2003	4
1019515	HUISINGA Z	122816	Mechanica en transductietechniek	5	2002	3
1019515	HUISINGA Z	122828	Practicum realiseren in materialen	6	2003	1
1019515	HUISINGA Z	122829	Systemen en technieken voor informatieopslag	9	2003	1
1019515	HUISINGA Z	122831	Geintegreerde optica	5	2003	2
1019515	HUISINGA Z	123112	Moderne modulatie- en detectietechnieken	7	2003	4
1019515	HUISINGA Z	123153	Embedded Signal Processing	2	2003	4
1019515	HUISINGA Z	125151	Schakel- en controlesystemen v. Multi-service netw	6	2003	3
1019515	HUISINGA Z	125152	Glasvezelcommunicatie	4	2003	2
1019515	HUISINGA Z	125153	Inleiding communicatiesystemen	4	2003	3
1019515	HUISINGA Z	127116	Elektromagnetisme I voor HBO	9	2003	3
1019515	HUISINGA Z	150500	Presentatie van een wiskundig onderwerp	5	2003	1
1019515	HUISINGA Z	150527	Wiskundig modelleren II	1	2003	3
1019515	HUISINGA Z	150532	Maple practicum	6	2003	4
1019515	HUISINGA Z	150539	Maple practicum	9	2003	4
1019515	HUISINGA Z	150600	Mathematical methods	5	2003	3
1019515	HUISINGA Z	150610	Statistics and probability	5	2003	3
1019515	HUISINGA Z	150620	Systems and signals	6	2003	3
1019515	HUISINGA Z	150910	Advanced modelling	7	2003	4
1019515	HUISINGA Z	151004	Calculus II-A	4	2003	4
1019515	HUISINGA Z	151039	Algebra	7	2003	4
1019515	HUISINGA Z	151043	Seminarium mathematische fysica	5	2003	4
1019515	HUISINGA Z	151070	Kwantitatieve methoden	3	2003	1
1019515	HUISINGA Z	151072	Wiskunde II	7	2003	4
1019515	HUISINGA Z	151130	Wiskunde II	9	2003	4
1019515	HUISINGA Z	151220	Wiskunde C	9	2003	3
1019515	HUISINGA Z	151520	Mathematical Finance	9	2003	4
1019515	HUISINGA Z	152006	Lineaire structuren	9	2003	4
1019515	HUISINGA Z	152025	Complexe functietheorie	8	2003	3
1019515	HUISINGA Z	152027	Calculus II	8	2003	3
1019515	HUISINGA Z	152056	Combinatoriek	6	2003	4
1019515	HUISINGA Z	152066	Capita selecta analyse	1	2003	3
1019515	HUISINGA Z	152066	Capita selecta analyse	7	2003	2
1019515	HUISINGA Z	152070	Meetkunde	4	2003	4
1019515	HUISINGA Z	152070	Meetkunde	5	2003	1
1019515	HUISINGA Z	152110	Calculus II	6	2003	3
1019515	HUISINGA Z	153016	Voortgezette wiskundige statistiek	4	2003	3
1019515	HUISINGA Z	153023	Statistiek II voor TBK	7	2003	3
1019515	HUISINGA Z	153038	Wiskundige statistiek	2	2003	4
1019515	HUISINGA Z	153039	Kansrekening en statistiek	9	2003	3
1019515	HUISINGA Z	153086	Telecommunicatiesystemen	1	2003	4
1019515	HUISINGA Z	156057	Inleiding wiskundige systeemtheorie	5	2003	4
1019515	HUISINGA Z	157008	Stochastische processen in dynamische systemen	9	2003	3
1019515	HUISINGA Z	157016	Stochastische filter- en besturingstheorie	5	2003	3
1019515	HUISINGA Z	157035	Financial Econometrics	6	2003	3
1019515	HUISINGA Z	158006	Operationele research II	6	2003	4
1019515	HUISINGA Z	158070	Grafentheorie en operationele research	8	2003	3
1019515	HUISINGA Z	211022	Programmeren in C++	4	2003	3
1019515	HUISINGA Z	211038	Spraak- en taaltechnologie	9	2001	3
1019515	HUISINGA Z	211090	Databasetoepassingen	5	2003	4
1019515	HUISINGA Z	211123	Component- en aspect georienteerd progammeren	4	2003	1
1019515	HUISINGA Z	211185	Taal- en rekenmodellen	4	2003	1
1019515	HUISINGA Z	211205	Functioneel programmeren	6	2003	4
1019515	HUISINGA Z	213005	Computerarchitectuur	4	2003	4
1019515	HUISINGA Z	213011	Gedistribueerde systemen	5	2003	4
1019515	HUISINGA Z	213530	Concurrent and distributed programming	9	2003	2
1019515	HUISINGA Z	214510	MMI-project	5	2003	3
1019515	HUISINGA Z	214513	Internet & Web Architecturen	6	2002	4
1019515	HUISINGA Z	214513	Internet & Web Architecturen	7	2003	4
1019515	HUISINGA Z	214513	Internet & Web Architecturen	9	2003	2
1019515	HUISINGA Z	233030	Specificeren van informatiesystemen	7	2003	3
1019515	HUISINGA Z	234004	Softwaremanagement	5	2003	3
1019515	HUISINGA Z	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1019515	HUISINGA Z	237201	Oriëntatie ICT	8	2002	3
1019515	HUISINGA Z	237201	Oriëntatie ICT	9	2003	4
1019515	HUISINGA Z	237600	Business Case Development for IT-projects	7	2003	3
1019515	HUISINGA Z	239981	Integratieproject	5	2000	1
1019515	HUISINGA Z	264002	Business process engineering	5	2003	4
1019515	HUISINGA Z	265200	Implementatie van telematicasystemen	6	2003	1
1019819	WILKENS I	121003	Elektronische functies	9	2003	3
1019819	WILKENS I	121022	Neurofysiologie	2	2003	4
1019819	WILKENS I	121050	Modern robotics	7	2003	3
1019819	WILKENS I	121053	Zekere- en onzekere informatie	5	2003	2
1019819	WILKENS I	121060	Optische basisfuncties en microsystemen	8	2003	4
1019819	WILKENS I	121717	Advanced semiconductor devices	4	2003	3
1019819	WILKENS I	122711	Digitale meetsystemen	2	2003	4
1019819	WILKENS I	122729	Image processing	7	2003	4
1019819	WILKENS I	122828	Practicum realiseren in materialen	4	2003	1
1019819	WILKENS I	122829	Systemen en technieken voor informatieopslag	4	2003	4
1019819	WILKENS I	123140	Inleiding systeem- en signaaltheorie voor HBO	8	2003	3
1019819	WILKENS I	123153	Embedded Signal Processing	6	2003	4
1019819	WILKENS I	124113	Optimal estimation in dynamic systems	7	2003	3
1019819	WILKENS I	124151	Mechatronica	4	2002	4
1019819	WILKENS I	124177	Inleiding elektrische energietechniek	9	2002	1
1019819	WILKENS I	125118	Practicum informatie-overdracht	7	2003	2
1019819	WILKENS I	125119	Signaaltheorie	7	2003	4
1019819	WILKENS I	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	1
1019819	WILKENS I	125152	Glasvezelcommunicatie	4	2003	3
1019819	WILKENS I	125153	Inleiding communicatiesystemen	4	2003	3
1019819	WILKENS I	127117	Biomechatronica	7	2003	2
1019819	WILKENS I	129354	Literatuuronderzoek	5	2003	4
1019819	WILKENS I	129357	Deelname aan een project	3	2003	4
1019819	WILKENS I	150600	Mathematical methods	5	2003	3
1019819	WILKENS I	151024	Lineaire analyse	4	2003	4
1019819	WILKENS I	151043	Seminarium mathematische fysica	7	2003	4
1019819	WILKENS I	151043	Seminarium mathematische fysica	6	2003	1
1019819	WILKENS I	151051	Fundamentele analyse I	2	2003	1
1019819	WILKENS I	151070	Kwantitatieve methoden	4	2002	4
1019819	WILKENS I	151082	Wiskunde II	6	2003	4
1019819	WILKENS I	151092	Modelvorming II	7	2003	4
1019819	WILKENS I	151150	Wiskunde IV	7	2003	3
1019819	WILKENS I	151540	Computational Methods in Finance	8	2003	4
1019819	WILKENS I	152006	Lineaire structuren	7	2003	4
1019819	WILKENS I	152027	Calculus II	4	2003	2
1019819	WILKENS I	153003	Kansrekening	8	2003	3
1019819	WILKENS I	153006	Kansrekening	7	2003	3
1019819	WILKENS I	153032	Kansrekening en stochastische processen	6	2003	4
1019819	WILKENS I	156033	Bifurcatie theorie	4	2003	4
1019819	WILKENS I	156057	Inleiding wiskundige systeemtheorie	8	2003	4
1019819	WILKENS I	156067	Robust Control	4	2003	4
1019819	WILKENS I	158042	Modelbouw in de optimalisatie	5	2003	4
1019819	WILKENS I	211022	Programmeren in C++	8	2003	3
1019819	WILKENS I	211038	Spraak- en taaltechnologie	4	2001	3
1019819	WILKENS I	211038	Spraak- en taaltechnologie	2	2003	4
1019819	WILKENS I	211054	Computersystemen	7	2003	2
1019819	WILKENS I	211095	Gedistribueerde databases & middleware technologie	9	2003	1
1019819	WILKENS I	211109	Voortgezette logica	1	2003	3
1019819	WILKENS I	211133	Ontwerpen van Software Architecturen	4	2003	1
1019819	WILKENS I	211180	Basismodellen in de informatica	4	2003	2
1019819	WILKENS I	213001	Basisbegrippen digitale techniek	2	2002	3
1019819	WILKENS I	213130	Computer Organisatie INF/TEL	7	2003	3
1019819	WILKENS I	213530	Concurrent and distributed programming	9	2002	4
1019819	WILKENS I	213530	Concurrent and distributed programming	4	2003	2
1019819	WILKENS I	213540	Advanced Design of Software Architectures	8	2003	3
1019819	WILKENS I	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2003	2
1019819	WILKENS I	214513	Internet & Web Architecturen	7	2003	4
1019819	WILKENS I	232016	Prestatie-analyse van informatiesystemen	1	2002	4
1019819	WILKENS I	232020	Data warehousing & data mining	4	2002	3
1019819	WILKENS I	232020	Data warehousing & data mining	6	2003	4
1019819	WILKENS I	232060	Multi-agent systemen	6	2003	2
1019819	WILKENS I	233035	Practicum Databases in Informatiesystemen	6	2002	1
1019819	WILKENS I	239800	BIT-BV 1	4	2003	4
1019819	WILKENS I	239801	BIT-BV 2	6	2003	4
1019819	WILKENS I	239805	BIT-BV	5	2003	4
1019819	WILKENS I	262020	Bijzondere onderwerpen Telematica	5	2003	1
1019819	WILKENS I	263000	Telematicadiensten	1	2003	1
1019819	WILKENS I	265110	Protocol Engineering	9	2003	1
1019819	WILKENS I	269001	Portfolio ontwerp	3	2003	4
1020830	JANS A	122833	Integratieproject	5	2003	4
1020830	JANS A	124162	Modelvorming en simulatie	5	2003	4
1020830	JANS A	124176	Digitale Regeltechniek	8	2003	2
1020830	JANS A	125118	Practicum informatie-overdracht	7	2003	2
1020830	JANS A	125159	Optische communicatienetwerken	9	2003	4
1020830	JANS A	127117	Biomechatronica	6	2001	3
1020830	JANS A	129351	Fysiologie II	1	2003	3
1020830	JANS A	129354	Literatuuronderzoek	6	2003	4
1020830	JANS A	129362	Start P-project	7	2003	3
1020830	JANS A	150529	Wiskundig modelleren IV	8	2003	4
1020830	JANS A	150625	Scientific communication	5	2003	3
1020830	JANS A	151019	Analyse B	3	2003	4
1020830	JANS A	151072	Wiskunde II	6	2003	4
1020830	JANS A	151081	Wiskunde I	7	2003	3
1020830	JANS A	151091	Modelvorming I	4	2003	3
1020830	JANS A	151093	Modelvorming III	5	2003	3
1020830	JANS A	151120	Wiskunde I	4	2003	4
1020830	JANS A	151208	Lineaire Algebra B	6	2003	3
1020830	JANS A	151560	Introduction to Investment Theory	8	2003	4
1020830	JANS A	152068	Discrete wiskunde	4	2003	3
1020830	JANS A	153006	Kansrekening	3	2003	3
1020830	JANS A	153016	Voortgezette wiskundige statistiek	2	2003	3
1020830	JANS A	153023	Statistiek II voor TBK	3	2003	3
1020830	JANS A	153026	Asymptotische technieken in de statistiek	4	2003	3
1020830	JANS A	153031	Statistiek	6	2003	3
1020830	JANS A	153039	Kansrekening en statistiek	6	2003	3
1020830	JANS A	153045	Lineaire statistische modellen	8	2003	4
1020830	JANS A	154021	Numerieke wiskunde en programmeermethoden	9	2003	1
1020830	JANS A	156012	Gewone differentiaalvergelijkingen	8	2003	3
1020830	JANS A	156080	Signalen en transformaties	4	2003	3
1020830	JANS A	157008	Stochastische processen in dynamische systemen	4	2003	3
1020830	JANS A	157016	Stochastische filter- en besturingstheorie	7	2003	3
1020830	JANS A	158006	Operationele research II	8	2003	4
1020830	JANS A	158075	Deterministische modellen in de OR	2	2002	4
1020830	JANS A	158075	Deterministische modellen in de OR	5	2003	4
1020830	JANS A	159918	Bibliotheekgebruik en literatuuropdracht	8	2003	3
1020830	JANS A	211024	Programmeren in C++	7	2003	4
1020830	JANS A	211123	Component- en aspect georienteerd progammeren	6	2003	3
1020830	JANS A	211129	Taaltechnologie	6	2003	4
1020830	JANS A	211131	Statische Objectanalyse en Typering	7	2003	4
1020830	JANS A	211133	Ontwerpen van Software Architecturen	4	2003	1
1020830	JANS A	213002	Ontwerpen van digitale systemen	5	2003	4
1020830	JANS A	213005	Computerarchitectuur	7	2003	4
1020830	JANS A	213016	Bijzondere onderwerpen computerarchitectuur	6	2003	3
1020830	JANS A	213110	Computerorganisatie	7	2003	1
1020830	JANS A	213120	Inleiding informatie- en communicatietechnologie	1	2003	2
1020830	JANS A	214020	Algoritmen,datastructuren en complexiteit	2	2003	4
1020830	JANS A	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2001	3
1020830	JANS A	214511	Database Project	2	2003	3
1020830	JANS A	214513	Internet & Web Architecturen	6	2002	4
1020830	JANS A	214513	Internet & Web Architecturen	8	2003	4
1020830	JANS A	232020	Data warehousing & data mining	7	2002	3
1020830	JANS A	232020	Data warehousing & data mining	9	2003	4
1020830	JANS A	232050	Electronic Commerce	5	2003	4
1020830	JANS A	232050	Electronic Commerce	7	2003	2
1020830	JANS A	232055	XML-technologie in E-Commerce	8	2003	1
1020830	JANS A	232085	Voortgezette Requirements Engineering	1	2003	4
1020830	JANS A	234004	Softwaremanagement	7	2003	3
1020830	JANS A	236002	Beheer van ICT voorzieningen	9	2003	3
1020830	JANS A	237201	Oriëntatie ICT	2	2003	4
1020830	JANS A	237400	BedrijfsProces Ondersteuning	8	2003	3
1020830	JANS A	239801	BIT-BV 2	6	2003	4
1020830	JANS A	261010	Computer netwerken	2	2003	1
1020830	JANS A	265200	Implementatie van telematicasystemen	6	2003	4
1020830	JANS A	269004	Refresher Logics, Probability,Databases and JAVA	3	2003	4
1020954	BASTIAENSDR Y Q	121001	Elektronische basisschakelingen	7	2003	4
1020954	BASTIAENSDR Y Q	121007	Elektromagnetische Veldtheorie	3	2002	1
1020954	BASTIAENSDR Y Q	121008	Practicum Elektromagnetische Veldtheorie	4	2002	4
1020954	BASTIAENSDR Y Q	121017	D1-project	4	2003	4
1020954	BASTIAENSDR Y Q	121026	Hands-on dig.image proces. and graphical pres.	5	2003	1
1020954	BASTIAENSDR Y Q	121028	Computer vision	4	2003	4
1020954	BASTIAENSDR Y Q	121044	Regeltechniek	2	2003	2
1020954	BASTIAENSDR Y Q	121045	Project Mechatronica	6	2003	3
1020954	BASTIAENSDR Y Q	121050	Modern robotics	9	2003	3
1020954	BASTIAENSDR Y Q	121060	Optische basisfuncties en microsystemen	8	2003	4
1020954	BASTIAENSDR Y Q	121067	Signaal analyse practicum	6	2003	4
1020954	BASTIAENSDR Y Q	121067	Signaal analyse practicum	6	2003	2
1020954	BASTIAENSDR Y Q	121706	Halfgeleiderdevices	1	2003	3
1020954	BASTIAENSDR Y Q	121709	Reliability Engineering	8	2003	2
1020954	BASTIAENSDR Y Q	122226	Project voortgezette elektronica	5	2003	3
1020954	BASTIAENSDR Y Q	122230	Integrated circuits and systems for mixed signals	4	2003	2
1020954	BASTIAENSDR Y Q	122814	Elektromagnetisme II voor HBO	1	2003	4
1020954	BASTIAENSDR Y Q	122831	Geintegreerde optica	7	2002	4
1020954	BASTIAENSDR Y Q	122833	Integratieproject	4	2003	2
1020954	BASTIAENSDR Y Q	123140	Inleiding systeem- en signaaltheorie voor HBO	5	2003	3
1020954	BASTIAENSDR Y Q	123153	Embedded Signal Processing	9	2003	4
1020954	BASTIAENSDR Y Q	124151	Mechatronica	1	2003	4
1020954	BASTIAENSDR Y Q	124153	Computer-aided design gereedschappen voor VLSI	4	2003	4
1020954	BASTIAENSDR Y Q	124163	Mechatronische meetsystemen	9	2003	4
1020954	BASTIAENSDR Y Q	125113	Analoge communicatietechniek	7	2003	4
1020954	BASTIAENSDR Y Q	127116	Elektromagnetisme I voor HBO	4	2003	2
1020954	BASTIAENSDR Y Q	129351	Fysiologie II	1	2003	1
1020954	BASTIAENSDR Y Q	129355	Deelname aan een studiegroep	6	2003	3
1020954	BASTIAENSDR Y Q	150529	Wiskundig modelleren IV	7	2003	1
1020954	BASTIAENSDR Y Q	150600	Mathematical methods	1	2003	3
1020954	BASTIAENSDR Y Q	150910	Advanced modelling	5	2003	4
1020954	BASTIAENSDR Y Q	151005	Calculus II-B	7	2003	3
1020954	BASTIAENSDR Y Q	151081	Wiskunde I	8	2003	3
1020954	BASTIAENSDR Y Q	151082	Wiskunde II	6	2003	4
1020954	BASTIAENSDR Y Q	151085	Wiskunde I	7	2003	3
1020954	BASTIAENSDR Y Q	151091	Modelvorming I	6	2003	3
1020954	BASTIAENSDR Y Q	151093	Modelvorming III	6	2003	3
1020954	BASTIAENSDR Y Q	151150	Wiskunde IV	3	2003	3
1020954	BASTIAENSDR Y Q	151510	Introduction to Risk Theory	7	2003	3
1020954	BASTIAENSDR Y Q	151565	Praktische opdracht Financial Engineering	6	2003	4
1020954	BASTIAENSDR Y Q	152025	Complexe functietheorie	3	2003	3
1020954	BASTIAENSDR Y Q	152080	Deterministische en stochastische speltheorie	4	2003	1
1020954	BASTIAENSDR Y Q	153004	Statistiek I	6	2003	3
1020954	BASTIAENSDR Y Q	153006	Kansrekening	3	2003	3
1020954	BASTIAENSDR Y Q	153082	Stochastische simulatie	8	2003	3
1020954	BASTIAENSDR Y Q	153087	Wachttijdtheorie	6	2003	3
1020954	BASTIAENSDR Y Q	154021	Numerieke wiskunde en programmeermethoden	7	2003	1
1020954	BASTIAENSDR Y Q	154023	Numerieke wiskunde en programmeermethoden	3	2003	1
1020954	BASTIAENSDR Y Q	155009	Fundamenten van de methode der eindige elementen	8	2003	3
1020954	BASTIAENSDR Y Q	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	3	2003	3
1020954	BASTIAENSDR Y Q	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	4	2003	1
1020954	BASTIAENSDR Y Q	157004	Stochastische processen in financien	6	2003	3
1020954	BASTIAENSDR Y Q	158017	Operationele research I	5	2003	4
1020954	BASTIAENSDR Y Q	158042	Modelbouw in de optimalisatie	8	2003	4
1020954	BASTIAENSDR Y Q	159918	Bibliotheekgebruik en literatuuropdracht	7	2003	3
1020954	BASTIAENSDR Y Q	211026	Theoretische informatica	8	2003	3
1020954	BASTIAENSDR Y Q	211035	Vertalerbouw	9	2003	4
1020954	BASTIAENSDR Y Q	211045	Besturingssystemen	8	2003	2
1020954	BASTIAENSDR Y Q	211078	Database-ontwerp	8	2003	4
1020954	BASTIAENSDR Y Q	211081	Distributed E-business Techniques	9	2003	3
1020954	BASTIAENSDR Y Q	211096	XML & Databases	7	2003	3
1020954	BASTIAENSDR Y Q	211130	Ubiquitous Computing	2	2003	2
1020954	BASTIAENSDR Y Q	212010	Informatiesystemen	6	2003	3
1020954	BASTIAENSDR Y Q	212018	Kennistechnologie voor bedrijfskundige toep.	8	2003	4
1020954	BASTIAENSDR Y Q	212018	Kennistechnologie voor bedrijfskundige toep.	7	2003	2
1020954	BASTIAENSDR Y Q	214010	Complexiteit van berekeningen	2	2003	3
1020954	BASTIAENSDR Y Q	214025	Algoritmen,datastructuren en complexiteit plus	5	2003	4
1020954	BASTIAENSDR Y Q	214510	MMI-project	8	2003	3
1020954	BASTIAENSDR Y Q	232016	Prestatie-analyse van informatiesystemen	6	2003	2
1020954	BASTIAENSDR Y Q	232085	Voortgezette Requirements Engineering	9	2003	4
1020954	BASTIAENSDR Y Q	236002	Beheer van ICT voorzieningen	9	2003	3
1020954	BASTIAENSDR Y Q	237201	Oriëntatie ICT	9	2002	3
1020954	BASTIAENSDR Y Q	239805	BIT-BV	1	2003	4
1020954	BASTIAENSDR Y Q	239981	Integratieproject	2	1999	3
1020954	BASTIAENSDR Y Q	239981	Integratieproject	5	1999	1
1020954	BASTIAENSDR Y Q	261010	Computer netwerken	5	2003	3
1020954	BASTIAENSDR Y Q	262001	Mobile and wireless networking	2	2003	2
1020954	BASTIAENSDR Y Q	265201	Middleware for distributed objects	4	2003	3
1021484	COUVROIRS M	234020	Ontwerpen van mens-machine interactie	8	2003	4
1021484	COUVROIRS M	235022	Investeringen in informatietechnologie	1	2003	2
1021484	COUVROIRS M	239981	Integratieproject	8	2003	3
1021484	COUVROIRS M	239981	Integratieproject	4	2003	2
1021484	COUVROIRS M	263000	Telematicadiensten	5	2003	1
1021484	COUVROIRS M	265110	Protocol Engineering	6	2003	1
1021484	COUVROIRS M	265200	Implementatie van telematicasystemen	9	2003	4
1021484	COUVROIRS M	265201	Middleware for distributed objects	7	2002	4
1021484	COUVROIRS M	266100	Patterns of software development	4	2003	4
1022489	OOMCKENS F Q	121003	Elektronische functies	2	2003	3
1022489	OOMCKENS F Q	121007	Elektromagnetische Veldtheorie	8	2002	1
1022489	OOMCKENS F Q	121008	Practicum Elektromagnetische Veldtheorie	9	2002	1
1022489	OOMCKENS F Q	121021	Inleiding in de biomedische technologie	6	2002	4
1022489	OOMCKENS F Q	121042	Meettechniek	9	2003	3
1022489	OOMCKENS F Q	121050	Modern robotics	4	2003	3
1022489	OOMCKENS F Q	121052	Imaging	1	2003	3
1022489	OOMCKENS F Q	121054	Neurotechnologie	4	2003	4
1022489	OOMCKENS F Q	121056	Laboratorium op een chip	4	2003	3
1022489	OOMCKENS F Q	121057	Bio-elektriciteit	8	2003	2
1022489	OOMCKENS F Q	121067	Signaal analyse practicum	4	2002	4
1022489	OOMCKENS F Q	122230	Integrated circuits and systems for mixed signals	6	2003	4
1022489	OOMCKENS F Q	122733	VLSI signal processing	8	2003	2
1022489	OOMCKENS F Q	122816	Mechanica en transductietechniek	7	2002	3
1022489	OOMCKENS F Q	122816	Mechanica en transductietechniek	7	2003	4
1022489	OOMCKENS F Q	122833	Integratieproject	6	2003	2
1022489	OOMCKENS F Q	123140	Inleiding systeem- en signaaltheorie voor HBO	9	2003	3
1022489	OOMCKENS F Q	123153	Embedded Signal Processing	4	2003	1
1022489	OOMCKENS F Q	124177	Inleiding elektrische energietechniek	6	2002	4
1022489	OOMCKENS F Q	125119	Signaaltheorie	6	2003	4
1022489	OOMCKENS F Q	125159	Optische communicatienetwerken	8	2003	4
1022489	OOMCKENS F Q	125163	Electromagnetische compatibiliteit	8	2003	4
1022489	OOMCKENS F Q	127117	Biomechatronica	1	2001	3
1022489	OOMCKENS F Q	127117	Biomechatronica	6	2003	2
1022489	OOMCKENS F Q	129351	Fysiologie II	7	2003	1
1022489	OOMCKENS F Q	150500	Presentatie van een wiskundig onderwerp	8	2003	1
1022489	OOMCKENS F Q	150528	Wiskundig modelleren III	7	2003	3
1022489	OOMCKENS F Q	150532	Maple practicum	4	2003	4
1022489	OOMCKENS F Q	150910	Advanced modelling	5	2003	4
1022489	OOMCKENS F Q	151012	Calculus I	4	2003	4
1022489	OOMCKENS F Q	151039	Algebra	4	2003	4
1022489	OOMCKENS F Q	151051	Fundamentele analyse I	7	2003	1
1022489	OOMCKENS F Q	151070	Kwantitatieve methoden	6	2002	4
1022489	OOMCKENS F Q	151073	Calculus III	3	2003	4
1022489	OOMCKENS F Q	151082	Wiskunde II	8	2003	4
1022489	OOMCKENS F Q	151092	Modelvorming II	1	2003	2
1022489	OOMCKENS F Q	151120	Wiskunde I	7	2003	4
1022489	OOMCKENS F Q	151130	Wiskunde II	9	2003	4
1022489	OOMCKENS F Q	151202	Calculus B	4	2003	3
1022489	OOMCKENS F Q	151208	Lineaire Algebra B	8	2003	3
1022489	OOMCKENS F Q	151250	Modellen en systemen	9	2003	4
1022489	OOMCKENS F Q	152100	Calculus I	5	2003	4
1022489	OOMCKENS F Q	153003	Kansrekening	8	2003	3
1022489	OOMCKENS F Q	153008	Kansrekening en statistiek	1	2003	3
1022489	OOMCKENS F Q	153016	Voortgezette wiskundige statistiek	5	2003	3
1022489	OOMCKENS F Q	153065	Markov ketens	4	2003	4
1022489	OOMCKENS F Q	153086	Telecommunicatiesystemen	8	2003	4
1022489	OOMCKENS F Q	153087	Wachttijdtheorie	9	2003	3
1022489	OOMCKENS F Q	153088	Stochastische modellen voor Operations Management	5	2003	3
1022489	OOMCKENS F Q	153100	Statistiek	5	2003	3
1022489	OOMCKENS F Q	155019	Practicum softwarepakketten PDV	7	2003	3
1022489	OOMCKENS F Q	156029	Analyse C	5	2003	3
1022489	OOMCKENS F Q	156068	Niet-lineaire besturingstheorie	8	2003	3
1022489	OOMCKENS F Q	156080	Signalen en transformaties	8	2003	3
1022489	OOMCKENS F Q	158017	Operationele research I	7	2003	4
1022489	OOMCKENS F Q	159918	Bibliotheekgebruik en literatuuropdracht	9	2003	3
1022489	OOMCKENS F Q	159927	Doctoraalstage	4	2003	4
1022489	OOMCKENS F Q	211022	Programmeren in C++	2	2003	3
1022489	OOMCKENS F Q	211123	Component- en aspect georienteerd progammeren	2	2003	1
1022489	OOMCKENS F Q	213001	Basisbegrippen digitale techniek	6	2002	3
1022489	OOMCKENS F Q	213014	Procesbesturing en robotica	8	2003	3
1022489	OOMCKENS F Q	213120	Inleiding informatie- en communicatietechnologie	3	2003	4
1022489	OOMCKENS F Q	213130	Computer Organisatie INF/TEL	9	2003	3
1022489	OOMCKENS F Q	213540	Advanced Design of Software Architectures	8	2003	3
1022489	OOMCKENS F Q	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	3
1022489	OOMCKENS F Q	214511	Database Project	4	2003	3
1022489	OOMCKENS F Q	214513	Internet & Web Architecturen	1	2003	4
1022489	OOMCKENS F Q	219801	Hypermedia structuren en systemen	5	2003	1
1022489	OOMCKENS F Q	232016	Prestatie-analyse van informatiesystemen	1	2002	4
1022489	OOMCKENS F Q	232060	Multi-agent systemen	6	2003	4
1022489	OOMCKENS F Q	233030	Specificeren van informatiesystemen	5	2003	3
1022489	OOMCKENS F Q	233035	Practicum Databases in Informatiesystemen	3	2002	3
1022489	OOMCKENS F Q	233035	Practicum Databases in Informatiesystemen	8	2003	4
1022489	OOMCKENS F Q	234001	Productie-informatietechnologie	4	2003	3
1022489	OOMCKENS F Q	234010	Invoering van IT in organisaties	4	2003	4
1022489	OOMCKENS F Q	237400	BedrijfsProces Ondersteuning	7	2003	1
1022489	OOMCKENS F Q	237500	BP lab	8	2003	3
1022489	OOMCKENS F Q	237600	Business Case Development for IT-projects	7	2003	3
1022489	OOMCKENS F Q	237600	Business Case Development for IT-projects	6	2003	1
1022489	OOMCKENS F Q	239981	Integratieproject	4	1999	3
1022489	OOMCKENS F Q	239981	Integratieproject	7	2000	4
1022489	OOMCKENS F Q	262000	Telematicanetwerken	7	2003	4
1022489	OOMCKENS F Q	263000	Telematicadiensten	5	2003	1
1022489	OOMCKENS F Q	265200	Implementatie van telematicasystemen	4	2003	1
1022489	OOMCKENS F Q	269100	P-project TEL	9	2003	2
1022551	HASSINCK F Y	121003	Elektronische functies	7	2003	3
1022551	HASSINCK F Y	121004	Practicum elektronische functies	4	2003	2
1022551	HASSINCK F Y	121005	Netwerkanalyse	9	2003	1
1022551	HASSINCK F Y	121006	Practicum Meetinstrumenten/Netwerkanalyse	5	2003	3
1022551	HASSINCK F Y	121007	Elektromagnetische Veldtheorie	1	2003	3
1022551	HASSINCK F Y	121007	Elektromagnetische Veldtheorie	6	2002	1
1022551	HASSINCK F Y	121007	Elektromagnetische Veldtheorie	6	2003	1
1022551	HASSINCK F Y	121008	Practicum Elektromagnetische Veldtheorie	4	2003	1
1022551	HASSINCK F Y	121009	Inleiding telecommunicatie	6	2003	4
1022551	HASSINCK F Y	121017	D1-project	8	2003	4
1022551	HASSINCK F Y	121025	Digitale beeldbewerking voor beta	2	2003	3
1022551	HASSINCK F Y	121043	Dynamische systemen	9	2003	2
1022551	HASSINCK F Y	121052	Imaging	5	2003	3
1022551	HASSINCK F Y	121053	Zekere- en onzekere informatie	9	2003	3
1022551	HASSINCK F Y	121056	Laboratorium op een chip	7	2003	3
1022551	HASSINCK F Y	121709	Reliability Engineering	5	2002	4
1022551	HASSINCK F Y	121717	Advanced semiconductor devices	7	2003	3
1022551	HASSINCK F Y	122740	Netwerkanalyse voor TEL	6	2003	3
1022551	HASSINCK F Y	122815	Materiaalkunde van microsystemen	3	2003	4
1022551	HASSINCK F Y	122816	Mechanica en transductietechniek	2	2002	2
1022551	HASSINCK F Y	122821	Microtechnologie t.b.v. transducenten	9	2003	3
1022551	HASSINCK F Y	122833	Integratieproject	5	2003	4
1022551	HASSINCK F Y	123112	Moderne modulatie- en detectietechnieken	9	2003	4
1022551	HASSINCK F Y	123152	Signal processing in acoustics and audio	8	2003	1
1022551	HASSINCK F Y	124151	Mechatronica	7	2003	2
1022551	HASSINCK F Y	124177	Inleiding elektrische energietechniek	4	2002	4
1022551	HASSINCK F Y	127117	Biomechatronica	4	2003	3
1022551	HASSINCK F Y	129347	Deelname aan een project	5	2003	4
1022551	HASSINCK F Y	129351	Fysiologie II	5	2003	1
1022551	HASSINCK F Y	129354	Literatuuronderzoek	7	2003	4
1022551	HASSINCK F Y	129367	Individual project	5	2003	3
1022551	HASSINCK F Y	150433	Wiskundig modelleren voor CiT	7	2003	4
1022551	HASSINCK F Y	150500	Presentatie van een wiskundig onderwerp	8	2003	1
1022551	HASSINCK F Y	150528	Wiskundig modelleren III	5	2003	3
1022551	HASSINCK F Y	150700	Introduction to operations research	5	2003	4
1022551	HASSINCK F Y	151015	Numerieke lineaire algebra	8	2003	3
1022551	HASSINCK F Y	151070	Kwantitatieve methoden	2	2002	4
1022551	HASSINCK F Y	151070	Kwantitatieve methoden	8	2003	1
1022551	HASSINCK F Y	151120	Wiskunde I	9	2003	4
1022551	HASSINCK F Y	151150	Wiskunde IV	8	2003	3
1022551	HASSINCK F Y	151530	Continuous Time Finance	1	2003	4
1022551	HASSINCK F Y	152006	Lineaire structuren	8	2003	4
1022551	HASSINCK F Y	152038	Grafentheorie	4	2003	2
1022551	HASSINCK F Y	152120	Lineaire algebra	9	2003	4
1022551	HASSINCK F Y	153036	Statistiek II	5	2003	4
1022551	HASSINCK F Y	153045	Lineaire statistische modellen	6	2003	4
1022551	HASSINCK F Y	153081	Stochastische modellen v. telecommunicatie syst.	8	2003	2
1022551	HASSINCK F Y	153086	Telecommunicatiesystemen	8	2003	4
1022551	HASSINCK F Y	154021	Numerieke wiskunde en programmeermethoden	7	2003	1
1022551	HASSINCK F Y	154023	Numerieke wiskunde en programmeermethoden	7	2003	3
1022551	HASSINCK F Y	156014	Analyse B	6	2003	4
1022551	HASSINCK F Y	156016	Analyse B	4	2003	1
1022551	HASSINCK F Y	158075	Deterministische modellen in de OR	6	2002	4
1022551	HASSINCK F Y	211022	Programmeren in C++	6	2003	3
1022551	HASSINCK F Y	211027	Inleiding programmeren met MATLAB	5	2003	3
1022551	HASSINCK F Y	211038	Spraak- en taaltechnologie	5	2002	3
1022551	HASSINCK F Y	211081	Distributed E-business Techniques	9	2003	3
1022551	HASSINCK F Y	211111	Parallelle processen	8	2003	3
1022551	HASSINCK F Y	211112	Inleiding Logica	7	2003	4
1022551	HASSINCK F Y	211185	Taal- en rekenmodellen	7	2003	4
1022551	HASSINCK F Y	213002	Ontwerpen van digitale systemen	9	2003	4
1022551	HASSINCK F Y	213011	Gedistribueerde systemen	2	2003	4
1022551	HASSINCK F Y	213013	Real-time embedded systemen	9	2003	3
1022551	HASSINCK F Y	213125	Computersystemen	4	2003	4
1022551	HASSINCK F Y	213520	Formele Methoden voor Software Engineering	8	2003	4
1022551	HASSINCK F Y	213540	Advanced Design of Software Architectures	8	2003	3
1022551	HASSINCK F Y	214010	Complexiteit van berekeningen	6	2003	3
1022551	HASSINCK F Y	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2003	3
1022551	HASSINCK F Y	214513	Internet & Web Architecturen	9	2002	2
1022551	HASSINCK F Y	214513	Internet & Web Architecturen	8	2003	2
1022551	HASSINCK F Y	234010	Invoering van IT in organisaties	8	2003	4
1022771	ES N J	237400	BedrijfsProces Ondersteuning	8	2003	1
1022551	HASSINCK F Y	235022	Investeringen in informatietechnologie	6	2003	4
1022551	HASSINCK F Y	237450	Bedrijfsfunctie ondersteuning	9	2003	3
1022551	HASSINCK F Y	239981	Integratieproject	6	1999	1
1022551	HASSINCK F Y	239981	Integratieproject	5	2001	2
1022551	HASSINCK F Y	261000	Telematicasystemen en toepassingen	5	2003	2
1022551	HASSINCK F Y	262001	Mobile and wireless networking	9	2003	2
1022551	HASSINCK F Y	264001	Telematics and business strategies	5	2003	2
1022551	HASSINCK F Y	266100	Patterns of software development	9	2003	2
1022771	ES N J	121003	Elektronische functies	9	2003	3
1022771	ES N J	121007	Elektromagnetische Veldtheorie	4	2001	4
1022771	ES N J	121007	Elektromagnetische Veldtheorie	7	2002	1
1022771	ES N J	121007	Elektromagnetische Veldtheorie	8	2003	1
1022771	ES N J	121009	Inleiding telecommunicatie	5	2003	4
1022771	ES N J	121018	Stage	6	2003	1
1022771	ES N J	121021	Inleiding in de biomedische technologie	4	2002	4
1022771	ES N J	121026	Hands-on dig.image proces. and graphical pres.	4	2003	4
1022771	ES N J	121043	Dynamische systemen	9	2003	4
1022771	ES N J	121044	Regeltechniek	5	2003	2
1022771	ES N J	121045	Project Mechatronica	7	2001	4
1022771	ES N J	121045	Project Mechatronica	8	2002	4
1022771	ES N J	121045	Project Mechatronica	4	2002	2
1022771	ES N J	121053	Zekere- en onzekere informatie	9	2003	2
1022771	ES N J	121054	Neurotechnologie	2	2003	4
1022771	ES N J	121062	Eind P-project	6	2003	4
1022771	ES N J	121067	Signaal analyse practicum	5	2002	4
1022771	ES N J	122481	Systems engineering	5	2003	3
1022771	ES N J	122728	Classification, Estimation and Data Analysis	9	2003	4
1022771	ES N J	122729	Image processing	6	2003	4
1022771	ES N J	122814	Elektromagnetisme II voor HBO	5	2003	4
1022771	ES N J	122831	Geintegreerde optica	5	2003	2
1022771	ES N J	123152	Signal processing in acoustics and audio	4	2003	1
1022771	ES N J	124151	Mechatronica	7	2002	4
1022771	ES N J	125114	Prestatieanalyse van communicatienetwerken	7	2003	4
1022771	ES N J	125118	Practicum informatie-overdracht	5	2003	3
1022771	ES N J	125153	Inleiding communicatiesystemen	7	2003	3
1022771	ES N J	127116	Elektromagnetisme I voor HBO	8	2003	3
1022771	ES N J	127117	Biomechatronica	9	2003	3
1022771	ES N J	127117	Biomechatronica	7	2003	2
1022771	ES N J	150433	Wiskundig modelleren voor CiT	1	2003	4
1022771	ES N J	150500	Presentatie van een wiskundig onderwerp	8	2003	1
1022771	ES N J	150528	Wiskundig modelleren III	5	2003	3
1022771	ES N J	150810	Modelling project	9	2003	3
1022771	ES N J	151018	Analyse A	5	2003	3
1022771	ES N J	151025	Functionaalanalyse II	5	2003	3
1022771	ES N J	151033	Numerieke analyse	7	2003	3
1022771	ES N J	151044	Analyse C	9	2003	3
1022771	ES N J	151092	Modelvorming II	4	2003	2
1022771	ES N J	151120	Wiskunde I	5	2003	4
1022771	ES N J	151130	Wiskunde II	1	2003	4
1022771	ES N J	151550	Life Insurance	4	2003	4
1022771	ES N J	152070	Meetkunde	9	2003	1
1022771	ES N J	152120	Lineaire algebra	5	2003	4
1022771	ES N J	153003	Kansrekening	2	2003	3
1022771	ES N J	153006	Kansrekening	7	2003	3
1022771	ES N J	153026	Asymptotische technieken in de statistiek	5	2003	3
1022771	ES N J	153031	Statistiek	9	2003	3
1022771	ES N J	153039	Kansrekening en statistiek	9	2003	3
1022771	ES N J	153055	Parametervrije statistische methoden	3	2003	3
1022771	ES N J	153087	Wachttijdtheorie	1	2003	3
1022771	ES N J	154021	Numerieke wiskunde en programmeermethoden	6	2003	3
1022771	ES N J	154023	Numerieke wiskunde en programmeermethoden	6	2003	3
1022771	ES N J	154023	Numerieke wiskunde en programmeermethoden	9	2003	1
1022771	ES N J	156029	Analyse C	4	2003	3
1022771	ES N J	156056	Inleiding wiskundige systeemtheorie	4	2003	4
1022771	ES N J	157004	Stochastische processen in financien	9	2003	3
1022771	ES N J	157009	Tijdreeksenanalyse en identificatietheorie	9	2003	3
1022771	ES N J	157030	Structured Products	7	2003	3
1022771	ES N J	211022	Programmeren in C++	6	2003	3
1022771	ES N J	211027	Inleiding programmeren met MATLAB	8	2003	3
1022771	ES N J	211038	Spraak- en taaltechnologie	6	2003	4
1022771	ES N J	211038	Spraak- en taaltechnologie	8	2003	1
1022771	ES N J	211047	Besturingssystemen voor Telematica	6	2003	4
1022771	ES N J	211077	Database-ontwerp	7	2003	4
1022771	ES N J	121005	Netwerkanalyse	3	2003	1
1022771	ES N J	211081	Distributed E-business Techniques	7	2003	3
1022771	ES N J	211081	Distributed E-business Techniques	8	2003	1
1022771	ES N J	211130	Ubiquitous Computing	8	2003	3
1022771	ES N J	211131	Statische Objectanalyse en Typering	4	2003	4
1022771	ES N J	211185	Taal- en rekenmodellen	9	2003	4
1022771	ES N J	213001	Basisbegrippen digitale techniek	6	2002	3
1022771	ES N J	213505	Programmeren 2	4	2003	4
1022771	ES N J	213530	Concurrent and distributed programming	8	2003	4
1022771	ES N J	214513	Internet & Web Architecturen	4	2003	4
1022771	ES N J	232050	Electronic Commerce	6	2003	2
1022771	ES N J	232055	XML-technologie in E-Commerce	6	2003	4
1022771	ES N J	232060	Multi-agent systemen	8	2003	4
1022771	ES N J	232060	Multi-agent systemen	8	2003	2
1022771	ES N J	234004	Softwaremanagement	4	2003	3
1022771	ES N J	234020	Ontwerpen van mens-machine interactie	8	2003	4
1022771	ES N J	235005	Inleiding bedrijfsinformatiesystemen	9	2003	3
1022771	ES N J	236050	E-health Strategies	6	2003	4
1022771	ES N J	237201	Oriëntatie ICT	6	2003	4
1022771	ES N J	237600	Business Case Development for IT-projects	6	2003	1
1022771	ES N J	239801	BIT-BV 2	6	2003	4
1022771	ES N J	262000	Telematicanetwerken	7	2003	4
1023211	SIJTSEMA R	121003	Elektronische functies	1	2003	3
1023211	SIJTSEMA R	121008	Practicum Elektromagnetische Veldtheorie	8	2002	4
1023211	SIJTSEMA R	121025	Digitale beeldbewerking voor beta	1	2003	3
1023211	SIJTSEMA R	121035	Mid P-project	3	2003	3
1023211	SIJTSEMA R	121045	Project Mechatronica	2	2001	4
1023211	SIJTSEMA R	121049	Practicum Medische Elektronica	4	2003	3
1023211	SIJTSEMA R	121052	Imaging	6	2003	3
1023211	SIJTSEMA R	121054	Neurotechnologie	4	2003	4
1023211	SIJTSEMA R	121067	Signaal analyse practicum	4	2002	4
1023211	SIJTSEMA R	121709	Reliability Engineering	3	2003	2
1023211	SIJTSEMA R	122227	Voortgezette analoge IC elektronica	1	2003	2
1023211	SIJTSEMA R	122831	Geintegreerde optica	5	2003	3
1023211	SIJTSEMA R	123152	Signal processing in acoustics and audio	6	2003	1
1023211	SIJTSEMA R	123153	Embedded Signal Processing	5	2003	1
1023211	SIJTSEMA R	124113	Optimal estimation in dynamic systems	8	2003	3
1023211	SIJTSEMA R	124176	Digitale Regeltechniek	3	2003	3
1023211	SIJTSEMA R	124177	Inleiding elektrische energietechniek	9	2003	3
1023211	SIJTSEMA R	124177	Inleiding elektrische energietechniek	6	2002	1
1023211	SIJTSEMA R	124177	Inleiding elektrische energietechniek	1	2003	1
1023211	SIJTSEMA R	125113	Analoge communicatietechniek	6	2003	4
1023211	SIJTSEMA R	125118	Practicum informatie-overdracht	4	2003	3
1023211	SIJTSEMA R	125152	Glasvezelcommunicatie	7	2003	2
1023211	SIJTSEMA R	127116	Elektromagnetisme I voor HBO	6	2003	2
1023211	SIJTSEMA R	129348	Maken van een scriptie	9	2003	3
1023211	SIJTSEMA R	129351	Fysiologie II	7	2003	1
1023211	SIJTSEMA R	129362	Start P-project	9	2003	3
1023211	SIJTSEMA R	150539	Maple practicum	9	2003	4
1023211	SIJTSEMA R	150620	Systems and signals	6	2003	3
1023211	SIJTSEMA R	150630	Applied functional analysis	5	2003	4
1023211	SIJTSEMA R	150730	Experimental design	9	2003	3
1023211	SIJTSEMA R	151012	Calculus I	3	2003	4
1023211	SIJTSEMA R	151019	Analyse B	9	2003	4
1023211	SIJTSEMA R	151020	Functionaalanalyse I	6	2003	3
1023211	SIJTSEMA R	151039	Algebra	8	2003	4
1023211	SIJTSEMA R	151044	Analyse C	6	2003	3
1023211	SIJTSEMA R	151051	Fundamentele analyse I	9	2003	1
1023211	SIJTSEMA R	151070	Kwantitatieve methoden	5	2003	1
1023211	SIJTSEMA R	151082	Wiskunde II	2	2003	4
1023211	SIJTSEMA R	151093	Modelvorming III	3	2003	1
1023211	SIJTSEMA R	151130	Wiskunde II	8	2003	4
1023211	SIJTSEMA R	151204	Calculus C	3	2003	4
1023211	SIJTSEMA R	151210	Wiskunde A	1	2003	4
1023211	SIJTSEMA R	151215	Wiskunde B	5	2003	4
1023211	SIJTSEMA R	151510	Introduction to Risk Theory	4	2003	3
1023211	SIJTSEMA R	152006	Lineaire structuren	6	2003	4
1023211	SIJTSEMA R	152056	Combinatoriek	5	2003	4
1023211	SIJTSEMA R	152061	Discrete wiskunde	8	2003	3
1023211	SIJTSEMA R	152068	Discrete wiskunde	4	2003	3
1023211	SIJTSEMA R	152100	Calculus I	6	2003	4
1023211	SIJTSEMA R	152110	Calculus II	4	2003	3
1023211	SIJTSEMA R	153004	Statistiek I	8	2003	3
1023211	SIJTSEMA R	153032	Kansrekening en stochastische processen	6	2003	4
1023211	SIJTSEMA R	153065	Markov ketens	8	2003	4
1023211	SIJTSEMA R	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	2
1023211	SIJTSEMA R	154021	Numerieke wiskunde en programmeermethoden	5	2003	3
1023211	SIJTSEMA R	156080	Signalen en transformaties	7	2003	3
1023211	SIJTSEMA R	157009	Tijdreeksenanalyse en identificatietheorie	4	2003	3
1023211	SIJTSEMA R	158018	Operationele research I, practicum	3	2003	4
1023211	SIJTSEMA R	158022	Operationele research III	5	2003	3
1023211	SIJTSEMA R	159960	Multidisciplinaire ontwerpopdracht	9	2003	3
1023211	SIJTSEMA R	211024	Programmeren in C++	9	2003	4
1023211	SIJTSEMA R	211038	Spraak- en taaltechnologie	8	2001	3
1023211	SIJTSEMA R	211038	Spraak- en taaltechnologie	6	2003	4
1023211	SIJTSEMA R	211078	Database-ontwerp	9	2003	4
1023211	SIJTSEMA R	211095	Gedistribueerde databases & middleware technologie	9	2003	1
1023211	SIJTSEMA R	211096	XML & Databases	4	2003	1
1023211	SIJTSEMA R	212018	Kennistechnologie voor bedrijfskundige toep.	4	2003	4
1023211	SIJTSEMA R	213001	Basisbegrippen digitale techniek	4	2003	4
1023211	SIJTSEMA R	213130	Computer Organisatie INF/TEL	5	2003	3
1023211	SIJTSEMA R	213130	Computer Organisatie INF/TEL	9	2003	2
1023211	SIJTSEMA R	213530	Concurrent and distributed programming	8	2002	4
1023211	SIJTSEMA R	214501	Communicatie & ontwerpen in ICT-projecten 2	5	2003	3
1023211	SIJTSEMA R	219801	Hypermedia structuren en systemen	8	2003	4
1023211	SIJTSEMA R	219910	Ontwerpproject	7	2003	3
1023211	SIJTSEMA R	232055	XML-technologie in E-Commerce	4	2003	1
1023211	SIJTSEMA R	234020	Ontwerpen van mens-machine interactie	7	2003	4
1023211	SIJTSEMA R	234020	Ontwerpen van mens-machine interactie	8	2003	1
1023211	SIJTSEMA R	237400	BedrijfsProces Ondersteuning	6	2003	1
1023211	SIJTSEMA R	237450	Bedrijfsfunctie ondersteuning	8	2003	3
1023211	SIJTSEMA R	239981	Integratieproject	2	2000	4
1023211	SIJTSEMA R	239981	Integratieproject	8	2003	3
1023211	SIJTSEMA R	239981	Integratieproject	3	2001	2
1023211	SIJTSEMA R	261000	Telematicasystemen en toepassingen	4	2003	2
1023211	SIJTSEMA R	269100	P-project TEL	4	2003	2
1023494	VELTHUIS P	121003	Elektronische functies	8	2003	2
1023494	VELTHUIS P	121019	D-opdracht	9	2003	3
1023494	VELTHUIS P	121021	Inleiding in de biomedische technologie	2	2003	2
1023494	VELTHUIS P	121026	Hands-on dig.image proces. and graphical pres.	7	2002	3
1023494	VELTHUIS P	269001	Portfolio ontwerp	9	2003	4
1023494	VELTHUIS P	121034	Fysische modelvorming van embedded systemen	5	2003	4
1023494	VELTHUIS P	121043	Dynamische systemen	8	2003	4
1023494	VELTHUIS P	121053	Zekere- en onzekere informatie	9	2003	2
1023494	VELTHUIS P	121054	Neurotechnologie	3	2003	4
1023494	VELTHUIS P	121057	Bio-elektriciteit	6	2003	2
1023494	VELTHUIS P	121706	Halfgeleiderdevices	7	2003	3
1023494	VELTHUIS P	121706	Halfgeleiderdevices	8	2003	1
1023494	VELTHUIS P	121709	Reliability Engineering	8	2003	4
1023494	VELTHUIS P	121709	Reliability Engineering	9	2003	2
1023494	VELTHUIS P	121714	I.C. technologie	4	2003	2
1023494	VELTHUIS P	121717	Advanced semiconductor devices	6	2003	3
1023494	VELTHUIS P	122230	Integrated circuits and systems for mixed signals	5	2003	2
1023494	VELTHUIS P	122733	VLSI signal processing	2	2003	2
1023494	VELTHUIS P	122829	Systemen en technieken voor informatieopslag	7	2003	4
1023494	VELTHUIS P	122831	Geintegreerde optica	8	2003	3
1023494	VELTHUIS P	122831	Geintegreerde optica	5	2003	2
1023494	VELTHUIS P	123140	Inleiding systeem- en signaaltheorie voor HBO	6	2003	3
1023494	VELTHUIS P	123152	Signal processing in acoustics and audio	8	2002	4
1023494	VELTHUIS P	124162	Modelvorming en simulatie	6	2003	4
1023494	VELTHUIS P	124176	Digitale Regeltechniek	4	2003	3
1023494	VELTHUIS P	125118	Practicum informatie-overdracht	9	2003	2
1023494	VELTHUIS P	125119	Signaaltheorie	2	2003	4
1023494	VELTHUIS P	125151	Schakel- en controlesystemen v. Multi-service netw	6	2003	1
1023494	VELTHUIS P	125152	Glasvezelcommunicatie	5	2003	2
1023494	VELTHUIS P	127115	Praktische biomedische signaalanalyse	2	2003	4
1023494	VELTHUIS P	127116	Elektromagnetisme I voor HBO	6	2003	2
1023494	VELTHUIS P	129348	Maken van een scriptie	8	2003	3
1023494	VELTHUIS P	129358	Maken van een scriptie	5	2003	3
1023494	VELTHUIS P	129367	Individual project	7	2003	3
1023494	VELTHUIS P	150432	Maple practicum II	5	2003	4
1023494	VELTHUIS P	150433	Wiskundig modelleren voor CiT	3	2003	4
1023494	VELTHUIS P	150529	Wiskundig modelleren IV	5	2003	4
1023494	VELTHUIS P	150600	Mathematical methods	5	2003	3
1023494	VELTHUIS P	150620	Systems and signals	4	2003	3
1023494	VELTHUIS P	150700	Introduction to operations research	7	2003	4
1023494	VELTHUIS P	150730	Experimental design	7	2003	3
1023494	VELTHUIS P	151070	Kwantitatieve methoden	1	2002	4
1023494	VELTHUIS P	151092	Modelvorming II	4	2003	4
1023494	VELTHUIS P	151093	Modelvorming III	9	2003	1
1023494	VELTHUIS P	151120	Wiskunde I	2	2003	4
1023494	VELTHUIS P	151200	Calculus A	9	2003	3
1023494	VELTHUIS P	151220	Wiskunde C	8	2003	3
1023494	VELTHUIS P	151570	Financial Engineering	4	2003	3
1023494	VELTHUIS P	152006	Lineaire structuren	1	2003	4
1023494	VELTHUIS P	152056	Combinatoriek	5	2003	4
1023494	VELTHUIS P	152068	Discrete wiskunde	6	2003	3
1023494	VELTHUIS P	153028	Statistiek I	6	2003	4
1023494	VELTHUIS P	153041	Inleiding statistiek	6	2003	4
1023494	VELTHUIS P	153086	Telecommunicatiesystemen	1	2003	4
1023494	VELTHUIS P	155009	Fundamenten van de methode der eindige elementen	1	2003	3
1023494	VELTHUIS P	155010	Part. differentiaalverg. uit de math. fysica	2	2003	2
1023494	VELTHUIS P	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	8	2003	3
1023494	VELTHUIS P	156012	Gewone differentiaalvergelijkingen	5	2003	3
1023494	VELTHUIS P	156062	Systeem- en besturingstheorie	5	2003	4
1023494	VELTHUIS P	156066	Besturingstheorie van economische systemen	4	2003	4
1023494	VELTHUIS P	156067	Robust Control	1	2003	4
1023494	VELTHUIS P	157016	Stochastische filter- en besturingstheorie	4	2003	3
1023494	VELTHUIS P	157021	Analyse van signaaloverdracht in communicatienetw.	4	2003	4
1023494	VELTHUIS P	158070	Grafentheorie en operationele research	8	2003	3
1023494	VELTHUIS P	158075	Deterministische modellen in de OR	7	2003	1
1023494	VELTHUIS P	159927	Doctoraalstage	4	2003	4
1023494	VELTHUIS P	211038	Spraak- en taaltechnologie	7	2001	3
1023494	VELTHUIS P	211038	Spraak- en taaltechnologie	4	2003	4
1023494	VELTHUIS P	211038	Spraak- en taaltechnologie	4	2002	1
1023494	VELTHUIS P	211045	Besturingssystemen	6	2003	2
1023494	VELTHUIS P	211050	Structuur van programmeertalen	7	2003	3
1023494	VELTHUIS P	211113	Constraint Logic Programming	9	2003	4
1023494	VELTHUIS P	213001	Basisbegrippen digitale techniek	8	2003	4
1023494	VELTHUIS P	213001	Basisbegrippen digitale techniek	6	2003	2
1023494	VELTHUIS P	213011	Gedistribueerde systemen	9	2003	4
1023494	VELTHUIS P	213012	Hardware/software co-design	8	2003	2
1023494	VELTHUIS P	213130	Computer Organisatie INF/TEL	7	2003	3
1023494	VELTHUIS P	213530	Concurrent and distributed programming	3	2003	2
1023494	VELTHUIS P	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2003	3
1023494	VELTHUIS P	214501	Communicatie & ontwerpen in ICT-projecten 2	7	2003	3
1023494	VELTHUIS P	232050	Electronic Commerce	1	2003	2
1023494	VELTHUIS P	232060	Multi-agent systemen	5	2003	4
1023494	VELTHUIS P	232060	Multi-agent systemen	8	2003	2
1023494	VELTHUIS P	233035	Practicum Databases in Informatiesystemen	7	2002	1
1023494	VELTHUIS P	234001	Productie-informatietechnologie	9	2003	3
1023494	VELTHUIS P	235005	Inleiding bedrijfsinformatiesystemen	6	2003	3
1023494	VELTHUIS P	237400	BedrijfsProces Ondersteuning	1	2003	3
1023494	VELTHUIS P	239805	BIT-BV	9	2003	4
1023494	VELTHUIS P	239981	Integratieproject	6	1998	3
1023494	VELTHUIS P	239981	Integratieproject	2	1999	1
1023494	VELTHUIS P	261010	Computer netwerken	5	2003	3
1023494	VELTHUIS P	264001	Telematics and business strategies	5	2003	4
1023494	VELTHUIS P	265100	Ontwerpen van telematicasystemen	4	2003	1
1023494	VELTHUIS P	265200	Implementatie van telematicasystemen	4	2003	4
1023494	VELTHUIS P	266100	Patterns of software development	5	2003	4
1024063	STOFFER U	121003	Elektronische functies	4	2003	3
1024063	STOFFER U	121005	Netwerkanalyse	3	2003	3
1024063	STOFFER U	121007	Elektromagnetische Veldtheorie	5	2002	1
1024063	STOFFER U	121007	Elektromagnetische Veldtheorie	8	2003	1
1024063	STOFFER U	121017	D1-project	7	2003	4
1024063	STOFFER U	121021	Inleiding in de biomedische technologie	4	2002	2
1024063	STOFFER U	121022	Neurofysiologie	1	2003	4
1024063	STOFFER U	121035	Mid P-project	7	2002	1
1024063	STOFFER U	121041	Elektrodynamica	5	2003	4
1024063	STOFFER U	121044	Regeltechniek	8	2003	2
1024063	STOFFER U	121045	Project Mechatronica	5	2003	3
1024063	STOFFER U	121045	Project Mechatronica	5	2003	1
1024063	STOFFER U	121052	Imaging	7	2003	3
1024063	STOFFER U	121053	Zekere- en onzekere informatie	3	2003	2
1024063	STOFFER U	121056	Laboratorium op een chip	1	2003	3
1024063	STOFFER U	121706	Halfgeleiderdevices	3	2003	3
1024063	STOFFER U	121709	Reliability Engineering	7	2003	4
1024063	STOFFER U	121709	Reliability Engineering	8	2003	2
1024063	STOFFER U	122728	Classification, Estimation and Data Analysis	8	2003	4
1024063	STOFFER U	122828	Practicum realiseren in materialen	6	2003	3
1024063	STOFFER U	122829	Systemen en technieken voor informatieopslag	9	2003	4
1024063	STOFFER U	122833	Integratieproject	4	2003	2
1024063	STOFFER U	123152	Signal processing in acoustics and audio	7	2002	4
1024063	STOFFER U	123153	Embedded Signal Processing	8	2003	4
1024063	STOFFER U	124151	Mechatronica	7	2002	4
1024063	STOFFER U	124151	Mechatronica	9	2003	4
1024063	STOFFER U	124176	Digitale Regeltechniek	3	2003	3
1024063	STOFFER U	125151	Schakel- en controlesystemen v. Multi-service netw	4	2003	3
1024063	STOFFER U	129346	Verrichten van experimenteel werk	9	2003	4
1024063	STOFFER U	129355	Deelname aan een studiegroep	6	2003	3
1024063	STOFFER U	129358	Maken van een scriptie	8	2003	3
1024063	STOFFER U	129367	Individual project	5	2003	2
1024063	STOFFER U	150600	Mathematical methods	7	2003	3
1024063	STOFFER U	150630	Applied functional analysis	7	2003	4
1024063	STOFFER U	150810	Modelling project	7	2003	3
1024063	STOFFER U	151012	Calculus I	5	2003	4
1024063	STOFFER U	151018	Analyse A	7	2003	3
1024063	STOFFER U	151024	Lineaire analyse	3	2003	4
1024063	STOFFER U	151072	Wiskunde II	6	2003	4
1024063	STOFFER U	151082	Wiskunde II	3	2003	4
1024063	STOFFER U	151084	Wiskunde IV	9	2003	4
1024063	STOFFER U	151091	Modelvorming I	7	2003	1
1024063	STOFFER U	151092	Modelvorming II	3	2003	2
1024063	STOFFER U	151150	Wiskunde IV	9	2003	3
1024063	STOFFER U	151160	Wiskunde C	9	2003	3
1024063	STOFFER U	151200	Calculus A	9	2003	3
1024063	STOFFER U	151208	Lineaire Algebra B	5	2003	3
1024063	STOFFER U	152028	Analyse A	8	2003	4
1024063	STOFFER U	152068	Discrete wiskunde	2	2003	3
1024063	STOFFER U	152070	Meetkunde	5	2003	1
1024063	STOFFER U	153002	Discrete kansrekening	3	2003	3
1024063	STOFFER U	153023	Statistiek II voor TBK	9	2003	3
1024063	STOFFER U	153029	Statistiek II	2	2003	4
1024063	STOFFER U	153031	Statistiek	6	2003	3
1024063	STOFFER U	153036	Statistiek II	5	2003	4
1097567	MAIJ T S	151140	Wiskunde III	8	2003	3
1024063	STOFFER U	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	3
1024063	STOFFER U	153083	Stochastische modellen in productie en logistiek	7	2003	3
1024063	STOFFER U	153086	Telecommunicatiesystemen	9	2003	1
1024063	STOFFER U	153087	Wachttijdtheorie	8	2003	3
1024063	STOFFER U	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	6	2003	1
1024063	STOFFER U	156014	Analyse B	8	2003	4
1024063	STOFFER U	156057	Inleiding wiskundige systeemtheorie	9	2003	4
1024063	STOFFER U	157016	Stochastische filter- en besturingstheorie	5	2003	3
1024063	STOFFER U	158022	Operationele research III	8	2003	3
1024063	STOFFER U	158075	Deterministische modellen in de OR	8	2003	1
1024063	STOFFER U	211024	Programmeren in C++	6	2003	4
1024063	STOFFER U	211081	Distributed E-business Techniques	5	2003	1
1024063	STOFFER U	211112	Inleiding Logica	4	2003	4
1024063	STOFFER U	211180	Basismodellen in de informatica	7	2003	4
1024063	STOFFER U	211185	Taal- en rekenmodellen	6	2003	1
1024063	STOFFER U	213001	Basisbegrippen digitale techniek	6	2002	3
1024063	STOFFER U	213005	Computerarchitectuur	6	2003	1
1025142	BOER Y	211017	Inleiding programmeren met JAVA	6	2003	3
1024063	STOFFER U	213016	Bijzondere onderwerpen computerarchitectuur	6	2003	3
1024063	STOFFER U	213530	Concurrent and distributed programming	9	2003	4
1024063	STOFFER U	213540	Advanced Design of Software Architectures	9	2003	3
1024063	STOFFER U	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2002	1
1024063	STOFFER U	214513	Internet & Web Architecturen	8	2002	4
1024063	STOFFER U	219803	Neurale netwerken	5	2003	4
1024063	STOFFER U	219910	Ontwerpproject	4	2003	3
1024063	STOFFER U	232016	Prestatie-analyse van informatiesystemen	9	2003	3
1024063	STOFFER U	232050	Electronic Commerce	1	2002	4
1024063	STOFFER U	232050	Electronic Commerce	1	2003	2
1024063	STOFFER U	232085	Voortgezette Requirements Engineering	4	2003	4
1024063	STOFFER U	234007	Systemen voor cooperatief werk	7	2003	4
1024063	STOFFER U	237201	Oriëntatie ICT	4	2002	3
1024063	STOFFER U	237201	Oriëntatie ICT	4	2002	2
1024063	STOFFER U	237400	BedrijfsProces Ondersteuning	2	2003	3
1024063	STOFFER U	239981	Integratieproject	5	1999	3
1024063	STOFFER U	262020	Bijzondere onderwerpen Telematica	8	2003	4
1024063	STOFFER U	265100	Ontwerpen van telematicasystemen	9	2003	3
1024063	STOFFER U	269004	Refresher Logics, Probability,Databases and JAVA	6	2003	4
1024063	STOFFER U	269100	P-project TEL	8	2003	4
1025005	STEIJN U W	150433	Wiskundig modelleren voor CiT	6	2003	4
1025005	STEIJN U W	150500	Presentatie van een wiskundig onderwerp	8	2003	1
1025005	STEIJN U W	150527	Wiskundig modelleren II	1	2003	3
1025005	STEIJN U W	150539	Maple practicum	4	2003	4
1025005	STEIJN U W	151033	Numerieke analyse	8	2003	3
1025005	STEIJN U W	151051	Fundamentele analyse I	4	2003	1
1025005	STEIJN U W	151072	Wiskunde II	5	2003	1
1025005	STEIJN U W	151080	Bijscholing wiskunde B2	6	2003	3
1025005	STEIJN U W	151082	Wiskunde II	7	2003	4
1025005	STEIJN U W	151085	Wiskunde I	6	2003	3
1025005	STEIJN U W	151210	Wiskunde A	6	2003	4
1025005	STEIJN U W	152030	Tensoranalyse	7	2003	3
1025005	STEIJN U W	152070	Meetkunde	7	2003	1
1025005	STEIJN U W	152080	Deterministische en stochastische speltheorie	2	2003	4
1025005	STEIJN U W	153036	Statistiek II	9	2003	4
1025005	STEIJN U W	153080	Stochastische modellen in de operationele research	6	2003	4
1025005	STEIJN U W	153081	Stochastische modellen v. telecommunicatie syst.	6	2003	3
1025005	STEIJN U W	153087	Wachttijdtheorie	3	2003	3
1025005	STEIJN U W	153088	Stochastische modellen voor Operations Management	5	2003	3
1025005	STEIJN U W	154021	Numerieke wiskunde en programmeermethoden	2	2003	1
1025005	STEIJN U W	156012	Gewone differentiaalvergelijkingen	4	2003	3
1025005	STEIJN U W	156033	Bifurcatie theorie	3	2003	4
1025005	STEIJN U W	156062	Systeem- en besturingstheorie	4	2003	4
1025005	STEIJN U W	156067	Robust Control	9	2003	4
1025005	STEIJN U W	157008	Stochastische processen in dynamische systemen	5	2003	3
1025005	STEIJN U W	158061	Inleiding wiskundige economie	6	2003	4
1025005	STEIJN U W	211017	Inleiding programmeren met JAVA	9	2003	3
1025005	STEIJN U W	211045	Besturingssystemen	4	2003	3
1025005	STEIJN U W	211081	Distributed E-business Techniques	2	2003	1
1025005	STEIJN U W	211095	Gedistribueerde databases & middleware technologie	7	2003	4
1025005	STEIJN U W	211129	Taaltechnologie	4	2003	4
1025005	STEIJN U W	211130	Ubiquitous Computing	9	2003	2
1025005	STEIJN U W	212010	Informatiesystemen	7	2003	3
1025005	STEIJN U W	213130	Computer Organisatie INF/TEL	7	2003	3
1025005	STEIJN U W	213530	Concurrent and distributed programming	8	2002	4
1025005	STEIJN U W	213545	Advanced Design of Software Architectures 2	6	2003	3
1025005	STEIJN U W	214512	Computerarchitectuur Project	1	2003	4
1025005	STEIJN U W	219803	Neurale netwerken	8	2003	4
1025005	STEIJN U W	219910	Ontwerpproject	2	2003	3
1025005	STEIJN U W	232016	Prestatie-analyse van informatiesystemen	7	2002	4
1025005	STEIJN U W	232020	Data warehousing & data mining	5	2003	4
1025005	STEIJN U W	233035	Practicum Databases in Informatiesystemen	4	2002	1
1025005	STEIJN U W	234007	Systemen voor cooperatief werk	9	2003	4
1025005	STEIJN U W	261010	Computer netwerken	6	2003	1
1025142	BOER Y	121000	Instrumentatie van embedded systemen	9	2003	3
1025142	BOER Y	121004	Practicum elektronische functies	6	2003	2
1025142	BOER Y	121017	D1-project	4	2003	4
1025142	BOER Y	121026	Hands-on dig.image proces. and graphical pres.	8	2003	4
1025142	BOER Y	121035	Mid P-project	2	2002	4
1025142	BOER Y	121043	Dynamische systemen	2	2003	2
1025142	BOER Y	121044	Regeltechniek	6	2003	2
1025142	BOER Y	121045	Project Mechatronica	2	2001	4
1025142	BOER Y	121049	Practicum Medische Elektronica	6	2003	3
1025142	BOER Y	121053	Zekere- en onzekere informatie	6	2003	3
1025142	BOER Y	121062	Eind P-project	8	2003	4
1025142	BOER Y	121709	Reliability Engineering	2	2002	4
1025142	BOER Y	121714	I.C. technologie	5	2003	4
1025142	BOER Y	122226	Project voortgezette elektronica	8	2003	3
1025142	BOER Y	122481	Systems engineering	4	2003	3
1025142	BOER Y	122828	Practicum realiseren in materialen	6	2003	3
1025142	BOER Y	122828	Practicum realiseren in materialen	6	2003	1
1025142	BOER Y	122829	Systemen en technieken voor informatieopslag	8	2003	4
1025142	BOER Y	123153	Embedded Signal Processing	4	2003	1
1025142	BOER Y	124151	Mechatronica	7	2003	4
1025142	BOER Y	124153	Computer-aided design gereedschappen voor VLSI	7	2003	4
1025142	BOER Y	124177	Inleiding elektrische energietechniek	8	2002	4
1025142	BOER Y	125156	Transmissiemedia- en systemen	1	2003	1
1025164	SNOR R O	214510	MMI-project	4	2003	2
1025142	BOER Y	127113	Elektrofysiologische signalen en bio-electriciteit	7	2003	4
1025142	BOER Y	127117	Biomechatronica	1	2002	3
1025142	BOER Y	127117	Biomechatronica	4	2003	2
1025142	BOER Y	129345	Deelname aan een studiegroep	3	2003	3
1025142	BOER Y	129358	Maken van een scriptie	6	2003	3
1025142	BOER Y	150529	Wiskundig modelleren IV	8	2003	1
1025142	BOER Y	150910	Advanced modelling	7	2003	4
1025142	BOER Y	151005	Calculus II-B	3	2003	3
1025142	BOER Y	151018	Analyse A	3	2003	3
1025142	BOER Y	151019	Analyse B	1	2003	4
1025142	BOER Y	151052	Fundamentele analyse II	9	2003	3
1025142	BOER Y	151070	Kwantitatieve methoden	6	2003	1
1025142	BOER Y	151072	Wiskunde II	8	2003	4
1025142	BOER Y	151150	Wiskunde IV	6	2003	3
1025142	BOER Y	151206	Lineaire Algebra A	8	2003	3
1025142	BOER Y	151560	Introduction to Investment Theory	7	2003	4
1025142	BOER Y	152027	Calculus II	5	2003	3
1025142	BOER Y	152066	Capita selecta analyse	6	2003	2
1025142	BOER Y	152070	Meetkunde	8	2003	4
1025142	BOER Y	152075	Grafentheorie	7	2003	3
1025142	BOER Y	153033	Statistiek	4	2003	4
1025142	BOER Y	153036	Statistiek II	7	2003	2
1025142	BOER Y	153041	Inleiding statistiek	4	2003	1
1025142	BOER Y	153081	Stochastische modellen v. telecommunicatie syst.	9	2003	3
1025142	BOER Y	153083	Stochastische modellen in productie en logistiek	6	2003	2
1025142	BOER Y	153086	Telecommunicatiesystemen	5	2003	1
1025142	BOER Y	153100	Statistiek	8	2003	3
1025142	BOER Y	153135	Statistical techniques	5	2003	4
1025142	BOER Y	156037	Applied Analytical Methods	3	2003	3
1025142	BOER Y	156062	Systeem- en besturingstheorie	7	2003	4
1025142	BOER Y	159918	Bibliotheekgebruik en literatuuropdracht	8	2003	3
1025142	BOER Y	211033	Neurale netwerken en neuro-computing	5	2003	3
1025142	BOER Y	211035	Vertalerbouw	9	2003	4
1025142	BOER Y	211078	Database-ontwerp	5	2003	4
1025142	BOER Y	211090	Databasetoepassingen	9	2003	4
1025142	BOER Y	211095	Gedistribueerde databases & middleware technologie	7	2003	1
1025142	BOER Y	211098	Databasetransacties en -processen	7	2003	2
1025142	BOER Y	211127	Formele analyse van natuurlijke taal	3	2003	4
1025142	BOER Y	211129	Taaltechnologie	8	2003	4
1025142	BOER Y	212010	Informatiesystemen	4	2003	3
1025142	BOER Y	212018	Kennistechnologie voor bedrijfskundige toep.	1	2003	4
1025142	BOER Y	213120	Inleiding informatie- en communicatietechnologie	2	2003	4
1025142	BOER Y	213545	Advanced Design of Software Architectures 2	5	2003	3
1025142	BOER Y	214513	Internet & Web Architecturen	5	2002	4
1025142	BOER Y	214513	Internet & Web Architecturen	8	2003	4
1025142	BOER Y	214513	Internet & Web Architecturen	3	2002	2
1025142	BOER Y	232011	Architectuur van informatiesystemen	8	2003	4
1025142	BOER Y	232081	Requirements Engineering	2	2003	4
1025142	BOER Y	234004	Softwaremanagement	4	2003	3
1025142	BOER Y	234020	Ontwerpen van mens-machine interactie	6	2003	4
1025142	BOER Y	237201	Oriëntatie ICT	3	2003	2
1025142	BOER Y	237400	BedrijfsProces Ondersteuning	6	2003	1
1025142	BOER Y	263000	Telematicadiensten	4	2003	4
1025142	BOER Y	265110	Protocol Engineering	9	2003	1
1025142	BOER Y	265201	Middleware for distributed objects	5	2003	3
1025142	BOER Y	269100	P-project TEL	5	2003	4
1025164	SNOR R O	150710	Modelling project	4	2003	3
1025164	SNOR R O	150910	Advanced modelling	7	2003	4
1025164	SNOR R O	151019	Analyse B	6	2003	4
1025164	SNOR R O	151033	Numerieke analyse	4	2003	3
1025164	SNOR R O	151039	Algebra	5	2003	4
1025164	SNOR R O	151044	Analyse C	5	2003	3
1025164	SNOR R O	151086	Vectoranalyse voor BMT	5	2003	3
1025164	SNOR R O	151093	Modelvorming III	7	2003	1
1025164	SNOR R O	151120	Wiskunde I	6	2003	4
1025164	SNOR R O	151160	Wiskunde C	2	2003	3
1025164	SNOR R O	151200	Calculus A	8	2003	3
1025164	SNOR R O	151210	Wiskunde A	6	2003	1
1025164	SNOR R O	151220	Wiskunde C	4	2003	3
1025164	SNOR R O	152025	Complexe functietheorie	4	2003	3
1025164	SNOR R O	152068	Discrete wiskunde	8	2003	2
1025164	SNOR R O	152100	Calculus I	6	2003	4
1025164	SNOR R O	152120	Lineaire algebra	4	2003	4
1025164	SNOR R O	153003	Kansrekening	8	2003	3
1025164	SNOR R O	153016	Voortgezette wiskundige statistiek	8	2003	3
1025164	SNOR R O	153045	Lineaire statistische modellen	5	2003	4
1025164	SNOR R O	153081	Stochastische modellen v. telecommunicatie syst.	8	2003	2
1025164	SNOR R O	154021	Numerieke wiskunde en programmeermethoden	6	2003	3
1025164	SNOR R O	156012	Gewone differentiaalvergelijkingen	4	2003	3
1025164	SNOR R O	156037	Applied Analytical Methods	9	2003	3
1025164	SNOR R O	157004	Stochastische processen in financien	9	2003	3
1025164	SNOR R O	211035	Vertalerbouw	6	2003	4
1025164	SNOR R O	211038	Spraak- en taaltechnologie	4	2002	3
1025164	SNOR R O	211081	Distributed E-business Techniques	7	2003	1
1025164	SNOR R O	211111	Parallelle processen	6	2003	3
1025164	SNOR R O	211133	Ontwerpen van Software Architecturen	4	2003	1
1025164	SNOR R O	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	2
1025164	SNOR R O	213001	Basisbegrippen digitale techniek	6	2002	3
1025164	SNOR R O	213001	Basisbegrippen digitale techniek	8	2003	4
1025164	SNOR R O	213005	Computerarchitectuur	8	2003	4
1025164	SNOR R O	213510	Software Engineering Modellen	9	2003	4
1025164	SNOR R O	213540	Advanced Design of Software Architectures	7	2002	4
1025164	SNOR R O	214012	Systeemvalidatie	7	2003	3
1025164	SNOR R O	214030	Artificial Intelligence	4	2003	2
1025164	SNOR R O	217001	Testtechnieken	2	2003	3
1025164	SNOR R O	232081	Requirements Engineering	8	2003	4
1025164	SNOR R O	233030	Specificeren van informatiesystemen	5	2003	3
1025164	SNOR R O	233030	Specificeren van informatiesystemen	4	2003	1
1025164	SNOR R O	233035	Practicum Databases in Informatiesystemen	6	2003	4
1025164	SNOR R O	234004	Softwaremanagement	6	2003	3
1025164	SNOR R O	234010	Invoering van IT in organisaties	1	2003	4
1025164	SNOR R O	234026	Voortgezette informatiesysteemmodellering	6	2003	4
1025164	SNOR R O	261000	Telematicasystemen en toepassingen	4	2003	2
1025164	SNOR R O	265200	Implementatie van telematicasystemen	9	2003	1
1025164	SNOR R O	269001	Portfolio ontwerp	6	2003	4
1025164	SNOR R O	269004	Refresher Logics, Probability,Databases and JAVA	6	2003	4
1026715	ARNOLDUS M	121001	Elektronische basisschakelingen	7	2003	4
1026715	ARNOLDUS M	121005	Netwerkanalyse	5	2003	3
1026715	ARNOLDUS M	121007	Elektromagnetische Veldtheorie	6	2001	4
1026715	ARNOLDUS M	121007	Elektromagnetische Veldtheorie	8	2003	1
1026715	ARNOLDUS M	121008	Practicum Elektromagnetische Veldtheorie	8	2002	1
1026715	ARNOLDUS M	121008	Practicum Elektromagnetische Veldtheorie	2	2003	1
1026715	ARNOLDUS M	121009	Inleiding telecommunicatie	2	2003	4
1026715	ARNOLDUS M	121021	Inleiding in de biomedische technologie	9	2002	2
1026715	ARNOLDUS M	121034	Fysische modelvorming van embedded systemen	6	2003	4
1026715	ARNOLDUS M	121035	Mid P-project	4	2003	3
1026715	ARNOLDUS M	121045	Project Mechatronica	5	2003	1
1026715	ARNOLDUS M	121050	Modern robotics	7	2003	3
1026715	ARNOLDUS M	121052	Imaging	6	2003	3
1026715	ARNOLDUS M	121056	Laboratorium op een chip	2	2003	3
1026715	ARNOLDUS M	121706	Halfgeleiderdevices	5	2003	3
1026715	ARNOLDUS M	122227	Voortgezette analoge IC elektronica	6	2003	4
1026715	ARNOLDUS M	122711	Digitale meetsystemen	8	2003	4
1026715	ARNOLDUS M	122728	Classification, Estimation and Data Analysis	6	2003	4
1026715	ARNOLDUS M	122815	Materiaalkunde van microsystemen	8	2003	4
1026715	ARNOLDUS M	122816	Mechanica en transductietechniek	9	2002	3
1026715	ARNOLDUS M	122828	Practicum realiseren in materialen	6	2003	1
1026715	ARNOLDUS M	123153	Embedded Signal Processing	7	2003	4
1026715	ARNOLDUS M	123153	Embedded Signal Processing	7	2003	1
1026715	ARNOLDUS M	124151	Mechatronica	7	2002	4
1026715	ARNOLDUS M	124151	Mechatronica	4	2003	4
1026715	ARNOLDUS M	124177	Inleiding elektrische energietechniek	6	2002	1
1026715	ARNOLDUS M	125114	Prestatieanalyse van communicatienetwerken	5	2003	4
1026715	ARNOLDUS M	125119	Signaaltheorie	9	2003	4
1026715	ARNOLDUS M	127116	Elektromagnetisme I voor HBO	7	2003	3
1026715	ARNOLDUS M	129345	Deelname aan een studiegroep	4	2003	3
1026715	ARNOLDUS M	129348	Maken van een scriptie	4	2003	3
1026715	ARNOLDUS M	150432	Maple practicum II	7	2003	4
1026715	ARNOLDUS M	150433	Wiskundig modelleren voor CiT	6	2003	4
1026715	ARNOLDUS M	150500	Presentatie van een wiskundig onderwerp	4	2003	3
1026715	ARNOLDUS M	150528	Wiskundig modelleren III	6	2003	3
1026715	ARNOLDUS M	150529	Wiskundig modelleren IV	8	2003	1
1026715	ARNOLDUS M	150625	Scientific communication	4	2003	3
1026715	ARNOLDUS M	150910	Advanced modelling	8	2003	4
1026715	ARNOLDUS M	151012	Calculus I	1	2003	4
1026715	ARNOLDUS M	151019	Analyse B	9	2003	4
1026715	ARNOLDUS M	151033	Numerieke analyse	6	2003	3
1026715	ARNOLDUS M	151043	Seminarium mathematische fysica	4	2003	1
1026715	ARNOLDUS M	151044	Analyse C	6	2003	3
1026715	ARNOLDUS M	151051	Fundamentele analyse I	9	2003	3
1026715	ARNOLDUS M	151070	Kwantitatieve methoden	6	2003	3
1026715	ARNOLDUS M	151072	Wiskunde II	2	2003	4
1026715	ARNOLDUS M	151086	Vectoranalyse voor BMT	7	2003	3
1026715	ARNOLDUS M	151093	Modelvorming III	8	2003	3
1026715	ARNOLDUS M	151140	Wiskunde III	8	2003	3
1026715	ARNOLDUS M	151150	Wiskunde IV	7	2003	3
1026715	ARNOLDUS M	151202	Calculus B	8	2003	3
1026715	ARNOLDUS M	151210	Wiskunde A	4	2003	4
1026715	ARNOLDUS M	152006	Lineaire structuren	6	2003	4
1026715	ARNOLDUS M	152066	Capita selecta analyse	4	2003	2
1026715	ARNOLDUS M	152070	Meetkunde	5	2003	1
1026715	ARNOLDUS M	153083	Stochastische modellen in productie en logistiek	6	2003	3
1026715	ARNOLDUS M	154023	Numerieke wiskunde en programmeermethoden	8	2003	1
1026715	ARNOLDUS M	157035	Financial Econometrics	5	2003	3
1026715	ARNOLDUS M	158017	Operationele research I	1	2003	4
1026715	ARNOLDUS M	158018	Operationele research I, practicum	8	2003	4
1026715	ARNOLDUS M	158075	Deterministische modellen in de OR	8	2002	4
1026715	ARNOLDUS M	211032	Seminarium Taal, Kennis & Interactie	6	2003	4
1026715	ARNOLDUS M	211033	Neurale netwerken en neuro-computing	6	2003	3
1026715	ARNOLDUS M	211047	Besturingssystemen voor Telematica	1	2003	4
1026715	ARNOLDUS M	211127	Formele analyse van natuurlijke taal	7	2003	4
1026715	ARNOLDUS M	211131	Statische Objectanalyse en Typering	7	2003	4
1026715	ARNOLDUS M	213001	Basisbegrippen digitale techniek	8	2002	3
1026715	ARNOLDUS M	213012	Hardware/software co-design	9	2003	2
1026715	ARNOLDUS M	213505	Programmeren 2	2	2003	1
1026715	ARNOLDUS M	213530	Concurrent and distributed programming	3	2002	4
1026715	ARNOLDUS M	214030	Artificial Intelligence	5	2002	3
1026715	ARNOLDUS M	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2003	3
1026715	ARNOLDUS M	214513	Internet & Web Architecturen	5	2002	4
1026715	ARNOLDUS M	232055	XML-technologie in E-Commerce	5	2003	4
1026715	ARNOLDUS M	234001	Productie-informatietechnologie	7	2003	3
1026715	ARNOLDUS M	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1026715	ARNOLDUS M	239981	Integratieproject	9	2000	4
1026715	ARNOLDUS M	239981	Integratieproject	6	2001	3
1026715	ARNOLDUS M	261000	Telematicasystemen en toepassingen	2	2003	2
1026715	ARNOLDUS M	261010	Computer netwerken	2	2003	1
1026715	ARNOLDUS M	265100	Ontwerpen van telematicasystemen	7	2003	1
1027829	GOEDEREN I I	236050	E-health Strategies	1	2003	4
1027829	GOEDEREN I I	237201	Oriëntatie ICT	8	2002	3
1027829	GOEDEREN I I	237201	Oriëntatie ICT	3	2003	2
1027829	GOEDEREN I I	239801	BIT-BV 2	5	2003	4
1027829	GOEDEREN I I	262020	Bijzondere onderwerpen Telematica	9	2003	4
1027829	GOEDEREN I I	262020	Bijzondere onderwerpen Telematica	7	2003	1
1027829	GOEDEREN I I	263000	Telematicadiensten	7	2003	1
1027829	GOEDEREN I I	264002	Business process engineering	6	2003	4
1027829	GOEDEREN I I	265100	Ontwerpen van telematicasystemen	6	2002	4
1027829	GOEDEREN I I	265200	Implementatie van telematicasystemen	5	2003	1
1027829	GOEDEREN I I	265201	Middleware for distributed objects	6	2003	3
1027829	GOEDEREN I I	265201	Middleware for distributed objects	9	2003	2
1027829	GOEDEREN I I	265300	Operationeel management van telematicasystemen	7	2003	3
1027829	GOEDEREN I I	266100	Patterns of software development	4	2003	2
1028103	RONDE G	121001	Elektronische basisschakelingen	7	2003	4
1028103	RONDE G	121007	Elektromagnetische Veldtheorie	6	2001	4
1028103	RONDE G	121007	Elektromagnetische Veldtheorie	4	2002	4
1028103	RONDE G	121007	Elektromagnetische Veldtheorie	6	2002	1
1028103	RONDE G	121008	Practicum Elektromagnetische Veldtheorie	7	2002	4
1028103	RONDE G	121017	D1-project	7	2003	4
1028103	RONDE G	121041	Elektrodynamica	5	2003	4
1028103	RONDE G	121044	Regeltechniek	9	2003	2
1028103	RONDE G	121045	Project Mechatronica	6	2003	3
1028103	RONDE G	121045	Project Mechatronica	8	2003	1
1028103	RONDE G	121053	Zekere- en onzekere informatie	9	2003	2
1028103	RONDE G	121709	Reliability Engineering	4	2003	2
1028103	RONDE G	122711	Digitale meetsystemen	8	2003	4
1028103	RONDE G	122733	VLSI signal processing	4	2003	2
1028103	RONDE G	122814	Elektromagnetisme II voor HBO	7	2003	4
1028103	RONDE G	122815	Materiaalkunde van microsystemen	7	2003	2
1028103	RONDE G	122816	Mechanica en transductietechniek	8	2003	4
1028103	RONDE G	122816	Mechanica en transductietechniek	7	2002	2
1028103	RONDE G	122829	Systemen en technieken voor informatieopslag	5	2003	1
1028103	RONDE G	123140	Inleiding systeem- en signaaltheorie voor HBO	9	2003	3
1028103	RONDE G	124162	Modelvorming en simulatie	4	2003	4
1028103	RONDE G	124163	Mechatronische meetsystemen	5	2003	4
1028103	RONDE G	124176	Digitale Regeltechniek	8	2003	2
1028103	RONDE G	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	3
1028103	RONDE G	125151	Schakel- en controlesystemen v. Multi-service netw	9	2003	1
1028103	RONDE G	127113	Elektrofysiologische signalen en bio-electriciteit	4	2003	4
1028103	RONDE G	127117	Biomechatronica	5	2002	3
1028103	RONDE G	129367	Individual project	5	2003	3
1028103	RONDE G	129367	Individual project	4	2003	2
1028103	RONDE G	150526	Wiskundig modelleren I	9	2003	3
1028103	RONDE G	150529	Wiskundig modelleren IV	8	2003	1
1028103	RONDE G	151081	Wiskunde I	2	2003	3
1028103	RONDE G	151082	Wiskunde II	7	2003	4
1028103	RONDE G	151091	Modelvorming I	7	2003	1
1028103	RONDE G	151130	Wiskunde II	9	2003	4
1028103	RONDE G	151140	Wiskunde III	6	2003	3
1028103	RONDE G	151204	Calculus C	8	2003	4
1028103	RONDE G	151215	Wiskunde B	9	2003	4
1028103	RONDE G	151520	Mathematical Finance	8	2003	4
1028103	RONDE G	151565	Praktische opdracht Financial Engineering	8	2003	4
1028103	RONDE G	152066	Capita selecta analyse	5	2003	3
1028103	RONDE G	152075	Grafentheorie	5	2003	3
1028103	RONDE G	153006	Kansrekening	4	2003	3
1028103	RONDE G	153045	Lineaire statistische modellen	6	2003	4
1028103	RONDE G	153110	Inleiding statistiek	2	2003	3
1028103	RONDE G	154023	Numerieke wiskunde en programmeermethoden	6	2003	1
1028103	RONDE G	155010	Part. differentiaalverg. uit de math. fysica	1	2003	2
1028103	RONDE G	157008	Stochastische processen in dynamische systemen	8	2003	3
1028103	RONDE G	157009	Tijdreeksenanalyse en identificatietheorie	5	2003	3
1028103	RONDE G	211017	Inleiding programmeren met JAVA	5	2003	3
1028103	RONDE G	211047	Besturingssystemen voor Telematica	3	2003	4
1028103	RONDE G	211054	Computersystemen	8	2003	2
1028103	RONDE G	211098	Databasetransacties en -processen	7	2003	2
1028103	RONDE G	211127	Formele analyse van natuurlijke taal	7	2003	4
1028103	RONDE G	211128	Informatica en taal	1	2003	4
1028103	RONDE G	211129	Taaltechnologie	8	2003	4
1028103	RONDE G	211130	Ubiquitous Computing	9	2003	3
1028103	RONDE G	211185	Taal- en rekenmodellen	6	2003	1
1028103	RONDE G	213001	Basisbegrippen digitale techniek	8	2003	2
1028103	RONDE G	213120	Inleiding informatie- en communicatietechnologie	2	2003	2
1028103	RONDE G	213130	Computer Organisatie INF/TEL	5	2003	3
1028103	RONDE G	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2003	3
1028103	RONDE G	214501	Communicatie & ontwerpen in ICT-projecten 2	7	2003	3
1028103	RONDE G	214510	MMI-project	4	2003	3
1028103	RONDE G	214513	Internet & Web Architecturen	5	2002	2
1028103	RONDE G	232055	XML-technologie in E-Commerce	9	2003	1
1028103	RONDE G	232081	Requirements Engineering	4	2003	4
1028103	RONDE G	234010	Invoering van IT in organisaties	5	2003	4
1028103	RONDE G	235022	Investeringen in informatietechnologie	5	2003	2
1028103	RONDE G	236050	E-health Strategies	5	2003	4
1028103	RONDE G	237201	Oriëntatie ICT	8	2003	4
1028103	RONDE G	239981	Integratieproject	5	1999	1
1028103	RONDE G	265200	Implementatie van telematicasystemen	9	2003	1
1028103	RONDE G	265310	Internet management architecturen	9	2003	3
1028284	JACOBS Q B	151015	Numerieke lineaire algebra	8	2003	3
1028284	JACOBS Q B	151019	Analyse B	9	2003	4
1028284	JACOBS Q B	151025	Functionaalanalyse II	3	2003	3
1028284	JACOBS Q B	151070	Kwantitatieve methoden	4	2003	1
1028284	JACOBS Q B	151081	Wiskunde I	9	2003	3
1028284	JACOBS Q B	151082	Wiskunde II	5	2003	4
1028284	JACOBS Q B	151093	Modelvorming III	4	2003	3
1028284	JACOBS Q B	151140	Wiskunde III	5	2003	3
1028284	JACOBS Q B	151150	Wiskunde IV	2	2003	3
1028284	JACOBS Q B	151202	Calculus B	8	2003	3
1028284	JACOBS Q B	151250	Modellen en systemen	1	2003	4
1028284	JACOBS Q B	151510	Introduction to Risk Theory	7	2003	3
1028284	JACOBS Q B	152006	Lineaire structuren	4	2003	4
1028284	JACOBS Q B	152068	Discrete wiskunde	5	2003	2
1028284	JACOBS Q B	153031	Statistiek	2	2003	3
1028284	JACOBS Q B	153036	Statistiek II	8	2003	2
1028284	JACOBS Q B	153086	Telecommunicatiesystemen	9	2003	1
1028284	JACOBS Q B	156033	Bifurcatie theorie	6	2003	4
1028284	JACOBS Q B	157004	Stochastische processen in financien	8	2003	3
1028284	JACOBS Q B	157008	Stochastische processen in dynamische systemen	1	2003	3
1028284	JACOBS Q B	157009	Tijdreeksenanalyse en identificatietheorie	4	2003	3
1028284	JACOBS Q B	158075	Deterministische modellen in de OR	9	2003	1
1028284	JACOBS Q B	211017	Inleiding programmeren met JAVA	6	2003	1
1028284	JACOBS Q B	211022	Programmeren in C++	2	2003	3
1028284	JACOBS Q B	211038	Spraak- en taaltechnologie	4	2002	3
1028284	JACOBS Q B	211038	Spraak- en taaltechnologie	9	2002	1
1028284	JACOBS Q B	211081	Distributed E-business Techniques	7	2003	3
1028284	JACOBS Q B	211090	Databasetoepassingen	4	2003	4
1028284	JACOBS Q B	211127	Formele analyse van natuurlijke taal	5	2003	4
1028284	JACOBS Q B	211128	Informatica en taal	3	2003	4
1028284	JACOBS Q B	211129	Taaltechnologie	7	2003	4
1028284	JACOBS Q B	211133	Ontwerpen van Software Architecturen	4	2003	3
1028284	JACOBS Q B	211185	Taal- en rekenmodellen	8	2003	1
1028284	JACOBS Q B	213002	Ontwerpen van digitale systemen	4	2003	4
1028284	JACOBS Q B	213005	Computerarchitectuur	7	2003	1
1028284	JACOBS Q B	213009	Fouten tolererende digitale systemen	2	2003	1
1028284	JACOBS Q B	213530	Concurrent and distributed programming	5	2003	2
1028284	JACOBS Q B	213540	Advanced Design of Software Architectures	4	2003	3
1028284	JACOBS Q B	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2003	2
1028284	JACOBS Q B	214513	Internet & Web Architecturen	8	2003	4
1028284	JACOBS Q B	232020	Data warehousing & data mining	1	2003	4
1028284	JACOBS Q B	232020	Data warehousing & data mining	9	2003	2
1028284	JACOBS Q B	232055	XML-technologie in E-Commerce	6	2003	1
1028284	JACOBS Q B	234020	Ontwerpen van mens-machine interactie	9	2003	4
1097567	MAIJ T S	151215	Wiskunde B	7	2003	4
1028284	JACOBS Q B	235022	Investeringen in informatietechnologie	4	2003	2
1028284	JACOBS Q B	261000	Telematicasystemen en toepassingen	7	2003	2
1028284	JACOBS Q B	262020	Bijzondere onderwerpen Telematica	8	2003	1
1028284	JACOBS Q B	269001	Portfolio ontwerp	7	2003	4
1028547	SCHEFFER T	121002	Practicum elektronische basisschakelingen	8	2003	3
1028547	SCHEFFER T	121004	Practicum elektronische functies	2	2003	2
1028547	SCHEFFER T	121008	Practicum Elektromagnetische Veldtheorie	6	2003	1
1028547	SCHEFFER T	121019	D-opdracht	3	2003	3
1028547	SCHEFFER T	121021	Inleiding in de biomedische technologie	3	2002	4
1028547	SCHEFFER T	121021	Inleiding in de biomedische technologie	4	2003	2
1028547	SCHEFFER T	121035	Mid P-project	5	2003	1
1028547	SCHEFFER T	121052	Imaging	5	2003	3
1028547	SCHEFFER T	121056	Laboratorium op een chip	9	2003	3
1028547	SCHEFFER T	121067	Signaal analyse practicum	6	2002	4
1028547	SCHEFFER T	121717	Advanced semiconductor devices	9	2003	3
1028547	SCHEFFER T	122728	Classification, Estimation and Data Analysis	4	2003	4
1028547	SCHEFFER T	122733	VLSI signal processing	6	2003	4
1028547	SCHEFFER T	122733	VLSI signal processing	5	2003	2
1028547	SCHEFFER T	122816	Mechanica en transductietechniek	4	2002	2
1028547	SCHEFFER T	122829	Systemen en technieken voor informatieopslag	4	2003	1
1028547	SCHEFFER T	123153	Embedded Signal Processing	8	2003	1
1028547	SCHEFFER T	124151	Mechatronica	8	2002	4
1028547	SCHEFFER T	124177	Inleiding elektrische energietechniek	6	2002	1
1028547	SCHEFFER T	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	3
1028547	SCHEFFER T	129344	Literatuuronderzoek	7	2003	3
1028547	SCHEFFER T	129357	Deelname aan een project	4	2003	4
1028547	SCHEFFER T	129367	Individual project	8	2003	2
1028547	SCHEFFER T	150529	Wiskundig modelleren IV	9	2003	1
1028547	SCHEFFER T	150539	Maple practicum	6	2003	4
1028547	SCHEFFER T	150620	Systems and signals	8	2003	3
1028547	SCHEFFER T	150625	Scientific communication	2	2003	3
1028547	SCHEFFER T	150700	Introduction to operations research	9	2003	4
1028547	SCHEFFER T	150730	Experimental design	1	2003	3
1028547	SCHEFFER T	151004	Calculus II-A	5	2003	4
1028547	SCHEFFER T	151005	Calculus II-B	6	2003	3
1028547	SCHEFFER T	151014	Analyse A	7	2003	3
1028547	SCHEFFER T	151043	Seminarium mathematische fysica	5	2003	4
1028547	SCHEFFER T	151052	Fundamentele analyse II	9	2003	3
1028547	SCHEFFER T	151072	Wiskunde II	5	2003	4
1028547	SCHEFFER T	151080	Bijscholing wiskunde B2	5	2003	3
1028547	SCHEFFER T	151088	Practicum Wiskundig modelleren	7	2003	4
1028547	SCHEFFER T	151093	Modelvorming III	7	2003	3
1028547	SCHEFFER T	151120	Wiskunde I	4	2003	4
1028547	SCHEFFER T	151200	Calculus A	8	2003	3
1028547	SCHEFFER T	151204	Calculus C	4	2003	4
1028547	SCHEFFER T	151540	Computational Methods in Finance	8	2003	4
1028547	SCHEFFER T	151560	Introduction to Investment Theory	5	2003	4
1028547	SCHEFFER T	152038	Grafentheorie	6	2003	2
1028547	SCHEFFER T	152056	Combinatoriek	3	2003	4
1028547	SCHEFFER T	152070	Meetkunde	4	2003	1
1028547	SCHEFFER T	152080	Deterministische en stochastische speltheorie	7	2003	1
1028547	SCHEFFER T	152120	Lineaire algebra	7	2003	4
1028547	SCHEFFER T	153002	Discrete kansrekening	7	2003	3
1028547	SCHEFFER T	153032	Kansrekening en stochastische processen	4	2003	4
1028547	SCHEFFER T	153034	Kansrekening en statistiek	3	2003	3
1028547	SCHEFFER T	153045	Lineaire statistische modellen	3	2003	4
1028547	SCHEFFER T	153055	Parametervrije statistische methoden	6	2003	3
1028547	SCHEFFER T	153081	Stochastische modellen v. telecommunicatie syst.	4	2003	2
1028547	SCHEFFER T	153082	Stochastische simulatie	7	2003	3
1028547	SCHEFFER T	154021	Numerieke wiskunde en programmeermethoden	9	2003	3
1028547	SCHEFFER T	154023	Numerieke wiskunde en programmeermethoden	4	2003	3
1028547	SCHEFFER T	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	3	2003	3
1028547	SCHEFFER T	155019	Practicum softwarepakketten PDV	7	2003	3
1028547	SCHEFFER T	156012	Gewone differentiaalvergelijkingen	5	2003	3
1028547	SCHEFFER T	156016	Analyse B	3	2003	3
1028547	SCHEFFER T	156067	Robust Control	6	2003	4
1028547	SCHEFFER T	157030	Structured Products	5	2003	3
1028547	SCHEFFER T	157035	Financial Econometrics	4	2003	3
1028547	SCHEFFER T	158025	Mathematische programmering I	8	2003	3
1028547	SCHEFFER T	158038	Discrete optimalisering	5	2003	3
1028547	SCHEFFER T	158075	Deterministische modellen in de OR	9	2002	4
1028547	SCHEFFER T	211027	Inleiding programmeren met MATLAB	2	2003	3
1028547	SCHEFFER T	211032	Seminarium Taal, Kennis & Interactie	8	2003	1
1028547	SCHEFFER T	211038	Spraak- en taaltechnologie	3	2003	4
1028547	SCHEFFER T	211045	Besturingssystemen	9	2003	3
1028547	SCHEFFER T	211081	Distributed E-business Techniques	9	2003	3
1028547	SCHEFFER T	211098	Databasetransacties en -processen	2	2003	3
1028547	SCHEFFER T	211131	Statische Objectanalyse en Typering	8	2003	4
1028547	SCHEFFER T	213002	Ontwerpen van digitale systemen	4	2003	4
1028547	SCHEFFER T	213016	Bijzondere onderwerpen computerarchitectuur	6	2003	3
1028547	SCHEFFER T	214513	Internet & Web Architecturen	5	2002	2
1028547	SCHEFFER T	232016	Prestatie-analyse van informatiesystemen	8	2002	4
1028547	SCHEFFER T	233030	Specificeren van informatiesystemen	9	2003	1
1028547	SCHEFFER T	233035	Practicum Databases in Informatiesystemen	5	2002	1
1028547	SCHEFFER T	234001	Productie-informatietechnologie	7	2003	3
1028547	SCHEFFER T	235022	Investeringen in informatietechnologie	7	2003	4
1028547	SCHEFFER T	239801	BIT-BV 2	4	2003	2
1028547	SCHEFFER T	262020	Bijzondere onderwerpen Telematica	6	2003	1
1028547	SCHEFFER T	263000	Telematicadiensten	7	2003	4
1028547	SCHEFFER T	264001	Telematics and business strategies	1	2003	4
1028547	SCHEFFER T	265100	Ontwerpen van telematicasystemen	4	2002	4
1028547	SCHEFFER T	265201	Middleware for distributed objects	4	2003	3
1028547	SCHEFFER T	265300	Operationeel management van telematicasystemen	9	2003	3
1028547	SCHEFFER T	269001	Portfolio ontwerp	9	2003	4
1029344	DE JONG D P	121000	Instrumentatie van embedded systemen	5	2003	3
1029344	DE JONG D P	121005	Netwerkanalyse	5	2003	3
1029344	DE JONG D P	121007	Elektromagnetische Veldtheorie	6	2003	3
1029344	DE JONG D P	121008	Practicum Elektromagnetische Veldtheorie	5	2002	4
1029344	DE JONG D P	121009	Inleiding telecommunicatie	3	2003	4
1029344	DE JONG D P	121022	Neurofysiologie	8	2003	4
1029344	DE JONG D P	121026	Hands-on dig.image proces. and graphical pres.	8	2003	4
1029344	DE JONG D P	121033	Project "computer vision"	3	2003	3
1029344	DE JONG D P	121045	Project Mechatronica	4	2003	1
1029344	DE JONG D P	121056	Laboratorium op een chip	6	2003	3
1029344	DE JONG D P	121057	Bio-elektriciteit	4	2003	2
1029344	DE JONG D P	121060	Optische basisfuncties en microsystemen	9	2003	4
1029344	DE JONG D P	121062	Eind P-project	9	2003	4
1029344	DE JONG D P	121709	Reliability Engineering	6	2003	2
1029344	DE JONG D P	121714	I.C. technologie	6	2003	2
1029344	DE JONG D P	122814	Elektromagnetisme II voor HBO	9	2003	1
1029344	DE JONG D P	122815	Materiaalkunde van microsystemen	4	2003	4
1029344	DE JONG D P	122816	Mechanica en transductietechniek	5	2002	2
1029344	DE JONG D P	123112	Moderne modulatie- en detectietechnieken	8	2003	4
1029344	DE JONG D P	123140	Inleiding systeem- en signaaltheorie voor HBO	5	2003	3
1029344	DE JONG D P	123153	Embedded Signal Processing	8	2003	1
1029344	DE JONG D P	124177	Inleiding elektrische energietechniek	9	2002	1
1029344	DE JONG D P	125113	Analoge communicatietechniek	8	2003	4
1029344	DE JONG D P	127113	Elektrofysiologische signalen en bio-electriciteit	7	2003	1
1029344	DE JONG D P	127117	Biomechatronica	5	2002	3
1029344	DE JONG D P	129344	Literatuuronderzoek	4	2003	3
1029344	DE JONG D P	129354	Literatuuronderzoek	9	2003	4
1029344	DE JONG D P	129362	Start P-project	6	2003	3
1029344	DE JONG D P	129362	Start P-project	7	2003	2
1029344	DE JONG D P	150500	Presentatie van een wiskundig onderwerp	4	2003	3
1029344	DE JONG D P	150528	Wiskundig modelleren III	5	2003	3
1029344	DE JONG D P	150529	Wiskundig modelleren IV	6	2003	4
1029344	DE JONG D P	150539	Maple practicum	9	2003	4
1029344	DE JONG D P	151015	Numerieke lineaire algebra	4	2003	3
1029344	DE JONG D P	151033	Numerieke analyse	4	2003	3
1029344	DE JONG D P	151052	Fundamentele analyse II	6	2003	3
1029344	DE JONG D P	151070	Kwantitatieve methoden	6	2003	1
1029344	DE JONG D P	151160	Wiskunde C	7	2003	3
1029344	DE JONG D P	151202	Calculus B	6	2003	3
1029344	DE JONG D P	151600	Modelleren en redeneren	9	2003	4
1029344	DE JONG D P	152027	Calculus II	8	2003	2
1029344	DE JONG D P	152030	Tensoranalyse	8	2003	3
1029344	DE JONG D P	152056	Combinatoriek	8	2003	4
1029344	DE JONG D P	152068	Discrete wiskunde	9	2003	3
1029344	DE JONG D P	152070	Meetkunde	5	2003	4
1029344	DE JONG D P	152070	Meetkunde	7	2003	1
1029344	DE JONG D P	152150	Wiskundig modelleren I	2	2003	4
1029344	DE JONG D P	153002	Discrete kansrekening	9	2003	3
1029344	DE JONG D P	153028	Statistiek I	5	2003	4
1029344	DE JONG D P	153038	Wiskundige statistiek	1	2003	4
1029344	DE JONG D P	153081	Stochastische modellen v. telecommunicatie syst.	4	2003	2
1029344	DE JONG D P	155015	Part.diff.verg.: Numerieke oplossingsmethoden I	1	2003	4
1029344	DE JONG D P	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	4	2003	3
1029344	DE JONG D P	156014	Analyse B	3	2003	4
1029344	DE JONG D P	156033	Bifurcatie theorie	3	2003	4
1029344	DE JONG D P	158038	Discrete optimalisering	8	2003	3
1029344	DE JONG D P	159960	Multidisciplinaire ontwerpopdracht	1	2003	3
1029344	DE JONG D P	211024	Programmeren in C++	1	2003	4
1029344	DE JONG D P	211035	Vertalerbouw	4	2003	4
1029344	DE JONG D P	211038	Spraak- en taaltechnologie	9	2001	3
1029344	DE JONG D P	211095	Gedistribueerde databases & middleware technologie	9	2003	4
1029344	DE JONG D P	211096	XML & Databases	3	2003	3
1029344	DE JONG D P	211096	XML & Databases	4	2003	1
1029344	DE JONG D P	211097	Bijzondere onderwerpen gegevensbanken	6	2003	1
1029344	DE JONG D P	211108	Bijzondere onderwerpen uit de logica	8	2003	4
1029344	DE JONG D P	211112	Inleiding Logica	4	2003	4
1029344	DE JONG D P	211180	Basismodellen in de informatica	5	2003	4
1029344	DE JONG D P	213001	Basisbegrippen digitale techniek	7	2002	3
1029344	DE JONG D P	213120	Inleiding informatie- en communicatietechnologie	8	2003	4
1029344	DE JONG D P	213500	Programmeren 1	8	2003	4
1029344	DE JONG D P	213540	Advanced Design of Software Architectures	8	2003	3
1029344	DE JONG D P	214020	Algoritmen,datastructuren en complexiteit	9	2003	4
1029344	DE JONG D P	214030	Artificial Intelligence	7	2002	1
1029344	DE JONG D P	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2003	3
1029344	DE JONG D P	214513	Internet & Web Architecturen	4	2002	4
1029344	DE JONG D P	214513	Internet & Web Architecturen	5	2003	4
1029344	DE JONG D P	232055	XML-technologie in E-Commerce	7	2003	1
1029344	DE JONG D P	232060	Multi-agent systemen	1	2003	4
1029344	DE JONG D P	236002	Beheer van ICT voorzieningen	8	2003	3
1029344	DE JONG D P	239981	Integratieproject	8	2001	2
1029344	DE JONG D P	262000	Telematicanetwerken	2	2003	4
1029344	DE JONG D P	265100	Ontwerpen van telematicasystemen	9	2003	3
1029344	DE JONG D P	265310	Internet management architecturen	7	2003	3
1029344	DE JONG D P	269004	Refresher Logics, Probability,Databases and JAVA	5	2003	1
1029344	DE JONG D P	269100	P-project TEL	6	2003	4
1030074	BOER U G	237201	Oriëntatie ICT	8	2003	2
1030074	BOER U G	237450	Bedrijfsfunctie ondersteuning	9	2003	3
1030074	BOER U G	239801	BIT-BV 2	7	2003	2
1030074	BOER U G	239981	Integratieproject	4	2001	2
1030074	BOER U G	263200	Gedistribueerde multimedia database systemen	8	2003	4
1030074	BOER U G	269001	Portfolio ontwerp	3	2003	4
1032101	DE JONG S A	150500	Presentatie van een wiskundig onderwerp	8	2003	3
1032101	DE JONG S A	150740	Quality control	9	2003	4
1032101	DE JONG S A	151039	Algebra	8	2003	4
1032101	DE JONG S A	151043	Seminarium mathematische fysica	8	2003	4
1032101	DE JONG S A	151052	Fundamentele analyse II	9	2003	3
1032101	DE JONG S A	151073	Calculus III	7	2003	4
1032101	DE JONG S A	151208	Lineaire Algebra B	3	2003	3
1032101	DE JONG S A	151215	Wiskunde B	2	2003	4
1032101	DE JONG S A	151570	Financial Engineering	4	2003	3
1032101	DE JONG S A	152075	Grafentheorie	9	2003	3
1032101	DE JONG S A	152080	Deterministische en stochastische speltheorie	8	2003	1
1032101	DE JONG S A	152150	Wiskundig modelleren I	5	2003	4
1032101	DE JONG S A	153002	Discrete kansrekening	6	2003	3
1032101	DE JONG S A	153006	Kansrekening	5	2003	3
1032101	DE JONG S A	153026	Asymptotische technieken in de statistiek	8	2003	3
1032101	DE JONG S A	153081	Stochastische modellen v. telecommunicatie syst.	6	2003	3
1032101	DE JONG S A	153081	Stochastische modellen v. telecommunicatie syst.	8	2003	2
1032101	DE JONG S A	154023	Numerieke wiskunde en programmeermethoden	8	2003	3
1032101	DE JONG S A	155009	Fundamenten van de methode der eindige elementen	7	2003	3
1032101	DE JONG S A	155015	Part.diff.verg.: Numerieke oplossingsmethoden I	6	2003	4
1032101	DE JONG S A	155019	Practicum softwarepakketten PDV	9	2003	3
1032101	DE JONG S A	156057	Inleiding wiskundige systeemtheorie	8	2003	4
1032101	DE JONG S A	156066	Besturingstheorie van economische systemen	4	2003	4
1032101	DE JONG S A	156069	Systemen en Signalen	9	2003	3
1032101	DE JONG S A	156080	Signalen en transformaties	3	2003	3
1032101	DE JONG S A	157009	Tijdreeksenanalyse en identificatietheorie	6	2003	3
1032101	DE JONG S A	158018	Operationele research I, practicum	5	2003	4
1032101	DE JONG S A	211034	Spraaktechnologie	6	2003	3
1032101	DE JONG S A	211035	Vertalerbouw	7	2003	4
1032101	DE JONG S A	211045	Besturingssystemen	8	2003	2
1032101	DE JONG S A	211047	Besturingssystemen voor Telematica	5	2003	4
1032101	DE JONG S A	211050	Structuur van programmeertalen	7	2003	3
1032101	DE JONG S A	211054	Computersystemen	5	2003	3
1032101	DE JONG S A	211098	Databasetransacties en -processen	5	2003	3
1032101	DE JONG S A	211113	Constraint Logic Programming	6	2003	4
1032101	DE JONG S A	211130	Ubiquitous Computing	6	2003	3
1032101	DE JONG S A	211185	Taal- en rekenmodellen	5	2003	1
1032101	DE JONG S A	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	4
1032101	DE JONG S A	212018	Kennistechnologie voor bedrijfskundige toep.	9	2003	2
1032101	DE JONG S A	213011	Gedistribueerde systemen	8	2003	4
1032101	DE JONG S A	213120	Inleiding informatie- en communicatietechnologie	2	2003	2
1032101	DE JONG S A	219801	Hypermedia structuren en systemen	4	2003	4
1032101	DE JONG S A	232011	Architectuur van informatiesystemen	9	2003	4
1032101	DE JONG S A	232020	Data warehousing & data mining	2	2003	4
1032101	DE JONG S A	232055	XML-technologie in E-Commerce	5	2003	4
1032101	DE JONG S A	232085	Voortgezette Requirements Engineering	1	2003	4
1032101	DE JONG S A	234004	Softwaremanagement	2	2003	3
1032101	DE JONG S A	234007	Systemen voor cooperatief werk	1	2003	4
1032101	DE JONG S A	234026	Voortgezette informatiesysteemmodellering	6	2003	4
1032101	DE JONG S A	235022	Investeringen in informatietechnologie	9	2003	4
1032101	DE JONG S A	236001	Kwaliteit van de informatievoorziening	4	2003	4
1032101	DE JONG S A	239981	Integratieproject	8	2000	4
1032101	DE JONG S A	265310	Internet management architecturen	6	2003	3
1032101	DE JONG S A	269001	Portfolio ontwerp	5	2003	4
1032101	DE JONG S A	269100	P-project TEL	6	2003	2
1032113	LOCHEM A J	211108	Bijzondere onderwerpen uit de logica	6	2003	4
1032113	LOCHEM A J	211109	Voortgezette logica	9	2003	3
1032113	LOCHEM A J	211123	Component- en aspect georienteerd progammeren	4	2003	3
1032113	LOCHEM A J	211129	Taaltechnologie	9	2003	4
1032113	LOCHEM A J	211130	Ubiquitous Computing	1	2003	2
1032113	LOCHEM A J	211185	Taal- en rekenmodellen	5	2003	4
1032113	LOCHEM A J	211185	Taal- en rekenmodellen	7	2003	1
1032113	LOCHEM A J	212010	Informatiesystemen	6	2003	3
1032101	DE JONG S A	239801	BIT-BV 2	7	2003	4
1032113	LOCHEM A J	213009	Fouten tolererende digitale systemen	6	2003	4
1032113	LOCHEM A J	213014	Procesbesturing en robotica	7	2003	3
1032113	LOCHEM A J	213505	Programmeren 2	8	2003	4
1032113	LOCHEM A J	214012	Systeemvalidatie	8	2003	3
1032113	LOCHEM A J	214501	Communicatie & ontwerpen in ICT-projecten 2	8	2003	3
1032113	LOCHEM A J	214511	Database Project	9	2003	3
1032113	LOCHEM A J	219801	Hypermedia structuren en systemen	6	2003	1
1032113	LOCHEM A J	232060	Multi-agent systemen	6	2003	4
1032113	LOCHEM A J	232085	Voortgezette Requirements Engineering	5	2003	4
1032113	LOCHEM A J	237201	Oriëntatie ICT	6	2003	4
1032113	LOCHEM A J	237600	Business Case Development for IT-projects	9	2003	1
1032113	LOCHEM A J	239805	BIT-BV	7	2003	4
1032113	LOCHEM A J	239981	Integratieproject	5	1999	3
1032113	LOCHEM A J	265300	Operationeel management van telematicasystemen	9	2003	3
1032593	GASSING F P	121002	Practicum elektronische basisschakelingen	1	2003	3
1032593	GASSING F P	121008	Practicum Elektromagnetische Veldtheorie	6	2003	3
1032593	GASSING F P	121008	Practicum Elektromagnetische Veldtheorie	8	2002	1
1032593	GASSING F P	121017	D1-project	5	2003	4
1032593	GASSING F P	121019	D-opdracht	5	2003	3
1032593	GASSING F P	121021	Inleiding in de biomedische technologie	7	2002	4
1032593	GASSING F P	121035	Mid P-project	6	2003	3
1032593	GASSING F P	121035	Mid P-project	9	2003	1
1032593	GASSING F P	121040	Medische elektronica	7	2003	3
1032593	GASSING F P	121049	Practicum Medische Elektronica	7	2003	3
1032593	GASSING F P	121053	Zekere- en onzekere informatie	9	2003	2
1032593	GASSING F P	121054	Neurotechnologie	8	2003	4
1032593	GASSING F P	121068	Signaaltheorie	4	2003	3
1032593	GASSING F P	121709	Reliability Engineering	4	2003	4
1032593	GASSING F P	122815	Materiaalkunde van microsystemen	7	2003	2
1032593	GASSING F P	122816	Mechanica en transductietechniek	6	2003	4
1032593	GASSING F P	122829	Systemen en technieken voor informatieopslag	6	2003	1
1032593	GASSING F P	122830	Micro electro mechanische systemen	2	2003	4
1032593	GASSING F P	122833	Integratieproject	4	2003	2
1032593	GASSING F P	124163	Mechatronische meetsystemen	7	2003	4
1032593	GASSING F P	124176	Digitale Regeltechniek	7	2003	3
1032593	GASSING F P	124177	Inleiding elektrische energietechniek	4	2003	3
1032593	GASSING F P	124177	Inleiding elektrische energietechniek	4	2003	1
1032593	GASSING F P	125113	Analoge communicatietechniek	9	2003	4
1032593	GASSING F P	125152	Glasvezelcommunicatie	6	2003	3
1032593	GASSING F P	125152	Glasvezelcommunicatie	7	2003	2
1032593	GASSING F P	127116	Elektromagnetisme I voor HBO	5	2003	3
1032593	GASSING F P	127116	Elektromagnetisme I voor HBO	6	2003	2
1032593	GASSING F P	127117	Biomechatronica	6	2002	3
1032593	GASSING F P	129351	Fysiologie II	3	2003	3
1032593	GASSING F P	129358	Maken van een scriptie	4	2003	3
1032593	GASSING F P	129362	Start P-project	3	2003	2
1032593	GASSING F P	129367	Individual project	6	2003	3
1032593	GASSING F P	150600	Mathematical methods	5	2003	3
1032593	GASSING F P	151004	Calculus II-A	7	2003	4
1032593	GASSING F P	151005	Calculus II-B	5	2003	3
1032593	GASSING F P	151025	Functionaalanalyse II	4	2003	3
1032593	GASSING F P	151052	Fundamentele analyse II	9	2003	3
1032593	GASSING F P	151208	Lineaire Algebra B	6	2003	3
1032593	GASSING F P	151600	Modelleren en redeneren	4	2003	4
1032593	GASSING F P	152061	Discrete wiskunde	8	2003	3
1032593	GASSING F P	152066	Capita selecta analyse	4	2003	2
1032593	GASSING F P	152070	Meetkunde	9	2003	4
1032593	GASSING F P	152130	Fundamentele analyse	7	2003	3
1032593	GASSING F P	153002	Discrete kansrekening	5	2003	3
1032593	GASSING F P	153036	Statistiek II	4	2003	4
1032593	GASSING F P	153100	Statistiek	4	2003	3
1032593	GASSING F P	157030	Structured Products	9	2003	3
1032593	GASSING F P	211022	Programmeren in C++	5	2003	3
1032593	GASSING F P	211034	Spraaktechnologie	6	2003	3
1032593	GASSING F P	211038	Spraak- en taaltechnologie	2	2002	1
1032593	GASSING F P	211038	Spraak- en taaltechnologie	4	2003	1
1032593	GASSING F P	211123	Component- en aspect georienteerd progammeren	6	2003	3
1032593	GASSING F P	211130	Ubiquitous Computing	8	2003	3
1032593	GASSING F P	211130	Ubiquitous Computing	6	2003	2
1032593	GASSING F P	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	4
1032593	GASSING F P	213011	Gedistribueerde systemen	9	2003	4
1032593	GASSING F P	213120	Inleiding informatie- en communicatietechnologie	6	2003	4
1032593	GASSING F P	213130	Computer Organisatie INF/TEL	5	2003	3
1032593	GASSING F P	213540	Advanced Design of Software Architectures	6	2002	4
1032593	GASSING F P	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	1
1032593	GASSING F P	214511	Database Project	3	2003	3
1032593	GASSING F P	217001	Testtechnieken	4	2003	3
1032593	GASSING F P	232020	Data warehousing & data mining	4	2003	4
1032593	GASSING F P	232050	Electronic Commerce	4	2003	4
1032593	GASSING F P	232055	XML-technologie in E-Commerce	1	2003	1
1032593	GASSING F P	233030	Specificeren van informatiesystemen	6	2003	3
1032593	GASSING F P	234010	Invoering van IT in organisaties	3	2002	4
1032593	GASSING F P	234026	Voortgezette informatiesysteemmodellering	5	2003	4
1032593	GASSING F P	236050	E-health Strategies	5	2003	4
1032593	GASSING F P	237201	Oriëntatie ICT	4	2003	2
1032593	GASSING F P	239805	BIT-BV	5	2003	4
1032593	GASSING F P	239981	Integratieproject	8	2003	3
1032593	GASSING F P	262000	Telematicanetwerken	5	2003	4
1032593	GASSING F P	264001	Telematics and business strategies	9	2003	4
1032593	GASSING F P	264002	Business process engineering	9	2003	4
1032593	GASSING F P	266100	Patterns of software development	6	2003	4
1034470	WIJNANDS Y	121003	Elektronische functies	5	2003	3
1034470	WIJNANDS Y	121005	Netwerkanalyse	6	2003	3
1034470	WIJNANDS Y	121006	Practicum Meetinstrumenten/Netwerkanalyse	8	2003	3
1034470	WIJNANDS Y	121008	Practicum Elektromagnetische Veldtheorie	4	2002	1
1034470	WIJNANDS Y	121008	Practicum Elektromagnetische Veldtheorie	2	2003	1
1034470	WIJNANDS Y	121017	D1-project	6	2003	4
1034470	WIJNANDS Y	121043	Dynamische systemen	7	2003	4
1034470	WIJNANDS Y	121045	Project Mechatronica	5	2003	3
1034470	WIJNANDS Y	121045	Project Mechatronica	3	2002	2
1034470	WIJNANDS Y	121049	Practicum Medische Elektronica	7	2003	3
1034470	WIJNANDS Y	121054	Neurotechnologie	4	2003	4
1034470	WIJNANDS Y	121706	Halfgeleiderdevices	6	2003	3
1034470	WIJNANDS Y	122733	VLSI signal processing	6	2003	2
1034470	WIJNANDS Y	122815	Materiaalkunde van microsystemen	6	2003	4
1034470	WIJNANDS Y	122816	Mechanica en transductietechniek	4	2002	3
1034470	WIJNANDS Y	122829	Systemen en technieken voor informatieopslag	5	2003	4
1034470	WIJNANDS Y	123112	Moderne modulatie- en detectietechnieken	6	2003	4
1034470	WIJNANDS Y	123140	Inleiding systeem- en signaaltheorie voor HBO	9	2003	3
1034470	WIJNANDS Y	124113	Optimal estimation in dynamic systems	4	2003	3
1034470	WIJNANDS Y	124151	Mechatronica	1	2003	2
1034470	WIJNANDS Y	124162	Modelvorming en simulatie	6	2003	4
1034470	WIJNANDS Y	124177	Inleiding elektrische energietechniek	5	2002	1
1034470	WIJNANDS Y	125113	Analoge communicatietechniek	7	2003	4
1034470	WIJNANDS Y	127116	Elektromagnetisme I voor HBO	8	2003	2
1034470	WIJNANDS Y	127117	Biomechatronica	6	2003	3
1034470	WIJNANDS Y	129362	Start P-project	4	2003	2
1034470	WIJNANDS Y	129367	Individual project	5	2003	2
1034470	WIJNANDS Y	150500	Presentatie van een wiskundig onderwerp	8	2003	3
1034470	WIJNANDS Y	150529	Wiskundig modelleren IV	2	2003	1
1034470	WIJNANDS Y	150730	Experimental design	4	2003	3
1034470	WIJNANDS Y	151004	Calculus II-A	5	2003	4
1034470	WIJNANDS Y	151024	Lineaire analyse	2	2003	4
1034470	WIJNANDS Y	151025	Functionaalanalyse II	4	2003	3
1034470	WIJNANDS Y	151033	Numerieke analyse	2	2003	3
1034470	WIJNANDS Y	151051	Fundamentele analyse I	4	2003	3
1034470	WIJNANDS Y	151052	Fundamentele analyse II	7	2003	3
1034470	WIJNANDS Y	151070	Kwantitatieve methoden	8	2002	4
1034470	WIJNANDS Y	151082	Wiskunde II	4	2003	4
1034470	WIJNANDS Y	151092	Modelvorming II	5	2003	4
1034470	WIJNANDS Y	151092	Modelvorming II	6	2003	2
1034470	WIJNANDS Y	151093	Modelvorming III	6	2003	3
1034470	WIJNANDS Y	151206	Lineaire Algebra A	8	2003	3
1034470	WIJNANDS Y	151215	Wiskunde B	8	2003	4
1034470	WIJNANDS Y	151540	Computational Methods in Finance	3	2003	4
1034470	WIJNANDS Y	152028	Analyse A	7	2003	4
1034470	WIJNANDS Y	153004	Statistiek I	9	2003	3
1034470	WIJNANDS Y	153034	Kansrekening en statistiek	3	2003	3
1034470	WIJNANDS Y	153087	Wachttijdtheorie	8	2003	3
1034470	WIJNANDS Y	153088	Stochastische modellen voor Operations Management	8	2003	3
1034470	WIJNANDS Y	154021	Numerieke wiskunde en programmeermethoden	4	2003	1
1034470	WIJNANDS Y	156056	Inleiding wiskundige systeemtheorie	4	2003	4
1034470	WIJNANDS Y	156069	Systemen en Signalen	5	2003	3
1034470	WIJNANDS Y	157035	Financial Econometrics	8	2003	3
1034470	WIJNANDS Y	158018	Operationele research I, practicum	6	2003	4
1034470	WIJNANDS Y	158070	Grafentheorie en operationele research	7	2003	3
1034470	WIJNANDS Y	159918	Bibliotheekgebruik en literatuuropdracht	4	2003	3
1034470	WIJNANDS Y	211032	Seminarium Taal, Kennis & Interactie	4	2003	4
1034470	WIJNANDS Y	211045	Besturingssystemen	6	2003	3
1034470	WIJNANDS Y	211097	Bijzondere onderwerpen gegevensbanken	5	2003	3
1034470	WIJNANDS Y	211098	Databasetransacties en -processen	6	2003	3
1034470	WIJNANDS Y	212010	Informatiesystemen	5	2003	3
1034470	WIJNANDS Y	213005	Computerarchitectuur	1	2003	1
1034470	WIJNANDS Y	213014	Procesbesturing en robotica	3	2003	3
1034470	WIJNANDS Y	213530	Concurrent and distributed programming	2	2003	4
1034470	WIJNANDS Y	214011	Tool Architectuur	5	2003	4
1034470	WIJNANDS Y	214030	Artificial Intelligence	9	2002	1
1034470	WIJNANDS Y	214501	Communicatie & ontwerpen in ICT-projecten 2	3	2003	3
1034470	WIJNANDS Y	214510	MMI-project	3	2003	3
1034470	WIJNANDS Y	232012	Information retrieval en kennisbeheer	2	2003	3
1034470	WIJNANDS Y	232016	Prestatie-analyse van informatiesystemen	4	2003	3
1034470	WIJNANDS Y	232020	Data warehousing & data mining	3	2003	4
1034470	WIJNANDS Y	232055	XML-technologie in E-Commerce	2	2003	1
1034470	WIJNANDS Y	232085	Voortgezette Requirements Engineering	6	2003	4
1034470	WIJNANDS Y	237201	Oriëntatie ICT	1	2003	2
1034470	WIJNANDS Y	237400	BedrijfsProces Ondersteuning	9	2003	1
1034470	WIJNANDS Y	237500	BP lab	1	2003	3
1034470	WIJNANDS Y	264001	Telematics and business strategies	5	2003	4
1034470	WIJNANDS Y	265100	Ontwerpen van telematicasystemen	5	2003	1
1035554	SCHURINGA Q	121002	Practicum elektronische basisschakelingen	7	2003	3
1035554	SCHURINGA Q	121006	Practicum Meetinstrumenten/Netwerkanalyse	7	2003	3
1035554	SCHURINGA Q	121007	Elektromagnetische Veldtheorie	4	2003	1
1035554	SCHURINGA Q	121008	Practicum Elektromagnetische Veldtheorie	6	2002	1
1035554	SCHURINGA Q	121008	Practicum Elektromagnetische Veldtheorie	9	2003	1
1035554	SCHURINGA Q	121021	Inleiding in de biomedische technologie	7	2003	2
1035554	SCHURINGA Q	121025	Digitale beeldbewerking voor beta	9	2003	3
1035554	SCHURINGA Q	121026	Hands-on dig.image proces. and graphical pres.	6	2003	4
1035554	SCHURINGA Q	121035	Mid P-project	9	2003	3
1035554	SCHURINGA Q	121043	Dynamische systemen	9	2003	2
1035554	SCHURINGA Q	121709	Reliability Engineering	7	2003	2
1035554	SCHURINGA Q	121714	I.C. technologie	9	2003	2
1035554	SCHURINGA Q	122481	Systems engineering	5	2003	3
1035554	SCHURINGA Q	122711	Digitale meetsystemen	6	2003	4
1035554	SCHURINGA Q	122814	Elektromagnetisme II voor HBO	2	2003	4
1035554	SCHURINGA Q	122816	Mechanica en transductietechniek	9	2003	2
1035554	SCHURINGA Q	122821	Microtechnologie t.b.v. transducenten	3	2003	3
1035554	SCHURINGA Q	122829	Systemen en technieken voor informatieopslag	4	2003	1
1035554	SCHURINGA Q	122831	Geintegreerde optica	7	2002	4
1035554	SCHURINGA Q	123152	Signal processing in acoustics and audio	8	2002	4
1035554	SCHURINGA Q	124113	Optimal estimation in dynamic systems	9	2003	3
1035554	SCHURINGA Q	124151	Mechatronica	7	2003	2
1035554	SCHURINGA Q	124153	Computer-aided design gereedschappen voor VLSI	4	2003	4
1035554	SCHURINGA Q	124162	Modelvorming en simulatie	6	2003	4
1035554	SCHURINGA Q	124176	Digitale Regeltechniek	6	2003	3
1035554	SCHURINGA Q	124177	Inleiding elektrische energietechniek	8	2002	4
1035554	SCHURINGA Q	124177	Inleiding elektrische energietechniek	5	2002	1
1035554	SCHURINGA Q	125119	Signaaltheorie	1	2003	4
1035554	SCHURINGA Q	129355	Deelname aan een studiegroep	5	2003	3
1035554	SCHURINGA Q	150630	Applied functional analysis	8	2003	4
1035554	SCHURINGA Q	150710	Modelling project	7	2003	3
1035554	SCHURINGA Q	151020	Functionaalanalyse I	8	2003	3
1035554	SCHURINGA Q	151044	Analyse C	6	2003	3
1035554	SCHURINGA Q	151070	Kwantitatieve methoden	8	2003	1
1035554	SCHURINGA Q	151073	Calculus III	2	2003	4
1035554	SCHURINGA Q	151082	Wiskunde II	5	2003	4
1035554	SCHURINGA Q	151085	Wiskunde I	8	2003	3
1035554	SCHURINGA Q	151160	Wiskunde C	4	2003	3
1035554	SCHURINGA Q	151200	Calculus A	6	2003	3
1035554	SCHURINGA Q	152033	Globale analyse	6	2003	4
1035554	SCHURINGA Q	152038	Grafentheorie	8	2003	2
1035554	SCHURINGA Q	152070	Meetkunde	4	2003	4
1035554	SCHURINGA Q	152080	Deterministische en stochastische speltheorie	7	2003	1
1035554	SCHURINGA Q	153003	Kansrekening	5	2003	3
1035554	SCHURINGA Q	153004	Statistiek I	6	2003	3
1035554	SCHURINGA Q	153023	Statistiek II voor TBK	7	2003	3
1035554	SCHURINGA Q	153038	Wiskundige statistiek	9	2003	4
1035554	SCHURINGA Q	153055	Parametervrije statistische methoden	8	2003	3
1035554	SCHURINGA Q	153080	Stochastische modellen in de operationele research	7	2003	4
1035554	SCHURINGA Q	153081	Stochastische modellen v. telecommunicatie syst.	6	2003	2
1035554	SCHURINGA Q	153082	Stochastische simulatie	5	2003	3
1035554	SCHURINGA Q	153083	Stochastische modellen in productie en logistiek	9	2003	2
1035554	SCHURINGA Q	155010	Part. differentiaalverg. uit de math. fysica	8	2003	4
1035554	SCHURINGA Q	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	7	2003	3
1035554	SCHURINGA Q	156067	Robust Control	4	2003	4
1035554	SCHURINGA Q	157030	Structured Products	8	2003	3
1035554	SCHURINGA Q	158025	Mathematische programmering I	1	2003	3
1035554	SCHURINGA Q	158061	Inleiding wiskundige economie	7	2003	4
1035554	SCHURINGA Q	158075	Deterministische modellen in de OR	6	2002	4
1035554	SCHURINGA Q	158075	Deterministische modellen in de OR	5	2003	4
1035554	SCHURINGA Q	158075	Deterministische modellen in de OR	5	2003	1
1035554	SCHURINGA Q	211017	Inleiding programmeren met JAVA	6	2003	1
1035554	SCHURINGA Q	211032	Seminarium Taal, Kennis & Interactie	4	2003	1
1035554	SCHURINGA Q	211045	Besturingssystemen	4	2003	2
1035554	SCHURINGA Q	211113	Constraint Logic Programming	7	2003	4
1035554	SCHURINGA Q	211123	Component- en aspect georienteerd progammeren	7	2003	3
1035554	SCHURINGA Q	211130	Ubiquitous Computing	6	2003	3
1035554	SCHURINGA Q	211180	Basismodellen in de informatica	5	2003	4
1035554	SCHURINGA Q	211205	Functioneel programmeren	8	2003	4
1035554	SCHURINGA Q	213002	Ontwerpen van digitale systemen	7	2003	4
1035554	SCHURINGA Q	213011	Gedistribueerde systemen	4	2003	4
1035554	SCHURINGA Q	213505	Programmeren 2	6	2003	4
1035554	SCHURINGA Q	214030	Artificial Intelligence	4	2002	1
1035554	SCHURINGA Q	214511	Database Project	4	2003	2
1035554	SCHURINGA Q	214513	Internet & Web Architecturen	7	2002	4
1035554	SCHURINGA Q	232020	Data warehousing & data mining	7	2002	3
1035554	SCHURINGA Q	236001	Kwaliteit van de informatievoorziening	6	2003	4
1035554	SCHURINGA Q	237600	Business Case Development for IT-projects	4	2003	3
1035554	SCHURINGA Q	237600	Business Case Development for IT-projects	9	2003	1
1035554	SCHURINGA Q	239981	Integratieproject	8	2002	3
1035554	SCHURINGA Q	239981	Integratieproject	9	1999	1
1035554	SCHURINGA Q	262020	Bijzondere onderwerpen Telematica	5	2003	1
1035554	SCHURINGA Q	265100	Ontwerpen van telematicasystemen	2	2003	3
1035554	SCHURINGA Q	265201	Middleware for distributed objects	8	2003	3
1035554	SCHURINGA Q	269100	P-project TEL	9	2003	4
1038227	FRIJTERS U R	121002	Practicum elektronische basisschakelingen	4	2003	1
1038227	FRIJTERS U R	121021	Inleiding in de biomedische technologie	4	2002	2
1038227	FRIJTERS U R	121021	Inleiding in de biomedische technologie	8	2003	2
1038227	FRIJTERS U R	121035	Mid P-project	3	2003	1
1038227	FRIJTERS U R	121040	Medische elektronica	8	2003	3
1038227	FRIJTERS U R	121041	Elektrodynamica	6	2003	2
1038227	FRIJTERS U R	121045	Project Mechatronica	4	2003	3
1038227	FRIJTERS U R	121709	Reliability Engineering	7	2003	2
1038227	FRIJTERS U R	121714	I.C. technologie	5	2003	4
1038227	FRIJTERS U R	122226	Project voortgezette elektronica	6	2003	3
1038227	FRIJTERS U R	122740	Netwerkanalyse voor TEL	3	2003	3
1038227	FRIJTERS U R	122816	Mechanica en transductietechniek	9	2003	2
1038227	FRIJTERS U R	122828	Practicum realiseren in materialen	9	2003	3
1038227	FRIJTERS U R	122830	Micro electro mechanische systemen	9	2003	4
1038227	FRIJTERS U R	122831	Geintegreerde optica	6	2003	2
1038227	FRIJTERS U R	123153	Embedded Signal Processing	3	2003	1
1038227	FRIJTERS U R	124151	Mechatronica	7	2003	2
1038227	FRIJTERS U R	124163	Mechatronische meetsystemen	6	2003	4
1038227	FRIJTERS U R	124177	Inleiding elektrische energietechniek	9	2003	3
1038227	FRIJTERS U R	124177	Inleiding elektrische energietechniek	3	2002	1
1038227	FRIJTERS U R	125118	Practicum informatie-overdracht	1	2003	2
1038227	FRIJTERS U R	125153	Inleiding communicatiesystemen	9	2003	3
1038227	FRIJTERS U R	125159	Optische communicatienetwerken	8	2003	4
1038227	FRIJTERS U R	127116	Elektromagnetisme I voor HBO	8	2003	3
1038227	FRIJTERS U R	127116	Elektromagnetisme I voor HBO	9	2003	2
1038227	FRIJTERS U R	127117	Biomechatronica	5	2002	3
1038227	FRIJTERS U R	129367	Individual project	8	2003	3
1038227	FRIJTERS U R	150432	Maple practicum II	4	2003	4
1038227	FRIJTERS U R	150710	Modelling project	8	2003	3
1038227	FRIJTERS U R	150810	Modelling project	3	2003	3
1038227	FRIJTERS U R	150910	Advanced modelling	8	2003	4
1038227	FRIJTERS U R	151005	Calculus II-B	9	2003	3
1038227	FRIJTERS U R	151007	Lineaire algebra	3	2003	4
1038227	FRIJTERS U R	151014	Analyse A	8	2003	3
1038227	FRIJTERS U R	151018	Analyse A	4	2003	3
1038227	FRIJTERS U R	151033	Numerieke analyse	8	2003	3
1038227	FRIJTERS U R	151043	Seminarium mathematische fysica	4	2003	1
1038227	FRIJTERS U R	151080	Bijscholing wiskunde B2	1	2003	3
1038227	FRIJTERS U R	151092	Modelvorming II	5	2003	4
1038227	FRIJTERS U R	151140	Wiskunde III	9	2003	3
1038227	FRIJTERS U R	151210	Wiskunde A	5	2003	4
1038227	FRIJTERS U R	151210	Wiskunde A	5	2003	1
1038227	FRIJTERS U R	151220	Wiskunde C	9	2003	3
1038227	FRIJTERS U R	151565	Praktische opdracht Financial Engineering	3	2003	4
1038227	FRIJTERS U R	152070	Meetkunde	5	2003	4
1038227	FRIJTERS U R	152080	Deterministische en stochastische speltheorie	9	2003	1
1038227	FRIJTERS U R	152150	Wiskundig modelleren I	6	2003	4
1038227	FRIJTERS U R	153065	Markov ketens	5	2003	4
1038227	FRIJTERS U R	153084	Analyse en besturing van productie systemen	1	2003	3
1038227	FRIJTERS U R	154023	Numerieke wiskunde en programmeermethoden	5	2003	3
1038227	FRIJTERS U R	156012	Gewone differentiaalvergelijkingen	1	2003	3
1038227	FRIJTERS U R	156033	Bifurcatie theorie	8	2003	4
1038227	FRIJTERS U R	158006	Operationele research II	6	2003	4
1038227	FRIJTERS U R	158075	Deterministische modellen in de OR	3	2003	1
1038227	FRIJTERS U R	159918	Bibliotheekgebruik en literatuuropdracht	2	2003	3
1038227	FRIJTERS U R	211038	Spraak- en taaltechnologie	5	2003	1
1038227	FRIJTERS U R	211045	Besturingssystemen	4	2003	3
1038227	FRIJTERS U R	211054	Computersystemen	8	2003	3
1038227	FRIJTERS U R	211098	Databasetransacties en -processen	8	2003	3
1038227	FRIJTERS U R	211123	Component- en aspect georienteerd progammeren	9	2003	3
1038227	FRIJTERS U R	211131	Statische Objectanalyse en Typering	9	2003	4
1038227	FRIJTERS U R	211185	Taal- en rekenmodellen	9	2003	4
1038227	FRIJTERS U R	213001	Basisbegrippen digitale techniek	8	2002	3
1038227	FRIJTERS U R	213005	Computerarchitectuur	9	2003	1
1038227	FRIJTERS U R	213110	Computerorganisatie	4	2003	1
1038227	FRIJTERS U R	213125	Computersystemen	7	2003	4
1038227	FRIJTERS U R	214011	Tool Architectuur	9	2003	4
1038227	FRIJTERS U R	214025	Algoritmen,datastructuren en complexiteit plus	6	2003	4
1038227	FRIJTERS U R	214511	Database Project	8	2003	3
1038227	FRIJTERS U R	219910	Ontwerpproject	7	2003	3
1038227	FRIJTERS U R	232060	Multi-agent systemen	3	2003	2
1038227	FRIJTERS U R	234004	Softwaremanagement	6	2003	3
1038227	FRIJTERS U R	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1038227	FRIJTERS U R	236050	E-health Strategies	8	2003	4
1038227	FRIJTERS U R	237600	Business Case Development for IT-projects	6	2003	3
1038227	FRIJTERS U R	239801	BIT-BV 2	1	2003	4
1038227	FRIJTERS U R	265200	Implementatie van telematicasystemen	1	2003	1
1038347	WAERBEKE C Z	121001	Elektronische basisschakelingen	7	2003	4
1038347	WAERBEKE C Z	121006	Practicum Meetinstrumenten/Netwerkanalyse	3	2003	3
1038347	WAERBEKE C Z	121017	D1-project	7	2003	4
1038347	WAERBEKE C Z	121018	Stage	6	2003	3
1038347	WAERBEKE C Z	121022	Neurofysiologie	5	2003	4
1038347	WAERBEKE C Z	121033	Project "computer vision"	4	2003	3
1038347	WAERBEKE C Z	121034	Fysische modelvorming van embedded systemen	4	2003	4
1038347	WAERBEKE C Z	121035	Mid P-project	3	2003	3
1038347	WAERBEKE C Z	121045	Project Mechatronica	4	2003	3
1038347	WAERBEKE C Z	121045	Project Mechatronica	6	2003	1
1038347	WAERBEKE C Z	121053	Zekere- en onzekere informatie	4	2003	2
1038347	WAERBEKE C Z	121062	Eind P-project	5	2003	4
1038347	WAERBEKE C Z	121706	Halfgeleiderdevices	1	2003	3
1038347	WAERBEKE C Z	122227	Voortgezette analoge IC elektronica	7	2003	2
1038347	WAERBEKE C Z	122740	Netwerkanalyse voor TEL	7	2003	3
1038347	WAERBEKE C Z	122829	Systemen en technieken voor informatieopslag	9	2003	1
1038347	WAERBEKE C Z	122831	Geintegreerde optica	6	2003	2
1038347	WAERBEKE C Z	123112	Moderne modulatie- en detectietechnieken	7	2003	4
1038347	WAERBEKE C Z	124162	Modelvorming en simulatie	4	2003	4
1038347	WAERBEKE C Z	124163	Mechatronische meetsystemen	4	2003	4
1038347	WAERBEKE C Z	125114	Prestatieanalyse van communicatienetwerken	7	2003	4
1038347	WAERBEKE C Z	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	3
1038347	WAERBEKE C Z	125153	Inleiding communicatiesystemen	5	2003	3
1038347	WAERBEKE C Z	127113	Elektrofysiologische signalen en bio-electriciteit	8	2003	4
1038347	WAERBEKE C Z	127116	Elektromagnetisme I voor HBO	4	2003	3
1038347	WAERBEKE C Z	127117	Biomechatronica	8	2003	2
1038347	WAERBEKE C Z	129348	Maken van een scriptie	7	2003	3
1038347	WAERBEKE C Z	129358	Maken van een scriptie	6	2003	3
1038347	WAERBEKE C Z	129367	Individual project	4	2003	3
1038347	WAERBEKE C Z	150432	Maple practicum II	7	2003	4
1038347	WAERBEKE C Z	150500	Presentatie van een wiskundig onderwerp	8	2003	1
1038347	WAERBEKE C Z	150700	Introduction to operations research	8	2003	4
1038347	WAERBEKE C Z	151004	Calculus II-A	1	2003	4
1038347	WAERBEKE C Z	151005	Calculus II-B	9	2003	3
1038347	WAERBEKE C Z	151204	Calculus C	5	2003	4
1038347	WAERBEKE C Z	151560	Introduction to Investment Theory	8	2003	4
1038347	WAERBEKE C Z	151570	Financial Engineering	9	2003	3
1038347	WAERBEKE C Z	152066	Capita selecta analyse	8	2003	2
1038347	WAERBEKE C Z	152068	Discrete wiskunde	9	2003	2
1038347	WAERBEKE C Z	152075	Grafentheorie	5	2003	3
1038347	WAERBEKE C Z	152080	Deterministische en stochastische speltheorie	6	2003	1
1038347	WAERBEKE C Z	153016	Voortgezette wiskundige statistiek	6	2003	3
1038347	WAERBEKE C Z	153021	Statistiek I voor TBK	5	2003	4
1038347	WAERBEKE C Z	153029	Statistiek II	8	2003	4
1038347	WAERBEKE C Z	153039	Kansrekening en statistiek	7	2003	3
1038347	WAERBEKE C Z	153045	Lineaire statistische modellen	8	2003	4
1038347	WAERBEKE C Z	153087	Wachttijdtheorie	9	2003	3
1038347	WAERBEKE C Z	153110	Inleiding statistiek	4	2003	3
1038347	WAERBEKE C Z	154023	Numerieke wiskunde en programmeermethoden	4	2003	3
1038347	WAERBEKE C Z	155010	Part. differentiaalverg. uit de math. fysica	2	2003	2
1038347	WAERBEKE C Z	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	3	2003	3
1038347	WAERBEKE C Z	156016	Analyse B	2	2003	1
1038347	WAERBEKE C Z	156033	Bifurcatie theorie	8	2003	4
1038347	WAERBEKE C Z	157008	Stochastische processen in dynamische systemen	5	2003	3
1038347	WAERBEKE C Z	157016	Stochastische filter- en besturingstheorie	4	2003	3
1038347	WAERBEKE C Z	157020	Dynamische discrete gebeurtenissen	8	2003	4
1038347	WAERBEKE C Z	158070	Grafentheorie en operationele research	7	2003	1
1038347	WAERBEKE C Z	158075	Deterministische modellen in de OR	7	2002	4
1038347	WAERBEKE C Z	158075	Deterministische modellen in de OR	8	2003	4
1038347	WAERBEKE C Z	211024	Programmeren in C++	7	2003	4
1038347	WAERBEKE C Z	211038	Spraak- en taaltechnologie	4	2003	4
1038347	WAERBEKE C Z	211045	Besturingssystemen	4	2003	3
1038347	WAERBEKE C Z	211045	Besturingssystemen	5	2003	2
1038347	WAERBEKE C Z	211090	Databasetoepassingen	9	2003	4
1038347	WAERBEKE C Z	211096	XML & Databases	5	2003	3
1038347	WAERBEKE C Z	211098	Databasetransacties en -processen	5	2003	2
1038347	WAERBEKE C Z	211113	Constraint Logic Programming	7	2003	4
1038347	WAERBEKE C Z	211129	Taaltechnologie	5	2003	4
1038347	WAERBEKE C Z	211185	Taal- en rekenmodellen	5	2003	4
1038347	WAERBEKE C Z	212018	Kennistechnologie voor bedrijfskundige toep.	4	2003	4
1038347	WAERBEKE C Z	213510	Software Engineering Modellen	5	2003	4
1038347	WAERBEKE C Z	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2001	3
1038347	WAERBEKE C Z	214513	Internet & Web Architecturen	6	2002	4
1038347	WAERBEKE C Z	232050	Electronic Commerce	2	2002	4
1038347	WAERBEKE C Z	232050	Electronic Commerce	6	2003	2
1038347	WAERBEKE C Z	233035	Practicum Databases in Informatiesystemen	3	2003	4
1038347	WAERBEKE C Z	234010	Invoering van IT in organisaties	6	2003	4
1038347	WAERBEKE C Z	237400	BedrijfsProces Ondersteuning	9	2003	3
1038347	WAERBEKE C Z	237600	Business Case Development for IT-projects	4	2003	1
1038347	WAERBEKE C Z	239981	Integratieproject	7	2000	4
1038347	WAERBEKE C Z	261000	Telematicasystemen en toepassingen	8	2003	2
1038347	WAERBEKE C Z	262001	Mobile and wireless networking	8	2003	2
1038347	WAERBEKE C Z	262020	Bijzondere onderwerpen Telematica	7	2003	1
1038347	WAERBEKE C Z	264000	Telematicatoepassingen	1	2003	3
1038371	OELE Y B	262020	Bijzondere onderwerpen Telematica	5	2003	1
1038371	OELE Y B	264000	Telematicatoepassingen	4	2003	3
1038371	OELE Y B	264001	Telematics and business strategies	7	2003	4
1038371	OELE Y B	265100	Ontwerpen van telematicasystemen	9	2003	3
1038371	OELE Y B	265300	Operationeel management van telematicasystemen	8	2003	3
1038371	OELE Y B	269100	P-project TEL	8	2003	2
1041121	SMIT N K	211022	Programmeren in C++	4	2003	3
1041121	SMIT N K	211027	Inleiding programmeren met MATLAB	5	2003	3
1041121	SMIT N K	211038	Spraak- en taaltechnologie	2	2003	1
1041121	SMIT N K	211090	Databasetoepassingen	2	2003	4
1041121	SMIT N K	211095	Gedistribueerde databases & middleware technologie	4	2003	4
1041121	SMIT N K	213014	Procesbesturing en robotica	4	2003	3
1041121	SMIT N K	214030	Artificial Intelligence	8	2002	1
1041121	SMIT N K	214513	Internet & Web Architecturen	2	2002	4
1041121	SMIT N K	232016	Prestatie-analyse van informatiesystemen	4	2003	3
1042629	BOLDERING A	121050	Modern robotics	9	2003	3
1041121	SMIT N K	232020	Data warehousing & data mining	8	2002	3
1041121	SMIT N K	232020	Data warehousing & data mining	8	2003	4
1041121	SMIT N K	233030	Specificeren van informatiesystemen	6	2003	3
1041121	SMIT N K	233030	Specificeren van informatiesystemen	3	2003	1
1041121	SMIT N K	234001	Productie-informatietechnologie	1	2003	3
1041121	SMIT N K	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1041121	SMIT N K	237201	Oriëntatie ICT	5	2003	2
1041121	SMIT N K	239981	Integratieproject	8	2000	4
1041121	SMIT N K	264001	Telematics and business strategies	8	2003	4
1041121	SMIT N K	269004	Refresher Logics, Probability,Databases and JAVA	6	2003	1
1041376	LUDEMAN U	211050	Structuur van programmeertalen	8	2003	3
1041376	LUDEMAN U	211054	Computersystemen	4	2003	2
1041376	LUDEMAN U	211077	Database-ontwerp	8	2003	4
1041376	LUDEMAN U	211081	Distributed E-business Techniques	4	2003	1
1041376	LUDEMAN U	211111	Parallelle processen	9	2003	3
1041376	LUDEMAN U	211133	Ontwerpen van Software Architecturen	9	2003	3
1041376	LUDEMAN U	211185	Taal- en rekenmodellen	8	2003	1
1041376	LUDEMAN U	213002	Ontwerpen van digitale systemen	6	2003	4
1041376	LUDEMAN U	213005	Computerarchitectuur	7	2003	1
1041376	LUDEMAN U	213125	Computersystemen	7	2003	4
1041376	LUDEMAN U	213500	Programmeren 1	4	2003	4
1041376	LUDEMAN U	232060	Multi-agent systemen	4	2003	4
1041376	LUDEMAN U	235005	Inleiding bedrijfsinformatiesystemen	7	2003	3
1041376	LUDEMAN U	236001	Kwaliteit van de informatievoorziening	8	2003	4
1041376	LUDEMAN U	237201	Oriëntatie ICT	7	2003	4
1041376	LUDEMAN U	237450	Bedrijfsfunctie ondersteuning	5	2003	3
1041376	LUDEMAN U	261000	Telematicasystemen en toepassingen	5	2003	3
1041376	LUDEMAN U	261010	Computer netwerken	5	2003	3
1041376	LUDEMAN U	265300	Operationeel management van telematicasystemen	5	2003	3
1041376	LUDEMAN U	266100	Patterns of software development	3	2003	4
1042262	EBBENS X N	121001	Elektronische basisschakelingen	2	2003	4
1042262	EBBENS X N	121004	Practicum elektronische functies	8	2003	2
1042262	EBBENS X N	121006	Practicum Meetinstrumenten/Netwerkanalyse	6	2003	3
1042262	EBBENS X N	121007	Elektromagnetische Veldtheorie	8	2001	4
1042262	EBBENS X N	121007	Elektromagnetische Veldtheorie	9	2002	1
1042262	EBBENS X N	121009	Inleiding telecommunicatie	6	2003	4
1042262	EBBENS X N	121018	Stage	8	2003	1
1042262	EBBENS X N	121021	Inleiding in de biomedische technologie	4	2002	2
1042262	EBBENS X N	121026	Hands-on dig.image proces. and graphical pres.	4	2002	3
1042262	EBBENS X N	121026	Hands-on dig.image proces. and graphical pres.	7	2003	1
1042262	EBBENS X N	121034	Fysische modelvorming van embedded systemen	6	2003	4
1042262	EBBENS X N	121035	Mid P-project	9	2003	3
1042262	EBBENS X N	121035	Mid P-project	4	2003	1
1042262	EBBENS X N	121037	Advanced digital signal processing	7	2003	3
1042262	EBBENS X N	121041	Elektrodynamica	7	2003	2
1042262	EBBENS X N	121043	Dynamische systemen	4	2003	2
1042262	EBBENS X N	121049	Practicum Medische Elektronica	2	2003	3
1042262	EBBENS X N	121056	Laboratorium op een chip	6	2003	3
1042262	EBBENS X N	121706	Halfgeleiderdevices	8	2003	3
1042262	EBBENS X N	121706	Halfgeleiderdevices	4	2003	1
1042262	EBBENS X N	121709	Reliability Engineering	2	2002	4
1042262	EBBENS X N	121714	I.C. technologie	5	2003	4
1042262	EBBENS X N	122634	Real-time software development	9	2003	3
1042262	EBBENS X N	122711	Digitale meetsystemen	4	2003	4
1042262	EBBENS X N	122729	Image processing	3	2003	4
1042262	EBBENS X N	122733	VLSI signal processing	8	2003	4
1042262	EBBENS X N	122816	Mechanica en transductietechniek	7	2002	2
1042262	EBBENS X N	122830	Micro electro mechanische systemen	9	2003	4
1042262	EBBENS X N	123153	Embedded Signal Processing	9	2003	1
1042262	EBBENS X N	124113	Optimal estimation in dynamic systems	6	2003	3
1042262	EBBENS X N	124151	Mechatronica	4	2002	4
1042262	EBBENS X N	124151	Mechatronica	6	2003	4
1042262	EBBENS X N	124163	Mechatronische meetsystemen	5	2003	4
1042262	EBBENS X N	124177	Inleiding elektrische energietechniek	6	2003	3
1042262	EBBENS X N	127113	Elektrofysiologische signalen en bio-electriciteit	9	2003	4
1042262	EBBENS X N	127117	Biomechatronica	9	2001	3
1042262	EBBENS X N	129348	Maken van een scriptie	9	2003	3
1042262	EBBENS X N	129362	Start P-project	1	2003	2
1042262	EBBENS X N	150433	Wiskundig modelleren voor CiT	9	2003	4
1042262	EBBENS X N	150700	Introduction to operations research	5	2003	4
1042262	EBBENS X N	150730	Experimental design	5	2003	3
1042262	EBBENS X N	151004	Calculus II-A	8	2003	4
1042262	EBBENS X N	151019	Analyse B	5	2003	4
1042262	EBBENS X N	151043	Seminarium mathematische fysica	5	2003	4
1042262	EBBENS X N	151051	Fundamentele analyse I	9	2003	1
1042262	EBBENS X N	151070	Kwantitatieve methoden	4	2003	1
1042262	EBBENS X N	151072	Wiskunde II	8	2003	1
1042262	EBBENS X N	151081	Wiskunde I	2	2003	3
1042262	EBBENS X N	151120	Wiskunde I	6	2003	4
1042262	EBBENS X N	151140	Wiskunde III	9	2003	3
1042262	EBBENS X N	151208	Lineaire Algebra B	2	2003	3
1042262	EBBENS X N	151565	Praktische opdracht Financial Engineering	7	2003	4
1042262	EBBENS X N	152068	Discrete wiskunde	7	2003	2
1042262	EBBENS X N	152070	Meetkunde	5	2003	4
1042262	EBBENS X N	152100	Calculus I	9	2003	4
1042262	EBBENS X N	152150	Wiskundig modelleren I	5	2003	4
1042262	EBBENS X N	153023	Statistiek II voor TBK	1	2003	3
1042262	EBBENS X N	153065	Markov ketens	6	2003	4
1042262	EBBENS X N	153080	Stochastische modellen in de operationele research	4	2003	4
1042262	EBBENS X N	153081	Stochastische modellen v. telecommunicatie syst.	7	2003	2
1042262	EBBENS X N	153082	Stochastische simulatie	5	2003	3
1042262	EBBENS X N	153086	Telecommunicatiesystemen	9	2003	4
1042262	EBBENS X N	156033	Bifurcatie theorie	8	2003	4
1042262	EBBENS X N	156062	Systeem- en besturingstheorie	6	2003	4
1042262	EBBENS X N	158017	Operationele research I	6	2003	4
1042262	EBBENS X N	158022	Operationele research III	1	2003	3
1042262	EBBENS X N	159928	Doctoraalstage	4	2003	3
1042262	EBBENS X N	211032	Seminarium Taal, Kennis & Interactie	7	2003	4
1042262	EBBENS X N	211034	Spraaktechnologie	8	2003	2
1042262	EBBENS X N	211090	Databasetoepassingen	4	2003	4
1042262	EBBENS X N	211097	Bijzondere onderwerpen gegevensbanken	9	2003	3
1042262	EBBENS X N	211113	Constraint Logic Programming	5	2003	4
1042262	EBBENS X N	211123	Component- en aspect georienteerd progammeren	8	2003	1
1042262	EBBENS X N	212018	Kennistechnologie voor bedrijfskundige toep.	5	2003	4
1042262	EBBENS X N	213110	Computerorganisatie	5	2003	4
1042262	EBBENS X N	214511	Database Project	4	2003	2
1042262	EBBENS X N	232080	Requirements Engineering	7	2003	3
1042262	EBBENS X N	233030	Specificeren van informatiesystemen	5	2003	1
1042262	EBBENS X N	233035	Practicum Databases in Informatiesystemen	8	2002	3
1042262	EBBENS X N	237201	Oriëntatie ICT	9	2003	2
1042262	EBBENS X N	239800	BIT-BV 1	9	2003	4
1042262	EBBENS X N	239981	Integratieproject	6	2001	2
1042262	EBBENS X N	265201	Middleware for distributed objects	6	2002	4
1042262	EBBENS X N	265310	Internet management architecturen	4	2003	3
1042386	GERRITS Y I	121002	Practicum elektronische basisschakelingen	7	2003	3
1042386	GERRITS Y I	121008	Practicum Elektromagnetische Veldtheorie	5	2003	3
1042386	GERRITS Y I	121008	Practicum Elektromagnetische Veldtheorie	6	2003	1
1042386	GERRITS Y I	121021	Inleiding in de biomedische technologie	4	2002	2
1042386	GERRITS Y I	121021	Inleiding in de biomedische technologie	6	2003	2
1042386	GERRITS Y I	121044	Regeltechniek	7	2003	4
1042386	GERRITS Y I	121044	Regeltechniek	4	2003	2
1042386	GERRITS Y I	121045	Project Mechatronica	8	2003	3
1042386	GERRITS Y I	121045	Project Mechatronica	5	2002	2
1042386	GERRITS Y I	121049	Practicum Medische Elektronica	4	2003	3
1042386	GERRITS Y I	121053	Zekere- en onzekere informatie	1	2003	3
1042386	GERRITS Y I	121067	Signaal analyse practicum	8	2003	4
1042386	GERRITS Y I	121717	Advanced semiconductor devices	8	2003	3
1042386	GERRITS Y I	122227	Voortgezette analoge IC elektronica	6	2003	2
1042386	GERRITS Y I	122481	Systems engineering	7	2003	3
1042386	GERRITS Y I	122634	Real-time software development	9	2003	3
1042386	GERRITS Y I	122815	Materiaalkunde van microsystemen	9	2003	4
1042386	GERRITS Y I	122821	Microtechnologie t.b.v. transducenten	3	2003	3
1042386	GERRITS Y I	122829	Systemen en technieken voor informatieopslag	9	2003	1
1042386	GERRITS Y I	122831	Geintegreerde optica	4	2003	2
1042386	GERRITS Y I	123112	Moderne modulatie- en detectietechnieken	9	2003	4
1042386	GERRITS Y I	123152	Signal processing in acoustics and audio	5	2002	4
1042386	GERRITS Y I	123153	Embedded Signal Processing	4	2003	1
1042386	GERRITS Y I	124113	Optimal estimation in dynamic systems	5	2003	3
1042386	GERRITS Y I	124153	Computer-aided design gereedschappen voor VLSI	8	2003	4
1042386	GERRITS Y I	125159	Optische communicatienetwerken	6	2003	4
1042386	GERRITS Y I	127117	Biomechatronica	7	2001	3
1042386	GERRITS Y I	129348	Maken van een scriptie	6	2003	3
1042386	GERRITS Y I	129357	Deelname aan een project	6	2003	4
1042386	GERRITS Y I	150433	Wiskundig modelleren voor CiT	1	2003	4
1042386	GERRITS Y I	150500	Presentatie van een wiskundig onderwerp	2	2003	3
1042386	GERRITS Y I	150529	Wiskundig modelleren IV	7	2003	4
1042386	GERRITS Y I	150630	Applied functional analysis	1	2003	4
1042386	GERRITS Y I	151010	Lineaire structuren	4	2003	3
1042386	GERRITS Y I	151018	Analyse A	7	2003	3
1042386	GERRITS Y I	151025	Functionaalanalyse II	4	2003	3
1042386	GERRITS Y I	151043	Seminarium mathematische fysica	9	2003	4
1042386	GERRITS Y I	151044	Analyse C	7	2003	3
1042386	GERRITS Y I	151086	Vectoranalyse voor BMT	9	2003	3
1042386	GERRITS Y I	151208	Lineaire Algebra B	8	2003	3
1042386	GERRITS Y I	151215	Wiskunde B	7	2003	4
1042386	GERRITS Y I	151540	Computational Methods in Finance	6	2003	4
1042386	GERRITS Y I	152038	Grafentheorie	8	2003	3
1042386	GERRITS Y I	152056	Combinatoriek	4	2003	4
1042386	GERRITS Y I	152070	Meetkunde	7	2003	4
1042386	GERRITS Y I	152100	Calculus I	6	2003	4
1042386	GERRITS Y I	153006	Kansrekening	6	2003	3
1042386	GERRITS Y I	153016	Voortgezette wiskundige statistiek	6	2003	3
1042386	GERRITS Y I	153083	Stochastische modellen in productie en logistiek	8	2003	2
1042386	GERRITS Y I	156014	Analyse B	9	2003	4
1042386	GERRITS Y I	157030	Structured Products	9	2003	3
1042386	GERRITS Y I	159927	Doctoraalstage	9	2003	4
1042386	GERRITS Y I	211017	Inleiding programmeren met JAVA	3	2003	3
1042386	GERRITS Y I	211034	Spraaktechnologie	2	2003	3
1042386	GERRITS Y I	211038	Spraak- en taaltechnologie	4	2002	1
1042386	GERRITS Y I	211077	Database-ontwerp	9	2003	4
1042386	GERRITS Y I	211096	XML & Databases	7	2003	1
1042386	GERRITS Y I	211185	Taal- en rekenmodellen	6	2003	1
1042386	GERRITS Y I	213002	Ontwerpen van digitale systemen	6	2003	4
1042386	GERRITS Y I	213005	Computerarchitectuur	8	2003	4
1042386	GERRITS Y I	213009	Fouten tolererende digitale systemen	2	2003	1
1042386	GERRITS Y I	213110	Computerorganisatie	8	2003	1
1042386	GERRITS Y I	213125	Computersystemen	7	2003	4
1042386	GERRITS Y I	213130	Computer Organisatie INF/TEL	5	2003	2
1042386	GERRITS Y I	213505	Programmeren 2	1	2003	4
1042386	GERRITS Y I	213530	Concurrent and distributed programming	7	2002	4
1042386	GERRITS Y I	213540	Advanced Design of Software Architectures	2	2002	4
1042386	GERRITS Y I	214010	Complexiteit van berekeningen	3	2003	3
1042386	GERRITS Y I	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	3
1042386	GERRITS Y I	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	1
1042386	GERRITS Y I	214513	Internet & Web Architecturen	5	2002	4
1042386	GERRITS Y I	214513	Internet & Web Architecturen	8	2003	2
1042386	GERRITS Y I	219910	Ontwerpproject	4	2003	3
1042386	GERRITS Y I	232050	Electronic Commerce	7	2003	2
1042386	GERRITS Y I	232055	XML-technologie in E-Commerce	5	2003	4
1042386	GERRITS Y I	232060	Multi-agent systemen	9	2003	2
1042386	GERRITS Y I	234010	Invoering van IT in organisaties	6	2002	4
1042386	GERRITS Y I	234026	Voortgezette informatiesysteemmodellering	2	2003	4
1042386	GERRITS Y I	235022	Investeringen in informatietechnologie	5	2003	4
1042386	GERRITS Y I	237201	Oriëntatie ICT	6	2003	4
1042386	GERRITS Y I	237201	Oriëntatie ICT	1	2003	2
1042386	GERRITS Y I	237400	BedrijfsProces Ondersteuning	9	2003	3
1042386	GERRITS Y I	239981	Integratieproject	7	2000	1
1042386	GERRITS Y I	261010	Computer netwerken	6	2003	3
1042386	GERRITS Y I	262001	Mobile and wireless networking	9	2003	4
1042386	GERRITS Y I	263000	Telematicadiensten	8	2003	4
1042386	GERRITS Y I	265200	Implementatie van telematicasystemen	6	2003	4
1042386	GERRITS Y I	265201	Middleware for distributed objects	8	2003	3
1042386	GERRITS Y I	265300	Operationeel management van telematicasystemen	5	2003	3
1042386	GERRITS Y I	265310	Internet management architecturen	7	2003	3
1042386	GERRITS Y I	269001	Portfolio ontwerp	6	2003	4
1042629	BOLDERING A	121000	Instrumentatie van embedded systemen	7	2003	3
1042629	BOLDERING A	121007	Elektromagnetische Veldtheorie	4	2001	4
1042629	BOLDERING A	121008	Practicum Elektromagnetische Veldtheorie	4	2001	3
1042629	BOLDERING A	121008	Practicum Elektromagnetische Veldtheorie	5	2002	1
1042629	BOLDERING A	121008	Practicum Elektromagnetische Veldtheorie	7	2003	1
1042629	BOLDERING A	121018	Stage	9	2003	3
1042629	BOLDERING A	121018	Stage	2	2003	1
1042629	BOLDERING A	121021	Inleiding in de biomedische technologie	7	2003	2
1042629	BOLDERING A	121026	Hands-on dig.image proces. and graphical pres.	6	2002	3
1042629	BOLDERING A	121026	Hands-on dig.image proces. and graphical pres.	8	2003	1
1042629	BOLDERING A	121028	Computer vision	7	2003	4
1042629	BOLDERING A	121067	Signaal analyse practicum	7	2002	4
1042629	BOLDERING A	121706	Halfgeleiderdevices	6	2003	3
1042629	BOLDERING A	122230	Integrated circuits and systems for mixed signals	9	2003	4
1042629	BOLDERING A	122711	Digitale meetsystemen	3	2003	4
1042629	BOLDERING A	122740	Netwerkanalyse voor TEL	9	2003	3
1042629	BOLDERING A	122814	Elektromagnetisme II voor HBO	5	2003	1
1042629	BOLDERING A	122831	Geintegreerde optica	7	2003	3
1042629	BOLDERING A	123112	Moderne modulatie- en detectietechnieken	5	2003	4
1042629	BOLDERING A	123153	Embedded Signal Processing	5	2003	1
1042629	BOLDERING A	124163	Mechatronische meetsystemen	4	2003	4
1042629	BOLDERING A	124176	Digitale Regeltechniek	1	2003	3
1042629	BOLDERING A	125114	Prestatieanalyse van communicatienetwerken	4	2003	4
1042629	BOLDERING A	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	1
1042629	BOLDERING A	127113	Elektrofysiologische signalen en bio-electriciteit	6	2003	4
1042629	BOLDERING A	127113	Elektrofysiologische signalen en bio-electriciteit	4	2003	1
1042629	BOLDERING A	127116	Elektromagnetisme I voor HBO	8	2003	3
1042629	BOLDERING A	129357	Deelname aan een project	6	2003	4
1042629	BOLDERING A	129367	Individual project	9	2003	2
1042629	BOLDERING A	150526	Wiskundig modelleren I	1	2003	3
1042629	BOLDERING A	151004	Calculus II-A	9	2003	4
1042629	BOLDERING A	151005	Calculus II-B	2	2003	3
1042629	BOLDERING A	151025	Functionaalanalyse II	9	2003	3
1042629	BOLDERING A	151044	Analyse C	4	2003	3
1042629	BOLDERING A	151082	Wiskunde II	7	2003	4
1042629	BOLDERING A	151084	Wiskunde IV	6	2003	4
1042629	BOLDERING A	151208	Lineaire Algebra B	5	2003	3
1042629	BOLDERING A	151530	Continuous Time Finance	7	2003	4
1042629	BOLDERING A	151560	Introduction to Investment Theory	5	2003	4
1042629	BOLDERING A	152038	Grafentheorie	8	2003	3
1042629	BOLDERING A	152068	Discrete wiskunde	9	2003	3
1042629	BOLDERING A	152100	Calculus I	7	2003	4
1042629	BOLDERING A	153003	Kansrekening	8	2003	3
1042629	BOLDERING A	153031	Statistiek	4	2003	3
1042629	BOLDERING A	153080	Stochastische modellen in de operationele research	7	2003	4
1042629	BOLDERING A	153083	Stochastische modellen in productie en logistiek	8	2003	3
1042629	BOLDERING A	153083	Stochastische modellen in productie en logistiek	5	2003	2
1042629	BOLDERING A	153110	Inleiding statistiek	5	2003	3
1042629	BOLDERING A	155019	Practicum softwarepakketten PDV	4	2003	3
1042629	BOLDERING A	156062	Systeem- en besturingstheorie	9	2003	4
1042629	BOLDERING A	157021	Analyse van signaaloverdracht in communicatienetw.	7	2003	4
1042629	BOLDERING A	158022	Operationele research III	8	2003	3
1042629	BOLDERING A	158075	Deterministische modellen in de OR	9	2002	4
1042629	BOLDERING A	159918	Bibliotheekgebruik en literatuuropdracht	7	2003	3
1042629	BOLDERING A	159928	Doctoraalstage	8	2003	3
1042629	BOLDERING A	211032	Seminarium Taal, Kennis & Interactie	4	2002	3
1042629	BOLDERING A	211033	Neurale netwerken en neuro-computing	8	2003	3
1042629	BOLDERING A	211038	Spraak- en taaltechnologie	4	2002	3
1042629	BOLDERING A	211038	Spraak- en taaltechnologie	2	2002	1
1042629	BOLDERING A	211047	Besturingssystemen voor Telematica	9	2003	4
1042629	BOLDERING A	211074	Gegevensbanken	2	2003	4
1042629	BOLDERING A	211090	Databasetoepassingen	8	2003	4
1042629	BOLDERING A	211097	Bijzondere onderwerpen gegevensbanken	4	2003	3
1042629	BOLDERING A	211112	Inleiding Logica	7	2003	4
1042629	BOLDERING A	213005	Computerarchitectuur	9	2003	4
1042629	BOLDERING A	213009	Fouten tolererende digitale systemen	3	2003	1
1042629	BOLDERING A	213011	Gedistribueerde systemen	4	2003	4
1042629	BOLDERING A	213012	Hardware/software co-design	4	2003	2
1042629	BOLDERING A	213014	Procesbesturing en robotica	4	2003	3
1042629	BOLDERING A	213125	Computersystemen	8	2003	4
1042629	BOLDERING A	213130	Computer Organisatie INF/TEL	8	2003	3
1042629	BOLDERING A	213540	Advanced Design of Software Architectures	7	2003	1
1042629	BOLDERING A	214020	Algoritmen,datastructuren en complexiteit	8	2003	4
1042629	BOLDERING A	214510	MMI-project	8	2003	3
1042629	BOLDERING A	232050	Electronic Commerce	6	2003	2
1042629	BOLDERING A	233035	Practicum Databases in Informatiesystemen	5	2002	1
1042629	BOLDERING A	234001	Productie-informatietechnologie	8	2003	3
1042629	BOLDERING A	234004	Softwaremanagement	7	2003	3
1042629	BOLDERING A	239981	Integratieproject	9	1999	1
1042629	BOLDERING A	261010	Computer netwerken	4	2003	1
1042629	BOLDERING A	263000	Telematicadiensten	5	2003	1
1042629	BOLDERING A	263100	Mobile E-health application and services	8	2003	4
1042629	BOLDERING A	263200	Gedistribueerde multimedia database systemen	5	2003	4
1042629	BOLDERING A	265100	Ontwerpen van telematicasystemen	5	2003	3
1042629	BOLDERING A	265300	Operationeel management van telematicasystemen	6	2003	3
1042629	BOLDERING A	269100	P-project TEL	1	2003	2
1043903	BOSCH M N	121003	Elektronische functies	1	2003	3
1043903	BOSCH M N	121009	Inleiding telecommunicatie	4	2003	4
1043903	BOSCH M N	121019	D-opdracht	4	2003	3
1043903	BOSCH M N	121021	Inleiding in de biomedische technologie	9	2002	4
1043903	BOSCH M N	121022	Neurofysiologie	7	2003	4
1043903	BOSCH M N	121041	Elektrodynamica	5	2003	4
1043903	BOSCH M N	121044	Regeltechniek	5	2003	2
1043903	BOSCH M N	121045	Project Mechatronica	5	2003	1
1043903	BOSCH M N	121056	Laboratorium op een chip	3	2003	3
1043903	BOSCH M N	121067	Signaal analyse practicum	8	2002	4
1043903	BOSCH M N	121067	Signaal analyse practicum	4	2003	2
1043903	BOSCH M N	121709	Reliability Engineering	2	2003	2
1043903	BOSCH M N	121714	I.C. technologie	2	2003	4
1043903	BOSCH M N	122729	Image processing	3	2003	4
1043903	BOSCH M N	122816	Mechanica en transductietechniek	9	2003	2
1043903	BOSCH M N	122821	Microtechnologie t.b.v. transducenten	9	2003	3
1043903	BOSCH M N	123153	Embedded Signal Processing	6	2003	4
1043903	BOSCH M N	123153	Embedded Signal Processing	6	2003	1
1043903	BOSCH M N	124153	Computer-aided design gereedschappen voor VLSI	5	2003	4
1043903	BOSCH M N	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	3
1043903	BOSCH M N	127117	Biomechatronica	4	2003	2
1043903	BOSCH M N	129358	Maken van een scriptie	9	2003	3
1043903	BOSCH M N	150526	Wiskundig modelleren I	6	2003	3
1043903	BOSCH M N	150600	Mathematical methods	9	2003	3
1043903	BOSCH M N	150625	Scientific communication	4	2003	3
1043903	BOSCH M N	151007	Lineaire algebra	1	2003	4
1043903	BOSCH M N	151010	Lineaire structuren	5	2003	3
1043903	BOSCH M N	151015	Numerieke lineaire algebra	9	2003	3
1043903	BOSCH M N	151033	Numerieke analyse	7	2003	3
1043903	BOSCH M N	151051	Fundamentele analyse I	5	2003	3
1043903	BOSCH M N	151092	Modelvorming II	4	2003	2
1043903	BOSCH M N	151140	Wiskunde III	5	2003	3
1043903	BOSCH M N	151210	Wiskunde A	8	2003	1
1043903	BOSCH M N	151215	Wiskunde B	9	2003	4
1043903	BOSCH M N	152025	Complexe functietheorie	9	2003	3
1043903	BOSCH M N	152056	Combinatoriek	6	2003	4
1043903	BOSCH M N	152066	Capita selecta analyse	8	2003	2
1043903	BOSCH M N	153080	Stochastische modellen in de operationele research	6	2003	4
1043903	BOSCH M N	153087	Wachttijdtheorie	4	2003	3
1043903	BOSCH M N	154023	Numerieke wiskunde en programmeermethoden	8	2003	1
1043903	BOSCH M N	155009	Fundamenten van de methode der eindige elementen	1	2003	3
1043903	BOSCH M N	156016	Analyse B	7	2003	1
1043903	BOSCH M N	156057	Inleiding wiskundige systeemtheorie	4	2003	4
1043903	BOSCH M N	157035	Financial Econometrics	4	2003	3
1043903	BOSCH M N	158075	Deterministische modellen in de OR	8	2003	4
1043903	BOSCH M N	159928	Doctoraalstage	7	2003	3
1043903	BOSCH M N	211017	Inleiding programmeren met JAVA	8	2003	3
1043903	BOSCH M N	211047	Besturingssystemen voor Telematica	7	2003	4
1043903	BOSCH M N	211095	Gedistribueerde databases & middleware technologie	9	2003	1
1043903	BOSCH M N	211098	Databasetransacties en -processen	9	2003	3
1043903	BOSCH M N	211123	Component- en aspect georienteerd progammeren	9	2003	3
1043903	BOSCH M N	211123	Component- en aspect georienteerd progammeren	4	2003	1
1043903	BOSCH M N	211129	Taaltechnologie	9	2003	4
1043903	BOSCH M N	211133	Ontwerpen van Software Architecturen	7	2003	1
1043903	BOSCH M N	211180	Basismodellen in de informatica	3	2003	2
1043903	BOSCH M N	211185	Taal- en rekenmodellen	5	2003	1
1043903	BOSCH M N	211205	Functioneel programmeren	6	2003	4
1043903	BOSCH M N	212018	Kennistechnologie voor bedrijfskundige toep.	5	2003	4
1043903	BOSCH M N	213005	Computerarchitectuur	7	2003	1
1043903	BOSCH M N	213014	Procesbesturing en robotica	1	2003	3
1043903	BOSCH M N	213110	Computerorganisatie	9	2003	1
1043903	BOSCH M N	214511	Database Project	6	2003	3
1043903	BOSCH M N	217001	Testtechnieken	9	2003	3
1043903	BOSCH M N	232012	Information retrieval en kennisbeheer	8	2003	3
1043903	BOSCH M N	232016	Prestatie-analyse van informatiesystemen	4	2002	4
1043903	BOSCH M N	232055	XML-technologie in E-Commerce	6	2003	4
1043903	BOSCH M N	233030	Specificeren van informatiesystemen	4	2003	3
1043903	BOSCH M N	233035	Practicum Databases in Informatiesystemen	4	2002	1
1043903	BOSCH M N	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1043903	BOSCH M N	235005	Inleiding bedrijfsinformatiesystemen	9	2003	3
1043903	BOSCH M N	237201	Oriëntatie ICT	6	2002	2
1043903	BOSCH M N	239801	BIT-BV 2	6	2003	4
1043903	BOSCH M N	239981	Integratieproject	5	1999	3
1043903	BOSCH M N	239981	Integratieproject	5	1999	1
1043903	BOSCH M N	262020	Bijzondere onderwerpen Telematica	4	2003	4
1043903	BOSCH M N	265310	Internet management architecturen	5	2003	3
1043903	BOSCH M N	266100	Patterns of software development	9	2003	4
1044045	HEMMELER A B	121001	Elektronische basisschakelingen	9	2003	4
1044045	HEMMELER A B	121008	Practicum Elektromagnetische Veldtheorie	7	2002	1
1044045	HEMMELER A B	121008	Practicum Elektromagnetische Veldtheorie	4	2003	1
1044045	HEMMELER A B	121017	D1-project	8	2003	4
1044045	HEMMELER A B	121021	Inleiding in de biomedische technologie	5	2003	2
1044045	HEMMELER A B	121026	Hands-on dig.image proces. and graphical pres.	8	2003	1
1044045	HEMMELER A B	121035	Mid P-project	4	2003	1
1044045	HEMMELER A B	121040	Medische elektronica	8	2003	3
1044045	HEMMELER A B	121045	Project Mechatronica	9	2001	4
1044045	HEMMELER A B	121045	Project Mechatronica	4	2002	4
1044045	HEMMELER A B	121056	Laboratorium op een chip	6	2003	3
1044045	HEMMELER A B	121067	Signaal analyse practicum	6	2003	4
1044045	HEMMELER A B	121067	Signaal analyse practicum	6	2003	2
1044045	HEMMELER A B	121717	Advanced semiconductor devices	5	2003	3
1044045	HEMMELER A B	122226	Project voortgezette elektronica	7	2003	3
1044045	HEMMELER A B	122711	Digitale meetsystemen	4	2003	4
1044045	HEMMELER A B	122815	Materiaalkunde van microsystemen	1	2003	4
1044045	HEMMELER A B	122816	Mechanica en transductietechniek	7	2003	4
1044045	HEMMELER A B	122829	Systemen en technieken voor informatieopslag	2	2003	1
1044045	HEMMELER A B	122830	Micro electro mechanische systemen	3	2003	4
1044045	HEMMELER A B	122831	Geintegreerde optica	8	2003	2
1044045	HEMMELER A B	123149	Lineaire systemen	4	2003	4
1044045	HEMMELER A B	123152	Signal processing in acoustics and audio	7	2002	4
1044045	HEMMELER A B	124151	Mechatronica	8	2003	4
1044045	HEMMELER A B	124163	Mechatronische meetsystemen	3	2003	4
1044045	HEMMELER A B	125152	Glasvezelcommunicatie	7	2003	3
1044045	HEMMELER A B	125152	Glasvezelcommunicatie	7	2003	2
1044045	HEMMELER A B	127116	Elektromagnetisme I voor HBO	9	2003	2
1044045	HEMMELER A B	129356	Verrichten van experimenteel werk	5	2003	3
1044045	HEMMELER A B	129367	Individual project	4	2003	3
1044045	HEMMELER A B	150610	Statistics and probability	9	2003	3
1044045	HEMMELER A B	150620	Systems and signals	7	2003	3
1044045	HEMMELER A B	150625	Scientific communication	7	2003	3
1044045	HEMMELER A B	151012	Calculus I	9	2003	4
1044045	HEMMELER A B	151018	Analyse A	9	2003	3
1044045	HEMMELER A B	151020	Functionaalanalyse I	6	2003	3
1044045	HEMMELER A B	151039	Algebra	4	2003	4
1044045	HEMMELER A B	151044	Analyse C	8	2003	3
1044045	HEMMELER A B	151051	Fundamentele analyse I	5	2003	1
1044045	HEMMELER A B	151082	Wiskunde II	5	2003	4
1044045	HEMMELER A B	151200	Calculus A	7	2003	3
1044045	HEMMELER A B	151220	Wiskunde C	9	2003	3
1044045	HEMMELER A B	151570	Financial Engineering	4	2003	3
1044045	HEMMELER A B	152006	Lineaire structuren	1	2003	4
1044045	HEMMELER A B	152025	Complexe functietheorie	5	2003	3
1044045	HEMMELER A B	152026	Calculus I	4	2003	3
1044045	HEMMELER A B	153016	Voortgezette wiskundige statistiek	4	2003	3
1044045	HEMMELER A B	153033	Statistiek	6	2003	4
1044045	HEMMELER A B	153038	Wiskundige statistiek	8	2003	4
1044045	HEMMELER A B	153086	Telecommunicatiesystemen	6	2003	1
1044045	HEMMELER A B	153088	Stochastische modellen voor Operations Management	6	2003	3
1044045	HEMMELER A B	155010	Part. differentiaalverg. uit de math. fysica	6	2003	4
1044045	HEMMELER A B	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	7	2003	3
1044045	HEMMELER A B	156012	Gewone differentiaalvergelijkingen	7	2003	3
1044045	HEMMELER A B	156062	Systeem- en besturingstheorie	6	2003	4
1044045	HEMMELER A B	156080	Signalen en transformaties	8	2003	3
1044045	HEMMELER A B	157008	Stochastische processen in dynamische systemen	3	2003	3
1044045	HEMMELER A B	158018	Operationele research I, practicum	9	2003	4
1044045	HEMMELER A B	158022	Operationele research III	8	2003	3
1044045	HEMMELER A B	159918	Bibliotheekgebruik en literatuuropdracht	1	2003	3
1044045	HEMMELER A B	211024	Programmeren in C++	5	2003	4
1044045	HEMMELER A B	211095	Gedistribueerde databases & middleware technologie	7	2003	4
1044045	HEMMELER A B	211129	Taaltechnologie	5	2003	4
1044045	HEMMELER A B	211180	Basismodellen in de informatica	8	2003	2
1044045	HEMMELER A B	213120	Inleiding informatie- en communicatietechnologie	9	2003	4
1044045	HEMMELER A B	213120	Inleiding informatie- en communicatietechnologie	9	2003	2
1044045	HEMMELER A B	213125	Computersystemen	2	2003	4
1044045	HEMMELER A B	213505	Programmeren 2	8	2003	4
1044045	HEMMELER A B	213540	Advanced Design of Software Architectures	7	2003	3
1044045	HEMMELER A B	214020	Algoritmen,datastructuren en complexiteit	4	2003	4
1044045	HEMMELER A B	214511	Database Project	5	2003	3
1044045	HEMMELER A B	214513	Internet & Web Architecturen	4	2003	4
1044045	HEMMELER A B	233035	Practicum Databases in Informatiesystemen	2	2002	1
1044045	HEMMELER A B	234026	Voortgezette informatiesysteemmodellering	5	2003	1
1044045	HEMMELER A B	237450	Bedrijfsfunctie ondersteuning	9	2003	3
1044045	HEMMELER A B	261000	Telematicasystemen en toepassingen	5	2003	3
1044045	HEMMELER A B	262000	Telematicanetwerken	8	2003	4
1044045	HEMMELER A B	265100	Ontwerpen van telematicasystemen	5	2003	3
1044153	JANSEN K G	121001	Elektronische basisschakelingen	3	2003	2
1044153	JANSEN K G	121008	Practicum Elektromagnetische Veldtheorie	6	2001	3
1044153	JANSEN K G	121026	Hands-on dig.image proces. and graphical pres.	5	2003	4
1044153	JANSEN K G	121026	Hands-on dig.image proces. and graphical pres.	9	2003	1
1044153	JANSEN K G	121039	Biomedische signaal- en systeemanalyse	7	2003	3
1044153	JANSEN K G	121044	Regeltechniek	6	2003	4
1044153	JANSEN K G	121045	Project Mechatronica	7	2003	3
1044153	JANSEN K G	121067	Signaal analyse practicum	5	2002	4
1044153	JANSEN K G	121067	Signaal analyse practicum	7	2003	2
1044153	JANSEN K G	121709	Reliability Engineering	8	2003	2
1044153	JANSEN K G	122711	Digitale meetsystemen	8	2003	4
1044153	JANSEN K G	122729	Image processing	8	2003	4
1044153	JANSEN K G	122733	VLSI signal processing	7	2003	4
1044153	JANSEN K G	122821	Microtechnologie t.b.v. transducenten	9	2003	3
1044153	JANSEN K G	122830	Micro electro mechanische systemen	6	2003	4
1044153	JANSEN K G	124151	Mechatronica	4	2003	2
1044153	JANSEN K G	124176	Digitale Regeltechniek	5	2003	3
1044153	JANSEN K G	124177	Inleiding elektrische energietechniek	8	2002	1
1044153	JANSEN K G	125119	Signaaltheorie	9	2003	4
1044153	JANSEN K G	125153	Inleiding communicatiesystemen	6	2003	3
1044153	JANSEN K G	125159	Optische communicatienetwerken	5	2003	4
1044153	JANSEN K G	129351	Fysiologie II	9	2003	3
1044153	JANSEN K G	129356	Verrichten van experimenteel werk	4	2003	3
1044153	JANSEN K G	129358	Maken van een scriptie	5	2003	3
1044153	JANSEN K G	150433	Wiskundig modelleren voor CiT	9	2003	4
1044153	JANSEN K G	150500	Presentatie van een wiskundig onderwerp	5	2003	1
1044153	JANSEN K G	150710	Modelling project	7	2003	3
1044153	JANSEN K G	151007	Lineaire algebra	5	2003	4
1044153	JANSEN K G	151024	Lineaire analyse	7	2003	4
1044153	JANSEN K G	151033	Numerieke analyse	7	2003	3
1044153	JANSEN K G	151081	Wiskunde I	8	2003	3
1044153	JANSEN K G	151091	Modelvorming I	9	2003	3
1044153	JANSEN K G	151092	Modelvorming II	8	2003	4
1044153	JANSEN K G	151120	Wiskunde I	1	2003	4
1044153	JANSEN K G	151160	Wiskunde C	3	2003	3
1044153	JANSEN K G	151206	Lineaire Algebra A	2	2003	3
1044153	JANSEN K G	151210	Wiskunde A	7	2003	4
1044153	JANSEN K G	151215	Wiskunde B	4	2003	4
1044153	JANSEN K G	151540	Computational Methods in Finance	7	2003	4
1044153	JANSEN K G	152051	Voortgezette grafentheorie	5	2003	3
1044153	JANSEN K G	152056	Combinatoriek	8	2003	4
1044153	JANSEN K G	152066	Capita selecta analyse	2	2003	2
1044153	JANSEN K G	153003	Kansrekening	5	2003	3
1044153	JANSEN K G	153033	Statistiek	9	2003	4
1044153	JANSEN K G	154021	Numerieke wiskunde en programmeermethoden	4	2003	1
1044153	JANSEN K G	156069	Systemen en Signalen	6	2003	3
1044153	JANSEN K G	158018	Operationele research I, practicum	9	2003	4
1044153	JANSEN K G	158061	Inleiding wiskundige economie	5	2003	4
1044153	JANSEN K G	158075	Deterministische modellen in de OR	1	2002	4
1044153	JANSEN K G	211024	Programmeren in C++	6	2003	4
1044153	JANSEN K G	211032	Seminarium Taal, Kennis & Interactie	6	2003	4
1044153	JANSEN K G	211095	Gedistribueerde databases & middleware technologie	6	2003	1
1044153	JANSEN K G	211109	Voortgezette logica	6	2003	3
1044153	JANSEN K G	212010	Informatiesystemen	6	2003	1
1044153	JANSEN K G	213001	Basisbegrippen digitale techniek	4	2003	4
1044153	JANSEN K G	213001	Basisbegrippen digitale techniek	7	2003	2
1044153	JANSEN K G	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2002	1
1044153	JANSEN K G	219801	Hypermedia structuren en systemen	4	2003	1
1044153	JANSEN K G	232016	Prestatie-analyse van informatiesystemen	5	2002	4
1044153	JANSEN K G	232016	Prestatie-analyse van informatiesystemen	8	2003	3
1044153	JANSEN K G	232085	Voortgezette Requirements Engineering	9	2003	4
1044153	JANSEN K G	233030	Specificeren van informatiesystemen	6	2003	1
1044153	JANSEN K G	233035	Practicum Databases in Informatiesystemen	4	2003	4
1044153	JANSEN K G	235022	Investeringen in informatietechnologie	4	2003	4
1044153	JANSEN K G	236001	Kwaliteit van de informatievoorziening	8	2003	4
1044153	JANSEN K G	237600	Business Case Development for IT-projects	3	2003	3
1044153	JANSEN K G	239981	Integratieproject	8	2001	3
1044153	JANSEN K G	239981	Integratieproject	3	2002	1
1044153	JANSEN K G	265201	Middleware for distributed objects	8	2003	3
1044153	JANSEN K G	265400	Beveiliging van telematicasystemen	5	2003	3
1044153	JANSEN K G	269001	Portfolio ontwerp	5	2003	4
1044442	SLOTEN B	121002	Practicum elektronische basisschakelingen	5	2003	1
1044442	SLOTEN B	121007	Elektromagnetische Veldtheorie	5	2003	1
1044442	SLOTEN B	121008	Practicum Elektromagnetische Veldtheorie	6	2003	1
1044442	SLOTEN B	121009	Inleiding telecommunicatie	5	2003	4
1044442	SLOTEN B	121021	Inleiding in de biomedische technologie	9	2003	2
1044442	SLOTEN B	121035	Mid P-project	7	2002	1
1044442	SLOTEN B	121037	Advanced digital signal processing	7	2003	3
1044442	SLOTEN B	121045	Project Mechatronica	9	2003	3
1044442	SLOTEN B	121049	Practicum Medische Elektronica	9	2003	3
1044442	SLOTEN B	121052	Imaging	4	2003	3
1044442	SLOTEN B	121056	Laboratorium op een chip	5	2003	3
1044442	SLOTEN B	122711	Digitale meetsystemen	6	2003	4
1044442	SLOTEN B	122831	Geintegreerde optica	6	2002	4
1044442	SLOTEN B	123152	Signal processing in acoustics and audio	9	2002	4
1044442	SLOTEN B	123152	Signal processing in acoustics and audio	6	2003	3
1044442	SLOTEN B	124151	Mechatronica	8	2003	4
1044442	SLOTEN B	125118	Practicum informatie-overdracht	8	2003	2
1044442	SLOTEN B	125152	Glasvezelcommunicatie	5	2003	2
1044442	SLOTEN B	129346	Verrichten van experimenteel werk	4	2003	4
1044442	SLOTEN B	129348	Maken van een scriptie	4	2003	3
1044442	SLOTEN B	129357	Deelname aan een project	1	2003	4
1044442	SLOTEN B	129362	Start P-project	4	2003	2
1044442	SLOTEN B	150539	Maple practicum	8	2003	4
1044442	SLOTEN B	151010	Lineaire structuren	5	2003	3
1044442	SLOTEN B	151025	Functionaalanalyse II	4	2003	3
1044442	SLOTEN B	151070	Kwantitatieve methoden	4	2003	1
1044442	SLOTEN B	151092	Modelvorming II	7	2003	2
1044442	SLOTEN B	151206	Lineaire Algebra A	7	2003	3
1044442	SLOTEN B	151250	Modellen en systemen	6	2003	4
1044442	SLOTEN B	151510	Introduction to Risk Theory	9	2003	3
1044442	SLOTEN B	151570	Financial Engineering	6	2003	3
1044442	SLOTEN B	153026	Asymptotische technieken in de statistiek	8	2003	3
1044442	SLOTEN B	153036	Statistiek II	8	2003	4
1044442	SLOTEN B	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	3
1044442	SLOTEN B	156062	Systeem- en besturingstheorie	5	2003	4
1044442	SLOTEN B	157035	Financial Econometrics	1	2003	3
1044442	SLOTEN B	158022	Operationele research III	4	2003	3
1044442	SLOTEN B	211026	Theoretische informatica	8	2003	3
1044442	SLOTEN B	211027	Inleiding programmeren met MATLAB	1	2003	3
1044442	SLOTEN B	211032	Seminarium Taal, Kennis & Interactie	7	2002	3
1044442	SLOTEN B	211032	Seminarium Taal, Kennis & Interactie	8	2003	1
1044442	SLOTEN B	211033	Neurale netwerken en neuro-computing	7	2003	3
1044442	SLOTEN B	211038	Spraak- en taaltechnologie	6	2003	1
1044442	SLOTEN B	211111	Parallelle processen	6	2003	3
1044442	SLOTEN B	211180	Basismodellen in de informatica	7	2003	4
1044442	SLOTEN B	213002	Ontwerpen van digitale systemen	9	2003	4
1044442	SLOTEN B	213540	Advanced Design of Software Architectures	7	2003	3
1044442	SLOTEN B	214010	Complexiteit van berekeningen	7	2003	3
1044442	SLOTEN B	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2001	3
1044442	SLOTEN B	214513	Internet & Web Architecturen	6	2002	2
1044442	SLOTEN B	219803	Neurale netwerken	7	2003	4
1044442	SLOTEN B	232012	Information retrieval en kennisbeheer	7	2003	3
1044442	SLOTEN B	232016	Prestatie-analyse van informatiesystemen	9	2002	4
1044442	SLOTEN B	232020	Data warehousing & data mining	9	2003	4
1044442	SLOTEN B	233030	Specificeren van informatiesystemen	4	2003	1
1044442	SLOTEN B	234026	Voortgezette informatiesysteemmodellering	9	2003	4
1044442	SLOTEN B	237400	BedrijfsProces Ondersteuning	1	2003	1
1044442	SLOTEN B	237500	BP lab	9	2003	3
1044442	SLOTEN B	262001	Mobile and wireless networking	5	2003	4
1044442	SLOTEN B	262020	Bijzondere onderwerpen Telematica	6	2003	4
1044442	SLOTEN B	265100	Ontwerpen van telematicasystemen	6	2003	3
1044442	SLOTEN B	265201	Middleware for distributed objects	4	2003	3
1044442	SLOTEN B	269004	Refresher Logics, Probability,Databases and JAVA	7	2003	4
1045009	PRINS Y L	121003	Elektronische functies	1	2003	3
1045009	PRINS Y L	121021	Inleiding in de biomedische technologie	4	2003	2
1045009	PRINS Y L	121026	Hands-on dig.image proces. and graphical pres.	5	2002	3
1045009	PRINS Y L	121026	Hands-on dig.image proces. and graphical pres.	7	2003	1
1045009	PRINS Y L	121034	Fysische modelvorming van embedded systemen	5	2003	4
1045009	PRINS Y L	121037	Advanced digital signal processing	6	2003	3
1045009	PRINS Y L	121043	Dynamische systemen	6	2003	2
1045009	PRINS Y L	121045	Project Mechatronica	8	2002	2
1045009	PRINS Y L	121052	Imaging	6	2003	3
1045009	PRINS Y L	121057	Bio-elektriciteit	4	2003	4
1045009	PRINS Y L	121062	Eind P-project	6	2003	4
1045009	PRINS Y L	121068	Signaaltheorie	4	2003	3
1045009	PRINS Y L	121709	Reliability Engineering	5	2003	4
1045009	PRINS Y L	121714	I.C. technologie	2	2003	2
1045009	PRINS Y L	122634	Real-time software development	8	2003	3
1045009	PRINS Y L	122711	Digitale meetsystemen	6	2003	4
1045009	PRINS Y L	122733	VLSI signal processing	3	2003	4
1045009	PRINS Y L	122816	Mechanica en transductietechniek	4	2002	2
1045009	PRINS Y L	122831	Geintegreerde optica	5	2003	2
1045009	PRINS Y L	124153	Computer-aided design gereedschappen voor VLSI	5	2003	4
1045009	PRINS Y L	124176	Digitale Regeltechniek	9	2003	2
1045009	PRINS Y L	125118	Practicum informatie-overdracht	9	2003	2
1045009	PRINS Y L	125156	Transmissiemedia- en systemen	4	2003	1
1045009	PRINS Y L	127116	Elektromagnetisme I voor HBO	2	2003	3
1045009	PRINS Y L	127117	Biomechatronica	5	2003	3
1045009	PRINS Y L	129355	Deelname aan een studiegroep	6	2003	3
1045009	PRINS Y L	129362	Start P-project	5	2003	2
1045009	PRINS Y L	150529	Wiskundig modelleren IV	4	2003	4
1045009	PRINS Y L	150620	Systems and signals	9	2003	3
1045009	PRINS Y L	150625	Scientific communication	8	2003	3
1045009	PRINS Y L	151012	Calculus I	7	2003	4
1045009	PRINS Y L	151014	Analyse A	1	2003	3
1045009	PRINS Y L	151015	Numerieke lineaire algebra	4	2003	3
1045009	PRINS Y L	151033	Numerieke analyse	9	2003	3
1045009	PRINS Y L	151039	Algebra	9	2003	4
1045009	PRINS Y L	151120	Wiskunde I	2	2003	4
1045009	PRINS Y L	151150	Wiskunde IV	7	2003	3
1045009	PRINS Y L	151215	Wiskunde B	2	2003	4
1045009	PRINS Y L	151565	Praktische opdracht Financial Engineering	8	2003	4
1045009	PRINS Y L	152026	Calculus I	5	2003	3
1045009	PRINS Y L	152027	Calculus II	8	2003	2
1045009	PRINS Y L	152051	Voortgezette grafentheorie	5	2003	3
1045009	PRINS Y L	152100	Calculus I	5	2003	4
1045009	PRINS Y L	153004	Statistiek I	6	2003	3
1045009	PRINS Y L	153023	Statistiek II voor TBK	6	2003	3
1045009	PRINS Y L	153083	Stochastische modellen in productie en logistiek	6	2003	2
1045009	PRINS Y L	153088	Stochastische modellen voor Operations Management	7	2003	3
1045009	PRINS Y L	156016	Analyse B	9	2003	3
1045009	PRINS Y L	156066	Besturingstheorie van economische systemen	6	2003	4
1045009	PRINS Y L	156080	Signalen en transformaties	7	2003	3
1045009	PRINS Y L	211054	Computersystemen	6	2003	3
1045009	PRINS Y L	211097	Bijzondere onderwerpen gegevensbanken	2	2003	1
1045009	PRINS Y L	211123	Component- en aspect georienteerd progammeren	6	2003	3
1045009	PRINS Y L	213001	Basisbegrippen digitale techniek	8	2002	3
1045009	PRINS Y L	213110	Computerorganisatie	7	2003	1
1045009	PRINS Y L	213530	Concurrent and distributed programming	6	2003	4
1045009	PRINS Y L	213540	Advanced Design of Software Architectures	8	2003	3
1045009	PRINS Y L	213540	Advanced Design of Software Architectures	6	2003	1
1045009	PRINS Y L	214011	Tool Architectuur	2	2003	4
1045009	PRINS Y L	214510	MMI-project	8	2003	2
1045009	PRINS Y L	219801	Hypermedia structuren en systemen	1	2003	4
1045009	PRINS Y L	232011	Architectuur van informatiesystemen	3	2003	4
1045009	PRINS Y L	232081	Requirements Engineering	6	2003	4
1045009	PRINS Y L	233030	Specificeren van informatiesystemen	9	2003	3
1045009	PRINS Y L	234001	Productie-informatietechnologie	4	2003	3
1045009	PRINS Y L	234026	Voortgezette informatiesysteemmodellering	5	2003	1
1045009	PRINS Y L	237400	BedrijfsProces Ondersteuning	2	2003	3
1045009	PRINS Y L	237450	Bedrijfsfunctie ondersteuning	8	2003	3
1045009	PRINS Y L	237600	Business Case Development for IT-projects	4	2003	3
1045009	PRINS Y L	237600	Business Case Development for IT-projects	6	2003	1
1045009	PRINS Y L	239981	Integratieproject	7	2001	3
1045009	PRINS Y L	239981	Integratieproject	6	2003	2
1045009	PRINS Y L	261010	Computer netwerken	5	2003	1
1045009	PRINS Y L	263100	Mobile E-health application and services	8	2003	4
1045009	PRINS Y L	265200	Implementatie van telematicasystemen	5	2003	1
1045159	WAALS V	121002	Practicum elektronische basisschakelingen	7	2003	3
1045159	WAALS V	121007	Elektromagnetische Veldtheorie	5	2001	4
1045159	WAALS V	121007	Elektromagnetische Veldtheorie	6	2002	4
1045159	WAALS V	121007	Elektromagnetische Veldtheorie	4	2002	1
1045159	WAALS V	121007	Elektromagnetische Veldtheorie	5	2003	1
1045159	WAALS V	121008	Practicum Elektromagnetische Veldtheorie	6	2003	1
1045159	WAALS V	121026	Hands-on dig.image proces. and graphical pres.	5	2003	4
1045159	WAALS V	121028	Computer vision	8	2003	4
1045159	WAALS V	121040	Medische elektronica	5	2003	3
1045159	WAALS V	121042	Meettechniek	5	2003	3
1045159	WAALS V	121043	Dynamische systemen	7	2003	4
1045159	WAALS V	121050	Modern robotics	7	2003	3
1045159	WAALS V	121053	Zekere- en onzekere informatie	9	2003	3
1045159	WAALS V	121056	Laboratorium op een chip	8	2003	3
1045159	WAALS V	121057	Bio-elektriciteit	1	2003	4
1045159	WAALS V	121714	I.C. technologie	8	2003	4
1045159	WAALS V	121714	I.C. technologie	4	2003	2
1045159	WAALS V	122729	Image processing	4	2003	4
1045159	WAALS V	122733	VLSI signal processing	9	2003	4
1045159	WAALS V	122833	Integratieproject	7	2003	2
1045159	WAALS V	123140	Inleiding systeem- en signaaltheorie voor HBO	5	2003	3
1045159	WAALS V	123153	Embedded Signal Processing	5	2003	1
1045159	WAALS V	124163	Mechatronische meetsystemen	6	2003	4
1045159	WAALS V	125118	Practicum informatie-overdracht	7	2003	3
1045159	WAALS V	125151	Schakel- en controlesystemen v. Multi-service netw	7	2003	1
1045159	WAALS V	125160	Mobiele communicatie	6	2003	3
1045159	WAALS V	129351	Fysiologie II	7	2003	3
1045159	WAALS V	129355	Deelname aan een studiegroep	7	2003	3
1045159	WAALS V	129362	Start P-project	3	2003	3
1045159	WAALS V	150500	Presentatie van een wiskundig onderwerp	4	2003	3
1045159	WAALS V	150500	Presentatie van een wiskundig onderwerp	9	2003	1
1045159	WAALS V	150529	Wiskundig modelleren IV	1	2003	1
1045159	WAALS V	150600	Mathematical methods	8	2003	3
1045159	WAALS V	150625	Scientific communication	3	2003	3
1045159	WAALS V	150910	Advanced modelling	4	2003	4
1045159	WAALS V	151012	Calculus I	7	2003	4
1045159	WAALS V	151043	Seminarium mathematische fysica	7	2003	4
1045159	WAALS V	151045	Functionaalanalyse III	6	2003	4
1045159	WAALS V	151072	Wiskunde II	7	2003	1
1045159	WAALS V	151081	Wiskunde I	7	2003	3
1045159	WAALS V	151082	Wiskunde II	4	2003	4
1045159	WAALS V	151130	Wiskunde II	7	2003	4
1045159	WAALS V	151530	Continuous Time Finance	9	2003	4
1045159	WAALS V	151540	Computational Methods in Finance	6	2003	4
1045159	WAALS V	151600	Modelleren en redeneren	8	2003	4
1045159	WAALS V	152066	Capita selecta analyse	9	2003	3
1045159	WAALS V	152066	Capita selecta analyse	8	2003	2
1045159	WAALS V	152070	Meetkunde	9	2003	4
1045159	WAALS V	152070	Meetkunde	3	2003	1
1045159	WAALS V	152080	Deterministische en stochastische speltheorie	5	2003	1
1045159	WAALS V	152130	Fundamentele analyse	6	2003	3
1045159	WAALS V	153002	Discrete kansrekening	8	2003	3
1045159	WAALS V	153023	Statistiek II voor TBK	6	2003	3
1045159	WAALS V	153033	Statistiek	1	2003	4
1045159	WAALS V	153036	Statistiek II	7	2003	4
1045159	WAALS V	153080	Stochastische modellen in de operationele research	8	2003	4
1045159	WAALS V	156016	Analyse B	4	2003	1
1045159	WAALS V	156062	Systeem- en besturingstheorie	8	2003	4
1045159	WAALS V	157016	Stochastische filter- en besturingstheorie	3	2003	3
1045159	WAALS V	158006	Operationele research II	5	2003	4
1045159	WAALS V	158075	Deterministische modellen in de OR	4	2003	4
1045159	WAALS V	211024	Programmeren in C++	7	2003	4
1045159	WAALS V	211032	Seminarium Taal, Kennis & Interactie	7	2003	4
1045159	WAALS V	211038	Spraak- en taaltechnologie	8	2001	3
1045159	WAALS V	211045	Besturingssystemen	6	2003	3
1045159	WAALS V	211054	Computersystemen	5	2003	3
1045159	WAALS V	211054	Computersystemen	7	2003	2
1045159	WAALS V	211095	Gedistribueerde databases & middleware technologie	6	2003	1
1045159	WAALS V	211097	Bijzondere onderwerpen gegevensbanken	3	2003	1
1045159	WAALS V	211180	Basismodellen in de informatica	9	2003	2
1045159	WAALS V	212010	Informatiesystemen	6	2003	3
1045159	WAALS V	212010	Informatiesystemen	6	2003	1
1045159	WAALS V	213009	Fouten tolererende digitale systemen	2	2003	1
1045159	WAALS V	213125	Computersystemen	8	2003	4
1045159	WAALS V	213540	Advanced Design of Software Architectures	2	2002	4
1045159	WAALS V	214501	Communicatie & ontwerpen in ICT-projecten 2	6	2003	3
1045159	WAALS V	219910	Ontwerpproject	6	2003	3
1045159	WAALS V	232020	Data warehousing & data mining	6	2003	4
1045159	WAALS V	232020	Data warehousing & data mining	6	2003	2
1045159	WAALS V	232050	Electronic Commerce	8	2003	4
1045159	WAALS V	234001	Productie-informatietechnologie	2	2003	3
1045159	WAALS V	237450	Bedrijfsfunctie ondersteuning	9	2003	3
1045159	WAALS V	237600	Business Case Development for IT-projects	5	2003	3
1045159	WAALS V	239981	Integratieproject	2	1999	3
1045159	WAALS V	265200	Implementatie van telematicasystemen	6	2003	1
1045159	WAALS V	265201	Middleware for distributed objects	5	2003	3
1045701	VERVAART P	121003	Elektronische functies	4	2003	3
1045701	VERVAART P	121006	Practicum Meetinstrumenten/Netwerkanalyse	6	2003	3
1045701	VERVAART P	121007	Elektromagnetische Veldtheorie	5	2001	4
1045701	VERVAART P	121008	Practicum Elektromagnetische Veldtheorie	7	2001	3
1045701	VERVAART P	121008	Practicum Elektromagnetische Veldtheorie	4	2002	4
1045701	VERVAART P	121026	Hands-on dig.image proces. and graphical pres.	6	2002	3
1045701	VERVAART P	121033	Project "computer vision"	5	2003	3
1045701	VERVAART P	121035	Mid P-project	8	2002	4
1045701	VERVAART P	121043	Dynamische systemen	8	2003	2
1045701	VERVAART P	121044	Regeltechniek	8	2003	2
1045701	VERVAART P	121045	Project Mechatronica	9	2002	4
1045701	VERVAART P	121062	Eind P-project	7	2003	4
1045701	VERVAART P	121067	Signaal analyse practicum	6	2003	2
1045701	VERVAART P	122728	Classification, Estimation and Data Analysis	7	2003	4
1045701	VERVAART P	122729	Image processing	4	2003	4
1045701	VERVAART P	122733	VLSI signal processing	5	2003	2
1045701	VERVAART P	122815	Materiaalkunde van microsystemen	4	2003	2
1045701	VERVAART P	122833	Integratieproject	9	2003	4
1045701	VERVAART P	123153	Embedded Signal Processing	3	2003	1
1045701	VERVAART P	124151	Mechatronica	7	2002	4
1045701	VERVAART P	124151	Mechatronica	5	2003	4
1045701	VERVAART P	124177	Inleiding elektrische energietechniek	8	2002	1
1045701	VERVAART P	125151	Schakel- en controlesystemen v. Multi-service netw	3	2003	3
1045701	VERVAART P	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	1
1045701	VERVAART P	125156	Transmissiemedia- en systemen	1	2003	1
1045701	VERVAART P	127113	Elektrofysiologische signalen en bio-electriciteit	5	2003	4
1045701	VERVAART P	127117	Biomechatronica	4	2002	2
1045701	VERVAART P	129348	Maken van een scriptie	5	2003	3
1045701	VERVAART P	129357	Deelname aan een project	8	2003	4
1045701	VERVAART P	129362	Start P-project	6	2003	3
1045701	VERVAART P	150710	Modelling project	7	2003	3
1045701	VERVAART P	150810	Modelling project	6	2003	3
1045701	VERVAART P	151012	Calculus I	6	2003	4
1045701	VERVAART P	151015	Numerieke lineaire algebra	8	2003	3
1045701	VERVAART P	151072	Wiskunde II	5	2003	4
1045701	VERVAART P	151084	Wiskunde IV	5	2003	4
1045701	VERVAART P	151093	Modelvorming III	6	2003	1
1045701	VERVAART P	151140	Wiskunde III	1	2003	3
1045701	VERVAART P	151210	Wiskunde A	6	2003	1
1045701	VERVAART P	151220	Wiskunde C	2	2003	3
1045701	VERVAART P	151570	Financial Engineering	9	2003	3
1045701	VERVAART P	152006	Lineaire structuren	4	2003	4
1045701	VERVAART P	152028	Analyse A	5	2003	4
1045701	VERVAART P	152110	Calculus II	4	2003	3
1045701	VERVAART P	153002	Discrete kansrekening	8	2003	3
1045701	VERVAART P	153023	Statistiek II voor TBK	7	2003	3
1045701	VERVAART P	153028	Statistiek I	4	2003	4
1045701	VERVAART P	153033	Statistiek	9	2003	4
1045701	VERVAART P	153039	Kansrekening en statistiek	9	2003	3
1045701	VERVAART P	153041	Inleiding statistiek	6	2003	4
1045701	VERVAART P	153086	Telecommunicatiesystemen	6	2003	1
1045701	VERVAART P	154021	Numerieke wiskunde en programmeermethoden	4	2003	1
1045701	VERVAART P	154023	Numerieke wiskunde en programmeermethoden	5	2003	3
1045701	VERVAART P	154023	Numerieke wiskunde en programmeermethoden	6	2003	1
1045701	VERVAART P	156012	Gewone differentiaalvergelijkingen	9	2003	3
1045701	VERVAART P	156033	Bifurcatie theorie	9	2003	4
1045701	VERVAART P	158017	Operationele research I	3	2003	4
1045701	VERVAART P	159918	Bibliotheekgebruik en literatuuropdracht	4	2003	3
1045701	VERVAART P	211022	Programmeren in C++	7	2003	3
1045701	VERVAART P	211038	Spraak- en taaltechnologie	8	2002	1
1045701	VERVAART P	211096	XML & Databases	2	2003	1
1045701	VERVAART P	211129	Taaltechnologie	1	2003	4
1045701	VERVAART P	211185	Taal- en rekenmodellen	1	2003	4
1045701	VERVAART P	211205	Functioneel programmeren	9	2003	4
1045701	VERVAART P	213009	Fouten tolererende digitale systemen	6	2003	1
1045701	VERVAART P	213500	Programmeren 1	4	2003	4
1045701	VERVAART P	214500	Communicatie en ontwerpen in ICT-projecten 1	3	2002	3
1045701	VERVAART P	232011	Architectuur van informatiesystemen	4	2003	4
1045701	VERVAART P	233035	Practicum Databases in Informatiesystemen	6	2003	1
1045701	VERVAART P	237201	Oriëntatie ICT	6	2002	2
1045701	VERVAART P	239981	Integratieproject	7	2001	2
1045701	VERVAART P	262001	Mobile and wireless networking	8	2003	4
1045701	VERVAART P	262001	Mobile and wireless networking	5	2003	2
1045701	VERVAART P	265201	Middleware for distributed objects	6	2003	3
1045701	VERVAART P	265300	Operationeel management van telematicasystemen	9	2003	3
1045701	VERVAART P	265310	Internet management architecturen	6	2003	3
1045701	VERVAART P	269001	Portfolio ontwerp	8	2003	4
1046196	SMIT L	124151	Mechatronica	5	2002	4
1046196	SMIT L	124163	Mechatronische meetsystemen	4	2003	4
1046196	SMIT L	124176	Digitale Regeltechniek	2	2003	2
1046196	SMIT L	150432	Maple practicum II	9	2003	4
1046196	SMIT L	150500	Presentatie van een wiskundig onderwerp	8	2003	1
1046196	SMIT L	150710	Modelling project	4	2003	3
1046196	SMIT L	151005	Calculus II-B	7	2003	3
1046196	SMIT L	151043	Seminarium mathematische fysica	5	2003	1
1046196	SMIT L	151085	Wiskunde I	9	2003	3
1046196	SMIT L	151092	Modelvorming II	5	2003	4
1046196	SMIT L	151160	Wiskunde C	7	2003	3
1046196	SMIT L	151202	Calculus B	8	2003	3
1046196	SMIT L	151560	Introduction to Investment Theory	6	2003	4
1046196	SMIT L	152028	Analyse A	7	2003	4
1046196	SMIT L	152068	Discrete wiskunde	9	2003	2
1046196	SMIT L	153002	Discrete kansrekening	4	2003	3
1046196	SMIT L	153036	Statistiek II	7	2003	4
1046196	SMIT L	153045	Lineaire statistische modellen	5	2003	4
1046196	SMIT L	154021	Numerieke wiskunde en programmeermethoden	8	2003	1
1046196	SMIT L	156016	Analyse B	4	2003	3
1046196	SMIT L	156016	Analyse B	8	2003	1
1046196	SMIT L	157016	Stochastische filter- en besturingstheorie	5	2003	3
1046196	SMIT L	157035	Financial Econometrics	4	2003	3
1046196	SMIT L	158017	Operationele research I	6	2003	4
1046196	SMIT L	158018	Operationele research I, practicum	5	2003	4
1046196	SMIT L	211038	Spraak- en taaltechnologie	8	2001	3
1046196	SMIT L	211081	Distributed E-business Techniques	5	2003	1
1046196	SMIT L	211185	Taal- en rekenmodellen	7	2003	1
1046196	SMIT L	213005	Computerarchitectuur	4	2003	1
1046196	SMIT L	213016	Bijzondere onderwerpen computerarchitectuur	9	2003	3
1046196	SMIT L	213120	Inleiding informatie- en communicatietechnologie	2	2003	2
1046196	SMIT L	213530	Concurrent and distributed programming	5	2002	4
1046196	SMIT L	213540	Advanced Design of Software Architectures	8	2002	4
1046196	SMIT L	214011	Tool Architectuur	5	2003	4
1046196	SMIT L	214030	Artificial Intelligence	6	2003	2
1046196	SMIT L	214510	MMI-project	6	2003	3
1046196	SMIT L	232020	Data warehousing & data mining	7	2002	3
1046196	SMIT L	233035	Practicum Databases in Informatiesystemen	1	2003	1
1046196	SMIT L	234007	Systemen voor cooperatief werk	8	2003	4
1046196	SMIT L	239800	BIT-BV 1	4	2003	4
1046196	SMIT L	262001	Mobile and wireless networking	4	2003	2
1046196	SMIT L	265200	Implementatie van telematicasystemen	8	2003	1
1046870	SCHOUTEN F	121000	Instrumentatie van embedded systemen	3	2003	3
1046870	SCHOUTEN F	121007	Elektromagnetische Veldtheorie	6	2001	4
1046870	SCHOUTEN F	121007	Elektromagnetische Veldtheorie	8	2002	1
1046870	SCHOUTEN F	121019	D-opdracht	4	2003	3
1046870	SCHOUTEN F	121035	Mid P-project	5	2003	3
1046870	SCHOUTEN F	121037	Advanced digital signal processing	7	2003	3
1046870	SCHOUTEN F	121041	Elektrodynamica	6	2003	4
1046870	SCHOUTEN F	121044	Regeltechniek	6	2003	2
1046870	SCHOUTEN F	121050	Modern robotics	3	2003	3
1046870	SCHOUTEN F	121056	Laboratorium op een chip	7	2003	3
1046870	SCHOUTEN F	121057	Bio-elektriciteit	8	2003	4
1046870	SCHOUTEN F	121706	Halfgeleiderdevices	9	2003	3
1046870	SCHOUTEN F	122833	Integratieproject	7	2003	4
1046870	SCHOUTEN F	123152	Signal processing in acoustics and audio	4	2003	3
1046870	SCHOUTEN F	123153	Embedded Signal Processing	4	2003	1
1046870	SCHOUTEN F	127113	Elektrofysiologische signalen en bio-electriciteit	5	2003	4
1046870	SCHOUTEN F	127113	Elektrofysiologische signalen en bio-electriciteit	4	2003	1
1046870	SCHOUTEN F	129362	Start P-project	1	2003	2
1046870	SCHOUTEN F	129367	Individual project	7	2003	2
1046870	SCHOUTEN F	150433	Wiskundig modelleren voor CiT	1	2003	4
1046870	SCHOUTEN F	150625	Scientific communication	9	2003	3
1046870	SCHOUTEN F	150700	Introduction to operations research	2	2003	4
1046870	SCHOUTEN F	150730	Experimental design	4	2003	3
1046870	SCHOUTEN F	150810	Modelling project	4	2003	3
1046870	SCHOUTEN F	151043	Seminarium mathematische fysica	7	2003	4
1046870	SCHOUTEN F	151045	Functionaalanalyse III	7	2003	4
1046870	SCHOUTEN F	151051	Fundamentele analyse I	5	2003	1
1046870	SCHOUTEN F	151092	Modelvorming II	6	2003	2
1046870	SCHOUTEN F	151206	Lineaire Algebra A	7	2003	3
1046870	SCHOUTEN F	151250	Modellen en systemen	5	2003	4
1046870	SCHOUTEN F	151550	Life Insurance	8	2003	4
1046870	SCHOUTEN F	151565	Praktische opdracht Financial Engineering	6	2003	4
1046870	SCHOUTEN F	152100	Calculus I	5	2003	4
1046870	SCHOUTEN F	152150	Wiskundig modelleren I	7	2003	4
1046870	SCHOUTEN F	153034	Kansrekening en statistiek	5	2003	3
1046870	SCHOUTEN F	154021	Numerieke wiskunde en programmeermethoden	7	2003	1
1046870	SCHOUTEN F	155010	Part. differentiaalverg. uit de math. fysica	8	2003	2
1046870	SCHOUTEN F	156033	Bifurcatie theorie	4	2003	4
1046870	SCHOUTEN F	156067	Robust Control	2	2003	4
1046870	SCHOUTEN F	156080	Signalen en transformaties	5	2003	3
1046870	SCHOUTEN F	157016	Stochastische filter- en besturingstheorie	6	2003	3
1046870	SCHOUTEN F	158018	Operationele research I, practicum	9	2003	4
1046870	SCHOUTEN F	158070	Grafentheorie en operationele research	9	2003	1
1046870	SCHOUTEN F	211035	Vertalerbouw	8	2003	4
1046870	SCHOUTEN F	211038	Spraak- en taaltechnologie	4	2003	1
1046870	SCHOUTEN F	211047	Besturingssystemen voor Telematica	5	2003	4
1046870	SCHOUTEN F	211054	Computersystemen	4	2003	2
1046870	SCHOUTEN F	211095	Gedistribueerde databases & middleware technologie	5	2003	4
1046870	SCHOUTEN F	211131	Statische Objectanalyse en Typering	8	2003	4
1046870	SCHOUTEN F	211185	Taal- en rekenmodellen	9	2003	4
1046870	SCHOUTEN F	213001	Basisbegrippen digitale techniek	6	2002	3
1046870	SCHOUTEN F	213002	Ontwerpen van digitale systemen	5	2003	4
1046870	SCHOUTEN F	213005	Computerarchitectuur	6	2003	1
1046870	SCHOUTEN F	213125	Computersystemen	2	2003	4
1046870	SCHOUTEN F	213505	Programmeren 2	5	2003	4
1046870	SCHOUTEN F	213540	Advanced Design of Software Architectures	4	2003	3
1046870	SCHOUTEN F	219910	Ontwerpproject	1	2003	3
1046870	SCHOUTEN F	232016	Prestatie-analyse van informatiesystemen	5	2003	2
1046870	SCHOUTEN F	232020	Data warehousing & data mining	7	2002	3
1046870	SCHOUTEN F	232020	Data warehousing & data mining	4	2003	4
1046870	SCHOUTEN F	232055	XML-technologie in E-Commerce	9	2003	1
1046870	SCHOUTEN F	234001	Productie-informatietechnologie	5	2003	3
1046870	SCHOUTEN F	237400	BedrijfsProces Ondersteuning	7	2003	3
1046870	SCHOUTEN F	237600	Business Case Development for IT-projects	9	2003	1
1046870	SCHOUTEN F	239801	BIT-BV 2	2	2003	4
1047445	VIJFHUIJSEN U V	121002	Practicum elektronische basisschakelingen	2	2003	3
1047445	VIJFHUIJSEN U V	121007	Elektromagnetische Veldtheorie	9	2001	4
1047445	VIJFHUIJSEN U V	121007	Elektromagnetische Veldtheorie	7	2002	1
1047445	VIJFHUIJSEN U V	121008	Practicum Elektromagnetische Veldtheorie	4	2002	1
1047445	VIJFHUIJSEN U V	121022	Neurofysiologie	5	2003	4
1047445	VIJFHUIJSEN U V	121035	Mid P-project	2	2002	4
1047445	VIJFHUIJSEN U V	121035	Mid P-project	5	2003	3
1047445	VIJFHUIJSEN U V	121037	Advanced digital signal processing	8	2003	3
1047445	VIJFHUIJSEN U V	121052	Imaging	6	2003	3
1047445	VIJFHUIJSEN U V	121060	Optische basisfuncties en microsystemen	8	2003	4
1047445	VIJFHUIJSEN U V	121067	Signaal analyse practicum	7	2003	4
1047445	VIJFHUIJSEN U V	121068	Signaaltheorie	3	2003	3
1047445	VIJFHUIJSEN U V	121706	Halfgeleiderdevices	7	2003	3
1047445	VIJFHUIJSEN U V	121709	Reliability Engineering	8	2003	2
1047445	VIJFHUIJSEN U V	122226	Project voortgezette elektronica	6	2003	3
1047445	VIJFHUIJSEN U V	122227	Voortgezette analoge IC elektronica	5	2003	2
1047445	VIJFHUIJSEN U V	122711	Digitale meetsystemen	4	2003	4
1047445	VIJFHUIJSEN U V	122733	VLSI signal processing	6	2003	2
1047445	VIJFHUIJSEN U V	122816	Mechanica en transductietechniek	6	2002	3
1047445	VIJFHUIJSEN U V	122821	Microtechnologie t.b.v. transducenten	8	2003	3
1047445	VIJFHUIJSEN U V	122829	Systemen en technieken voor informatieopslag	5	2003	4
1047445	VIJFHUIJSEN U V	123112	Moderne modulatie- en detectietechnieken	1	2003	4
1047445	VIJFHUIJSEN U V	124151	Mechatronica	4	2003	2
1047445	VIJFHUIJSEN U V	125118	Practicum informatie-overdracht	6	2003	2
1047445	VIJFHUIJSEN U V	125152	Glasvezelcommunicatie	7	2003	3
1047445	VIJFHUIJSEN U V	127115	Praktische biomedische signaalanalyse	2	2003	4
1047445	VIJFHUIJSEN U V	127116	Elektromagnetisme I voor HBO	4	2003	3
1047445	VIJFHUIJSEN U V	129348	Maken van een scriptie	9	2003	3
1047445	VIJFHUIJSEN U V	129351	Fysiologie II	2	2003	3
1047445	VIJFHUIJSEN U V	150500	Presentatie van een wiskundig onderwerp	5	2003	1
1047445	VIJFHUIJSEN U V	150529	Wiskundig modelleren IV	9	2003	1
1047445	VIJFHUIJSEN U V	150539	Maple practicum	5	2003	4
1047445	VIJFHUIJSEN U V	151005	Calculus II-B	2	2003	3
1047445	VIJFHUIJSEN U V	151007	Lineaire algebra	3	2003	4
1047445	VIJFHUIJSEN U V	151015	Numerieke lineaire algebra	4	2003	3
1047445	VIJFHUIJSEN U V	151039	Algebra	5	2003	4
1047445	VIJFHUIJSEN U V	151043	Seminarium mathematische fysica	5	2003	4
1047445	VIJFHUIJSEN U V	151072	Wiskunde II	8	2003	4
1047445	VIJFHUIJSEN U V	151073	Calculus III	7	2003	4
1047445	VIJFHUIJSEN U V	151083	Wiskunde III	4	2003	3
1047445	VIJFHUIJSEN U V	151088	Practicum Wiskundig modelleren	1	2003	4
1047445	VIJFHUIJSEN U V	151092	Modelvorming II	6	2003	2
1047445	VIJFHUIJSEN U V	151093	Modelvorming III	8	2003	3
1047445	VIJFHUIJSEN U V	151140	Wiskunde III	4	2003	3
1047445	VIJFHUIJSEN U V	151250	Modellen en systemen	5	2003	4
1047445	VIJFHUIJSEN U V	151570	Financial Engineering	9	2003	3
1047445	VIJFHUIJSEN U V	152028	Analyse A	4	2003	4
1047445	VIJFHUIJSEN U V	152130	Fundamentele analyse	6	2003	3
1047445	VIJFHUIJSEN U V	153029	Statistiek II	6	2003	4
1047445	VIJFHUIJSEN U V	153036	Statistiek II	7	2003	4
1047445	VIJFHUIJSEN U V	153082	Stochastische simulatie	9	2003	3
1047445	VIJFHUIJSEN U V	155019	Practicum softwarepakketten PDV	6	2003	3
1047445	VIJFHUIJSEN U V	156056	Inleiding wiskundige systeemtheorie	9	2003	4
1047445	VIJFHUIJSEN U V	157004	Stochastische processen in financien	5	2003	3
1047445	VIJFHUIJSEN U V	158018	Operationele research I, practicum	6	2003	4
1047445	VIJFHUIJSEN U V	158075	Deterministische modellen in de OR	4	2003	4
1047445	VIJFHUIJSEN U V	211032	Seminarium Taal, Kennis & Interactie	7	2003	4
1047445	VIJFHUIJSEN U V	211038	Spraak- en taaltechnologie	9	2003	1
1047445	VIJFHUIJSEN U V	211090	Databasetoepassingen	7	2003	4
1047445	VIJFHUIJSEN U V	211129	Taaltechnologie	7	2003	4
1047445	VIJFHUIJSEN U V	211185	Taal- en rekenmodellen	5	2003	4
1047445	VIJFHUIJSEN U V	213012	Hardware/software co-design	8	2003	2
1047445	VIJFHUIJSEN U V	213130	Computer Organisatie INF/TEL	4	2003	3
1047445	VIJFHUIJSEN U V	213505	Programmeren 2	6	2003	4
1047445	VIJFHUIJSEN U V	213530	Concurrent and distributed programming	7	2003	2
1047445	VIJFHUIJSEN U V	214025	Algoritmen,datastructuren en complexiteit plus	4	2003	4
1047445	VIJFHUIJSEN U V	214030	Artificial Intelligence	9	2002	1
1047445	VIJFHUIJSEN U V	214030	Artificial Intelligence	4	2003	2
1047445	VIJFHUIJSEN U V	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2003	3
1047445	VIJFHUIJSEN U V	214513	Internet & Web Architecturen	7	2002	2
1047445	VIJFHUIJSEN U V	219801	Hypermedia structuren en systemen	7	2003	1
1047445	VIJFHUIJSEN U V	219910	Ontwerpproject	9	2003	3
1047445	VIJFHUIJSEN U V	232012	Information retrieval en kennisbeheer	6	2003	3
1047445	VIJFHUIJSEN U V	232020	Data warehousing & data mining	2	2003	4
1047445	VIJFHUIJSEN U V	232050	Electronic Commerce	5	2002	4
1047445	VIJFHUIJSEN U V	232085	Voortgezette Requirements Engineering	3	2003	4
1047445	VIJFHUIJSEN U V	236050	E-health Strategies	1	2003	4
1047445	VIJFHUIJSEN U V	237500	BP lab	6	2003	3
1047445	VIJFHUIJSEN U V	265100	Ontwerpen van telematicasystemen	6	2003	1
1047445	VIJFHUIJSEN U V	265310	Internet management architecturen	4	2003	3
1047445	VIJFHUIJSEN U V	266100	Patterns of software development	1	2003	4
1047445	VIJFHUIJSEN U V	269004	Refresher Logics, Probability,Databases and JAVA	3	2003	1
1047505	WESTERLOO Y	151091	Modelvorming I	8	2003	1
1047505	WESTERLOO Y	151220	Wiskunde C	6	2003	3
1047505	WESTERLOO Y	151540	Computational Methods in Finance	5	2003	4
1047505	WESTERLOO Y	151550	Life Insurance	8	2003	4
1047505	WESTERLOO Y	152027	Calculus II	7	2003	3
1047505	WESTERLOO Y	152038	Grafentheorie	4	2003	3
1047505	WESTERLOO Y	152051	Voortgezette grafentheorie	2	2003	3
1047505	WESTERLOO Y	152056	Combinatoriek	8	2003	4
1047505	WESTERLOO Y	152066	Capita selecta analyse	5	2003	2
1047505	WESTERLOO Y	152110	Calculus II	9	2003	3
1047505	WESTERLOO Y	153008	Kansrekening en statistiek	7	2003	3
1047505	WESTERLOO Y	153029	Statistiek II	7	2003	4
1047505	WESTERLOO Y	153034	Kansrekening en statistiek	2	2003	3
1047505	WESTERLOO Y	153036	Statistiek II	6	2003	4
1047505	WESTERLOO Y	154021	Numerieke wiskunde en programmeermethoden	9	2003	1
1047505	WESTERLOO Y	156067	Robust Control	9	2003	4
1047505	WESTERLOO Y	156068	Niet-lineaire besturingstheorie	3	2003	3
1047505	WESTERLOO Y	157030	Structured Products	7	2003	3
1047505	WESTERLOO Y	158022	Operationele research III	5	2003	3
1047505	WESTERLOO Y	158038	Discrete optimalisering	7	2003	3
1047505	WESTERLOO Y	158042	Modelbouw in de optimalisatie	5	2003	4
1047505	WESTERLOO Y	159960	Multidisciplinaire ontwerpopdracht	6	2003	3
1047505	WESTERLOO Y	211038	Spraak- en taaltechnologie	7	2003	1
1047505	WESTERLOO Y	211097	Bijzondere onderwerpen gegevensbanken	4	2003	3
1047505	WESTERLOO Y	211109	Voortgezette logica	5	2003	3
1047505	WESTERLOO Y	211130	Ubiquitous Computing	7	2003	3
1047505	WESTERLOO Y	211133	Ontwerpen van Software Architecturen	6	2003	1
1047505	WESTERLOO Y	211180	Basismodellen in de informatica	8	2003	2
1047505	WESTERLOO Y	211185	Taal- en rekenmodellen	4	2003	1
1047505	WESTERLOO Y	212018	Kennistechnologie voor bedrijfskundige toep.	2	2003	2
1047505	WESTERLOO Y	213005	Computerarchitectuur	6	2003	4
1047505	WESTERLOO Y	214501	Communicatie & ontwerpen in ICT-projecten 2	7	2003	3
1047505	WESTERLOO Y	214510	MMI-project	8	2003	3
1047505	WESTERLOO Y	219910	Ontwerpproject	4	2003	3
1047505	WESTERLOO Y	232016	Prestatie-analyse van informatiesystemen	4	2003	2
1047505	WESTERLOO Y	232060	Multi-agent systemen	9	2003	4
1047505	WESTERLOO Y	233035	Practicum Databases in Informatiesystemen	7	2002	1
1047505	WESTERLOO Y	234020	Ontwerpen van mens-machine interactie	8	2003	4
1047505	WESTERLOO Y	235005	Inleiding bedrijfsinformatiesystemen	6	2003	3
1047505	WESTERLOO Y	237201	Oriëntatie ICT	7	2003	2
1047505	WESTERLOO Y	262001	Mobile and wireless networking	5	2003	4
1047505	WESTERLOO Y	265100	Ontwerpen van telematicasystemen	7	2003	1
1047505	WESTERLOO Y	265110	Protocol Engineering	2	2003	3
1047505	WESTERLOO Y	265300	Operationeel management van telematicasystemen	6	2003	3
1047762	BOS I W	121003	Elektronische functies	7	2003	3
1047762	BOS I W	121006	Practicum Meetinstrumenten/Netwerkanalyse	2	2003	3
1047762	BOS I W	121008	Practicum Elektromagnetische Veldtheorie	4	2002	4
1047762	BOS I W	121008	Practicum Elektromagnetische Veldtheorie	4	2003	1
1047762	BOS I W	121021	Inleiding in de biomedische technologie	8	2003	2
1047762	BOS I W	121025	Digitale beeldbewerking voor beta	8	2003	3
1047762	BOS I W	121035	Mid P-project	6	2003	3
1047762	BOS I W	121035	Mid P-project	5	2003	1
1047762	BOS I W	121037	Advanced digital signal processing	9	2003	3
1047762	BOS I W	121040	Medische elektronica	6	2003	3
1047762	BOS I W	121044	Regeltechniek	4	2003	2
1047762	BOS I W	121045	Project Mechatronica	9	2001	4
1047762	BOS I W	121050	Modern robotics	5	2003	3
1047762	BOS I W	121054	Neurotechnologie	9	2003	4
1047762	BOS I W	121709	Reliability Engineering	5	2003	2
1047762	BOS I W	121714	I.C. technologie	6	2003	2
1047762	BOS I W	122226	Project voortgezette elektronica	1	2003	3
1047762	BOS I W	122481	Systems engineering	6	2003	3
1047762	BOS I W	122729	Image processing	2	2003	4
1047762	BOS I W	122733	VLSI signal processing	7	2003	4
1047762	BOS I W	122833	Integratieproject	8	2003	2
1047762	BOS I W	123152	Signal processing in acoustics and audio	8	2003	1
1047762	BOS I W	124177	Inleiding elektrische energietechniek	8	2003	3
1047762	BOS I W	125118	Practicum informatie-overdracht	9	2003	3
1047762	BOS I W	127113	Elektrofysiologische signalen en bio-electriciteit	4	2003	1
1047762	BOS I W	127117	Biomechatronica	8	2002	3
1047762	BOS I W	129357	Deelname aan een project	9	2003	4
1047762	BOS I W	129362	Start P-project	9	2003	2
1047762	BOS I W	150528	Wiskundig modelleren III	1	2003	3
1047762	BOS I W	150529	Wiskundig modelleren IV	7	2003	4
1047762	BOS I W	151033	Numerieke analyse	4	2003	3
1047762	BOS I W	151052	Fundamentele analyse II	5	2003	3
1047762	BOS I W	151070	Kwantitatieve methoden	8	2003	1
1047762	BOS I W	151072	Wiskunde II	1	2003	4
1047762	BOS I W	151092	Modelvorming II	2	2003	4
1047762	BOS I W	151202	Calculus B	4	2003	3
1047762	BOS I W	151204	Calculus C	9	2003	4
1047762	BOS I W	151206	Lineaire Algebra A	8	2003	3
1047762	BOS I W	151220	Wiskunde C	1	2003	3
1047762	BOS I W	151550	Life Insurance	8	2003	4
1047762	BOS I W	152056	Combinatoriek	1	2003	4
1047762	BOS I W	152100	Calculus I	8	2003	4
1047762	BOS I W	153003	Kansrekening	7	2003	3
1047762	BOS I W	153031	Statistiek	7	2003	3
1047762	BOS I W	153038	Wiskundige statistiek	2	2003	4
1047762	BOS I W	153039	Kansrekening en statistiek	4	2003	3
1047762	BOS I W	153041	Inleiding statistiek	9	2003	1
1047762	BOS I W	153080	Stochastische modellen in de operationele research	4	2003	4
1047762	BOS I W	153082	Stochastische simulatie	8	2003	3
1047762	BOS I W	154023	Numerieke wiskunde en programmeermethoden	7	2003	1
1047762	BOS I W	155009	Fundamenten van de methode der eindige elementen	6	2003	3
1047762	BOS I W	155015	Part.diff.verg.: Numerieke oplossingsmethoden I	5	2003	4
1047762	BOS I W	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	1	2003	3
1047762	BOS I W	156016	Analyse B	6	2003	1
1047762	BOS I W	156057	Inleiding wiskundige systeemtheorie	9	2003	4
1047762	BOS I W	156069	Systemen en Signalen	2	2003	3
1047762	BOS I W	156080	Signalen en transformaties	4	2003	3
1047762	BOS I W	157030	Structured Products	6	2003	3
1047762	BOS I W	157035	Financial Econometrics	9	2003	3
1047762	BOS I W	158017	Operationele research I	4	2003	4
1047762	BOS I W	158018	Operationele research I, practicum	9	2003	4
1047762	BOS I W	159960	Multidisciplinaire ontwerpopdracht	5	2003	3
1047762	BOS I W	211034	Spraaktechnologie	8	2003	3
1047762	BOS I W	211038	Spraak- en taaltechnologie	5	2002	3
1047762	BOS I W	211095	Gedistribueerde databases & middleware technologie	4	2003	4
1047762	BOS I W	211095	Gedistribueerde databases & middleware technologie	9	2003	1
1047762	BOS I W	213001	Basisbegrippen digitale techniek	3	2002	3
1047762	BOS I W	213001	Basisbegrippen digitale techniek	4	2003	4
1047762	BOS I W	213520	Formele Methoden voor Software Engineering	9	2003	4
1047762	BOS I W	213530	Concurrent and distributed programming	6	2003	4
1047762	BOS I W	214010	Complexiteit van berekeningen	7	2003	3
1047762	BOS I W	214025	Algoritmen,datastructuren en complexiteit plus	9	2003	4
1047762	BOS I W	214030	Artificial Intelligence	9	2003	4
1047762	BOS I W	214030	Artificial Intelligence	6	2002	1
1047762	BOS I W	214030	Artificial Intelligence	9	2003	2
1047762	BOS I W	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	3
1047762	BOS I W	214513	Internet & Web Architecturen	4	2003	4
1047762	BOS I W	214513	Internet & Web Architecturen	1	2003	2
1047762	BOS I W	232016	Prestatie-analyse van informatiesystemen	6	2003	3
1047762	BOS I W	232020	Data warehousing & data mining	8	2003	4
1047762	BOS I W	232050	Electronic Commerce	8	2002	4
1047762	BOS I W	235022	Investeringen in informatietechnologie	8	2003	4
1047762	BOS I W	237201	Oriëntatie ICT	6	2003	2
1047762	BOS I W	237600	Business Case Development for IT-projects	4	2003	1
1047762	BOS I W	265100	Ontwerpen van telematicasystemen	7	2002	4
1047762	BOS I W	265310	Internet management architecturen	7	2003	3
1048931	BOS B A	121002	Practicum elektronische basisschakelingen	9	2003	3
1048931	BOS B A	121007	Elektromagnetische Veldtheorie	7	2002	1
1048931	BOS B A	121008	Practicum Elektromagnetische Veldtheorie	6	2001	3
1048931	BOS B A	121008	Practicum Elektromagnetische Veldtheorie	5	2003	1
1048931	BOS B A	121009	Inleiding telecommunicatie	5	2003	4
1048931	BOS B A	121021	Inleiding in de biomedische technologie	8	2003	2
1048931	BOS B A	121026	Hands-on dig.image proces. and graphical pres.	3	2003	1
1048931	BOS B A	121044	Regeltechniek	1	2003	4
1048931	BOS B A	121044	Regeltechniek	1	2003	2
1048931	BOS B A	121045	Project Mechatronica	4	2001	4
1048931	BOS B A	121050	Modern robotics	6	2003	3
1048931	BOS B A	121053	Zekere- en onzekere informatie	4	2003	2
1048931	BOS B A	121057	Bio-elektriciteit	9	2003	2
1048931	BOS B A	121062	Eind P-project	7	2003	4
1048931	BOS B A	122230	Integrated circuits and systems for mixed signals	8	2003	2
1048931	BOS B A	122481	Systems engineering	6	2003	3
1048931	BOS B A	122711	Digitale meetsystemen	7	2003	4
1048931	BOS B A	122814	Elektromagnetisme II voor HBO	8	2003	1
1048931	BOS B A	122816	Mechanica en transductietechniek	5	2002	2
1048931	BOS B A	122816	Mechanica en transductietechniek	8	2003	2
1048931	BOS B A	122828	Practicum realiseren in materialen	9	2003	3
1048931	BOS B A	122829	Systemen en technieken voor informatieopslag	2	2003	1
1048931	BOS B A	124151	Mechatronica	5	2003	4
1048931	BOS B A	124151	Mechatronica	1	2003	2
1048931	BOS B A	124176	Digitale Regeltechniek	4	2003	3
1048931	BOS B A	125118	Practicum informatie-overdracht	4	2003	3
1048931	BOS B A	125118	Practicum informatie-overdracht	7	2003	2
1048931	BOS B A	125151	Schakel- en controlesystemen v. Multi-service netw	4	2003	3
1048931	BOS B A	127113	Elektrofysiologische signalen en bio-electriciteit	7	2003	1
1048931	BOS B A	127117	Biomechatronica	8	2003	3
1048931	BOS B A	129348	Maken van een scriptie	9	2003	3
1049824	RANNINK C	153003	Kansrekening	6	2003	3
1048931	BOS B A	129362	Start P-project	3	2003	2
1048931	BOS B A	150500	Presentatie van een wiskundig onderwerp	5	2003	3
1048931	BOS B A	151012	Calculus I	7	2003	4
1048931	BOS B A	151014	Analyse A	8	2003	3
1048931	BOS B A	151039	Algebra	1	2003	4
1048931	BOS B A	151045	Functionaalanalyse III	2	2003	4
1048931	BOS B A	151051	Fundamentele analyse I	4	2003	1
1048931	BOS B A	151085	Wiskunde I	9	2003	3
1048931	BOS B A	151160	Wiskunde C	9	2003	3
1048931	BOS B A	151210	Wiskunde A	6	2003	4
1048931	BOS B A	151510	Introduction to Risk Theory	8	2003	3
1048931	BOS B A	151530	Continuous Time Finance	4	2003	4
1048931	BOS B A	151600	Modelleren en redeneren	5	2003	4
1048931	BOS B A	152068	Discrete wiskunde	4	2003	2
1048931	BOS B A	152150	Wiskundig modelleren I	9	2003	4
1048931	BOS B A	153036	Statistiek II	7	2003	4
1048931	BOS B A	153045	Lineaire statistische modellen	4	2003	4
1048931	BOS B A	153087	Wachttijdtheorie	5	2003	3
1048931	BOS B A	154021	Numerieke wiskunde en programmeermethoden	8	2003	1
1048931	BOS B A	154023	Numerieke wiskunde en programmeermethoden	2	2003	3
1048931	BOS B A	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	6	2003	1
1048931	BOS B A	156067	Robust Control	2	2003	4
1048931	BOS B A	158025	Mathematische programmering I	7	2003	3
1048931	BOS B A	158042	Modelbouw in de optimalisatie	9	2003	4
1048931	BOS B A	158070	Grafentheorie en operationele research	9	2003	3
1048931	BOS B A	211024	Programmeren in C++	1	2003	4
1048931	BOS B A	211032	Seminarium Taal, Kennis & Interactie	8	2003	4
1048931	BOS B A	211033	Neurale netwerken en neuro-computing	8	2003	3
1048931	BOS B A	211038	Spraak- en taaltechnologie	9	2002	3
1048931	BOS B A	211038	Spraak- en taaltechnologie	5	2003	1
1048931	BOS B A	211045	Besturingssystemen	7	2003	3
1048931	BOS B A	211113	Constraint Logic Programming	7	2003	4
1048931	BOS B A	213009	Fouten tolererende digitale systemen	4	2003	1
1048931	BOS B A	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1048931	BOS B A	214513	Internet & Web Architecturen	9	2002	2
1048931	BOS B A	232016	Prestatie-analyse van informatiesystemen	1	2003	2
1048931	BOS B A	232080	Requirements Engineering	5	2003	3
1048931	BOS B A	237201	Oriëntatie ICT	2	2002	3
1048931	BOS B A	237400	BedrijfsProces Ondersteuning	9	2003	3
1048931	BOS B A	239801	BIT-BV 2	9	2003	4
1048931	BOS B A	239981	Integratieproject	9	1998	3
1048931	BOS B A	239981	Integratieproject	6	1999	3
1048931	BOS B A	265100	Ontwerpen van telematicasystemen	9	2003	1
1048931	BOS B A	265110	Protocol Engineering	8	2003	3
1048931	BOS B A	265201	Middleware for distributed objects	5	2003	3
1048931	BOS B A	269000	Orientatie ICT	9	2003	3
1048937	HEIJDEN M	121001	Elektronische basisschakelingen	8	2003	2
1048937	HEIJDEN M	121007	Elektromagnetische Veldtheorie	4	2002	4
1048937	HEIJDEN M	121007	Elektromagnetische Veldtheorie	4	2002	1
1048937	HEIJDEN M	121026	Hands-on dig.image proces. and graphical pres.	2	2003	4
1048937	HEIJDEN M	121028	Computer vision	5	2003	4
1048937	HEIJDEN M	121037	Advanced digital signal processing	6	2003	3
1048937	HEIJDEN M	121040	Medische elektronica	7	2003	3
1048937	HEIJDEN M	121053	Zekere- en onzekere informatie	7	2003	2
1048937	HEIJDEN M	121054	Neurotechnologie	1	2003	4
1048937	HEIJDEN M	121067	Signaal analyse practicum	5	2002	4
1048937	HEIJDEN M	121706	Halfgeleiderdevices	3	2003	3
1048937	HEIJDEN M	121709	Reliability Engineering	9	2003	4
1048937	HEIJDEN M	121714	I.C. technologie	3	2003	2
1048937	HEIJDEN M	122481	Systems engineering	1	2003	3
1048937	HEIJDEN M	122634	Real-time software development	2	2003	3
1048937	HEIJDEN M	122815	Materiaalkunde van microsystemen	4	2003	2
1048937	HEIJDEN M	122821	Microtechnologie t.b.v. transducenten	5	2003	3
1048937	HEIJDEN M	122828	Practicum realiseren in materialen	5	2003	3
1048937	HEIJDEN M	122831	Geintegreerde optica	6	2003	3
1048937	HEIJDEN M	123153	Embedded Signal Processing	4	2003	4
1048937	HEIJDEN M	124153	Computer-aided design gereedschappen voor VLSI	9	2003	4
1048937	HEIJDEN M	124177	Inleiding elektrische energietechniek	4	2002	1
1048937	HEIJDEN M	125159	Optische communicatienetwerken	9	2003	4
1048937	HEIJDEN M	125160	Mobiele communicatie	8	2003	3
1048937	HEIJDEN M	127117	Biomechatronica	8	2002	2
1048937	HEIJDEN M	129348	Maken van een scriptie	7	2003	3
1048937	HEIJDEN M	129367	Individual project	8	2003	2
1048937	HEIJDEN M	150527	Wiskundig modelleren II	9	2003	3
1048937	HEIJDEN M	150620	Systems and signals	4	2003	3
1048937	HEIJDEN M	150700	Introduction to operations research	8	2003	4
1048937	HEIJDEN M	150710	Modelling project	1	2003	3
1048937	HEIJDEN M	150740	Quality control	8	2003	4
1048937	HEIJDEN M	151005	Calculus II-B	5	2003	3
1048937	HEIJDEN M	151015	Numerieke lineaire algebra	1	2003	3
1048937	HEIJDEN M	151086	Vectoranalyse voor BMT	7	2003	3
1048937	HEIJDEN M	151091	Modelvorming I	9	2003	1
1048937	HEIJDEN M	151120	Wiskunde I	8	2003	4
1048937	HEIJDEN M	151215	Wiskunde B	4	2003	4
1048937	HEIJDEN M	151540	Computational Methods in Finance	2	2003	4
1048937	HEIJDEN M	152066	Capita selecta analyse	9	2003	2
1048937	HEIJDEN M	152070	Meetkunde	3	2003	4
1048937	HEIJDEN M	152100	Calculus I	9	2003	4
1048937	HEIJDEN M	153003	Kansrekening	9	2003	3
1048937	HEIJDEN M	153016	Voortgezette wiskundige statistiek	5	2003	3
1048937	HEIJDEN M	153021	Statistiek I voor TBK	4	2003	4
1048937	HEIJDEN M	153036	Statistiek II	9	2003	4
1048937	HEIJDEN M	153045	Lineaire statistische modellen	2	2003	4
1048937	HEIJDEN M	153080	Stochastische modellen in de operationele research	2	2003	4
1048937	HEIJDEN M	153083	Stochastische modellen in productie en logistiek	6	2003	2
1048937	HEIJDEN M	153100	Statistiek	7	2003	3
1048937	HEIJDEN M	154021	Numerieke wiskunde en programmeermethoden	5	2003	3
1048937	HEIJDEN M	154023	Numerieke wiskunde en programmeermethoden	5	2003	3
1048937	HEIJDEN M	155010	Part. differentiaalverg. uit de math. fysica	7	2003	4
1048937	HEIJDEN M	156016	Analyse B	8	2003	1
1048937	HEIJDEN M	156066	Besturingstheorie van economische systemen	7	2003	4
1048937	HEIJDEN M	157004	Stochastische processen in financien	4	2003	3
1048937	HEIJDEN M	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1048937	HEIJDEN M	158006	Operationele research II	5	2003	4
1048937	HEIJDEN M	159918	Bibliotheekgebruik en literatuuropdracht	8	2003	3
1048937	HEIJDEN M	159960	Multidisciplinaire ontwerpopdracht	7	2003	3
1048937	HEIJDEN M	211027	Inleiding programmeren met MATLAB	2	2003	3
1048937	HEIJDEN M	211038	Spraak- en taaltechnologie	4	2001	3
1048937	HEIJDEN M	211081	Distributed E-business Techniques	5	2003	1
1048937	HEIJDEN M	211098	Databasetransacties en -processen	5	2003	3
1048937	HEIJDEN M	211098	Databasetransacties en -processen	8	2003	2
1048937	HEIJDEN M	211113	Constraint Logic Programming	5	2003	4
1048937	HEIJDEN M	211127	Formele analyse van natuurlijke taal	4	2003	4
1048937	HEIJDEN M	211128	Informatica en taal	8	2003	4
1048937	HEIJDEN M	213011	Gedistribueerde systemen	4	2003	4
1048937	HEIJDEN M	213125	Computersystemen	2	2003	4
1048937	HEIJDEN M	213530	Concurrent and distributed programming	5	2003	2
1048937	HEIJDEN M	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2001	3
1048937	HEIJDEN M	214501	Communicatie & ontwerpen in ICT-projecten 2	5	2003	3
1048937	HEIJDEN M	214513	Internet & Web Architecturen	8	2002	2
1048937	HEIJDEN M	219910	Ontwerpproject	6	2003	3
1048937	HEIJDEN M	232060	Multi-agent systemen	9	2003	4
1048937	HEIJDEN M	234007	Systemen voor cooperatief werk	9	2003	4
1048937	HEIJDEN M	234010	Invoering van IT in organisaties	7	2002	4
1048937	HEIJDEN M	236050	E-health Strategies	7	2003	4
1048937	HEIJDEN M	237201	Oriëntatie ICT	4	2002	3
1048937	HEIJDEN M	237400	BedrijfsProces Ondersteuning	8	2003	3
1048937	HEIJDEN M	239981	Integratieproject	9	2000	4
1048937	HEIJDEN M	239981	Integratieproject	4	2003	3
1048937	HEIJDEN M	239981	Integratieproject	4	2002	1
1048937	HEIJDEN M	265100	Ontwerpen van telematicasystemen	6	2003	1
1049479	PRINZEN I E	121001	Elektronische basisschakelingen	7	2003	4
1049479	PRINZEN I E	121007	Elektromagnetische Veldtheorie	6	2002	1
1049479	PRINZEN I E	121007	Elektromagnetische Veldtheorie	7	2003	1
1049479	PRINZEN I E	121008	Practicum Elektromagnetische Veldtheorie	4	2003	1
1049479	PRINZEN I E	121019	D-opdracht	4	2003	3
1049479	PRINZEN I E	121021	Inleiding in de biomedische technologie	9	2002	4
1049479	PRINZEN I E	121025	Digitale beeldbewerking voor beta	9	2003	3
1049479	PRINZEN I E	121034	Fysische modelvorming van embedded systemen	1	2003	4
1049479	PRINZEN I E	121035	Mid P-project	2	2003	3
1049479	PRINZEN I E	121035	Mid P-project	5	2003	1
1049479	PRINZEN I E	121041	Elektrodynamica	8	2003	4
1049479	PRINZEN I E	121042	Meettechniek	5	2003	3
1049479	PRINZEN I E	121045	Project Mechatronica	7	2002	2
1049479	PRINZEN I E	121052	Imaging	1	2003	3
1049479	PRINZEN I E	121062	Eind P-project	6	2003	4
1049479	PRINZEN I E	121706	Halfgeleiderdevices	4	2003	1
1049479	PRINZEN I E	121714	I.C. technologie	2	2003	4
1049479	PRINZEN I E	122230	Integrated circuits and systems for mixed signals	7	2003	4
1049479	PRINZEN I E	122729	Image processing	6	2003	4
1049479	PRINZEN I E	122814	Elektromagnetisme II voor HBO	8	2003	4
1049479	PRINZEN I E	122816	Mechanica en transductietechniek	8	2002	2
1049479	PRINZEN I E	122828	Practicum realiseren in materialen	3	2003	1
1049479	PRINZEN I E	122830	Micro electro mechanische systemen	7	2003	4
1049479	PRINZEN I E	123112	Moderne modulatie- en detectietechnieken	7	2003	4
1049479	PRINZEN I E	123140	Inleiding systeem- en signaaltheorie voor HBO	2	2003	3
1049479	PRINZEN I E	124151	Mechatronica	5	2002	4
1049479	PRINZEN I E	124177	Inleiding elektrische energietechniek	8	2002	4
1049479	PRINZEN I E	125152	Glasvezelcommunicatie	4	2003	2
1049479	PRINZEN I E	125160	Mobiele communicatie	6	2003	3
1049479	PRINZEN I E	129362	Start P-project	1	2003	3
1049479	PRINZEN I E	129367	Individual project	6	2003	3
1049479	PRINZEN I E	151025	Functionaalanalyse II	7	2003	3
1049479	PRINZEN I E	151033	Numerieke analyse	5	2003	3
1049479	PRINZEN I E	151072	Wiskunde II	9	2003	4
1049479	PRINZEN I E	151072	Wiskunde II	4	2003	1
1049479	PRINZEN I E	151073	Calculus III	8	2003	4
1049479	PRINZEN I E	151084	Wiskunde IV	9	2003	4
1051748	BORGESIUS Y L	156014	Analyse B	6	2003	4
1049479	PRINZEN I E	151086	Vectoranalyse voor BMT	7	2003	3
1049479	PRINZEN I E	151130	Wiskunde II	6	2003	4
1049479	PRINZEN I E	151140	Wiskunde III	8	2003	3
1049479	PRINZEN I E	151202	Calculus B	4	2003	3
1049479	PRINZEN I E	151210	Wiskunde A	5	2003	4
1049479	PRINZEN I E	151510	Introduction to Risk Theory	6	2003	3
1049479	PRINZEN I E	151550	Life Insurance	7	2003	4
1049479	PRINZEN I E	152006	Lineaire structuren	7	2003	4
1049479	PRINZEN I E	152025	Complexe functietheorie	5	2003	3
1049479	PRINZEN I E	152066	Capita selecta analyse	9	2003	3
1049479	PRINZEN I E	152066	Capita selecta analyse	6	2003	2
1049479	PRINZEN I E	152120	Lineaire algebra	9	2003	4
1049479	PRINZEN I E	153029	Statistiek II	9	2003	4
1049479	PRINZEN I E	153032	Kansrekening en stochastische processen	9	2003	4
1049479	PRINZEN I E	153034	Kansrekening en statistiek	8	2003	3
1049479	PRINZEN I E	153081	Stochastische modellen v. telecommunicatie syst.	9	2003	2
1049479	PRINZEN I E	153086	Telecommunicatiesystemen	6	2003	4
1049479	PRINZEN I E	153100	Statistiek	7	2003	3
1049479	PRINZEN I E	153120	Statistiek	2	2003	4
1049479	PRINZEN I E	154023	Numerieke wiskunde en programmeermethoden	4	2003	1
1049479	PRINZEN I E	155009	Fundamenten van de methode der eindige elementen	6	2003	3
1049479	PRINZEN I E	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	1	2003	3
1049479	PRINZEN I E	158070	Grafentheorie en operationele research	5	2003	3
1049479	PRINZEN I E	159918	Bibliotheekgebruik en literatuuropdracht	4	2003	3
1049479	PRINZEN I E	211024	Programmeren in C++	7	2003	4
1049479	PRINZEN I E	211045	Besturingssystemen	7	2003	3
1049479	PRINZEN I E	211081	Distributed E-business Techniques	9	2003	1
1049479	PRINZEN I E	211095	Gedistribueerde databases & middleware technologie	8	2003	4
1049479	PRINZEN I E	211108	Bijzondere onderwerpen uit de logica	3	2003	4
1049479	PRINZEN I E	211111	Parallelle processen	9	2003	3
1049479	PRINZEN I E	211130	Ubiquitous Computing	6	2003	2
1049479	PRINZEN I E	211133	Ontwerpen van Software Architecturen	4	2003	1
1049479	PRINZEN I E	211180	Basismodellen in de informatica	4	2003	4
1049479	PRINZEN I E	211185	Taal- en rekenmodellen	4	2003	4
1049479	PRINZEN I E	213530	Concurrent and distributed programming	4	2002	4
1049479	PRINZEN I E	213530	Concurrent and distributed programming	4	2003	4
1049479	PRINZEN I E	213540	Advanced Design of Software Architectures	7	2003	1
1049479	PRINZEN I E	214011	Tool Architectuur	4	2003	4
1049479	PRINZEN I E	214511	Database Project	3	2003	3
1049479	PRINZEN I E	232020	Data warehousing & data mining	7	2003	4
1049479	PRINZEN I E	234001	Productie-informatietechnologie	5	2003	3
1049479	PRINZEN I E	237201	Oriëntatie ICT	8	2002	2
1049479	PRINZEN I E	237400	BedrijfsProces Ondersteuning	8	2003	1
1049479	PRINZEN I E	239981	Integratieproject	8	1999	1
1049479	PRINZEN I E	239981	Integratieproject	7	2001	2
1049479	PRINZEN I E	263200	Gedistribueerde multimedia database systemen	3	2003	4
1049479	PRINZEN I E	265200	Implementatie van telematicasystemen	8	2003	1
1049668	HEINEMAN L J	121001	Elektronische basisschakelingen	6	2003	2
1049668	HEINEMAN L J	121005	Netwerkanalyse	5	2003	1
1049668	HEINEMAN L J	121007	Elektromagnetische Veldtheorie	7	2003	1
1049668	HEINEMAN L J	121008	Practicum Elektromagnetische Veldtheorie	6	2003	1
1049668	HEINEMAN L J	121019	D-opdracht	1	2003	3
1049668	HEINEMAN L J	121022	Neurofysiologie	5	2003	4
1049668	HEINEMAN L J	121035	Mid P-project	7	2002	4
1049668	HEINEMAN L J	121035	Mid P-project	4	2003	1
1049668	HEINEMAN L J	121040	Medische elektronica	9	2003	3
1049668	HEINEMAN L J	121045	Project Mechatronica	9	2002	4
1049668	HEINEMAN L J	121045	Project Mechatronica	5	2003	3
1049668	HEINEMAN L J	121053	Zekere- en onzekere informatie	8	2003	3
1049668	HEINEMAN L J	121053	Zekere- en onzekere informatie	6	2003	2
1049668	HEINEMAN L J	121060	Optische basisfuncties en microsystemen	8	2003	4
1049668	HEINEMAN L J	122226	Project voortgezette elektronica	7	2003	3
1049668	HEINEMAN L J	122230	Integrated circuits and systems for mixed signals	9	2003	4
1049668	HEINEMAN L J	122481	Systems engineering	2	2003	3
1049668	HEINEMAN L J	122828	Practicum realiseren in materialen	4	2003	3
1049668	HEINEMAN L J	122829	Systemen en technieken voor informatieopslag	8	2003	4
1049668	HEINEMAN L J	124177	Inleiding elektrische energietechniek	4	2003	3
1049668	HEINEMAN L J	125113	Analoge communicatietechniek	9	2003	4
1049668	HEINEMAN L J	127117	Biomechatronica	7	2003	2
1049668	HEINEMAN L J	129348	Maken van een scriptie	6	2003	3
1049668	HEINEMAN L J	129358	Maken van een scriptie	7	2003	3
1049668	HEINEMAN L J	150500	Presentatie van een wiskundig onderwerp	7	2003	1
1049668	HEINEMAN L J	150610	Statistics and probability	8	2003	3
1049668	HEINEMAN L J	150620	Systems and signals	9	2003	3
1049668	HEINEMAN L J	151004	Calculus II-A	9	2003	4
1049668	HEINEMAN L J	151015	Numerieke lineaire algebra	1	2003	3
1049668	HEINEMAN L J	151070	Kwantitatieve methoden	7	2003	1
1049668	HEINEMAN L J	151072	Wiskunde II	7	2003	4
1049668	HEINEMAN L J	151081	Wiskunde I	8	2003	3
1049668	HEINEMAN L J	151092	Modelvorming II	7	2003	2
1049668	HEINEMAN L J	151150	Wiskunde IV	5	2003	3
1049668	HEINEMAN L J	151204	Calculus C	9	2003	4
1049668	HEINEMAN L J	151210	Wiskunde A	3	2003	1
1049668	HEINEMAN L J	152066	Capita selecta analyse	7	2003	3
1049668	HEINEMAN L J	152068	Discrete wiskunde	8	2003	3
1049668	HEINEMAN L J	152070	Meetkunde	1	2003	1
1049668	HEINEMAN L J	152100	Calculus I	9	2003	4
1049668	HEINEMAN L J	152110	Calculus II	5	2003	3
1049668	HEINEMAN L J	153006	Kansrekening	5	2003	3
1049668	HEINEMAN L J	153008	Kansrekening en statistiek	6	2003	3
1049668	HEINEMAN L J	153026	Asymptotische technieken in de statistiek	6	2003	3
1049668	HEINEMAN L J	153086	Telecommunicatiesystemen	9	2003	4
1049668	HEINEMAN L J	156012	Gewone differentiaalvergelijkingen	9	2003	3
1049668	HEINEMAN L J	156033	Bifurcatie theorie	2	2003	4
1049668	HEINEMAN L J	157016	Stochastische filter- en besturingstheorie	9	2003	3
1049668	HEINEMAN L J	157021	Analyse van signaaloverdracht in communicatienetw.	4	2003	4
1049668	HEINEMAN L J	158018	Operationele research I, practicum	1	2003	4
1049668	HEINEMAN L J	158075	Deterministische modellen in de OR	9	2003	1
1049668	HEINEMAN L J	159928	Doctoraalstage	5	2003	3
1049668	HEINEMAN L J	211027	Inleiding programmeren met MATLAB	2	2003	3
1049668	HEINEMAN L J	211047	Besturingssystemen voor Telematica	6	2003	4
1049668	HEINEMAN L J	211078	Database-ontwerp	6	2003	4
1049668	HEINEMAN L J	211081	Distributed E-business Techniques	4	2003	1
1049668	HEINEMAN L J	211095	Gedistribueerde databases & middleware technologie	5	2003	4
1049668	HEINEMAN L J	211096	XML & Databases	8	2003	1
1049668	HEINEMAN L J	211131	Statische Objectanalyse en Typering	4	2003	4
1049668	HEINEMAN L J	211185	Taal- en rekenmodellen	6	2003	1
1049668	HEINEMAN L J	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	2
1049668	HEINEMAN L J	213009	Fouten tolererende digitale systemen	6	2003	4
1049668	HEINEMAN L J	213014	Procesbesturing en robotica	5	2003	3
1049668	HEINEMAN L J	213110	Computerorganisatie	6	2003	4
1049668	HEINEMAN L J	213110	Computerorganisatie	1	2003	1
1049668	HEINEMAN L J	213120	Inleiding informatie- en communicatietechnologie	5	2003	2
1049668	HEINEMAN L J	213520	Formele Methoden voor Software Engineering	2	2003	4
1049668	HEINEMAN L J	213530	Concurrent and distributed programming	4	2002	4
1049668	HEINEMAN L J	213540	Advanced Design of Software Architectures	4	2003	3
1049668	HEINEMAN L J	214030	Artificial Intelligence	4	2002	1
1049668	HEINEMAN L J	232020	Data warehousing & data mining	9	2003	2
1049668	HEINEMAN L J	232060	Multi-agent systemen	9	2003	2
1049668	HEINEMAN L J	232080	Requirements Engineering	4	2003	3
1049668	HEINEMAN L J	233035	Practicum Databases in Informatiesystemen	4	2003	4
1049668	HEINEMAN L J	233035	Practicum Databases in Informatiesystemen	6	2002	1
1049668	HEINEMAN L J	234026	Voortgezette informatiesysteemmodellering	7	2003	4
1049668	HEINEMAN L J	235022	Investeringen in informatietechnologie	9	2003	2
1049668	HEINEMAN L J	237201	Oriëntatie ICT	3	2002	2
1049668	HEINEMAN L J	265100	Ontwerpen van telematicasystemen	5	2002	4
1049668	HEINEMAN L J	265100	Ontwerpen van telematicasystemen	8	2003	1
1049668	HEINEMAN L J	269004	Refresher Logics, Probability,Databases and JAVA	2	2003	1
1049824	RANNINK C	121002	Practicum elektronische basisschakelingen	5	2003	3
1049824	RANNINK C	121004	Practicum elektronische functies	9	2003	2
1049824	RANNINK C	121006	Practicum Meetinstrumenten/Netwerkanalyse	4	2003	3
1049824	RANNINK C	121007	Elektromagnetische Veldtheorie	1	2002	4
1049824	RANNINK C	121017	D1-project	8	2003	4
1049824	RANNINK C	121021	Inleiding in de biomedische technologie	8	2002	2
1049824	RANNINK C	121028	Computer vision	1	2003	4
1049824	RANNINK C	121035	Mid P-project	4	2002	1
1049824	RANNINK C	121040	Medische elektronica	4	2003	3
1049824	RANNINK C	121043	Dynamische systemen	2	2003	4
1049824	RANNINK C	121043	Dynamische systemen	8	2003	2
1049824	RANNINK C	121045	Project Mechatronica	6	2002	4
1049824	RANNINK C	121051	Informatie Opslag	4	2003	3
1049824	RANNINK C	121057	Bio-elektriciteit	8	2003	2
1049824	RANNINK C	121706	Halfgeleiderdevices	5	2003	1
1049824	RANNINK C	121713	VLSI system design	8	2003	4
1049824	RANNINK C	122226	Project voortgezette elektronica	4	2003	3
1049824	RANNINK C	122634	Real-time software development	1	2003	3
1049824	RANNINK C	122828	Practicum realiseren in materialen	1	2003	3
1049824	RANNINK C	122833	Integratieproject	9	2003	4
1049824	RANNINK C	124151	Mechatronica	6	2003	4
1049824	RANNINK C	125153	Inleiding communicatiesystemen	7	2003	3
1049824	RANNINK C	127113	Elektrofysiologische signalen en bio-electriciteit	7	2003	4
1049824	RANNINK C	127116	Elektromagnetisme I voor HBO	7	2003	3
1049824	RANNINK C	127116	Elektromagnetisme I voor HBO	4	2003	2
1049824	RANNINK C	129358	Maken van een scriptie	4	2003	3
1049824	RANNINK C	150630	Applied functional analysis	5	2003	4
1049824	RANNINK C	151005	Calculus II-B	7	2003	3
1049824	RANNINK C	151012	Calculus I	4	2003	4
1049824	RANNINK C	151014	Analyse A	6	2003	3
1049824	RANNINK C	151015	Numerieke lineaire algebra	6	2003	3
1049824	RANNINK C	151072	Wiskunde II	4	2003	1
1049824	RANNINK C	151084	Wiskunde IV	5	2003	4
1049824	RANNINK C	151093	Modelvorming III	9	2003	3
1049824	RANNINK C	151202	Calculus B	5	2003	3
1049824	RANNINK C	152056	Combinatoriek	8	2003	4
1049824	RANNINK C	152100	Calculus I	5	2003	4
1049824	RANNINK C	153004	Statistiek I	5	2003	3
1049824	RANNINK C	153029	Statistiek II	5	2003	4
1049824	RANNINK C	153036	Statistiek II	5	2003	4
1049824	RANNINK C	153036	Statistiek II	6	2003	2
1049824	RANNINK C	153055	Parametervrije statistische methoden	5	2003	3
1049824	RANNINK C	153080	Stochastische modellen in de operationele research	2	2003	4
1049824	RANNINK C	153083	Stochastische modellen in productie en logistiek	7	2003	3
1049824	RANNINK C	153100	Statistiek	6	2003	3
1049824	RANNINK C	153120	Statistiek	4	2003	4
1049824	RANNINK C	154021	Numerieke wiskunde en programmeermethoden	6	2003	1
1049824	RANNINK C	155019	Practicum softwarepakketten PDV	9	2003	3
1049824	RANNINK C	157016	Stochastische filter- en besturingstheorie	5	2003	3
1049824	RANNINK C	158022	Operationele research III	8	2003	3
1049824	RANNINK C	158025	Mathematische programmering I	7	2003	3
1049824	RANNINK C	158070	Grafentheorie en operationele research	9	2003	3
1049824	RANNINK C	158075	Deterministische modellen in de OR	9	2003	1
1049824	RANNINK C	159918	Bibliotheekgebruik en literatuuropdracht	8	2003	3
1049824	RANNINK C	211033	Neurale netwerken en neuro-computing	4	2003	3
1049824	RANNINK C	211038	Spraak- en taaltechnologie	6	2002	3
1049824	RANNINK C	211038	Spraak- en taaltechnologie	9	2003	4
1049824	RANNINK C	211123	Component- en aspect georienteerd progammeren	8	2003	1
1049824	RANNINK C	211128	Informatica en taal	5	2003	4
1049824	RANNINK C	211130	Ubiquitous Computing	1	2003	3
1049824	RANNINK C	212010	Informatiesystemen	5	2003	1
1049824	RANNINK C	212018	Kennistechnologie voor bedrijfskundige toep.	5	2003	4
1049824	RANNINK C	213001	Basisbegrippen digitale techniek	4	2002	3
1049824	RANNINK C	213120	Inleiding informatie- en communicatietechnologie	7	2003	2
1049824	RANNINK C	213505	Programmeren 2	8	2003	4
1049824	RANNINK C	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	1
1049824	RANNINK C	214501	Communicatie & ontwerpen in ICT-projecten 2	4	2003	3
1049824	RANNINK C	214511	Database Project	4	2003	2
1049824	RANNINK C	214513	Internet & Web Architecturen	1	2002	4
1049824	RANNINK C	232011	Architectuur van informatiesystemen	9	2003	4
1049824	RANNINK C	232016	Prestatie-analyse van informatiesystemen	7	2002	4
1049824	RANNINK C	232050	Electronic Commerce	4	2002	4
1049824	RANNINK C	234007	Systemen voor cooperatief werk	8	2003	4
1049824	RANNINK C	234010	Invoering van IT in organisaties	1	2003	4
1049824	RANNINK C	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1049824	RANNINK C	239800	BIT-BV 1	6	2003	4
1049824	RANNINK C	239801	BIT-BV 2	5	2003	4
1049824	RANNINK C	239801	BIT-BV 2	6	2003	2
1049824	RANNINK C	239981	Integratieproject	5	2001	3
1049824	RANNINK C	265100	Ontwerpen van telematicasystemen	6	2003	1
1049824	RANNINK C	269100	P-project TEL	4	2003	2
1051347	KESTER N	121002	Practicum elektronische basisschakelingen	8	2003	1
1051347	KESTER N	121005	Netwerkanalyse	6	2003	1
1051347	KESTER N	121007	Elektromagnetische Veldtheorie	5	2002	1
1051347	KESTER N	121017	D1-project	4	2003	4
1051347	KESTER N	121019	D-opdracht	2	2003	3
1051347	KESTER N	121028	Computer vision	7	2003	4
1051347	KESTER N	121035	Mid P-project	7	2002	4
1051347	KESTER N	121035	Mid P-project	4	2003	3
1051347	KESTER N	121035	Mid P-project	9	2003	1
1051347	KESTER N	121045	Project Mechatronica	5	2002	2
1051347	KESTER N	121053	Zekere- en onzekere informatie	4	2003	3
1051347	KESTER N	121057	Bio-elektriciteit	6	2003	2
1051347	KESTER N	121060	Optische basisfuncties en microsystemen	9	2003	4
1051347	KESTER N	121717	Advanced semiconductor devices	9	2003	3
1051347	KESTER N	122227	Voortgezette analoge IC elektronica	9	2003	4
1051347	KESTER N	122634	Real-time software development	8	2003	3
1051347	KESTER N	122711	Digitale meetsystemen	6	2003	4
1051347	KESTER N	122728	Classification, Estimation and Data Analysis	6	2003	4
1051347	KESTER N	122740	Netwerkanalyse voor TEL	8	2003	3
1051347	KESTER N	122814	Elektromagnetisme II voor HBO	6	2003	1
1051347	KESTER N	122815	Materiaalkunde van microsystemen	5	2003	2
1051347	KESTER N	122829	Systemen en technieken voor informatieopslag	5	2003	1
1051347	KESTER N	122831	Geintegreerde optica	6	2003	3
1051347	KESTER N	122833	Integratieproject	5	2003	2
1051347	KESTER N	123140	Inleiding systeem- en signaaltheorie voor HBO	4	2003	3
1051347	KESTER N	124151	Mechatronica	7	2002	4
1051347	KESTER N	124153	Computer-aided design gereedschappen voor VLSI	6	2003	4
1051347	KESTER N	124177	Inleiding elektrische energietechniek	2	2002	4
1051347	KESTER N	125151	Schakel- en controlesystemen v. Multi-service netw	7	2003	3
1051347	KESTER N	125152	Glasvezelcommunicatie	3	2003	3
1051347	KESTER N	129344	Literatuuronderzoek	2	2003	3
1051347	KESTER N	129354	Literatuuronderzoek	9	2003	4
1051347	KESTER N	150529	Wiskundig modelleren IV	5	2003	1
1051347	KESTER N	150810	Modelling project	6	2003	3
1051347	KESTER N	151015	Numerieke lineaire algebra	9	2003	3
1051347	KESTER N	151039	Algebra	8	2003	4
1051347	KESTER N	151043	Seminarium mathematische fysica	8	2003	4
1051347	KESTER N	151051	Fundamentele analyse I	4	2003	1
1051347	KESTER N	151070	Kwantitatieve methoden	6	2003	1
1051347	KESTER N	152038	Grafentheorie	4	2003	2
1051347	KESTER N	152068	Discrete wiskunde	6	2003	3
1051347	KESTER N	153006	Kansrekening	5	2003	3
1051347	KESTER N	153038	Wiskundige statistiek	7	2003	4
1051347	KESTER N	153039	Kansrekening en statistiek	5	2003	3
1051347	KESTER N	153110	Inleiding statistiek	9	2003	3
1051347	KESTER N	155010	Part. differentiaalverg. uit de math. fysica	4	2003	4
1051347	KESTER N	155019	Practicum softwarepakketten PDV	2	2003	3
1051347	KESTER N	156016	Analyse B	9	2003	3
1051347	KESTER N	157030	Structured Products	6	2003	3
1051347	KESTER N	158017	Operationele research I	6	2003	4
1051347	KESTER N	158022	Operationele research III	4	2003	3
1051347	KESTER N	158070	Grafentheorie en operationele research	5	2003	1
1051347	KESTER N	211032	Seminarium Taal, Kennis & Interactie	4	2002	3
1051347	KESTER N	211035	Vertalerbouw	9	2003	4
1051347	KESTER N	211038	Spraak- en taaltechnologie	7	2002	1
1051347	KESTER N	211038	Spraak- en taaltechnologie	7	2003	1
1051347	KESTER N	211081	Distributed E-business Techniques	9	2003	1
1051347	KESTER N	211090	Databasetoepassingen	8	2003	4
1051347	KESTER N	212018	Kennistechnologie voor bedrijfskundige toep.	7	2003	4
1051347	KESTER N	212018	Kennistechnologie voor bedrijfskundige toep.	5	2003	2
1051347	KESTER N	213001	Basisbegrippen digitale techniek	5	2003	4
1051347	KESTER N	213014	Procesbesturing en robotica	7	2003	3
1051347	KESTER N	213120	Inleiding informatie- en communicatietechnologie	7	2003	2
1051347	KESTER N	213510	Software Engineering Modellen	1	2003	4
1051347	KESTER N	213530	Concurrent and distributed programming	5	2003	2
1051347	KESTER N	213540	Advanced Design of Software Architectures	6	2003	1
1051347	KESTER N	214030	Artificial Intelligence	6	2003	2
1051347	KESTER N	214510	MMI-project	5	2003	3
1051347	KESTER N	214512	Computerarchitectuur Project	9	2003	4
1051347	KESTER N	232020	Data warehousing & data mining	8	2003	4
1051347	KESTER N	232055	XML-technologie in E-Commerce	5	2003	4
1051347	KESTER N	232060	Multi-agent systemen	7	2003	4
1051347	KESTER N	233035	Practicum Databases in Informatiesystemen	4	2003	1
1051347	KESTER N	234004	Softwaremanagement	8	2003	3
1051347	KESTER N	235005	Inleiding bedrijfsinformatiesystemen	4	2003	3
1051347	KESTER N	237201	Oriëntatie ICT	8	2002	3
1051347	KESTER N	237201	Oriëntatie ICT	1	2003	4
1051347	KESTER N	239981	Integratieproject	7	2000	4
1051347	KESTER N	239981	Integratieproject	9	1999	1
1051347	KESTER N	262020	Bijzondere onderwerpen Telematica	3	2003	1
1051347	KESTER N	264001	Telematics and business strategies	5	2003	4
1051347	KESTER N	265100	Ontwerpen van telematicasystemen	5	2003	3
1051347	KESTER N	265310	Internet management architecturen	2	2003	3
1051748	BORGESIUS Y L	121053	Zekere- en onzekere informatie	9	2003	3
1051748	BORGESIUS Y L	121054	Neurotechnologie	2	2003	4
1051748	BORGESIUS Y L	121067	Signaal analyse practicum	8	2002	4
1051748	BORGESIUS Y L	121709	Reliability Engineering	7	2003	4
1051748	BORGESIUS Y L	121717	Advanced semiconductor devices	4	2003	3
1051748	BORGESIUS Y L	122226	Project voortgezette elektronica	7	2003	3
1051748	BORGESIUS Y L	122481	Systems engineering	7	2003	3
1051748	BORGESIUS Y L	122634	Real-time software development	5	2003	3
1051748	BORGESIUS Y L	122729	Image processing	7	2003	4
1051748	BORGESIUS Y L	122733	VLSI signal processing	4	2003	2
1051748	BORGESIUS Y L	122816	Mechanica en transductietechniek	5	2003	4
1051748	BORGESIUS Y L	122830	Micro electro mechanische systemen	8	2003	4
1051748	BORGESIUS Y L	123149	Lineaire systemen	4	2003	4
1051748	BORGESIUS Y L	123152	Signal processing in acoustics and audio	7	2003	1
1051748	BORGESIUS Y L	124151	Mechatronica	2	2002	4
1051748	BORGESIUS Y L	124151	Mechatronica	5	2003	4
1051748	BORGESIUS Y L	124153	Computer-aided design gereedschappen voor VLSI	6	2003	4
1051748	BORGESIUS Y L	124163	Mechatronische meetsystemen	2	2003	4
1051748	BORGESIUS Y L	125118	Practicum informatie-overdracht	4	2003	2
1051748	BORGESIUS Y L	125152	Glasvezelcommunicatie	6	2003	3
1051748	BORGESIUS Y L	125152	Glasvezelcommunicatie	2	2003	2
1051748	BORGESIUS Y L	125159	Optische communicatienetwerken	8	2003	4
1051748	BORGESIUS Y L	127117	Biomechatronica	6	2002	3
1051748	BORGESIUS Y L	129347	Deelname aan een project	6	2003	4
1051748	BORGESIUS Y L	129351	Fysiologie II	5	2003	1
1051748	BORGESIUS Y L	129358	Maken van een scriptie	5	2003	3
1051748	BORGESIUS Y L	129362	Start P-project	6	2003	2
1051748	BORGESIUS Y L	150528	Wiskundig modelleren III	5	2003	3
1051748	BORGESIUS Y L	150710	Modelling project	1	2003	3
1051748	BORGESIUS Y L	151004	Calculus II-A	5	2003	4
1051748	BORGESIUS Y L	151018	Analyse A	9	2003	3
1051748	BORGESIUS Y L	151019	Analyse B	9	2003	4
1051748	BORGESIUS Y L	151044	Analyse C	4	2003	3
1051748	BORGESIUS Y L	151070	Kwantitatieve methoden	5	2002	4
1051748	BORGESIUS Y L	151070	Kwantitatieve methoden	8	2003	1
1051748	BORGESIUS Y L	151072	Wiskunde II	8	2003	1
1051748	BORGESIUS Y L	151080	Bijscholing wiskunde B2	5	2003	3
1051748	BORGESIUS Y L	151081	Wiskunde I	6	2003	3
1051748	BORGESIUS Y L	151208	Lineaire Algebra B	3	2003	3
1051748	BORGESIUS Y L	151540	Computational Methods in Finance	4	2003	4
1051748	BORGESIUS Y L	152006	Lineaire structuren	2	2003	4
1051748	BORGESIUS Y L	152025	Complexe functietheorie	9	2003	3
1051748	BORGESIUS Y L	152028	Analyse A	3	2003	4
1051748	BORGESIUS Y L	152066	Capita selecta analyse	4	2003	2
1051748	BORGESIUS Y L	152068	Discrete wiskunde	6	2003	3
1051748	BORGESIUS Y L	152070	Meetkunde	9	2003	1
1051748	BORGESIUS Y L	152110	Calculus II	7	2003	3
1051748	BORGESIUS Y L	153004	Statistiek I	9	2003	3
1051748	BORGESIUS Y L	153023	Statistiek II voor TBK	9	2003	3
1051748	BORGESIUS Y L	153036	Statistiek II	7	2003	2
1051748	BORGESIUS Y L	153041	Inleiding statistiek	8	2003	4
1051748	BORGESIUS Y L	153045	Lineaire statistische modellen	5	2003	4
1051748	BORGESIUS Y L	153083	Stochastische modellen in productie en logistiek	6	2003	2
1051748	BORGESIUS Y L	153086	Telecommunicatiesystemen	9	2003	1
1051748	BORGESIUS Y L	153088	Stochastische modellen voor Operations Management	8	2003	3
1051748	BORGESIUS Y L	153110	Inleiding statistiek	5	2003	3
1051748	BORGESIUS Y L	156057	Inleiding wiskundige systeemtheorie	9	2003	4
1051748	BORGESIUS Y L	158075	Deterministische modellen in de OR	5	2003	1
1051748	BORGESIUS Y L	211038	Spraak- en taaltechnologie	7	2001	3
1051748	BORGESIUS Y L	211074	Gegevensbanken	8	2003	4
1051748	BORGESIUS Y L	211097	Bijzondere onderwerpen gegevensbanken	8	2003	3
1051748	BORGESIUS Y L	211131	Statische Objectanalyse en Typering	6	2003	4
1051748	BORGESIUS Y L	213002	Ontwerpen van digitale systemen	7	2003	4
1051748	BORGESIUS Y L	213009	Fouten tolererende digitale systemen	5	2003	4
1051748	BORGESIUS Y L	213013	Real-time embedded systemen	8	2003	3
1051748	BORGESIUS Y L	213110	Computerorganisatie	6	2003	4
1051748	BORGESIUS Y L	213120	Inleiding informatie- en communicatietechnologie	4	2003	2
1051748	BORGESIUS Y L	214012	Systeemvalidatie	8	2003	3
1051748	BORGESIUS Y L	214030	Artificial Intelligence	5	2003	2
1051748	BORGESIUS Y L	214513	Internet & Web Architecturen	8	2002	4
1051748	BORGESIUS Y L	219801	Hypermedia structuren en systemen	6	2003	4
1051748	BORGESIUS Y L	232011	Architectuur van informatiesystemen	5	2003	4
1051748	BORGESIUS Y L	232020	Data warehousing & data mining	6	2002	3
1051748	BORGESIUS Y L	232050	Electronic Commerce	8	2003	4
1051748	BORGESIUS Y L	232050	Electronic Commerce	4	2003	2
1051748	BORGESIUS Y L	232055	XML-technologie in E-Commerce	6	2003	4
1051748	BORGESIUS Y L	234007	Systemen voor cooperatief werk	9	2003	4
1051748	BORGESIUS Y L	234020	Ontwerpen van mens-machine interactie	8	2003	4
1051748	BORGESIUS Y L	237201	Oriëntatie ICT	4	2003	2
1051748	BORGESIUS Y L	237400	BedrijfsProces Ondersteuning	7	2003	1
1051748	BORGESIUS Y L	239801	BIT-BV 2	6	2003	4
1051748	BORGESIUS Y L	239981	Integratieproject	4	2003	2
1051748	BORGESIUS Y L	264000	Telematicatoepassingen	9	2003	3
1051748	BORGESIUS Y L	265100	Ontwerpen van telematicasystemen	4	2002	4
1051748	BORGESIUS Y L	269000	Orientatie ICT	2	2003	3
1052369	OOMKENS J O	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	1
1052369	OOMKENS J O	129344	Literatuuronderzoek	4	2003	3
1052369	OOMKENS J O	129345	Deelname aan een studiegroep	5	2003	3
1052369	OOMKENS J O	129358	Maken van een scriptie	5	2003	3
1052369	OOMKENS J O	150433	Wiskundig modelleren voor CiT	4	2003	4
1052369	OOMKENS J O	150532	Maple practicum	5	2003	4
1052369	OOMKENS J O	151043	Seminarium mathematische fysica	2	2003	1
1052369	OOMKENS J O	151072	Wiskunde II	7	2003	4
1052369	OOMKENS J O	151092	Modelvorming II	6	2003	2
1052369	OOMKENS J O	151206	Lineaire Algebra A	5	2003	3
1052369	OOMKENS J O	151208	Lineaire Algebra B	8	2003	3
1052369	OOMKENS J O	151540	Computational Methods in Finance	4	2003	4
1052369	OOMKENS J O	151565	Praktische opdracht Financial Engineering	1	2003	4
1052369	OOMKENS J O	152068	Discrete wiskunde	3	2003	2
1052369	OOMKENS J O	153002	Discrete kansrekening	6	2003	3
1052369	OOMKENS J O	153006	Kansrekening	6	2003	3
1052369	OOMKENS J O	153008	Kansrekening en statistiek	8	2003	3
1052369	OOMKENS J O	153016	Voortgezette wiskundige statistiek	5	2003	3
1052369	OOMKENS J O	153028	Statistiek I	6	2003	4
1052369	OOMKENS J O	155009	Fundamenten van de methode der eindige elementen	9	2003	3
1052369	OOMKENS J O	155010	Part. differentiaalverg. uit de math. fysica	7	2003	4
1052369	OOMKENS J O	156067	Robust Control	4	2003	4
1052369	OOMKENS J O	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1052369	OOMKENS J O	158038	Discrete optimalisering	7	2003	3
1052369	OOMKENS J O	211098	Databasetransacties en -processen	2	2003	3
1052369	OOMKENS J O	211123	Component- en aspect georienteerd progammeren	6	2003	3
1052369	OOMKENS J O	211130	Ubiquitous Computing	2	2003	3
1052369	OOMKENS J O	211130	Ubiquitous Computing	8	2003	2
1052369	OOMKENS J O	213001	Basisbegrippen digitale techniek	2	2003	4
1052369	OOMKENS J O	213005	Computerarchitectuur	2	2003	4
1052369	OOMKENS J O	213510	Software Engineering Modellen	6	2003	4
1052369	OOMKENS J O	214011	Tool Architectuur	5	2003	4
1052369	OOMKENS J O	214012	Systeemvalidatie	6	2003	3
1052369	OOMKENS J O	214025	Algoritmen,datastructuren en complexiteit plus	4	2003	4
1052369	OOMKENS J O	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	1
1052369	OOMKENS J O	219801	Hypermedia structuren en systemen	6	2003	4
1052369	OOMKENS J O	232016	Prestatie-analyse van informatiesystemen	8	2002	4
1052369	OOMKENS J O	232081	Requirements Engineering	8	2003	4
1052369	OOMKENS J O	233030	Specificeren van informatiesystemen	6	2003	1
1052369	OOMKENS J O	239801	BIT-BV 2	3	2003	4
1052369	OOMKENS J O	261010	Computer netwerken	5	2003	1
1052369	OOMKENS J O	262020	Bijzondere onderwerpen Telematica	6	2003	1
1052369	OOMKENS J O	269001	Portfolio ontwerp	8	2003	4
1052369	OOMKENS J O	269100	P-project TEL	6	2003	4
1052369	OOMKENS J O	269100	P-project TEL	7	2003	2
1053038	BANDTSMA F J	121002	Practicum elektronische basisschakelingen	6	2003	3
1053038	BANDTSMA F J	121007	Elektromagnetische Veldtheorie	3	2003	3
1053038	BANDTSMA F J	121017	D1-project	6	2003	4
1053038	BANDTSMA F J	121018	Stage	8	2003	1
1053038	BANDTSMA F J	121021	Inleiding in de biomedische technologie	6	2002	4
1053038	BANDTSMA F J	121021	Inleiding in de biomedische technologie	1	2002	2
1053038	BANDTSMA F J	121021	Inleiding in de biomedische technologie	8	2003	2
1053038	BANDTSMA F J	121028	Computer vision	6	2003	4
1053038	BANDTSMA F J	121037	Advanced digital signal processing	6	2003	3
1053038	BANDTSMA F J	121038	Elektronica voor industrieel ontwerpers	7	2003	4
1053038	BANDTSMA F J	121043	Dynamische systemen	8	2003	2
1053038	BANDTSMA F J	121053	Zekere- en onzekere informatie	7	2003	2
1053038	BANDTSMA F J	121057	Bio-elektriciteit	7	2003	2
1053038	BANDTSMA F J	121067	Signaal analyse practicum	9	2003	2
1053038	BANDTSMA F J	121706	Halfgeleiderdevices	7	2003	1
1053038	BANDTSMA F J	121709	Reliability Engineering	7	2003	4
1053038	BANDTSMA F J	122226	Project voortgezette elektronica	6	2003	3
1053038	BANDTSMA F J	122230	Integrated circuits and systems for mixed signals	7	2003	2
1053038	BANDTSMA F J	122828	Practicum realiseren in materialen	9	2003	1
1053038	BANDTSMA F J	122829	Systemen en technieken voor informatieopslag	7	2003	1
1053038	BANDTSMA F J	123140	Inleiding systeem- en signaaltheorie voor HBO	4	2003	3
1053038	BANDTSMA F J	124177	Inleiding elektrische energietechniek	5	2002	1
1053038	BANDTSMA F J	125119	Signaaltheorie	7	2003	4
1053038	BANDTSMA F J	125152	Glasvezelcommunicatie	4	2003	2
1053038	BANDTSMA F J	127115	Praktische biomedische signaalanalyse	6	2003	4
1053038	BANDTSMA F J	129344	Literatuuronderzoek	5	2003	3
1053038	BANDTSMA F J	129355	Deelname aan een studiegroep	5	2003	3
1053038	BANDTSMA F J	129357	Deelname aan een project	7	2003	4
1053038	BANDTSMA F J	150433	Wiskundig modelleren voor CiT	5	2003	4
1053038	BANDTSMA F J	150500	Presentatie van een wiskundig onderwerp	6	2003	1
1053038	BANDTSMA F J	150526	Wiskundig modelleren I	7	2003	3
1053038	BANDTSMA F J	150529	Wiskundig modelleren IV	8	2003	1
1053038	BANDTSMA F J	150600	Mathematical methods	7	2003	3
1053038	BANDTSMA F J	150620	Systems and signals	9	2003	3
1053038	BANDTSMA F J	150730	Experimental design	4	2003	3
1053038	BANDTSMA F J	151012	Calculus I	5	2003	4
1053038	BANDTSMA F J	151051	Fundamentele analyse I	9	2003	3
1053038	BANDTSMA F J	151051	Fundamentele analyse I	9	2003	1
1053038	BANDTSMA F J	151052	Fundamentele analyse II	4	2003	3
1053038	BANDTSMA F J	151092	Modelvorming II	4	2003	2
1053038	BANDTSMA F J	151150	Wiskunde IV	2	2003	3
1053038	BANDTSMA F J	151160	Wiskunde C	9	2003	3
1053038	BANDTSMA F J	151210	Wiskunde A	8	2003	4
1053038	BANDTSMA F J	151250	Modellen en systemen	9	2003	4
1053038	BANDTSMA F J	151600	Modelleren en redeneren	4	2003	4
1053038	BANDTSMA F J	152027	Calculus II	5	2003	2
1053038	BANDTSMA F J	152056	Combinatoriek	4	2003	4
1053038	BANDTSMA F J	153023	Statistiek II voor TBK	4	2003	3
1053038	BANDTSMA F J	153026	Asymptotische technieken in de statistiek	7	2003	3
1053038	BANDTSMA F J	153031	Statistiek	7	2003	3
1053038	BANDTSMA F J	153036	Statistiek II	8	2003	4
1053038	BANDTSMA F J	153083	Stochastische modellen in productie en logistiek	4	2003	3
1053038	BANDTSMA F J	156062	Systeem- en besturingstheorie	1	2003	4
1053038	BANDTSMA F J	157021	Analyse van signaaloverdracht in communicatienetw.	9	2003	4
1053038	BANDTSMA F J	158075	Deterministische modellen in de OR	8	2003	1
1053038	BANDTSMA F J	211097	Bijzondere onderwerpen gegevensbanken	9	2003	3
1053038	BANDTSMA F J	211097	Bijzondere onderwerpen gegevensbanken	6	2003	1
1053038	BANDTSMA F J	211131	Statische Objectanalyse en Typering	4	2003	4
1053038	BANDTSMA F J	211180	Basismodellen in de informatica	5	2003	2
1053038	BANDTSMA F J	213005	Computerarchitectuur	7	2003	4
1053038	BANDTSMA F J	213005	Computerarchitectuur	8	2003	1
1053038	BANDTSMA F J	213011	Gedistribueerde systemen	6	2003	2
1053038	BANDTSMA F J	213510	Software Engineering Modellen	7	2003	4
1053038	BANDTSMA F J	214010	Complexiteit van berekeningen	7	2003	3
1053038	BANDTSMA F J	214030	Artificial Intelligence	8	2003	2
1053038	BANDTSMA F J	232050	Electronic Commerce	4	2003	2
1053038	BANDTSMA F J	232055	XML-technologie in E-Commerce	4	2003	1
1053038	BANDTSMA F J	232060	Multi-agent systemen	8	2003	2
1053038	BANDTSMA F J	234026	Voortgezette informatiesysteemmodellering	2	2003	4
1053038	BANDTSMA F J	235005	Inleiding bedrijfsinformatiesystemen	2	2003	3
1053038	BANDTSMA F J	237400	BedrijfsProces Ondersteuning	7	2003	1
1053038	BANDTSMA F J	239981	Integratieproject	5	2002	3
1053038	BANDTSMA F J	239981	Integratieproject	4	2003	2
1053038	BANDTSMA F J	262001	Mobile and wireless networking	7	2003	4
1053038	BANDTSMA F J	265110	Protocol Engineering	8	2003	3
1053038	BANDTSMA F J	266100	Patterns of software development	4	2003	4
1053188	ALINCK I	121003	Elektronische functies	9	2003	3
1053188	ALINCK I	121005	Netwerkanalyse	6	2003	1
1053188	ALINCK I	121021	Inleiding in de biomedische technologie	4	2003	2
1053188	ALINCK I	121034	Fysische modelvorming van embedded systemen	9	2003	4
1053188	ALINCK I	121035	Mid P-project	5	2002	1
1053188	ALINCK I	121035	Mid P-project	8	2003	1
1053188	ALINCK I	121045	Project Mechatronica	1	2003	3
1053188	ALINCK I	121045	Project Mechatronica	6	2003	1
1053188	ALINCK I	121056	Laboratorium op een chip	5	2003	3
1053188	ALINCK I	121057	Bio-elektriciteit	7	2003	4
1053188	ALINCK I	121057	Bio-elektriciteit	7	2003	2
1053188	ALINCK I	121067	Signaal analyse practicum	4	2002	4
1053188	ALINCK I	121709	Reliability Engineering	6	2003	2
1053188	ALINCK I	121713	VLSI system design	8	2003	4
1053188	ALINCK I	122729	Image processing	4	2003	4
1053188	ALINCK I	122733	VLSI signal processing	7	2003	2
1053188	ALINCK I	122816	Mechanica en transductietechniek	2	2003	4
1053188	ALINCK I	122816	Mechanica en transductietechniek	6	2002	2
1053188	ALINCK I	122821	Microtechnologie t.b.v. transducenten	6	2003	3
1053188	ALINCK I	122833	Integratieproject	4	2003	2
1053188	ALINCK I	123112	Moderne modulatie- en detectietechnieken	6	2003	4
1053188	ALINCK I	124177	Inleiding elektrische energietechniek	3	2002	1
1053188	ALINCK I	124177	Inleiding elektrische energietechniek	9	2003	1
1053188	ALINCK I	125153	Inleiding communicatiesystemen	7	2003	3
1053188	ALINCK I	125163	Electromagnetische compatibiliteit	8	2003	4
1053188	ALINCK I	127117	Biomechatronica	8	2002	3
1053188	ALINCK I	129355	Deelname aan een studiegroep	8	2003	3
1053188	ALINCK I	151019	Analyse B	2	2003	4
1053188	ALINCK I	151020	Functionaalanalyse I	5	2003	3
1053188	ALINCK I	151043	Seminarium mathematische fysica	5	2003	4
1053188	ALINCK I	151043	Seminarium mathematische fysica	4	2003	1
1053188	ALINCK I	151080	Bijscholing wiskunde B2	4	2003	3
1053188	ALINCK I	151081	Wiskunde I	4	2003	3
1053188	ALINCK I	151082	Wiskunde II	8	2003	4
1053188	ALINCK I	151120	Wiskunde I	5	2003	4
1053188	ALINCK I	151200	Calculus A	4	2003	3
1053188	ALINCK I	152006	Lineaire structuren	8	2003	4
1053188	ALINCK I	152028	Analyse A	4	2003	4
1053188	ALINCK I	152051	Voortgezette grafentheorie	6	2003	3
1053188	ALINCK I	152056	Combinatoriek	4	2003	4
1053188	ALINCK I	152110	Calculus II	6	2003	3
1053188	ALINCK I	153004	Statistiek I	8	2003	3
1053188	ALINCK I	153006	Kansrekening	9	2003	3
1053188	ALINCK I	153082	Stochastische simulatie	7	2003	3
1053188	ALINCK I	153086	Telecommunicatiesystemen	7	2003	4
1053188	ALINCK I	153086	Telecommunicatiesystemen	9	2003	1
1053188	ALINCK I	153087	Wachttijdtheorie	5	2003	3
1053188	ALINCK I	153088	Stochastische modellen voor Operations Management	6	2003	3
1053188	ALINCK I	156012	Gewone differentiaalvergelijkingen	7	2003	3
1053188	ALINCK I	157009	Tijdreeksenanalyse en identificatietheorie	4	2003	3
1053188	ALINCK I	157016	Stochastische filter- en besturingstheorie	6	2003	3
1053188	ALINCK I	157035	Financial Econometrics	7	2003	3
1053188	ALINCK I	158042	Modelbouw in de optimalisatie	4	2003	4
1053188	ALINCK I	211022	Programmeren in C++	1	2003	3
1053188	ALINCK I	211024	Programmeren in C++	7	2003	4
1053188	ALINCK I	211038	Spraak- en taaltechnologie	7	2003	1
1053188	ALINCK I	211078	Database-ontwerp	8	2003	4
1053188	ALINCK I	211096	XML & Databases	9	2003	1
1053188	ALINCK I	213001	Basisbegrippen digitale techniek	6	2002	3
1053188	ALINCK I	213005	Computerarchitectuur	4	2003	4
1053188	ALINCK I	213013	Real-time embedded systemen	7	2003	3
1053188	ALINCK I	213125	Computersystemen	7	2003	4
1053188	ALINCK I	213510	Software Engineering Modellen	8	2003	4
1053188	ALINCK I	213540	Advanced Design of Software Architectures	3	2003	3
1053188	ALINCK I	217001	Testtechnieken	5	2003	3
1053188	ALINCK I	219801	Hypermedia structuren en systemen	5	2003	4
1053188	ALINCK I	219803	Neurale netwerken	1	2003	4
1053188	ALINCK I	232012	Information retrieval en kennisbeheer	8	2003	3
1053188	ALINCK I	232020	Data warehousing & data mining	6	2003	4
1053188	ALINCK I	232060	Multi-agent systemen	4	2003	4
1053188	ALINCK I	232085	Voortgezette Requirements Engineering	9	2003	4
1053188	ALINCK I	233030	Specificeren van informatiesystemen	8	2003	3
1053188	ALINCK I	233030	Specificeren van informatiesystemen	8	2003	1
1053188	ALINCK I	234020	Ontwerpen van mens-machine interactie	9	2003	4
1053188	ALINCK I	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1059930	PET V	156029	Analyse C	6	2003	3
1053188	ALINCK I	236002	Beheer van ICT voorzieningen	8	2003	3
1053188	ALINCK I	237201	Oriëntatie ICT	5	2002	3
1053188	ALINCK I	239801	BIT-BV 2	9	2003	4
1053188	ALINCK I	239981	Integratieproject	9	2000	4
1053188	ALINCK I	239981	Integratieproject	2	2003	3
1053188	ALINCK I	239981	Integratieproject	7	1999	1
1053188	ALINCK I	261000	Telematicasystemen en toepassingen	5	2003	2
1053534	DE JONG Y	121001	Elektronische basisschakelingen	6	2003	4
1053534	DE JONG Y	121017	D1-project	7	2003	4
1053534	DE JONG Y	121021	Inleiding in de biomedische technologie	4	2003	2
1053534	DE JONG Y	121026	Hands-on dig.image proces. and graphical pres.	9	2003	1
1053534	DE JONG Y	121038	Elektronica voor industrieel ontwerpers	7	2003	4
1053534	DE JONG Y	121041	Elektrodynamica	6	2003	2
1053534	DE JONG Y	121042	Meettechniek	2	2003	3
1053534	DE JONG Y	121044	Regeltechniek	6	2003	2
1053534	DE JONG Y	121051	Informatie Opslag	8	2003	3
1053534	DE JONG Y	121054	Neurotechnologie	3	2003	4
1053534	DE JONG Y	121068	Signaaltheorie	4	2003	3
1053534	DE JONG Y	121713	VLSI system design	6	2003	4
1053534	DE JONG Y	121717	Advanced semiconductor devices	3	2003	3
1053534	DE JONG Y	122230	Integrated circuits and systems for mixed signals	8	2003	2
1053534	DE JONG Y	122634	Real-time software development	7	2003	3
1053534	DE JONG Y	122733	VLSI signal processing	6	2003	4
1053534	DE JONG Y	122814	Elektromagnetisme II voor HBO	2	2003	4
1053534	DE JONG Y	122828	Practicum realiseren in materialen	2	2003	1
1053534	DE JONG Y	124151	Mechatronica	8	2003	4
1053534	DE JONG Y	124163	Mechatronische meetsystemen	6	2003	4
1053534	DE JONG Y	124177	Inleiding elektrische energietechniek	6	2002	4
1053534	DE JONG Y	125113	Analoge communicatietechniek	4	2003	4
1053534	DE JONG Y	125118	Practicum informatie-overdracht	9	2003	3
1053534	DE JONG Y	125151	Schakel- en controlesystemen v. Multi-service netw	7	2003	1
1053534	DE JONG Y	125152	Glasvezelcommunicatie	8	2003	3
1053534	DE JONG Y	129347	Deelname aan een project	9	2003	4
1053534	DE JONG Y	129351	Fysiologie II	9	2003	3
1053534	DE JONG Y	129356	Verrichten van experimenteel werk	8	2003	3
1053534	DE JONG Y	150526	Wiskundig modelleren I	8	2003	3
1053534	DE JONG Y	150528	Wiskundig modelleren III	6	2003	3
1053534	DE JONG Y	150529	Wiskundig modelleren IV	7	2003	4
1053534	DE JONG Y	150620	Systems and signals	8	2003	3
1053534	DE JONG Y	150910	Advanced modelling	5	2003	4
1053534	DE JONG Y	151014	Analyse A	7	2003	3
1053534	DE JONG Y	151015	Numerieke lineaire algebra	8	2003	3
1053534	DE JONG Y	151051	Fundamentele analyse I	6	2003	1
1053534	DE JONG Y	151072	Wiskunde II	2	2003	4
1053534	DE JONG Y	151083	Wiskunde III	7	2003	3
1053534	DE JONG Y	151600	Modelleren en redeneren	7	2003	4
1053534	DE JONG Y	152027	Calculus II	1	2003	3
1053534	DE JONG Y	152028	Analyse A	5	2003	4
1053534	DE JONG Y	152068	Discrete wiskunde	5	2003	2
1053534	DE JONG Y	152075	Grafentheorie	4	2003	3
1053534	DE JONG Y	153004	Statistiek I	6	2003	3
1053534	DE JONG Y	153038	Wiskundige statistiek	4	2003	4
1053534	DE JONG Y	153039	Kansrekening en statistiek	9	2003	3
1053534	DE JONG Y	153065	Markov ketens	8	2003	4
1053534	DE JONG Y	153080	Stochastische modellen in de operationele research	4	2003	4
1053534	DE JONG Y	153086	Telecommunicatiesystemen	7	2003	4
1053534	DE JONG Y	153100	Statistiek	6	2003	3
1053534	DE JONG Y	153135	Statistical techniques	7	2003	4
1053534	DE JONG Y	154023	Numerieke wiskunde en programmeermethoden	7	2003	1
1053534	DE JONG Y	155010	Part. differentiaalverg. uit de math. fysica	2	2003	4
1053534	DE JONG Y	156012	Gewone differentiaalvergelijkingen	8	2003	3
1053534	DE JONG Y	156080	Signalen en transformaties	9	2003	3
1053534	DE JONG Y	158018	Operationele research I, practicum	7	2003	4
1053534	DE JONG Y	158070	Grafentheorie en operationele research	7	2003	1
1053534	DE JONG Y	159928	Doctoraalstage	9	2003	3
1053534	DE JONG Y	211038	Spraak- en taaltechnologie	4	2001	3
1053534	DE JONG Y	211038	Spraak- en taaltechnologie	1	2003	1
1053534	DE JONG Y	211045	Besturingssystemen	5	2003	3
1053534	DE JONG Y	211081	Distributed E-business Techniques	9	2003	3
1053534	DE JONG Y	211131	Statische Objectanalyse en Typering	9	2003	4
1053534	DE JONG Y	211185	Taal- en rekenmodellen	6	2003	1
1053534	DE JONG Y	211205	Functioneel programmeren	8	2003	4
1053534	DE JONG Y	213011	Gedistribueerde systemen	1	2003	4
1053534	DE JONG Y	213016	Bijzondere onderwerpen computerarchitectuur	8	2003	3
1053534	DE JONG Y	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2001	3
1053534	DE JONG Y	214510	MMI-project	9	2003	3
1053534	DE JONG Y	232020	Data warehousing & data mining	3	2002	3
1053534	DE JONG Y	234001	Productie-informatietechnologie	6	2003	3
1053534	DE JONG Y	234026	Voortgezette informatiesysteemmodellering	6	2003	4
1055221	JORNA L	154021	Numerieke wiskunde en programmeermethoden	6	2003	3
1055221	JORNA L	156062	Systeem- en besturingstheorie	5	2003	4
1055221	JORNA L	156067	Robust Control	9	2003	4
1055221	JORNA L	158022	Operationele research III	9	2003	3
1055221	JORNA L	159927	Doctoraalstage	5	2003	4
1059930	PET V	211038	Spraak- en taaltechnologie	8	2002	1
1055221	JORNA L	211022	Programmeren in C++	4	2003	3
1055221	JORNA L	211108	Bijzondere onderwerpen uit de logica	4	2003	4
1055221	JORNA L	211123	Component- en aspect georienteerd progammeren	5	2003	1
1055221	JORNA L	211130	Ubiquitous Computing	2	2003	3
1055221	JORNA L	211185	Taal- en rekenmodellen	9	2003	1
1055221	JORNA L	213510	Software Engineering Modellen	4	2003	4
1055221	JORNA L	213530	Concurrent and distributed programming	5	2002	4
1055221	JORNA L	213540	Advanced Design of Software Architectures	6	2003	3
1055221	JORNA L	213540	Advanced Design of Software Architectures	3	2003	1
1055221	JORNA L	214511	Database Project	2	2003	3
1055221	JORNA L	214513	Internet & Web Architecturen	1	2003	4
1055221	JORNA L	214513	Internet & Web Architecturen	6	2002	2
1055221	JORNA L	217001	Testtechnieken	9	2003	3
1055221	JORNA L	219801	Hypermedia structuren en systemen	9	2003	4
1055221	JORNA L	232016	Prestatie-analyse van informatiesystemen	5	2003	2
1055221	JORNA L	232055	XML-technologie in E-Commerce	4	2003	1
1055221	JORNA L	233030	Specificeren van informatiesystemen	8	2003	3
1055221	JORNA L	237201	Oriëntatie ICT	7	2003	4
1055221	JORNA L	237400	BedrijfsProces Ondersteuning	4	2003	1
1055221	JORNA L	265100	Ontwerpen van telematicasystemen	1	2002	4
1055221	JORNA L	265200	Implementatie van telematicasystemen	4	2003	1
1056249	NIJHUIS W	121003	Elektronische functies	6	2003	2
1056249	NIJHUIS W	121007	Elektromagnetische Veldtheorie	7	2003	1
1056249	NIJHUIS W	121008	Practicum Elektromagnetische Veldtheorie	5	2002	1
1056249	NIJHUIS W	121034	Fysische modelvorming van embedded systemen	8	2003	4
1056249	NIJHUIS W	121035	Mid P-project	8	2003	3
1056249	NIJHUIS W	121035	Mid P-project	5	2003	1
1056249	NIJHUIS W	121038	Elektronica voor industrieel ontwerpers	6	2003	4
1056249	NIJHUIS W	121706	Halfgeleiderdevices	6	2003	1
1056249	NIJHUIS W	121714	I.C. technologie	7	2003	4
1056249	NIJHUIS W	122733	VLSI signal processing	8	2003	4
1056249	NIJHUIS W	122821	Microtechnologie t.b.v. transducenten	8	2003	3
1056249	NIJHUIS W	122828	Practicum realiseren in materialen	8	2003	3
1056249	NIJHUIS W	122831	Geintegreerde optica	9	2003	2
1056249	NIJHUIS W	124151	Mechatronica	6	2003	2
1056249	NIJHUIS W	124177	Inleiding elektrische energietechniek	2	2003	1
1056249	NIJHUIS W	127117	Biomechatronica	7	2001	3
1056249	NIJHUIS W	129344	Literatuuronderzoek	1	2003	3
1056249	NIJHUIS W	129362	Start P-project	4	2003	3
1056249	NIJHUIS W	129367	Individual project	6	2003	3
1056249	NIJHUIS W	150528	Wiskundig modelleren III	7	2003	3
1056249	NIJHUIS W	150529	Wiskundig modelleren IV	6	2003	1
1056249	NIJHUIS W	150620	Systems and signals	6	2003	3
1056249	NIJHUIS W	151004	Calculus II-A	5	2003	4
1056249	NIJHUIS W	151019	Analyse B	5	2003	4
1056249	NIJHUIS W	151025	Functionaalanalyse II	4	2003	3
1056249	NIJHUIS W	151039	Algebra	6	2003	4
1056249	NIJHUIS W	151080	Bijscholing wiskunde B2	9	2003	3
1056249	NIJHUIS W	151091	Modelvorming I	9	2003	1
1056249	NIJHUIS W	151092	Modelvorming II	9	2003	4
1056249	NIJHUIS W	151210	Wiskunde A	5	2003	4
1056249	NIJHUIS W	151215	Wiskunde B	5	2003	4
1056249	NIJHUIS W	151250	Modellen en systemen	7	2003	4
1056249	NIJHUIS W	151560	Introduction to Investment Theory	5	2003	4
1056249	NIJHUIS W	151600	Modelleren en redeneren	6	2003	4
1056249	NIJHUIS W	152027	Calculus II	3	2003	2
1056249	NIJHUIS W	153002	Discrete kansrekening	8	2003	3
1056249	NIJHUIS W	153023	Statistiek II voor TBK	4	2003	3
1056249	NIJHUIS W	153031	Statistiek	9	2003	3
1056249	NIJHUIS W	153055	Parametervrije statistische methoden	6	2003	3
1056249	NIJHUIS W	153081	Stochastische modellen v. telecommunicatie syst.	4	2003	2
1056249	NIJHUIS W	153086	Telecommunicatiesystemen	5	2003	4
1056249	NIJHUIS W	153088	Stochastische modellen voor Operations Management	1	2003	3
1056249	NIJHUIS W	153110	Inleiding statistiek	1	2003	3
1056249	NIJHUIS W	156014	Analyse B	4	2003	4
1056249	NIJHUIS W	156056	Inleiding wiskundige systeemtheorie	7	2003	4
1056249	NIJHUIS W	156062	Systeem- en besturingstheorie	5	2003	4
1056249	NIJHUIS W	158022	Operationele research III	4	2003	3
1056249	NIJHUIS W	158070	Grafentheorie en operationele research	4	2003	3
1056249	NIJHUIS W	158075	Deterministische modellen in de OR	1	2003	1
1056249	NIJHUIS W	211017	Inleiding programmeren met JAVA	5	2003	3
1056249	NIJHUIS W	211033	Neurale netwerken en neuro-computing	9	2003	3
1056249	NIJHUIS W	211034	Spraaktechnologie	7	2003	3
1056249	NIJHUIS W	211038	Spraak- en taaltechnologie	6	2003	4
1056249	NIJHUIS W	211038	Spraak- en taaltechnologie	4	2003	1
1056249	NIJHUIS W	211047	Besturingssystemen voor Telematica	1	2003	4
1056249	NIJHUIS W	211054	Computersystemen	7	2003	2
1056249	NIJHUIS W	211095	Gedistribueerde databases & middleware technologie	1	2003	4
1056249	NIJHUIS W	211108	Bijzondere onderwerpen uit de logica	7	2003	4
1056249	NIJHUIS W	211130	Ubiquitous Computing	4	2003	2
1056249	NIJHUIS W	212018	Kennistechnologie voor bedrijfskundige toep.	8	2003	4
1056249	NIJHUIS W	213005	Computerarchitectuur	2	2003	4
1056249	NIJHUIS W	213011	Gedistribueerde systemen	7	2003	2
1056249	NIJHUIS W	213016	Bijzondere onderwerpen computerarchitectuur	9	2003	3
1056249	NIJHUIS W	213505	Programmeren 2	7	2003	4
1056249	NIJHUIS W	213530	Concurrent and distributed programming	3	2003	2
1056249	NIJHUIS W	214010	Complexiteit van berekeningen	6	2003	3
1056249	NIJHUIS W	214025	Algoritmen,datastructuren en complexiteit plus	5	2003	4
1056249	NIJHUIS W	214510	MMI-project	9	2003	3
1056249	NIJHUIS W	219803	Neurale netwerken	1	2003	4
1056249	NIJHUIS W	232050	Electronic Commerce	4	2003	2
1056249	NIJHUIS W	237400	BedrijfsProces Ondersteuning	9	2003	3
1056249	NIJHUIS W	239981	Integratieproject	8	2001	2
1056249	NIJHUIS W	262000	Telematicanetwerken	7	2003	4
1056249	NIJHUIS W	262020	Bijzondere onderwerpen Telematica	6	2003	1
1057321	BARUCH I K	121002	Practicum elektronische basisschakelingen	4	2003	3
1057321	BARUCH I K	121005	Netwerkanalyse	4	2003	3
1057321	BARUCH I K	121022	Neurofysiologie	8	2003	4
1057321	BARUCH I K	121026	Hands-on dig.image proces. and graphical pres.	9	2002	3
1057321	BARUCH I K	121041	Elektrodynamica	8	2003	4
1057321	BARUCH I K	121043	Dynamische systemen	5	2003	2
1057321	BARUCH I K	121045	Project Mechatronica	5	2002	4
1057321	BARUCH I K	121057	Bio-elektriciteit	9	2003	2
1057321	BARUCH I K	121062	Eind P-project	6	2003	4
1057321	BARUCH I K	121709	Reliability Engineering	9	2003	4
1057321	BARUCH I K	122227	Voortgezette analoge IC elektronica	3	2003	4
1057321	BARUCH I K	122711	Digitale meetsystemen	5	2003	4
1057321	BARUCH I K	122729	Image processing	4	2003	4
1057321	BARUCH I K	122733	VLSI signal processing	4	2003	4
1057321	BARUCH I K	122816	Mechanica en transductietechniek	3	2003	4
1057321	BARUCH I K	122816	Mechanica en transductietechniek	5	2003	2
1057321	BARUCH I K	122828	Practicum realiseren in materialen	6	2003	1
1057321	BARUCH I K	122831	Geintegreerde optica	1	2003	2
1057321	BARUCH I K	123152	Signal processing in acoustics and audio	5	2003	1
1057321	BARUCH I K	124151	Mechatronica	5	2003	2
1057321	BARUCH I K	124177	Inleiding elektrische energietechniek	9	2002	1
1057321	BARUCH I K	125118	Practicum informatie-overdracht	7	2003	2
1057321	BARUCH I K	125156	Transmissiemedia- en systemen	6	2003	4
1057321	BARUCH I K	129351	Fysiologie II	9	2003	1
1057321	BARUCH I K	150500	Presentatie van een wiskundig onderwerp	7	2003	1
1057321	BARUCH I K	151012	Calculus I	5	2003	4
1057321	BARUCH I K	151018	Analyse A	3	2003	3
1057321	BARUCH I K	151024	Lineaire analyse	7	2003	4
1057321	BARUCH I K	151025	Functionaalanalyse II	1	2003	3
1057321	BARUCH I K	151033	Numerieke analyse	6	2003	3
1057321	BARUCH I K	151043	Seminarium mathematische fysica	6	2003	4
1057321	BARUCH I K	151051	Fundamentele analyse I	6	2003	3
1057321	BARUCH I K	151052	Fundamentele analyse II	6	2003	3
1057321	BARUCH I K	151080	Bijscholing wiskunde B2	2	2003	3
1057321	BARUCH I K	151083	Wiskunde III	5	2003	3
1057321	BARUCH I K	151086	Vectoranalyse voor BMT	6	2003	3
1057321	BARUCH I K	151092	Modelvorming II	5	2003	4
1057321	BARUCH I K	151202	Calculus B	9	2003	3
1057321	BARUCH I K	152066	Capita selecta analyse	3	2003	3
1057321	BARUCH I K	152100	Calculus I	9	2003	4
1057321	BARUCH I K	153003	Kansrekening	7	2003	3
1057321	BARUCH I K	153032	Kansrekening en stochastische processen	9	2003	4
1057321	BARUCH I K	153034	Kansrekening en statistiek	4	2003	3
1057321	BARUCH I K	153038	Wiskundige statistiek	4	2003	4
1057321	BARUCH I K	153041	Inleiding statistiek	8	2003	1
1057321	BARUCH I K	153086	Telecommunicatiesystemen	7	2003	4
1057321	BARUCH I K	154021	Numerieke wiskunde en programmeermethoden	6	2003	1
1057321	BARUCH I K	155010	Part. differentiaalverg. uit de math. fysica	9	2003	4
1057321	BARUCH I K	155015	Part.diff.verg.: Numerieke oplossingsmethoden I	1	2003	4
1057321	BARUCH I K	155019	Practicum softwarepakketten PDV	8	2003	3
1057321	BARUCH I K	156062	Systeem- en besturingstheorie	4	2003	4
1057321	BARUCH I K	157016	Stochastische filter- en besturingstheorie	9	2003	3
1057321	BARUCH I K	158022	Operationele research III	6	2003	3
1057321	BARUCH I K	158075	Deterministische modellen in de OR	5	2002	4
1057321	BARUCH I K	158075	Deterministische modellen in de OR	5	2003	4
1057321	BARUCH I K	158075	Deterministische modellen in de OR	9	2003	1
1057321	BARUCH I K	211027	Inleiding programmeren met MATLAB	9	2003	3
1057321	BARUCH I K	211035	Vertalerbouw	6	2003	4
1057321	BARUCH I K	211038	Spraak- en taaltechnologie	6	2003	4
1057321	BARUCH I K	211095	Gedistribueerde databases & middleware technologie	6	2003	4
1057321	BARUCH I K	211096	XML & Databases	6	2003	1
1057321	BARUCH I K	211098	Databasetransacties en -processen	9	2003	3
1057321	BARUCH I K	211108	Bijzondere onderwerpen uit de logica	2	2003	4
1057321	BARUCH I K	211111	Parallelle processen	9	2003	3
1057321	BARUCH I K	211129	Taaltechnologie	9	2003	4
1057321	BARUCH I K	211133	Ontwerpen van Software Architecturen	8	2003	3
1057321	BARUCH I K	213001	Basisbegrippen digitale techniek	5	2003	4
1057321	BARUCH I K	213002	Ontwerpen van digitale systemen	6	2003	4
1057321	BARUCH I K	213009	Fouten tolererende digitale systemen	6	2003	4
1057321	BARUCH I K	213130	Computer Organisatie INF/TEL	4	2003	2
1057321	BARUCH I K	213505	Programmeren 2	8	2003	1
1057321	BARUCH I K	213510	Software Engineering Modellen	1	2003	4
1057321	BARUCH I K	213540	Advanced Design of Software Architectures	6	2002	4
1057321	BARUCH I K	214030	Artificial Intelligence	8	2003	4
1057321	BARUCH I K	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2003	3
1057321	BARUCH I K	214501	Communicatie & ontwerpen in ICT-projecten 2	7	2003	3
1057321	BARUCH I K	214510	MMI-project	2	2003	3
1057321	BARUCH I K	214513	Internet & Web Architecturen	4	2003	4
1057321	BARUCH I K	214515	Codesign project	6	2003	3
1057321	BARUCH I K	232011	Architectuur van informatiesystemen	6	2003	4
1057321	BARUCH I K	237201	Oriëntatie ICT	9	2002	3
1057321	BARUCH I K	237600	Business Case Development for IT-projects	5	2003	3
1057321	BARUCH I K	239805	BIT-BV	7	2003	4
1057321	BARUCH I K	239981	Integratieproject	4	1998	3
1057321	BARUCH I K	239981	Integratieproject	7	2002	3
1057321	BARUCH I K	262020	Bijzondere onderwerpen Telematica	2	2003	1
1057321	BARUCH I K	263200	Gedistribueerde multimedia database systemen	4	2003	4
1057321	BARUCH I K	265100	Ontwerpen van telematicasystemen	4	2003	1
1057321	BARUCH I K	265201	Middleware for distributed objects	4	2002	4
1057321	BARUCH I K	269004	Refresher Logics, Probability,Databases and JAVA	8	2003	1
1057629	TUSVELT M	121002	Practicum elektronische basisschakelingen	3	2003	3
1057629	TUSVELT M	121005	Netwerkanalyse	9	2003	1
1057629	TUSVELT M	121007	Elektromagnetische Veldtheorie	7	2003	1
1057629	TUSVELT M	121021	Inleiding in de biomedische technologie	5	2003	2
1057629	TUSVELT M	121022	Neurofysiologie	3	2003	4
1057629	TUSVELT M	121026	Hands-on dig.image proces. and graphical pres.	7	2003	1
1057629	TUSVELT M	121043	Dynamische systemen	6	2003	4
1057629	TUSVELT M	121051	Informatie Opslag	8	2003	3
1057629	TUSVELT M	121057	Bio-elektriciteit	6	2003	4
1057629	TUSVELT M	121062	Eind P-project	9	2003	4
1057629	TUSVELT M	121706	Halfgeleiderdevices	7	2003	1
1057629	TUSVELT M	121714	I.C. technologie	9	2003	4
1057629	TUSVELT M	121714	I.C. technologie	8	2003	2
1057629	TUSVELT M	122634	Real-time software development	5	2003	3
1057629	TUSVELT M	122740	Netwerkanalyse voor TEL	8	2003	3
1057629	TUSVELT M	122816	Mechanica en transductietechniek	9	2003	4
1057629	TUSVELT M	124151	Mechatronica	4	2003	2
1057629	TUSVELT M	124177	Inleiding elektrische energietechniek	7	2002	4
1057629	TUSVELT M	124177	Inleiding elektrische energietechniek	7	2003	3
1057629	TUSVELT M	125156	Transmissiemedia- en systemen	4	2003	4
1057629	TUSVELT M	125160	Mobiele communicatie	9	2003	3
1057629	TUSVELT M	127117	Biomechatronica	1	2002	2
1057629	TUSVELT M	129346	Verrichten van experimenteel werk	4	2003	4
1057629	TUSVELT M	129367	Individual project	2	2003	2
1057629	TUSVELT M	150529	Wiskundig modelleren IV	8	2003	4
1057629	TUSVELT M	150810	Modelling project	9	2003	3
1057629	TUSVELT M	150910	Advanced modelling	4	2003	4
1057629	TUSVELT M	151005	Calculus II-B	8	2003	3
1057629	TUSVELT M	151019	Analyse B	5	2003	4
1057629	TUSVELT M	151024	Lineaire analyse	5	2003	4
1057629	TUSVELT M	151039	Algebra	6	2003	4
1057629	TUSVELT M	151080	Bijscholing wiskunde B2	6	2003	3
1057629	TUSVELT M	151082	Wiskunde II	2	2003	4
1057629	TUSVELT M	151092	Modelvorming II	4	2003	2
1057629	TUSVELT M	151204	Calculus C	9	2003	4
1057629	TUSVELT M	151210	Wiskunde A	5	2003	4
1057629	TUSVELT M	151560	Introduction to Investment Theory	4	2003	4
1057629	TUSVELT M	152025	Complexe functietheorie	6	2003	3
1057629	TUSVELT M	152110	Calculus II	5	2003	3
1057629	TUSVELT M	155019	Practicum softwarepakketten PDV	5	2003	3
1057629	TUSVELT M	211032	Seminarium Taal, Kennis & Interactie	6	2002	3
1057629	TUSVELT M	211037	Graphics & Virtual Reality	9	2003	3
1057629	TUSVELT M	211038	Spraak- en taaltechnologie	9	2002	3
1057629	TUSVELT M	211090	Databasetoepassingen	9	2003	4
1057629	TUSVELT M	213002	Ontwerpen van digitale systemen	9	2003	4
1057629	TUSVELT M	213012	Hardware/software co-design	8	2003	4
1057629	TUSVELT M	213016	Bijzondere onderwerpen computerarchitectuur	7	2003	3
1057629	TUSVELT M	213500	Programmeren 1	5	2003	4
1057629	TUSVELT M	214020	Algoritmen,datastructuren en complexiteit	1	2003	4
1057629	TUSVELT M	214025	Algoritmen,datastructuren en complexiteit plus	4	2003	4
1057629	TUSVELT M	214510	MMI-project	3	2003	3
1057629	TUSVELT M	214513	Internet & Web Architecturen	7	2002	4
1057629	TUSVELT M	214513	Internet & Web Architecturen	6	2002	2
1057629	TUSVELT M	232050	Electronic Commerce	5	2003	4
1057629	TUSVELT M	232055	XML-technologie in E-Commerce	7	2003	4
1057629	TUSVELT M	235005	Inleiding bedrijfsinformatiesystemen	9	2003	3
1057629	TUSVELT M	239981	Integratieproject	3	1999	3
1057629	TUSVELT M	261000	Telematicasystemen en toepassingen	9	2003	3
1057629	TUSVELT M	261010	Computer netwerken	8	2003	1
1057629	TUSVELT M	265201	Middleware for distributed objects	8	2002	4
1057708	BANDTSMA K	213012	Hardware/software co-design	9	2003	4
1057708	BANDTSMA K	213120	Inleiding informatie- en communicatietechnologie	5	2003	2
1057708	BANDTSMA K	213530	Concurrent and distributed programming	4	2003	2
1057708	BANDTSMA K	213545	Advanced Design of Software Architectures 2	3	2003	3
1057708	BANDTSMA K	214030	Artificial Intelligence	4	2002	3
1057708	BANDTSMA K	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2001	3
1057708	BANDTSMA K	217001	Testtechnieken	9	2003	3
1057708	BANDTSMA K	219910	Ontwerpproject	5	2003	3
1057708	BANDTSMA K	232016	Prestatie-analyse van informatiesystemen	2	2003	2
1057708	BANDTSMA K	234007	Systemen voor cooperatief werk	6	2003	4
1057708	BANDTSMA K	234010	Invoering van IT in organisaties	7	2002	4
1057708	BANDTSMA K	234010	Invoering van IT in organisaties	4	2003	4
1057708	BANDTSMA K	234010	Invoering van IT in organisaties	4	2003	2
1057708	BANDTSMA K	234020	Ontwerpen van mens-machine interactie	9	2003	4
1057708	BANDTSMA K	237201	Oriëntatie ICT	7	2002	2
1057708	BANDTSMA K	237400	BedrijfsProces Ondersteuning	1	2003	3
1057708	BANDTSMA K	237600	Business Case Development for IT-projects	8	2003	1
1057708	BANDTSMA K	239800	BIT-BV 1	8	2003	4
1057708	BANDTSMA K	239981	Integratieproject	1	1998	3
1057708	BANDTSMA K	239981	Integratieproject	8	1999	1
1057708	BANDTSMA K	239981	Integratieproject	4	2003	2
1057708	BANDTSMA K	262020	Bijzondere onderwerpen Telematica	8	2003	1
1057708	BANDTSMA K	265100	Ontwerpen van telematicasystemen	7	2002	4
1057708	BANDTSMA K	265201	Middleware for distributed objects	4	2003	3
1057708	BANDTSMA K	265300	Operationeel management van telematicasystemen	1	2003	3
1057708	BANDTSMA K	269100	P-project TEL	9	2003	2
1058930	GOOZEN A	125152	Glasvezelcommunicatie	4	2003	3
1058930	GOOZEN A	125152	Glasvezelcommunicatie	1	2003	2
1058930	GOOZEN A	125156	Transmissiemedia- en systemen	7	2003	4
1058930	GOOZEN A	125159	Optische communicatienetwerken	4	2003	4
1058930	GOOZEN A	127117	Biomechatronica	9	2002	3
1058930	GOOZEN A	129351	Fysiologie II	5	2003	3
1058930	GOOZEN A	129362	Start P-project	8	2003	3
1058930	GOOZEN A	129367	Individual project	1	2003	3
1058930	GOOZEN A	150528	Wiskundig modelleren III	6	2003	3
1058930	GOOZEN A	150810	Modelling project	5	2003	3
1058930	GOOZEN A	151014	Analyse A	4	2003	3
1058930	GOOZEN A	151024	Lineaire analyse	7	2003	4
1058930	GOOZEN A	151052	Fundamentele analyse II	5	2003	3
1058930	GOOZEN A	151088	Practicum Wiskundig modelleren	6	2003	4
1058930	GOOZEN A	151092	Modelvorming II	5	2003	2
1058930	GOOZEN A	151120	Wiskunde I	8	2003	4
1058930	GOOZEN A	151202	Calculus B	4	2003	3
1058930	GOOZEN A	151208	Lineaire Algebra B	2	2003	3
1058930	GOOZEN A	151530	Continuous Time Finance	6	2003	4
1058930	GOOZEN A	152027	Calculus II	5	2003	3
1058930	GOOZEN A	152027	Calculus II	5	2003	2
1058930	GOOZEN A	152038	Grafentheorie	1	2003	3
1058930	GOOZEN A	152068	Discrete wiskunde	5	2003	3
1058930	GOOZEN A	152068	Discrete wiskunde	3	2003	2
1058930	GOOZEN A	152120	Lineaire algebra	5	2003	4
1058930	GOOZEN A	152150	Wiskundig modelleren I	9	2003	4
1058930	GOOZEN A	153003	Kansrekening	7	2003	3
1058930	GOOZEN A	153036	Statistiek II	2	2003	4
1058930	GOOZEN A	153038	Wiskundige statistiek	1	2003	4
1058930	GOOZEN A	153039	Kansrekening en statistiek	4	2003	3
1058930	GOOZEN A	153041	Inleiding statistiek	2	2003	1
1058930	GOOZEN A	153045	Lineaire statistische modellen	7	2003	4
1058930	GOOZEN A	153086	Telecommunicatiesystemen	9	2003	1
1058930	GOOZEN A	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	8	2003	3
1058930	GOOZEN A	157009	Tijdreeksenanalyse en identificatietheorie	8	2003	3
1058930	GOOZEN A	157030	Structured Products	9	2003	3
1058930	GOOZEN A	158070	Grafentheorie en operationele research	7	2003	1
1058930	GOOZEN A	158075	Deterministische modellen in de OR	8	2003	1
1058930	GOOZEN A	159960	Multidisciplinaire ontwerpopdracht	4	2003	3
1058930	GOOZEN A	211032	Seminarium Taal, Kennis & Interactie	9	2003	1
1058930	GOOZEN A	211035	Vertalerbouw	2	2003	4
1058930	GOOZEN A	211038	Spraak- en taaltechnologie	5	2001	3
1058930	GOOZEN A	211045	Besturingssystemen	5	2003	3
1058930	GOOZEN A	211047	Besturingssystemen voor Telematica	1	2003	4
1058930	GOOZEN A	211109	Voortgezette logica	5	2003	3
1058930	GOOZEN A	211133	Ontwerpen van Software Architecturen	7	2003	3
1058930	GOOZEN A	212010	Informatiesystemen	8	2003	3
1058930	GOOZEN A	213005	Computerarchitectuur	9	2003	4
1058930	GOOZEN A	213016	Bijzondere onderwerpen computerarchitectuur	9	2003	3
1058930	GOOZEN A	213125	Computersystemen	5	2003	4
1058930	GOOZEN A	213520	Formele Methoden voor Software Engineering	9	2003	4
1058930	GOOZEN A	213530	Concurrent and distributed programming	8	2002	4
1058930	GOOZEN A	213540	Advanced Design of Software Architectures	9	2003	1
1058930	GOOZEN A	214030	Artificial Intelligence	1	2003	2
1058930	GOOZEN A	214501	Communicatie & ontwerpen in ICT-projecten 2	8	2003	3
1058930	GOOZEN A	214513	Internet & Web Architecturen	4	2002	4
1058930	GOOZEN A	219910	Ontwerpproject	8	2003	3
1058930	GOOZEN A	233035	Practicum Databases in Informatiesystemen	6	2003	4
1058930	GOOZEN A	233035	Practicum Databases in Informatiesystemen	4	2002	1
1058930	GOOZEN A	234004	Softwaremanagement	9	2003	3
1058930	GOOZEN A	234020	Ontwerpen van mens-machine interactie	6	2003	4
1058930	GOOZEN A	237201	Oriëntatie ICT	6	2003	2
1058930	GOOZEN A	237600	Business Case Development for IT-projects	6	2003	1
1058930	GOOZEN A	239981	Integratieproject	8	2000	1
1058930	GOOZEN A	239981	Integratieproject	6	2001	2
1058930	GOOZEN A	262001	Mobile and wireless networking	4	2003	4
1058930	GOOZEN A	265201	Middleware for distributed objects	7	2002	4
1058930	GOOZEN A	269004	Refresher Logics, Probability,Databases and JAVA	4	2003	1
1059333	ALINCK Q O	121001	Elektronische basisschakelingen	8	2003	2
1059333	ALINCK Q O	121005	Netwerkanalyse	8	2003	3
1059333	ALINCK Q O	121007	Elektromagnetische Veldtheorie	2	2003	3
1059333	ALINCK Q O	121008	Practicum Elektromagnetische Veldtheorie	5	2002	1
1059333	ALINCK Q O	121021	Inleiding in de biomedische technologie	7	2002	2
1059333	ALINCK Q O	121038	Elektronica voor industrieel ontwerpers	8	2003	4
1059333	ALINCK Q O	121039	Biomedische signaal- en systeemanalyse	4	2003	3
1059333	ALINCK Q O	121045	Project Mechatronica	5	2002	4
1059333	ALINCK Q O	121045	Project Mechatronica	4	2003	1
1059333	ALINCK Q O	121060	Optische basisfuncties en microsystemen	7	2003	4
1059333	ALINCK Q O	121062	Eind P-project	8	2003	4
1059333	ALINCK Q O	121709	Reliability Engineering	7	2003	4
1059333	ALINCK Q O	122711	Digitale meetsystemen	6	2003	4
1059333	ALINCK Q O	122815	Materiaalkunde van microsystemen	4	2003	4
1059333	ALINCK Q O	122816	Mechanica en transductietechniek	6	2002	3
1059333	ALINCK Q O	122831	Geintegreerde optica	8	2002	4
1059333	ALINCK Q O	124113	Optimal estimation in dynamic systems	6	2003	3
1059333	ALINCK Q O	124151	Mechatronica	6	2002	4
1059333	ALINCK Q O	124153	Computer-aided design gereedschappen voor VLSI	6	2003	4
1059333	ALINCK Q O	124177	Inleiding elektrische energietechniek	7	2002	4
1059333	ALINCK Q O	125151	Schakel- en controlesystemen v. Multi-service netw	4	2003	3
1059333	ALINCK Q O	125156	Transmissiemedia- en systemen	4	2003	1
1059333	ALINCK Q O	127115	Praktische biomedische signaalanalyse	5	2003	4
1059333	ALINCK Q O	129358	Maken van een scriptie	6	2003	3
1059333	ALINCK Q O	150630	Applied functional analysis	6	2003	4
1059333	ALINCK Q O	150910	Advanced modelling	6	2003	4
1059333	ALINCK Q O	151019	Analyse B	4	2003	4
1059333	ALINCK Q O	151020	Functionaalanalyse I	5	2003	3
1059333	ALINCK Q O	151039	Algebra	4	2003	4
1059333	ALINCK Q O	151081	Wiskunde I	9	2003	3
1059333	ALINCK Q O	151082	Wiskunde II	7	2003	4
1059333	ALINCK Q O	151140	Wiskunde III	8	2003	3
1059333	ALINCK Q O	151150	Wiskunde IV	5	2003	3
1059333	ALINCK Q O	151204	Calculus C	5	2003	4
1059333	ALINCK Q O	151510	Introduction to Risk Theory	7	2003	3
1059333	ALINCK Q O	151540	Computational Methods in Finance	9	2003	4
1059333	ALINCK Q O	152027	Calculus II	6	2003	3
1059333	ALINCK Q O	152030	Tensoranalyse	7	2003	3
1059333	ALINCK Q O	152070	Meetkunde	4	2003	4
1059333	ALINCK Q O	152100	Calculus I	7	2003	4
1059333	ALINCK Q O	153002	Discrete kansrekening	8	2003	3
1059333	ALINCK Q O	153004	Statistiek I	7	2003	3
1059333	ALINCK Q O	153021	Statistiek I voor TBK	6	2003	4
1059333	ALINCK Q O	153039	Kansrekening en statistiek	5	2003	3
1059333	ALINCK Q O	153086	Telecommunicatiesystemen	4	2003	4
1059333	ALINCK Q O	155019	Practicum softwarepakketten PDV	3	2003	3
1059333	ALINCK Q O	156012	Gewone differentiaalvergelijkingen	8	2003	3
1059333	ALINCK Q O	156014	Analyse B	5	2003	4
1059333	ALINCK Q O	156057	Inleiding wiskundige systeemtheorie	9	2003	4
1059333	ALINCK Q O	156066	Besturingstheorie van economische systemen	1	2003	4
1059333	ALINCK Q O	157016	Stochastische filter- en besturingstheorie	8	2003	3
1059333	ALINCK Q O	158038	Discrete optimalisering	3	2003	3
1059333	ALINCK Q O	211024	Programmeren in C++	9	2003	4
1059333	ALINCK Q O	211027	Inleiding programmeren met MATLAB	6	2003	3
1059333	ALINCK Q O	211032	Seminarium Taal, Kennis & Interactie	4	2003	4
1059333	ALINCK Q O	211038	Spraak- en taaltechnologie	5	2002	3
1059333	ALINCK Q O	211038	Spraak- en taaltechnologie	4	2003	1
1059333	ALINCK Q O	211074	Gegevensbanken	9	2003	4
1059333	ALINCK Q O	211090	Databasetoepassingen	3	2003	4
1059333	ALINCK Q O	211095	Gedistribueerde databases & middleware technologie	9	2003	1
1059333	ALINCK Q O	211133	Ontwerpen van Software Architecturen	6	2003	3
1059333	ALINCK Q O	211180	Basismodellen in de informatica	7	2003	2
1059333	ALINCK Q O	211205	Functioneel programmeren	7	2003	4
1059333	ALINCK Q O	212018	Kennistechnologie voor bedrijfskundige toep.	4	2003	2
1059333	ALINCK Q O	213012	Hardware/software co-design	9	2003	2
1059333	ALINCK Q O	213530	Concurrent and distributed programming	7	2003	2
1059333	ALINCK Q O	232012	Information retrieval en kennisbeheer	5	2003	3
1059333	ALINCK Q O	232050	Electronic Commerce	2	2003	2
1059333	ALINCK Q O	232081	Requirements Engineering	5	2003	4
1059333	ALINCK Q O	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1059333	ALINCK Q O	235022	Investeringen in informatietechnologie	5	2003	4
1059333	ALINCK Q O	237600	Business Case Development for IT-projects	9	2003	1
1059333	ALINCK Q O	239801	BIT-BV 2	6	2003	4
1059333	ALINCK Q O	239981	Integratieproject	3	1999	3
1059333	ALINCK Q O	262020	Bijzondere onderwerpen Telematica	3	2003	1
1059333	ALINCK Q O	265110	Protocol Engineering	1	2003	1
1059333	ALINCK Q O	265300	Operationeel management van telematicasystemen	5	2003	3
1059930	PET V	158022	Operationele research III	2	2003	3
1059930	PET V	211032	Seminarium Taal, Kennis & Interactie	8	2003	4
1059930	PET V	211045	Besturingssystemen	8	2003	2
1059930	PET V	211054	Computersystemen	8	2003	2
1059930	PET V	211096	XML & Databases	5	2003	3
1059930	PET V	211096	XML & Databases	4	2003	1
1059930	PET V	211127	Formele analyse van natuurlijke taal	9	2003	4
1059930	PET V	211130	Ubiquitous Computing	6	2003	2
1059930	PET V	211185	Taal- en rekenmodellen	6	2003	4
1059930	PET V	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	4
1059930	PET V	213011	Gedistribueerde systemen	7	2003	4
1059930	PET V	213505	Programmeren 2	2	2003	1
1059930	PET V	213530	Concurrent and distributed programming	3	2002	4
1059930	PET V	214030	Artificial Intelligence	4	2002	3
1059930	PET V	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2003	3
1059930	PET V	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2003	2
1059930	PET V	214511	Database Project	5	2003	3
1059930	PET V	214511	Database Project	1	2003	2
1059930	PET V	219801	Hypermedia structuren en systemen	9	2003	1
1059930	PET V	232016	Prestatie-analyse van informatiesystemen	5	2002	4
1059930	PET V	232055	XML-technologie in E-Commerce	1	2003	1
1059930	PET V	232081	Requirements Engineering	9	2003	4
1059930	PET V	234010	Invoering van IT in organisaties	5	2003	2
1059930	PET V	234026	Voortgezette informatiesysteemmodellering	9	2003	1
1059930	PET V	237201	Oriëntatie ICT	9	2002	3
1059930	PET V	262020	Bijzondere onderwerpen Telematica	4	2003	4
1059930	PET V	265100	Ontwerpen van telematicasystemen	9	2003	3
1059930	PET V	265110	Protocol Engineering	2	2003	3
1059930	PET V	265201	Middleware for distributed objects	5	2002	4
1059930	PET V	265300	Operationeel management van telematicasystemen	6	2003	3
1059930	PET V	266100	Patterns of software development	6	2003	4
1060066	WAARD L R	121002	Practicum elektronische basisschakelingen	4	2003	1
1060066	WAARD L R	121006	Practicum Meetinstrumenten/Netwerkanalyse	7	2003	3
1060066	WAARD L R	121007	Elektromagnetische Veldtheorie	6	2003	1
1060066	WAARD L R	121008	Practicum Elektromagnetische Veldtheorie	7	2002	1
1060066	WAARD L R	121017	D1-project	4	2003	4
1060066	WAARD L R	121021	Inleiding in de biomedische technologie	8	2003	4
1060066	WAARD L R	121041	Elektrodynamica	2	2003	2
1060066	WAARD L R	121044	Regeltechniek	7	2003	4
1060066	WAARD L R	121045	Project Mechatronica	4	2001	4
1060066	WAARD L R	121045	Project Mechatronica	6	2002	4
1060066	WAARD L R	121709	Reliability Engineering	4	2002	4
1060066	WAARD L R	122733	VLSI signal processing	9	2003	2
1060066	WAARD L R	122833	Integratieproject	4	2003	2
1060066	WAARD L R	123112	Moderne modulatie- en detectietechnieken	8	2003	4
1060066	WAARD L R	123152	Signal processing in acoustics and audio	9	2003	3
1060066	WAARD L R	124113	Optimal estimation in dynamic systems	9	2003	3
1060066	WAARD L R	124151	Mechatronica	6	2003	4
1060066	WAARD L R	124163	Mechatronische meetsystemen	1	2003	4
1060066	WAARD L R	124177	Inleiding elektrische energietechniek	1	2003	3
1060066	WAARD L R	125118	Practicum informatie-overdracht	9	2003	3
1060066	WAARD L R	125152	Glasvezelcommunicatie	4	2003	3
1060066	WAARD L R	129351	Fysiologie II	6	2003	3
1060066	WAARD L R	129357	Deelname aan een project	1	2003	4
1060066	WAARD L R	150433	Wiskundig modelleren voor CiT	5	2003	4
1060066	WAARD L R	150526	Wiskundig modelleren I	8	2003	3
1060066	WAARD L R	150528	Wiskundig modelleren III	5	2003	3
1060066	WAARD L R	150529	Wiskundig modelleren IV	1	2003	1
1060066	WAARD L R	150740	Quality control	8	2003	4
1060066	WAARD L R	151005	Calculus II-B	6	2003	3
1060066	WAARD L R	151014	Analyse A	6	2003	3
1060066	WAARD L R	151130	Wiskunde II	9	2003	4
1060066	WAARD L R	151200	Calculus A	2	2003	3
1060066	WAARD L R	151250	Modellen en systemen	4	2003	4
1060066	WAARD L R	151560	Introduction to Investment Theory	8	2003	4
1060066	WAARD L R	152027	Calculus II	5	2003	2
1060066	WAARD L R	152068	Discrete wiskunde	3	2003	2
1060066	WAARD L R	152070	Meetkunde	8	2003	4
1060066	WAARD L R	152120	Lineaire algebra	9	2003	4
1060066	WAARD L R	153002	Discrete kansrekening	7	2003	3
1060066	WAARD L R	153023	Statistiek II voor TBK	4	2003	3
1060066	WAARD L R	153031	Statistiek	6	2003	3
1060066	WAARD L R	153036	Statistiek II	9	2003	4
1060066	WAARD L R	153039	Kansrekening en statistiek	7	2003	3
1060066	WAARD L R	153081	Stochastische modellen v. telecommunicatie syst.	6	2003	3
1060066	WAARD L R	153082	Stochastische simulatie	7	2003	3
1060066	WAARD L R	154023	Numerieke wiskunde en programmeermethoden	6	2003	3
1060066	WAARD L R	155010	Part. differentiaalverg. uit de math. fysica	4	2003	2
1060066	WAARD L R	156014	Analyse B	4	2003	4
1060066	WAARD L R	156068	Niet-lineaire besturingstheorie	3	2003	3
1060066	WAARD L R	158017	Operationele research I	2	2003	4
1060066	WAARD L R	158018	Operationele research I, practicum	9	2003	4
1060066	WAARD L R	158042	Modelbouw in de optimalisatie	8	2003	4
1060066	WAARD L R	158070	Grafentheorie en operationele research	7	2003	1
1060066	WAARD L R	159927	Doctoraalstage	7	2003	4
1060066	WAARD L R	211035	Vertalerbouw	9	2003	4
1060066	WAARD L R	211038	Spraak- en taaltechnologie	2	2001	3
1060066	WAARD L R	211081	Distributed E-business Techniques	5	2003	3
1060066	WAARD L R	211081	Distributed E-business Techniques	4	2003	1
1060066	WAARD L R	211090	Databasetoepassingen	1	2003	4
1060066	WAARD L R	211097	Bijzondere onderwerpen gegevensbanken	7	2003	3
1060066	WAARD L R	211108	Bijzondere onderwerpen uit de logica	7	2003	4
1060066	WAARD L R	211109	Voortgezette logica	8	2003	3
1060066	WAARD L R	211133	Ontwerpen van Software Architecturen	8	2003	3
1060066	WAARD L R	211185	Taal- en rekenmodellen	4	2003	1
1060066	WAARD L R	213011	Gedistribueerde systemen	5	2003	4
1060066	WAARD L R	213012	Hardware/software co-design	7	2003	2
1060066	WAARD L R	214025	Algoritmen,datastructuren en complexiteit plus	8	2003	4
1060066	WAARD L R	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2003	3
1060066	WAARD L R	214513	Internet & Web Architecturen	8	2003	4
1060066	WAARD L R	219910	Ontwerpproject	7	2003	3
1060066	WAARD L R	234010	Invoering van IT in organisaties	8	2003	2
1060066	WAARD L R	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1060066	WAARD L R	237201	Oriëntatie ICT	8	2003	4
1060066	WAARD L R	239981	Integratieproject	7	2001	3
1060066	WAARD L R	239981	Integratieproject	8	2003	2
1060066	WAARD L R	265100	Ontwerpen van telematicasystemen	6	2002	4
1061888	HOFSTRA Y	213005	Computerarchitectuur	8	2003	4
1061888	HOFSTRA Y	213012	Hardware/software co-design	9	2003	4
1061888	HOFSTRA Y	214513	Internet & Web Architecturen	3	2002	2
1061888	HOFSTRA Y	217001	Testtechnieken	8	2003	3
1061888	HOFSTRA Y	232016	Prestatie-analyse van informatiesystemen	9	2003	2
1061888	HOFSTRA Y	232050	Electronic Commerce	4	2002	4
1061888	HOFSTRA Y	232055	XML-technologie in E-Commerce	6	2003	4
1061888	HOFSTRA Y	232055	XML-technologie in E-Commerce	7	2003	1
1061888	HOFSTRA Y	233035	Practicum Databases in Informatiesystemen	4	2003	1
1061888	HOFSTRA Y	234004	Softwaremanagement	5	2003	3
1061888	HOFSTRA Y	234026	Voortgezette informatiesysteemmodellering	6	2003	4
1061888	HOFSTRA Y	237201	Oriëntatie ICT	1	2002	2
1061888	HOFSTRA Y	237400	BedrijfsProces Ondersteuning	9	2003	1
1061888	HOFSTRA Y	239981	Integratieproject	5	2001	2
1061888	HOFSTRA Y	263200	Gedistribueerde multimedia database systemen	9	2003	4
1061888	HOFSTRA Y	265100	Ontwerpen van telematicasystemen	4	2003	1
1064400	HENDRIKS M O	121001	Elektronische basisschakelingen	5	2003	4
1064400	HENDRIKS M O	121004	Practicum elektronische functies	5	2003	2
1064400	HENDRIKS M O	121005	Netwerkanalyse	8	2003	1
1064400	HENDRIKS M O	121007	Elektromagnetische Veldtheorie	5	2002	1
1064400	HENDRIKS M O	121008	Practicum Elektromagnetische Veldtheorie	3	2003	1
1064400	HENDRIKS M O	121021	Inleiding in de biomedische technologie	5	2003	4
1064400	HENDRIKS M O	121026	Hands-on dig.image proces. and graphical pres.	7	2002	3
1064400	HENDRIKS M O	121028	Computer vision	6	2003	4
1064400	HENDRIKS M O	121044	Regeltechniek	1	2003	4
1064400	HENDRIKS M O	121044	Regeltechniek	8	2003	2
1064400	HENDRIKS M O	121045	Project Mechatronica	8	2002	4
1064400	HENDRIKS M O	121045	Project Mechatronica	2	2003	3
1064400	HENDRIKS M O	121053	Zekere- en onzekere informatie	5	2003	2
1064400	HENDRIKS M O	121057	Bio-elektriciteit	4	2003	2
1064400	HENDRIKS M O	121709	Reliability Engineering	4	2002	4
1064400	HENDRIKS M O	121709	Reliability Engineering	4	2003	4
1064400	HENDRIKS M O	121717	Advanced semiconductor devices	9	2003	3
1064400	HENDRIKS M O	122226	Project voortgezette elektronica	4	2003	3
1064400	HENDRIKS M O	122481	Systems engineering	7	2003	3
1064400	HENDRIKS M O	122733	VLSI signal processing	7	2003	4
1064400	HENDRIKS M O	122814	Elektromagnetisme II voor HBO	5	2003	4
1064400	HENDRIKS M O	122829	Systemen en technieken voor informatieopslag	6	2003	1
1064400	HENDRIKS M O	123152	Signal processing in acoustics and audio	4	2003	3
1064400	HENDRIKS M O	124151	Mechatronica	7	2003	4
1064400	HENDRIKS M O	124163	Mechatronische meetsystemen	9	2003	4
1064400	HENDRIKS M O	124177	Inleiding elektrische energietechniek	8	2003	1
1064400	HENDRIKS M O	125153	Inleiding communicatiesystemen	5	2003	3
1064400	HENDRIKS M O	125160	Mobiele communicatie	8	2003	3
1064400	HENDRIKS M O	127117	Biomechatronica	5	2002	3
1064400	HENDRIKS M O	129362	Start P-project	8	2003	2
1064400	HENDRIKS M O	150433	Wiskundig modelleren voor CiT	6	2003	4
1064400	HENDRIKS M O	150625	Scientific communication	9	2003	3
1064400	HENDRIKS M O	150630	Applied functional analysis	8	2003	4
1064400	HENDRIKS M O	151052	Fundamentele analyse II	5	2003	3
1064400	HENDRIKS M O	151088	Practicum Wiskundig modelleren	6	2003	4
1064400	HENDRIKS M O	151093	Modelvorming III	6	2003	1
1064400	HENDRIKS M O	151140	Wiskunde III	7	2003	3
1064400	HENDRIKS M O	151204	Calculus C	4	2003	4
1064400	HENDRIKS M O	151210	Wiskunde A	5	2003	4
1064400	HENDRIKS M O	151510	Introduction to Risk Theory	9	2003	3
1064400	HENDRIKS M O	153002	Discrete kansrekening	6	2003	3
1064400	HENDRIKS M O	153003	Kansrekening	8	2003	3
1064400	HENDRIKS M O	153028	Statistiek I	7	2003	4
1064400	HENDRIKS M O	153032	Kansrekening en stochastische processen	7	2003	4
1064400	HENDRIKS M O	153065	Markov ketens	4	2003	4
1064400	HENDRIKS M O	153082	Stochastische simulatie	9	2003	3
1064400	HENDRIKS M O	154023	Numerieke wiskunde en programmeermethoden	4	2003	1
1064400	HENDRIKS M O	156068	Niet-lineaire besturingstheorie	7	2003	3
1064400	HENDRIKS M O	157020	Dynamische discrete gebeurtenissen	6	2003	4
1064400	HENDRIKS M O	158018	Operationele research I, practicum	9	2003	4
1064400	HENDRIKS M O	158075	Deterministische modellen in de OR	9	2003	4
1064400	HENDRIKS M O	159918	Bibliotheekgebruik en literatuuropdracht	4	2003	3
1064400	HENDRIKS M O	159960	Multidisciplinaire ontwerpopdracht	7	2003	3
1064400	HENDRIKS M O	211017	Inleiding programmeren met JAVA	7	2003	1
1064400	HENDRIKS M O	211032	Seminarium Taal, Kennis & Interactie	1	2003	4
1064400	HENDRIKS M O	211050	Structuur van programmeertalen	5	2003	3
1064400	HENDRIKS M O	211074	Gegevensbanken	3	2003	4
1064400	HENDRIKS M O	211096	XML & Databases	6	2003	3
1064400	HENDRIKS M O	211109	Voortgezette logica	6	2003	3
1064400	HENDRIKS M O	211130	Ubiquitous Computing	4	2003	3
1064400	HENDRIKS M O	211185	Taal- en rekenmodellen	2	2003	1
1064400	HENDRIKS M O	213014	Procesbesturing en robotica	6	2003	3
1064400	HENDRIKS M O	213130	Computer Organisatie INF/TEL	6	2003	3
1064400	HENDRIKS M O	213540	Advanced Design of Software Architectures	9	2002	4
1064400	HENDRIKS M O	214011	Tool Architectuur	5	2003	4
1064400	HENDRIKS M O	214030	Artificial Intelligence	1	2002	1
1064400	HENDRIKS M O	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2001	3
1064400	HENDRIKS M O	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	3
1064400	HENDRIKS M O	214510	MMI-project	4	2003	3
1064400	HENDRIKS M O	232016	Prestatie-analyse van informatiesystemen	6	2002	4
1064400	HENDRIKS M O	232060	Multi-agent systemen	7	2003	4
1064400	HENDRIKS M O	233030	Specificeren van informatiesystemen	7	2003	1
1064400	HENDRIKS M O	234001	Productie-informatietechnologie	2	2003	3
1064400	HENDRIKS M O	234010	Invoering van IT in organisaties	8	2002	4
1064400	HENDRIKS M O	236050	E-health Strategies	8	2003	4
1064400	HENDRIKS M O	239801	BIT-BV 2	8	2003	4
1064400	HENDRIKS M O	264000	Telematicatoepassingen	9	2003	3
1064400	HENDRIKS M O	265110	Protocol Engineering	5	2003	3
1064400	HENDRIKS M O	265201	Middleware for distributed objects	4	2002	4
1065224	MILJOEN D X	121045	Project Mechatronica	5	2003	1
1065224	MILJOEN D X	121057	Bio-elektriciteit	4	2003	4
1065224	MILJOEN D X	121060	Optische basisfuncties en microsystemen	8	2003	4
1065224	MILJOEN D X	121714	I.C. technologie	8	2003	4
1065224	MILJOEN D X	121717	Advanced semiconductor devices	5	2003	3
1065224	MILJOEN D X	122226	Project voortgezette elektronica	5	2003	3
1065224	MILJOEN D X	122227	Voortgezette analoge IC elektronica	4	2003	4
1065224	MILJOEN D X	122814	Elektromagnetisme II voor HBO	7	2003	4
1065224	MILJOEN D X	122815	Materiaalkunde van microsystemen	4	2003	2
1065224	MILJOEN D X	122816	Mechanica en transductietechniek	9	2003	4
1065224	MILJOEN D X	122831	Geintegreerde optica	8	2003	2
1065224	MILJOEN D X	122833	Integratieproject	8	2003	2
1065224	MILJOEN D X	123112	Moderne modulatie- en detectietechnieken	7	2003	4
1065224	MILJOEN D X	123153	Embedded Signal Processing	1	2003	1
1065224	MILJOEN D X	124163	Mechatronische meetsystemen	9	2003	4
1065224	MILJOEN D X	124177	Inleiding elektrische energietechniek	1	2002	4
1065224	MILJOEN D X	127117	Biomechatronica	7	2002	3
1065224	MILJOEN D X	150526	Wiskundig modelleren I	4	2003	3
1065224	MILJOEN D X	150527	Wiskundig modelleren II	8	2003	3
1065224	MILJOEN D X	150528	Wiskundig modelleren III	5	2003	3
1065224	MILJOEN D X	150539	Maple practicum	5	2003	4
1065224	MILJOEN D X	150810	Modelling project	1	2003	3
1065224	MILJOEN D X	150910	Advanced modelling	9	2003	4
1065224	MILJOEN D X	151019	Analyse B	7	2003	4
1065224	MILJOEN D X	151070	Kwantitatieve methoden	7	2002	4
1065224	MILJOEN D X	151073	Calculus III	6	2003	4
1065224	MILJOEN D X	151200	Calculus A	2	2003	3
1065224	MILJOEN D X	151510	Introduction to Risk Theory	7	2003	3
1065224	MILJOEN D X	152027	Calculus II	8	2003	3
1065224	MILJOEN D X	152066	Capita selecta analyse	5	2003	2
1065224	MILJOEN D X	152068	Discrete wiskunde	6	2003	2
1065224	MILJOEN D X	152150	Wiskundig modelleren I	5	2003	4
1065224	MILJOEN D X	153004	Statistiek I	1	2003	3
1065224	MILJOEN D X	153016	Voortgezette wiskundige statistiek	4	2003	3
1065224	MILJOEN D X	153023	Statistiek II voor TBK	4	2003	3
1065224	MILJOEN D X	153031	Statistiek	5	2003	3
1065224	MILJOEN D X	153038	Wiskundige statistiek	6	2003	4
1065224	MILJOEN D X	153065	Markov ketens	4	2003	4
1065224	MILJOEN D X	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	2
1065224	MILJOEN D X	153086	Telecommunicatiesystemen	6	2003	4
1065224	MILJOEN D X	155009	Fundamenten van de methode der eindige elementen	7	2003	3
1065224	MILJOEN D X	155010	Part. differentiaalverg. uit de math. fysica	4	2003	4
1065224	MILJOEN D X	156056	Inleiding wiskundige systeemtheorie	7	2003	4
1065224	MILJOEN D X	157008	Stochastische processen in dynamische systemen	6	2003	3
1065224	MILJOEN D X	158025	Mathematische programmering I	7	2003	3
1065224	MILJOEN D X	211045	Besturingssystemen	5	2003	3
1065224	MILJOEN D X	211074	Gegevensbanken	2	2003	4
1065224	MILJOEN D X	211081	Distributed E-business Techniques	5	2003	3
1065224	MILJOEN D X	211108	Bijzondere onderwerpen uit de logica	5	2003	4
1065224	MILJOEN D X	211112	Inleiding Logica	4	2003	4
1065224	MILJOEN D X	211130	Ubiquitous Computing	7	2003	2
1065224	MILJOEN D X	211180	Basismodellen in de informatica	6	2003	2
1065224	MILJOEN D X	212010	Informatiesystemen	6	2003	1
1065224	MILJOEN D X	213001	Basisbegrippen digitale techniek	4	2003	4
1065224	MILJOEN D X	214501	Communicatie & ontwerpen in ICT-projecten 2	8	2003	3
1065224	MILJOEN D X	214510	MMI-project	4	2003	3
1065224	MILJOEN D X	214513	Internet & Web Architecturen	4	2002	4
1065224	MILJOEN D X	232012	Information retrieval en kennisbeheer	4	2003	3
1065224	MILJOEN D X	232055	XML-technologie in E-Commerce	4	2003	1
1065224	MILJOEN D X	232081	Requirements Engineering	5	2003	4
1065224	MILJOEN D X	232085	Voortgezette Requirements Engineering	8	2003	4
1065224	MILJOEN D X	234007	Systemen voor cooperatief werk	6	2003	4
1065224	MILJOEN D X	234010	Invoering van IT in organisaties	3	2003	4
1065224	MILJOEN D X	234026	Voortgezette informatiesysteemmodellering	1	2003	4
1065224	MILJOEN D X	237400	BedrijfsProces Ondersteuning	8	2003	3
1065224	MILJOEN D X	239981	Integratieproject	9	2003	3
1065224	MILJOEN D X	239981	Integratieproject	6	1999	1
1065224	MILJOEN D X	265200	Implementatie van telematicasystemen	7	2003	4
1065224	MILJOEN D X	265200	Implementatie van telematicasystemen	6	2003	1
1065224	MILJOEN D X	265201	Middleware for distributed objects	5	2003	3
1065635	BOLDRING F	121002	Practicum elektronische basisschakelingen	8	2003	1
1065635	BOLDRING F	121007	Elektromagnetische Veldtheorie	3	2003	1
1065635	BOLDRING F	121008	Practicum Elektromagnetische Veldtheorie	4	2003	3
1065635	BOLDRING F	121021	Inleiding in de biomedische technologie	6	2003	2
1065635	BOLDRING F	121033	Project "computer vision"	2	2003	3
1065635	BOLDRING F	121041	Elektrodynamica	6	2003	2
1065635	BOLDRING F	121045	Project Mechatronica	7	2001	4
1065635	BOLDRING F	121050	Modern robotics	3	2003	3
1065635	BOLDRING F	121053	Zekere- en onzekere informatie	6	2003	2
1065635	BOLDRING F	121056	Laboratorium op een chip	7	2003	3
1065635	BOLDRING F	121067	Signaal analyse practicum	9	2003	2
1065635	BOLDRING F	121706	Halfgeleiderdevices	5	2003	3
1065635	BOLDRING F	121714	I.C. technologie	9	2003	4
1065635	BOLDRING F	122227	Voortgezette analoge IC elektronica	7	2003	4
1065635	BOLDRING F	122831	Geintegreerde optica	9	2003	2
1065635	BOLDRING F	124163	Mechatronische meetsystemen	7	2003	4
1065635	BOLDRING F	124176	Digitale Regeltechniek	5	2003	3
1065635	BOLDRING F	124177	Inleiding elektrische energietechniek	7	2002	1
1065635	BOLDRING F	125151	Schakel- en controlesystemen v. Multi-service netw	4	2003	3
1065635	BOLDRING F	125163	Electromagnetische compatibiliteit	4	2003	4
1065635	BOLDRING F	127117	Biomechatronica	5	2003	3
1065635	BOLDRING F	150529	Wiskundig modelleren IV	4	2003	1
1065635	BOLDRING F	150625	Scientific communication	6	2003	3
1065635	BOLDRING F	151052	Fundamentele analyse II	8	2003	3
1065635	BOLDRING F	151070	Kwantitatieve methoden	7	2003	1
1065635	BOLDRING F	151092	Modelvorming II	1	2003	2
1065635	BOLDRING F	151140	Wiskunde III	5	2003	3
1065635	BOLDRING F	151202	Calculus B	7	2003	3
1065635	BOLDRING F	151540	Computational Methods in Finance	9	2003	4
1065635	BOLDRING F	152006	Lineaire structuren	8	2003	4
1065635	BOLDRING F	152068	Discrete wiskunde	6	2003	2
1065635	BOLDRING F	152080	Deterministische en stochastische speltheorie	5	2003	4
1065635	BOLDRING F	152100	Calculus I	9	2003	4
1065635	BOLDRING F	152120	Lineaire algebra	5	2003	4
1065635	BOLDRING F	153002	Discrete kansrekening	7	2003	3
1065635	BOLDRING F	153016	Voortgezette wiskundige statistiek	6	2003	3
1065635	BOLDRING F	153065	Markov ketens	4	2003	4
1065635	BOLDRING F	153100	Statistiek	4	2003	3
1065635	BOLDRING F	156012	Gewone differentiaalvergelijkingen	8	2003	3
1065635	BOLDRING F	156029	Analyse C	4	2003	3
1065635	BOLDRING F	156033	Bifurcatie theorie	2	2003	4
1065635	BOLDRING F	157020	Dynamische discrete gebeurtenissen	5	2003	4
1065635	BOLDRING F	159960	Multidisciplinaire ontwerpopdracht	9	2003	3
1065635	BOLDRING F	211035	Vertalerbouw	5	2003	4
1065635	BOLDRING F	211038	Spraak- en taaltechnologie	6	2002	3
1065635	BOLDRING F	211045	Besturingssystemen	5	2003	3
1065635	BOLDRING F	211090	Databasetoepassingen	5	2003	4
1065635	BOLDRING F	211097	Bijzondere onderwerpen gegevensbanken	5	2003	3
1065635	BOLDRING F	211127	Formele analyse van natuurlijke taal	6	2003	4
1065635	BOLDRING F	211180	Basismodellen in de informatica	8	2003	2
1065635	BOLDRING F	213500	Programmeren 1	7	2003	1
1065635	BOLDRING F	213540	Advanced Design of Software Architectures	7	2002	4
1065635	BOLDRING F	214010	Complexiteit van berekeningen	8	2003	3
1065635	BOLDRING F	214011	Tool Architectuur	5	2003	4
1065635	BOLDRING F	214030	Artificial Intelligence	7	2003	4
1065635	BOLDRING F	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2003	2
1065635	BOLDRING F	214501	Communicatie & ontwerpen in ICT-projecten 2	9	2003	3
1065635	BOLDRING F	214510	MMI-project	3	2003	3
1065635	BOLDRING F	214513	Internet & Web Architecturen	7	2003	4
1065635	BOLDRING F	232016	Prestatie-analyse van informatiesystemen	1	2003	2
1065635	BOLDRING F	232020	Data warehousing & data mining	4	2003	4
1065635	BOLDRING F	232020	Data warehousing & data mining	5	2003	2
1065635	BOLDRING F	232050	Electronic Commerce	3	2003	4
1065635	BOLDRING F	232081	Requirements Engineering	6	2003	4
1065635	BOLDRING F	237201	Oriëntatie ICT	8	2003	4
1070311	BORGHOF B	214511	Database Project	8	2003	3
1065635	BOLDRING F	239800	BIT-BV 1	5	2003	4
1065635	BOLDRING F	261000	Telematicasystemen en toepassingen	5	2003	2
1065635	BOLDRING F	262020	Bijzondere onderwerpen Telematica	7	2003	1
1065635	BOLDRING F	266100	Patterns of software development	9	2003	2
1065635	BOLDRING F	269000	Orientatie ICT	6	2003	3
1065635	BOLDRING F	269001	Portfolio ontwerp	3	2003	4
1066450	VINCK Q S	121002	Practicum elektronische basisschakelingen	5	2003	1
1066450	VINCK Q S	121006	Practicum Meetinstrumenten/Netwerkanalyse	8	2003	3
1066450	VINCK Q S	121007	Elektromagnetische Veldtheorie	7	2003	1
1066450	VINCK Q S	121008	Practicum Elektromagnetische Veldtheorie	6	2003	1
1066450	VINCK Q S	121009	Inleiding telecommunicatie	8	2003	4
1066450	VINCK Q S	121019	D-opdracht	6	2003	3
1066450	VINCK Q S	121026	Hands-on dig.image proces. and graphical pres.	9	2003	1
1066450	VINCK Q S	121028	Computer vision	8	2003	4
1066450	VINCK Q S	121045	Project Mechatronica	6	2002	4
1066450	VINCK Q S	121052	Imaging	5	2003	3
1066450	VINCK Q S	121060	Optische basisfuncties en microsystemen	7	2003	4
1066450	VINCK Q S	121062	Eind P-project	9	2003	4
1066450	VINCK Q S	121067	Signaal analyse practicum	6	2003	4
1066450	VINCK Q S	121714	I.C. technologie	1	2003	4
1066450	VINCK Q S	122227	Voortgezette analoge IC elektronica	7	2003	2
1066450	VINCK Q S	122816	Mechanica en transductietechniek	8	2002	3
1066450	VINCK Q S	122816	Mechanica en transductietechniek	6	2003	2
1066450	VINCK Q S	122828	Practicum realiseren in materialen	9	2003	1
1066450	VINCK Q S	122831	Geintegreerde optica	9	2003	2
1066450	VINCK Q S	122833	Integratieproject	6	2003	2
1066450	VINCK Q S	123140	Inleiding systeem- en signaaltheorie voor HBO	4	2003	3
1066450	VINCK Q S	123149	Lineaire systemen	5	2003	4
1066450	VINCK Q S	124151	Mechatronica	7	2002	4
1066450	VINCK Q S	124163	Mechatronische meetsystemen	7	2003	4
1066450	VINCK Q S	124177	Inleiding elektrische energietechniek	6	2002	1
1066450	VINCK Q S	125118	Practicum informatie-overdracht	4	2003	3
1066450	VINCK Q S	125118	Practicum informatie-overdracht	6	2003	2
1066450	VINCK Q S	125159	Optische communicatienetwerken	7	2003	4
1066450	VINCK Q S	127116	Elektromagnetisme I voor HBO	5	2003	3
1066450	VINCK Q S	129345	Deelname aan een studiegroep	9	2003	3
1066450	VINCK Q S	129351	Fysiologie II	7	2003	3
1066450	VINCK Q S	129367	Individual project	4	2003	3
1066450	VINCK Q S	150910	Advanced modelling	6	2003	4
1066450	VINCK Q S	151051	Fundamentele analyse I	3	2003	3
1066450	VINCK Q S	151081	Wiskunde I	4	2003	3
1066450	VINCK Q S	151092	Modelvorming II	8	2003	4
1066450	VINCK Q S	151093	Modelvorming III	8	2003	3
1066450	VINCK Q S	151150	Wiskunde IV	2	2003	3
1066450	VINCK Q S	151204	Calculus C	9	2003	4
1066450	VINCK Q S	151208	Lineaire Algebra B	5	2003	3
1066450	VINCK Q S	151510	Introduction to Risk Theory	8	2003	3
1066450	VINCK Q S	151600	Modelleren en redeneren	8	2003	4
1066450	VINCK Q S	152110	Calculus II	1	2003	3
1066450	VINCK Q S	153016	Voortgezette wiskundige statistiek	9	2003	3
1066450	VINCK Q S	153036	Statistiek II	4	2003	4
1066450	VINCK Q S	153038	Wiskundige statistiek	6	2003	4
1066450	VINCK Q S	153100	Statistiek	6	2003	3
1066450	VINCK Q S	154023	Numerieke wiskunde en programmeermethoden	3	2003	3
1066450	VINCK Q S	154023	Numerieke wiskunde en programmeermethoden	3	2003	1
1066450	VINCK Q S	156014	Analyse B	5	2003	4
1066450	VINCK Q S	156057	Inleiding wiskundige systeemtheorie	9	2003	4
1066450	VINCK Q S	157008	Stochastische processen in dynamische systemen	5	2003	3
1066450	VINCK Q S	157016	Stochastische filter- en besturingstheorie	5	2003	3
1066450	VINCK Q S	157035	Financial Econometrics	3	2003	3
1066450	VINCK Q S	158025	Mathematische programmering I	5	2003	3
1066450	VINCK Q S	159927	Doctoraalstage	8	2003	4
1066450	VINCK Q S	211024	Programmeren in C++	9	2003	4
1066450	VINCK Q S	211035	Vertalerbouw	7	2003	4
1066450	VINCK Q S	211054	Computersystemen	5	2003	3
1066450	VINCK Q S	211108	Bijzondere onderwerpen uit de logica	2	2003	4
1066450	VINCK Q S	211123	Component- en aspect georienteerd progammeren	2	2003	3
1066450	VINCK Q S	211131	Statische Objectanalyse en Typering	9	2003	4
1066450	VINCK Q S	211133	Ontwerpen van Software Architecturen	4	2003	3
1066450	VINCK Q S	211185	Taal- en rekenmodellen	2	2003	4
1066450	VINCK Q S	212018	Kennistechnologie voor bedrijfskundige toep.	4	2003	2
1066450	VINCK Q S	213001	Basisbegrippen digitale techniek	6	2002	3
1066450	VINCK Q S	213005	Computerarchitectuur	1	2003	4
1066450	VINCK Q S	213014	Procesbesturing en robotica	6	2003	3
1066450	VINCK Q S	214025	Algoritmen,datastructuren en complexiteit plus	5	2003	4
1066450	VINCK Q S	214511	Database Project	2	2003	3
1066450	VINCK Q S	232012	Information retrieval en kennisbeheer	4	2003	3
1066450	VINCK Q S	232050	Electronic Commerce	8	2002	4
1066450	VINCK Q S	232050	Electronic Commerce	7	2003	4
1066450	VINCK Q S	232055	XML-technologie in E-Commerce	6	2003	4
1066450	VINCK Q S	232081	Requirements Engineering	9	2003	4
1066450	VINCK Q S	233030	Specificeren van informatiesystemen	9	2003	3
1066450	VINCK Q S	236050	E-health Strategies	4	2003	4
1066450	VINCK Q S	237600	Business Case Development for IT-projects	7	2003	1
1066450	VINCK Q S	263100	Mobile E-health application and services	2	2003	4
1066584	GOOZEN R D	158075	Deterministische modellen in de OR	3	2002	4
1066584	GOOZEN R D	159960	Multidisciplinaire ontwerpopdracht	3	2003	3
1066584	GOOZEN R D	211017	Inleiding programmeren met JAVA	9	2003	3
1066584	GOOZEN R D	211017	Inleiding programmeren met JAVA	8	2003	1
1066584	GOOZEN R D	211027	Inleiding programmeren met MATLAB	6	2003	3
1066584	GOOZEN R D	211038	Spraak- en taaltechnologie	5	2001	3
1066584	GOOZEN R D	211123	Component- en aspect georienteerd progammeren	2	2003	3
1066584	GOOZEN R D	213125	Computersystemen	9	2003	4
1066584	GOOZEN R D	213530	Concurrent and distributed programming	5	2003	4
1066584	GOOZEN R D	214012	Systeemvalidatie	8	2003	3
1066584	GOOZEN R D	214030	Artificial Intelligence	6	2003	2
1066584	GOOZEN R D	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2001	3
1066584	GOOZEN R D	232020	Data warehousing & data mining	2	2002	3
1066584	GOOZEN R D	265310	Internet management architecturen	8	2003	3
1066584	GOOZEN R D	269100	P-project TEL	5	2003	4
1067348	DOES R I	211127	Formele analyse van natuurlijke taal	4	2003	4
1067348	DOES R I	211130	Ubiquitous Computing	3	2003	2
1067348	DOES R I	211133	Ontwerpen van Software Architecturen	4	2003	1
1067348	DOES R I	213005	Computerarchitectuur	2	2003	4
1067348	DOES R I	213005	Computerarchitectuur	8	2003	1
1067348	DOES R I	213009	Fouten tolererende digitale systemen	7	2003	4
1067348	DOES R I	213505	Programmeren 2	9	2003	1
1067348	DOES R I	213510	Software Engineering Modellen	9	2003	4
1067348	DOES R I	213530	Concurrent and distributed programming	6	2003	4
1067348	DOES R I	213540	Advanced Design of Software Architectures	5	2003	1
1067348	DOES R I	214011	Tool Architectuur	4	2003	4
1067348	DOES R I	214500	Communicatie en ontwerpen in ICT-projecten 1	2	2001	3
1067348	DOES R I	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	1
1067348	DOES R I	232012	Information retrieval en kennisbeheer	5	2003	3
1067348	DOES R I	232060	Multi-agent systemen	7	2003	2
1067348	DOES R I	233030	Specificeren van informatiesystemen	8	2003	1
1067348	DOES R I	233035	Practicum Databases in Informatiesystemen	4	2002	1
1067348	DOES R I	234010	Invoering van IT in organisaties	4	2003	2
1067348	DOES R I	234026	Voortgezette informatiesysteemmodellering	8	2003	4
1067348	DOES R I	234026	Voortgezette informatiesysteemmodellering	9	2003	1
1067348	DOES R I	239805	BIT-BV	9	2003	4
1067348	DOES R I	262001	Mobile and wireless networking	9	2003	4
1067348	DOES R I	263000	Telematicadiensten	7	2003	1
1067348	DOES R I	265100	Ontwerpen van telematicasystemen	7	2003	1
1067517	JANSEN R	154023	Numerieke wiskunde en programmeermethoden	8	2003	3
1067517	JANSEN R	154023	Numerieke wiskunde en programmeermethoden	4	2003	1
1067517	JANSEN R	156068	Niet-lineaire besturingstheorie	7	2003	3
1067517	JANSEN R	157035	Financial Econometrics	3	2003	3
1067517	JANSEN R	158017	Operationele research I	8	2003	4
1067517	JANSEN R	158018	Operationele research I, practicum	8	2003	4
1067517	JANSEN R	211032	Seminarium Taal, Kennis & Interactie	4	2003	4
1067517	JANSEN R	211077	Database-ontwerp	4	2003	4
1067517	JANSEN R	211078	Database-ontwerp	6	2003	4
1067517	JANSEN R	211097	Bijzondere onderwerpen gegevensbanken	8	2003	1
1067517	JANSEN R	211131	Statische Objectanalyse en Typering	7	2003	4
1067517	JANSEN R	211133	Ontwerpen van Software Architecturen	2	2003	3
1067517	JANSEN R	213002	Ontwerpen van digitale systemen	1	2003	4
1067517	JANSEN R	213011	Gedistribueerde systemen	7	2003	2
1067517	JANSEN R	213016	Bijzondere onderwerpen computerarchitectuur	4	2003	3
1067517	JANSEN R	213110	Computerorganisatie	9	2003	1
1067517	JANSEN R	213540	Advanced Design of Software Architectures	1	2003	3
1067517	JANSEN R	213545	Advanced Design of Software Architectures 2	4	2003	3
1067517	JANSEN R	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1067517	JANSEN R	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	1
1067517	JANSEN R	219801	Hypermedia structuren en systemen	2	2003	4
1067517	JANSEN R	232016	Prestatie-analyse van informatiesystemen	3	2002	4
1067517	JANSEN R	232020	Data warehousing & data mining	9	2003	4
1067517	JANSEN R	232020	Data warehousing & data mining	9	2003	2
1067517	JANSEN R	232085	Voortgezette Requirements Engineering	9	2003	4
1067517	JANSEN R	233035	Practicum Databases in Informatiesystemen	5	2002	3
1067517	JANSEN R	237201	Oriëntatie ICT	5	2002	3
1067517	JANSEN R	239801	BIT-BV 2	9	2003	2
1068361	WERNERS Z	237500	BP lab	4	2003	3
1068361	WERNERS Z	239801	BIT-BV 2	8	2003	4
1068361	WERNERS Z	239981	Integratieproject	6	2002	3
1068361	WERNERS Z	239981	Integratieproject	2	2001	2
1068828	BEEKE L F	156080	Signalen en transformaties	3	2003	3
1068828	BEEKE L F	157009	Tijdreeksenanalyse en identificatietheorie	9	2003	3
1068828	BEEKE L F	157030	Structured Products	3	2003	3
1068828	BEEKE L F	211022	Programmeren in C++	8	2003	3
1068828	BEEKE L F	211037	Graphics & Virtual Reality	7	2003	3
1068828	BEEKE L F	211038	Spraak- en taaltechnologie	9	2003	4
1068828	BEEKE L F	211096	XML & Databases	9	2003	1
1077133	VOLLENBROEK N L	152061	Discrete wiskunde	8	2003	3
1068828	BEEKE L F	211098	Databasetransacties en -processen	8	2003	3
1068828	BEEKE L F	211113	Constraint Logic Programming	6	2003	4
1068828	BEEKE L F	213001	Basisbegrippen digitale techniek	8	2003	4
1068828	BEEKE L F	213012	Hardware/software co-design	9	2003	4
1068828	BEEKE L F	213125	Computersystemen	5	2003	4
1068828	BEEKE L F	214510	MMI-project	4	2003	3
1068828	BEEKE L F	214511	Database Project	8	2003	3
1068828	BEEKE L F	214512	Computerarchitectuur Project	1	2003	4
1068828	BEEKE L F	214513	Internet & Web Architecturen	9	2002	4
1068828	BEEKE L F	219803	Neurale netwerken	2	2003	4
1068828	BEEKE L F	232055	XML-technologie in E-Commerce	8	2003	1
1068828	BEEKE L F	232081	Requirements Engineering	9	2003	4
1068828	BEEKE L F	235005	Inleiding bedrijfsinformatiesystemen	1	2003	3
1068828	BEEKE L F	239800	BIT-BV 1	7	2003	4
1068828	BEEKE L F	239805	BIT-BV	4	2003	4
1068828	BEEKE L F	261000	Telematicasystemen en toepassingen	8	2003	2
1069028	MEIJER B	121002	Practicum elektronische basisschakelingen	5	2003	1
1069028	MEIJER B	121022	Neurofysiologie	6	2003	4
1069028	MEIJER B	121034	Fysische modelvorming van embedded systemen	3	2003	4
1069028	MEIJER B	121044	Regeltechniek	5	2003	4
1069028	MEIJER B	121049	Practicum Medische Elektronica	6	2003	3
1069028	MEIJER B	121056	Laboratorium op een chip	6	2003	3
1069028	MEIJER B	121714	I.C. technologie	8	2003	2
1069028	MEIJER B	122226	Project voortgezette elektronica	7	2003	3
1069028	MEIJER B	122729	Image processing	1	2003	4
1069028	MEIJER B	122733	VLSI signal processing	4	2003	4
1069028	MEIJER B	122816	Mechanica en transductietechniek	3	2003	4
1069028	MEIJER B	122828	Practicum realiseren in materialen	4	2003	3
1069028	MEIJER B	122831	Geintegreerde optica	6	2003	2
1069028	MEIJER B	122833	Integratieproject	5	2003	2
1069028	MEIJER B	124176	Digitale Regeltechniek	6	2003	3
1069028	MEIJER B	125151	Schakel- en controlesystemen v. Multi-service netw	1	2003	3
1069028	MEIJER B	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	1
1069028	MEIJER B	129348	Maken van een scriptie	4	2003	3
1069028	MEIJER B	129351	Fysiologie II	3	2003	1
1069028	MEIJER B	129362	Start P-project	6	2003	3
1069028	MEIJER B	150433	Wiskundig modelleren voor CiT	4	2003	4
1069028	MEIJER B	150526	Wiskundig modelleren I	5	2003	3
1069028	MEIJER B	150700	Introduction to operations research	8	2003	4
1069028	MEIJER B	150730	Experimental design	7	2003	3
1069028	MEIJER B	151043	Seminarium mathematische fysica	3	2003	4
1069028	MEIJER B	151070	Kwantitatieve methoden	2	2003	1
1069028	MEIJER B	151072	Wiskunde II	8	2003	4
1069028	MEIJER B	151080	Bijscholing wiskunde B2	7	2003	3
1069028	MEIJER B	151082	Wiskunde II	5	2003	4
1069028	MEIJER B	151093	Modelvorming III	6	2003	1
1069028	MEIJER B	151120	Wiskunde I	9	2003	4
1069028	MEIJER B	151204	Calculus C	5	2003	4
1069028	MEIJER B	151220	Wiskunde C	9	2003	3
1069028	MEIJER B	151510	Introduction to Risk Theory	5	2003	3
1069028	MEIJER B	151560	Introduction to Investment Theory	7	2003	4
1069028	MEIJER B	152027	Calculus II	7	2003	3
1069028	MEIJER B	152033	Globale analyse	1	2003	4
1069028	MEIJER B	152070	Meetkunde	6	2003	1
1069028	MEIJER B	152080	Deterministische en stochastische speltheorie	2	2003	4
1069028	MEIJER B	153023	Statistiek II voor TBK	2	2003	3
1069028	MEIJER B	153080	Stochastische modellen in de operationele research	7	2003	4
1069028	MEIJER B	153086	Telecommunicatiesystemen	6	2003	1
1069028	MEIJER B	153087	Wachttijdtheorie	6	2003	3
1069028	MEIJER B	153100	Statistiek	4	2003	3
1069028	MEIJER B	153120	Statistiek	4	2003	4
1069028	MEIJER B	154021	Numerieke wiskunde en programmeermethoden	8	2003	1
1069028	MEIJER B	155009	Fundamenten van de methode der eindige elementen	6	2003	3
1069028	MEIJER B	156067	Robust Control	7	2003	4
1069028	MEIJER B	157035	Financial Econometrics	5	2003	3
1069028	MEIJER B	211027	Inleiding programmeren met MATLAB	5	2003	3
1069028	MEIJER B	211033	Neurale netwerken en neuro-computing	8	2003	3
1069028	MEIJER B	211123	Component- en aspect georienteerd progammeren	8	2003	1
1069028	MEIJER B	211128	Informatica en taal	9	2003	4
1069028	MEIJER B	211130	Ubiquitous Computing	9	2003	3
1069028	MEIJER B	213005	Computerarchitectuur	1	2003	1
1069028	MEIJER B	213011	Gedistribueerde systemen	8	2003	4
1069028	MEIJER B	213110	Computerorganisatie	7	2003	1
1069028	MEIJER B	213500	Programmeren 1	5	2003	4
1069028	MEIJER B	213530	Concurrent and distributed programming	1	2002	4
1069028	MEIJER B	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1069028	MEIJER B	214030	Artificial Intelligence	1	2002	1
1069028	MEIJER B	214511	Database Project	9	2003	3
1069028	MEIJER B	214513	Internet & Web Architecturen	8	2002	4
1069028	MEIJER B	232055	XML-technologie in E-Commerce	6	2003	4
1069028	MEIJER B	232060	Multi-agent systemen	6	2003	2
1069028	MEIJER B	232080	Requirements Engineering	6	2003	3
1069028	MEIJER B	233035	Practicum Databases in Informatiesystemen	8	2003	4
1069028	MEIJER B	233035	Practicum Databases in Informatiesystemen	5	2002	1
1069028	MEIJER B	234010	Invoering van IT in organisaties	8	2003	4
1069028	MEIJER B	235005	Inleiding bedrijfsinformatiesystemen	5	2003	3
1069028	MEIJER B	235022	Investeringen in informatietechnologie	5	2003	4
1069028	MEIJER B	237201	Oriëntatie ICT	9	2002	2
1069028	MEIJER B	239981	Integratieproject	6	2003	2
1069028	MEIJER B	263200	Gedistribueerde multimedia database systemen	6	2003	4
1069028	MEIJER B	265110	Protocol Engineering	8	2003	3
1069028	MEIJER B	265110	Protocol Engineering	3	2003	1
1069028	MEIJER B	265200	Implementatie van telematicasystemen	8	2003	1
1069028	MEIJER B	265201	Middleware for distributed objects	8	2002	4
1069028	MEIJER B	265201	Middleware for distributed objects	4	2003	3
1069028	MEIJER B	265300	Operationeel management van telematicasystemen	9	2003	3
1069028	MEIJER B	269001	Portfolio ontwerp	6	2003	4
1069028	MEIJER B	269004	Refresher Logics, Probability,Databases and JAVA	7	2003	4
1069028	MEIJER B	269100	P-project TEL	6	2003	2
1069538	LOCHEM X	121001	Elektronische basisschakelingen	9	2003	2
1069538	LOCHEM X	121006	Practicum Meetinstrumenten/Netwerkanalyse	8	2003	3
1069538	LOCHEM X	121008	Practicum Elektromagnetische Veldtheorie	5	2003	3
1069538	LOCHEM X	121021	Inleiding in de biomedische technologie	5	2002	2
1069538	LOCHEM X	121022	Neurofysiologie	8	2003	4
1069538	LOCHEM X	121028	Computer vision	1	2003	4
1069538	LOCHEM X	121045	Project Mechatronica	9	2003	3
1069538	LOCHEM X	121050	Modern robotics	9	2003	3
1069538	LOCHEM X	121060	Optische basisfuncties en microsystemen	4	2003	4
1069538	LOCHEM X	121062	Eind P-project	1	2003	4
1069538	LOCHEM X	121706	Halfgeleiderdevices	7	2003	3
1069538	LOCHEM X	121714	I.C. technologie	4	2003	2
1069538	LOCHEM X	122226	Project voortgezette elektronica	8	2003	3
1069538	LOCHEM X	122230	Integrated circuits and systems for mixed signals	4	2003	4
1069538	LOCHEM X	122230	Integrated circuits and systems for mixed signals	5	2003	2
1069538	LOCHEM X	122816	Mechanica en transductietechniek	3	2003	4
1069538	LOCHEM X	122816	Mechanica en transductietechniek	7	2002	2
1069538	LOCHEM X	122828	Practicum realiseren in materialen	1	2003	3
1069538	LOCHEM X	122828	Practicum realiseren in materialen	9	2003	1
1069538	LOCHEM X	122831	Geintegreerde optica	4	2002	4
1069538	LOCHEM X	122831	Geintegreerde optica	3	2003	2
1069538	LOCHEM X	123149	Lineaire systemen	6	2003	4
1069538	LOCHEM X	123152	Signal processing in acoustics and audio	5	2003	3
1069538	LOCHEM X	124151	Mechatronica	4	2002	4
1069538	LOCHEM X	124151	Mechatronica	9	2003	2
1069538	LOCHEM X	124153	Computer-aided design gereedschappen voor VLSI	2	2003	4
1069538	LOCHEM X	124163	Mechatronische meetsystemen	6	2003	4
1069538	LOCHEM X	124177	Inleiding elektrische energietechniek	2	2003	1
1069538	LOCHEM X	125113	Analoge communicatietechniek	5	2003	4
1069538	LOCHEM X	125118	Practicum informatie-overdracht	7	2003	2
1069538	LOCHEM X	127116	Elektromagnetisme I voor HBO	7	2003	2
1069538	LOCHEM X	127117	Biomechatronica	9	2001	3
1069538	LOCHEM X	150500	Presentatie van een wiskundig onderwerp	3	2003	3
1069538	LOCHEM X	150532	Maple practicum	6	2003	4
1069538	LOCHEM X	150539	Maple practicum	2	2003	4
1069538	LOCHEM X	151005	Calculus II-B	5	2003	3
1069538	LOCHEM X	151007	Lineaire algebra	6	2003	4
1069538	LOCHEM X	151070	Kwantitatieve methoden	7	2003	1
1069538	LOCHEM X	151072	Wiskunde II	1	2003	4
1069538	LOCHEM X	151081	Wiskunde I	6	2003	3
1069538	LOCHEM X	151088	Practicum Wiskundig modelleren	4	2003	4
1069538	LOCHEM X	151140	Wiskunde III	2	2003	3
1069538	LOCHEM X	151200	Calculus A	8	2003	3
1069538	LOCHEM X	151560	Introduction to Investment Theory	5	2003	4
1069538	LOCHEM X	152038	Grafentheorie	7	2003	3
1069538	LOCHEM X	152080	Deterministische en stochastische speltheorie	8	2003	4
1069538	LOCHEM X	153002	Discrete kansrekening	6	2003	3
1069538	LOCHEM X	153006	Kansrekening	6	2003	3
1069538	LOCHEM X	153008	Kansrekening en statistiek	6	2003	3
1069538	LOCHEM X	153016	Voortgezette wiskundige statistiek	6	2003	3
1069538	LOCHEM X	153086	Telecommunicatiesystemen	8	2003	4
1069538	LOCHEM X	153086	Telecommunicatiesystemen	4	2003	1
1069538	LOCHEM X	153087	Wachttijdtheorie	7	2003	3
1069538	LOCHEM X	153088	Stochastische modellen voor Operations Management	8	2003	3
1069538	LOCHEM X	154021	Numerieke wiskunde en programmeermethoden	6	2003	3
1069538	LOCHEM X	154021	Numerieke wiskunde en programmeermethoden	7	2003	1
1069538	LOCHEM X	154023	Numerieke wiskunde en programmeermethoden	9	2003	3
1069538	LOCHEM X	156067	Robust Control	9	2003	4
1069538	LOCHEM X	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1069538	LOCHEM X	158017	Operationele research I	5	2003	4
1069538	LOCHEM X	158075	Deterministische modellen in de OR	9	2002	4
1069538	LOCHEM X	158075	Deterministische modellen in de OR	8	2003	1
1069538	LOCHEM X	211022	Programmeren in C++	7	2003	3
1069538	LOCHEM X	211054	Computersystemen	6	2003	2
1069538	LOCHEM X	211095	Gedistribueerde databases & middleware technologie	6	2003	4
1069538	LOCHEM X	211128	Informatica en taal	9	2003	4
1069538	LOCHEM X	211185	Taal- en rekenmodellen	7	2003	1
1069538	LOCHEM X	213002	Ontwerpen van digitale systemen	7	2003	4
1069538	LOCHEM X	213120	Inleiding informatie- en communicatietechnologie	3	2003	2
1069538	LOCHEM X	213505	Programmeren 2	2	2003	1
1069538	LOCHEM X	213520	Formele Methoden voor Software Engineering	4	2003	4
1069538	LOCHEM X	214030	Artificial Intelligence	7	2002	1
1069538	LOCHEM X	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	3
1069538	LOCHEM X	214512	Computerarchitectuur Project	6	2003	4
1069538	LOCHEM X	214513	Internet & Web Architecturen	4	2002	2
1069538	LOCHEM X	232020	Data warehousing & data mining	6	2003	4
1069538	LOCHEM X	234020	Ontwerpen van mens-machine interactie	7	2003	1
1069538	LOCHEM X	235005	Inleiding bedrijfsinformatiesystemen	5	2003	3
1069538	LOCHEM X	236050	E-health Strategies	7	2003	4
1069538	LOCHEM X	265201	Middleware for distributed objects	9	2003	3
1070274	NIEUWENHUIZEN Y	121001	Elektronische basisschakelingen	4	2003	2
1070274	NIEUWENHUIZEN Y	121007	Elektromagnetische Veldtheorie	6	2003	1
1070274	NIEUWENHUIZEN Y	121009	Inleiding telecommunicatie	2	2003	4
1070274	NIEUWENHUIZEN Y	121019	D-opdracht	7	2003	3
1070274	NIEUWENHUIZEN Y	121021	Inleiding in de biomedische technologie	8	2003	4
1070274	NIEUWENHUIZEN Y	121021	Inleiding in de biomedische technologie	6	2002	2
1070274	NIEUWENHUIZEN Y	121026	Hands-on dig.image proces. and graphical pres.	2	2003	4
1070274	NIEUWENHUIZEN Y	121035	Mid P-project	4	2002	4
1070274	NIEUWENHUIZEN Y	121039	Biomedische signaal- en systeemanalyse	4	2003	3
1070274	NIEUWENHUIZEN Y	121045	Project Mechatronica	9	2003	3
1070274	NIEUWENHUIZEN Y	121049	Practicum Medische Elektronica	6	2003	3
1070274	NIEUWENHUIZEN Y	121717	Advanced semiconductor devices	8	2003	3
1070274	NIEUWENHUIZEN Y	122634	Real-time software development	1	2003	3
1070274	NIEUWENHUIZEN Y	122728	Classification, Estimation and Data Analysis	7	2003	4
1070274	NIEUWENHUIZEN Y	122815	Materiaalkunde van microsystemen	5	2003	4
1070274	NIEUWENHUIZEN Y	122816	Mechanica en transductietechniek	3	2002	2
1070274	NIEUWENHUIZEN Y	122828	Practicum realiseren in materialen	3	2003	3
1070274	NIEUWENHUIZEN Y	122829	Systemen en technieken voor informatieopslag	4	2003	4
1070274	NIEUWENHUIZEN Y	123112	Moderne modulatie- en detectietechnieken	5	2003	4
1070274	NIEUWENHUIZEN Y	123152	Signal processing in acoustics and audio	1	2003	3
1070274	NIEUWENHUIZEN Y	124151	Mechatronica	6	2003	4
1070274	NIEUWENHUIZEN Y	124151	Mechatronica	8	2003	2
1070311	BORGHOF B	151019	Analyse B	5	2003	4
1070274	NIEUWENHUIZEN Y	127113	Elektrofysiologische signalen en bio-electriciteit	8	2003	4
1070274	NIEUWENHUIZEN Y	127117	Biomechatronica	7	2003	3
1070274	NIEUWENHUIZEN Y	129351	Fysiologie II	4	2003	3
1070274	NIEUWENHUIZEN Y	129355	Deelname aan een studiegroep	6	2003	3
1070274	NIEUWENHUIZEN Y	129356	Verrichten van experimenteel werk	2	2003	3
1070274	NIEUWENHUIZEN Y	129362	Start P-project	3	2003	2
1070274	NIEUWENHUIZEN Y	150528	Wiskundig modelleren III	9	2003	3
1070274	NIEUWENHUIZEN Y	150532	Maple practicum	6	2003	4
1070274	NIEUWENHUIZEN Y	150620	Systems and signals	6	2003	3
1070274	NIEUWENHUIZEN Y	151024	Lineaire analyse	6	2003	4
1070274	NIEUWENHUIZEN Y	151025	Functionaalanalyse II	5	2003	3
1070274	NIEUWENHUIZEN Y	151085	Wiskunde I	8	2003	3
1070274	NIEUWENHUIZEN Y	151092	Modelvorming II	9	2003	4
1070274	NIEUWENHUIZEN Y	151540	Computational Methods in Finance	7	2003	4
1070274	NIEUWENHUIZEN Y	152110	Calculus II	8	2003	3
1070274	NIEUWENHUIZEN Y	153004	Statistiek I	9	2003	3
1070274	NIEUWENHUIZEN Y	153086	Telecommunicatiesystemen	4	2003	4
1070274	NIEUWENHUIZEN Y	155010	Part. differentiaalverg. uit de math. fysica	7	2003	4
1070274	NIEUWENHUIZEN Y	155019	Practicum softwarepakketten PDV	5	2003	3
1070274	NIEUWENHUIZEN Y	156014	Analyse B	7	2003	4
1070274	NIEUWENHUIZEN Y	156080	Signalen en transformaties	2	2003	3
1070274	NIEUWENHUIZEN Y	157008	Stochastische processen in dynamische systemen	8	2003	3
1070274	NIEUWENHUIZEN Y	158018	Operationele research I, practicum	4	2003	4
1070274	NIEUWENHUIZEN Y	159928	Doctoraalstage	9	2003	3
1070274	NIEUWENHUIZEN Y	211034	Spraaktechnologie	9	2003	2
1070274	NIEUWENHUIZEN Y	211038	Spraak- en taaltechnologie	8	2001	3
1070274	NIEUWENHUIZEN Y	211095	Gedistribueerde databases & middleware technologie	7	2003	4
1070274	NIEUWENHUIZEN Y	211096	XML & Databases	8	2003	1
1070274	NIEUWENHUIZEN Y	211111	Parallelle processen	3	2003	3
1070274	NIEUWENHUIZEN Y	211131	Statische Objectanalyse en Typering	4	2003	4
1070274	NIEUWENHUIZEN Y	211133	Ontwerpen van Software Architecturen	2	2003	1
1070274	NIEUWENHUIZEN Y	213500	Programmeren 1	5	2003	4
1070274	NIEUWENHUIZEN Y	213510	Software Engineering Modellen	5	2003	4
1070274	NIEUWENHUIZEN Y	214025	Algoritmen,datastructuren en complexiteit plus	4	2003	4
1070274	NIEUWENHUIZEN Y	214030	Artificial Intelligence	6	2002	3
1070274	NIEUWENHUIZEN Y	214501	Communicatie & ontwerpen in ICT-projecten 2	8	2003	3
1070274	NIEUWENHUIZEN Y	219910	Ontwerpproject	6	2003	3
1070274	NIEUWENHUIZEN Y	232011	Architectuur van informatiesystemen	4	2003	4
1070274	NIEUWENHUIZEN Y	232012	Information retrieval en kennisbeheer	6	2003	3
1070274	NIEUWENHUIZEN Y	232020	Data warehousing & data mining	3	2002	3
1070274	NIEUWENHUIZEN Y	232020	Data warehousing & data mining	7	2003	2
1070274	NIEUWENHUIZEN Y	232050	Electronic Commerce	4	2002	4
1070274	NIEUWENHUIZEN Y	233035	Practicum Databases in Informatiesystemen	5	2003	1
1070274	NIEUWENHUIZEN Y	234001	Productie-informatietechnologie	7	2003	3
1070274	NIEUWENHUIZEN Y	234010	Invoering van IT in organisaties	7	2003	4
1070274	NIEUWENHUIZEN Y	234010	Invoering van IT in organisaties	5	2003	2
1070274	NIEUWENHUIZEN Y	237400	BedrijfsProces Ondersteuning	2	2003	1
1070274	NIEUWENHUIZEN Y	239981	Integratieproject	8	2001	2
1070274	NIEUWENHUIZEN Y	261000	Telematicasystemen en toepassingen	8	2003	2
1070274	NIEUWENHUIZEN Y	261010	Computer netwerken	4	2003	1
1070274	NIEUWENHUIZEN Y	262001	Mobile and wireless networking	4	2003	4
1070274	NIEUWENHUIZEN Y	263000	Telematicadiensten	7	2003	1
1070274	NIEUWENHUIZEN Y	263100	Mobile E-health application and services	6	2003	4
1070274	NIEUWENHUIZEN Y	265100	Ontwerpen van telematicasystemen	9	2002	4
1070274	NIEUWENHUIZEN Y	265201	Middleware for distributed objects	8	2003	2
1070274	NIEUWENHUIZEN Y	265300	Operationeel management van telematicasystemen	8	2003	3
1070274	NIEUWENHUIZEN Y	269100	P-project TEL	1	2003	4
1070274	NIEUWENHUIZEN Y	269100	P-project TEL	6	2003	2
1070311	BORGHOF B	121001	Elektronische basisschakelingen	9	2003	4
1070311	BORGHOF B	121005	Netwerkanalyse	8	2003	1
1070311	BORGHOF B	121007	Elektromagnetische Veldtheorie	6	2002	1
1070311	BORGHOF B	121008	Practicum Elektromagnetische Veldtheorie	9	2001	3
1070311	BORGHOF B	121044	Regeltechniek	4	2003	2
1070311	BORGHOF B	121053	Zekere- en onzekere informatie	6	2003	3
1070311	BORGHOF B	121706	Halfgeleiderdevices	9	2003	3
1070311	BORGHOF B	121706	Halfgeleiderdevices	8	2003	1
1070311	BORGHOF B	121709	Reliability Engineering	5	2003	2
1070311	BORGHOF B	121714	I.C. technologie	9	2003	4
1070311	BORGHOF B	122481	Systems engineering	4	2003	3
1070311	BORGHOF B	122733	VLSI signal processing	1	2003	4
1070311	BORGHOF B	122733	VLSI signal processing	4	2003	2
1070311	BORGHOF B	122814	Elektromagnetisme II voor HBO	8	2003	4
1070311	BORGHOF B	122815	Materiaalkunde van microsystemen	9	2003	4
1070311	BORGHOF B	122828	Practicum realiseren in materialen	7	2003	3
1070311	BORGHOF B	122828	Practicum realiseren in materialen	9	2003	1
1070311	BORGHOF B	122831	Geintegreerde optica	8	2003	2
1070311	BORGHOF B	123152	Signal processing in acoustics and audio	5	2003	1
1070311	BORGHOF B	123153	Embedded Signal Processing	9	2003	4
1070311	BORGHOF B	124151	Mechatronica	6	2003	2
1070311	BORGHOF B	125159	Optische communicatienetwerken	6	2003	4
1070311	BORGHOF B	127113	Elektrofysiologische signalen en bio-electriciteit	5	2003	1
1070311	BORGHOF B	129344	Literatuuronderzoek	9	2003	3
1070311	BORGHOF B	129348	Maken van een scriptie	6	2003	3
1070311	BORGHOF B	129362	Start P-project	1	2003	2
1070311	BORGHOF B	150529	Wiskundig modelleren IV	6	2003	1
1070311	BORGHOF B	150539	Maple practicum	7	2003	4
1070311	BORGHOF B	150620	Systems and signals	9	2003	3
1070311	BORGHOF B	150630	Applied functional analysis	6	2003	4
1070311	BORGHOF B	151020	Functionaalanalyse I	5	2003	3
1070311	BORGHOF B	151082	Wiskunde II	1	2003	4
1070311	BORGHOF B	151088	Practicum Wiskundig modelleren	2	2003	4
1070311	BORGHOF B	151120	Wiskunde I	2	2003	4
1070311	BORGHOF B	151140	Wiskunde III	9	2003	3
1070311	BORGHOF B	151540	Computational Methods in Finance	9	2003	4
1070311	BORGHOF B	152027	Calculus II	8	2003	3
1070311	BORGHOF B	152066	Capita selecta analyse	3	2003	2
1070311	BORGHOF B	152068	Discrete wiskunde	5	2003	3
1070311	BORGHOF B	152068	Discrete wiskunde	7	2003	2
1070311	BORGHOF B	152110	Calculus II	8	2003	3
1070311	BORGHOF B	152130	Fundamentele analyse	8	2003	3
1070311	BORGHOF B	153002	Discrete kansrekening	7	2003	3
1070311	BORGHOF B	153087	Wachttijdtheorie	5	2003	3
1070311	BORGHOF B	156066	Besturingstheorie van economische systemen	1	2003	4
1070311	BORGHOF B	157020	Dynamische discrete gebeurtenissen	8	2003	4
1070311	BORGHOF B	158025	Mathematische programmering I	9	2003	3
1070311	BORGHOF B	158075	Deterministische modellen in de OR	4	2003	1
1070311	BORGHOF B	159960	Multidisciplinaire ontwerpopdracht	7	2003	3
1070311	BORGHOF B	211027	Inleiding programmeren met MATLAB	5	2003	3
1070311	BORGHOF B	211081	Distributed E-business Techniques	8	2003	3
1070311	BORGHOF B	211123	Component- en aspect georienteerd progammeren	8	2003	3
1070311	BORGHOF B	211129	Taaltechnologie	9	2003	4
1070311	BORGHOF B	211133	Ontwerpen van Software Architecturen	7	2003	3
1070311	BORGHOF B	213009	Fouten tolererende digitale systemen	7	2003	4
1070311	BORGHOF B	213530	Concurrent and distributed programming	1	2003	4
1070311	BORGHOF B	213530	Concurrent and distributed programming	5	2003	2
1070311	BORGHOF B	214501	Communicatie & ontwerpen in ICT-projecten 2	3	2003	3
1070311	BORGHOF B	219801	Hypermedia structuren en systemen	6	2003	1
1070311	BORGHOF B	232011	Architectuur van informatiesystemen	5	2003	4
1070311	BORGHOF B	232016	Prestatie-analyse van informatiesystemen	7	2002	4
1070311	BORGHOF B	232050	Electronic Commerce	7	2002	4
1070311	BORGHOF B	232055	XML-technologie in E-Commerce	8	2003	1
1070311	BORGHOF B	232060	Multi-agent systemen	6	2003	4
1070311	BORGHOF B	232085	Voortgezette Requirements Engineering	6	2003	4
1070311	BORGHOF B	237201	Oriëntatie ICT	4	2003	4
1070311	BORGHOF B	237400	BedrijfsProces Ondersteuning	7	2003	1
1070311	BORGHOF B	265201	Middleware for distributed objects	6	2003	3
1072977	PIERIUS B P	121000	Instrumentatie van embedded systemen	4	2003	3
1072977	PIERIUS B P	121007	Elektromagnetische Veldtheorie	4	2002	1
1072977	PIERIUS B P	121008	Practicum Elektromagnetische Veldtheorie	4	2002	4
1072977	PIERIUS B P	121017	D1-project	5	2003	4
1072977	PIERIUS B P	121021	Inleiding in de biomedische technologie	7	2003	2
1072977	PIERIUS B P	121045	Project Mechatronica	7	2001	4
1072977	PIERIUS B P	121053	Zekere- en onzekere informatie	2	2003	2
1072977	PIERIUS B P	121067	Signaal analyse practicum	9	2002	4
1072977	PIERIUS B P	121706	Halfgeleiderdevices	7	2003	1
1072977	PIERIUS B P	121709	Reliability Engineering	8	2003	4
1072977	PIERIUS B P	121709	Reliability Engineering	6	2003	2
1072977	PIERIUS B P	121714	I.C. technologie	7	2003	4
1072977	PIERIUS B P	121717	Advanced semiconductor devices	6	2003	3
1072977	PIERIUS B P	122733	VLSI signal processing	4	2003	2
1072977	PIERIUS B P	122816	Mechanica en transductietechniek	8	2003	4
1072977	PIERIUS B P	122829	Systemen en technieken voor informatieopslag	5	2003	1
1072977	PIERIUS B P	122831	Geintegreerde optica	5	2002	4
1072977	PIERIUS B P	123140	Inleiding systeem- en signaaltheorie voor HBO	9	2003	3
1072977	PIERIUS B P	123152	Signal processing in acoustics and audio	4	2002	4
1072977	PIERIUS B P	124151	Mechatronica	5	2002	4
1072977	PIERIUS B P	124177	Inleiding elektrische energietechniek	8	2002	4
1072977	PIERIUS B P	124177	Inleiding elektrische energietechniek	6	2003	3
1072977	PIERIUS B P	124177	Inleiding elektrische energietechniek	6	2002	1
1072977	PIERIUS B P	127113	Elektrofysiologische signalen en bio-electriciteit	6	2003	1
1072977	PIERIUS B P	127116	Elektromagnetisme I voor HBO	8	2003	3
1072977	PIERIUS B P	127116	Elektromagnetisme I voor HBO	2	2003	2
1072977	PIERIUS B P	127117	Biomechatronica	7	2002	3
1072977	PIERIUS B P	129357	Deelname aan een project	7	2003	4
1072977	PIERIUS B P	150700	Introduction to operations research	7	2003	4
1072977	PIERIUS B P	150810	Modelling project	8	2003	3
1072977	PIERIUS B P	150910	Advanced modelling	7	2003	4
1072977	PIERIUS B P	151004	Calculus II-A	6	2003	4
1072977	PIERIUS B P	151018	Analyse A	7	2003	3
1072977	PIERIUS B P	151033	Numerieke analyse	6	2003	3
1072977	PIERIUS B P	151043	Seminarium mathematische fysica	7	2003	4
1072977	PIERIUS B P	151070	Kwantitatieve methoden	6	2002	4
1072977	PIERIUS B P	151070	Kwantitatieve methoden	4	2003	1
1072977	PIERIUS B P	151083	Wiskunde III	9	2003	3
1072977	PIERIUS B P	151130	Wiskunde II	6	2003	4
1072977	PIERIUS B P	151140	Wiskunde III	9	2003	3
1072977	PIERIUS B P	151210	Wiskunde A	3	2003	4
1072977	PIERIUS B P	151215	Wiskunde B	9	2003	4
1072977	PIERIUS B P	152025	Complexe functietheorie	4	2003	3
1072977	PIERIUS B P	152026	Calculus I	7	2003	3
1072977	PIERIUS B P	152066	Capita selecta analyse	6	2003	3
1072977	PIERIUS B P	152130	Fundamentele analyse	9	2003	3
1072977	PIERIUS B P	153038	Wiskundige statistiek	7	2003	4
1072977	PIERIUS B P	153039	Kansrekening en statistiek	9	2003	3
1072977	PIERIUS B P	154021	Numerieke wiskunde en programmeermethoden	4	2003	3
1072977	PIERIUS B P	154023	Numerieke wiskunde en programmeermethoden	1	2003	3
1072977	PIERIUS B P	156014	Analyse B	1	2003	4
1072977	PIERIUS B P	156029	Analyse C	6	2003	3
1072977	PIERIUS B P	156066	Besturingstheorie van economische systemen	2	2003	4
1072977	PIERIUS B P	156080	Signalen en transformaties	2	2003	3
1072977	PIERIUS B P	157035	Financial Econometrics	7	2003	3
1072977	PIERIUS B P	158025	Mathematische programmering I	8	2003	3
1072977	PIERIUS B P	211032	Seminarium Taal, Kennis & Interactie	8	2003	4
1072977	PIERIUS B P	211054	Computersystemen	4	2003	2
1072977	PIERIUS B P	211108	Bijzondere onderwerpen uit de logica	1	2003	4
1072977	PIERIUS B P	211180	Basismodellen in de informatica	9	2003	4
1072977	PIERIUS B P	211180	Basismodellen in de informatica	6	2003	2
1072977	PIERIUS B P	213530	Concurrent and distributed programming	4	2003	4
1072977	PIERIUS B P	214011	Tool Architectuur	6	2003	4
1072977	PIERIUS B P	214025	Algoritmen,datastructuren en complexiteit plus	4	2003	4
1072977	PIERIUS B P	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2003	3
1072977	PIERIUS B P	219803	Neurale netwerken	4	2003	4
1072977	PIERIUS B P	234007	Systemen voor cooperatief werk	7	2003	4
1072977	PIERIUS B P	234010	Invoering van IT in organisaties	6	2003	2
1072977	PIERIUS B P	234026	Voortgezette informatiesysteemmodellering	7	2003	4
1072977	PIERIUS B P	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1072977	PIERIUS B P	237600	Business Case Development for IT-projects	9	2003	3
1072977	PIERIUS B P	237600	Business Case Development for IT-projects	7	2003	1
1072977	PIERIUS B P	262001	Mobile and wireless networking	6	2003	2
1072977	PIERIUS B P	262020	Bijzondere onderwerpen Telematica	8	2003	1
1073805	MEIJER L E	121000	Instrumentatie van embedded systemen	6	2003	3
1073805	MEIJER L E	121008	Practicum Elektromagnetische Veldtheorie	6	2002	1
1073805	MEIJER L E	121017	D1-project	5	2003	4
1073805	MEIJER L E	121021	Inleiding in de biomedische technologie	5	2003	4
1073805	MEIJER L E	121025	Digitale beeldbewerking voor beta	8	2003	3
1073805	MEIJER L E	121026	Hands-on dig.image proces. and graphical pres.	5	2002	3
1073805	MEIJER L E	121045	Project Mechatronica	8	2002	4
1073805	MEIJER L E	121045	Project Mechatronica	4	2003	1
1073805	MEIJER L E	121051	Informatie Opslag	2	2003	3
1073805	MEIJER L E	121062	Eind P-project	7	2003	4
1073805	MEIJER L E	121067	Signaal analyse practicum	1	2003	2
1073805	MEIJER L E	121714	I.C. technologie	9	2003	2
1073805	MEIJER L E	122481	Systems engineering	9	2003	3
1073805	MEIJER L E	122634	Real-time software development	7	2003	3
1073805	MEIJER L E	122815	Materiaalkunde van microsystemen	8	2003	4
1073805	MEIJER L E	122821	Microtechnologie t.b.v. transducenten	4	2003	3
1073805	MEIJER L E	122828	Practicum realiseren in materialen	8	2003	1
1073805	MEIJER L E	122831	Geintegreerde optica	2	2002	4
1073805	MEIJER L E	122833	Integratieproject	9	2003	2
1073805	MEIJER L E	123112	Moderne modulatie- en detectietechnieken	6	2003	4
1073805	MEIJER L E	124153	Computer-aided design gereedschappen voor VLSI	4	2003	4
1073805	MEIJER L E	124176	Digitale Regeltechniek	4	2003	3
1073805	MEIJER L E	125152	Glasvezelcommunicatie	6	2003	3
1073805	MEIJER L E	125153	Inleiding communicatiesystemen	7	2003	3
1073805	MEIJER L E	125159	Optische communicatienetwerken	7	2003	4
1073805	MEIJER L E	125160	Mobiele communicatie	3	2003	3
1073805	MEIJER L E	127117	Biomechatronica	7	2001	3
1073805	MEIJER L E	127117	Biomechatronica	9	2002	3
1073805	MEIJER L E	127117	Biomechatronica	1	2003	2
1073805	MEIJER L E	129346	Verrichten van experimenteel werk	7	2003	4
1073805	MEIJER L E	129362	Start P-project	6	2003	2
1073805	MEIJER L E	150529	Wiskundig modelleren IV	1	2003	4
1073805	MEIJER L E	150529	Wiskundig modelleren IV	8	2003	1
1073805	MEIJER L E	150600	Mathematical methods	3	2003	3
1073805	MEIJER L E	150610	Statistics and probability	3	2003	3
1073805	MEIJER L E	150630	Applied functional analysis	6	2003	4
1073805	MEIJER L E	151007	Lineaire algebra	6	2003	4
1073805	MEIJER L E	151043	Seminarium mathematische fysica	6	2003	4
1073805	MEIJER L E	151082	Wiskunde II	6	2003	4
1073805	MEIJER L E	151092	Modelvorming II	5	2003	2
1073805	MEIJER L E	151093	Modelvorming III	5	2003	3
1073805	MEIJER L E	151220	Wiskunde C	6	2003	3
1073805	MEIJER L E	151510	Introduction to Risk Theory	4	2003	3
1073805	MEIJER L E	152027	Calculus II	4	2003	3
1073805	MEIJER L E	152066	Capita selecta analyse	7	2003	2
1073805	MEIJER L E	152070	Meetkunde	8	2003	4
1073805	MEIJER L E	152070	Meetkunde	7	2003	1
1073805	MEIJER L E	153003	Kansrekening	6	2003	3
1073805	MEIJER L E	153016	Voortgezette wiskundige statistiek	7	2003	3
1073805	MEIJER L E	153036	Statistiek II	9	2003	2
1073805	MEIJER L E	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	2
1073805	MEIJER L E	153110	Inleiding statistiek	4	2003	3
1073805	MEIJER L E	154021	Numerieke wiskunde en programmeermethoden	4	2003	3
1073805	MEIJER L E	154023	Numerieke wiskunde en programmeermethoden	3	2003	3
1073805	MEIJER L E	154023	Numerieke wiskunde en programmeermethoden	6	2003	1
1073805	MEIJER L E	155009	Fundamenten van de methode der eindige elementen	6	2003	3
1073805	MEIJER L E	155019	Practicum softwarepakketten PDV	5	2003	3
1073805	MEIJER L E	156062	Systeem- en besturingstheorie	7	2003	4
1073805	MEIJER L E	156066	Besturingstheorie van economische systemen	8	2003	4
1073805	MEIJER L E	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1073805	MEIJER L E	157035	Financial Econometrics	7	2003	3
1073805	MEIJER L E	159927	Doctoraalstage	6	2003	4
1073805	MEIJER L E	211054	Computersystemen	8	2003	3
1073805	MEIJER L E	211127	Formele analyse van natuurlijke taal	5	2003	4
1073805	MEIJER L E	211130	Ubiquitous Computing	5	2003	3
1073805	MEIJER L E	212018	Kennistechnologie voor bedrijfskundige toep.	8	2003	2
1073805	MEIJER L E	213002	Ontwerpen van digitale systemen	5	2003	4
1073805	MEIJER L E	213110	Computerorganisatie	8	2003	4
1073805	MEIJER L E	213500	Programmeren 1	9	2003	4
1073805	MEIJER L E	213505	Programmeren 2	6	2003	4
1073805	MEIJER L E	213520	Formele Methoden voor Software Engineering	4	2003	4
1073805	MEIJER L E	232016	Prestatie-analyse van informatiesystemen	2	2003	2
1073805	MEIJER L E	232085	Voortgezette Requirements Engineering	5	2003	4
1073805	MEIJER L E	233035	Practicum Databases in Informatiesystemen	7	2002	1
1073805	MEIJER L E	234001	Productie-informatietechnologie	1	2003	3
1073805	MEIJER L E	234010	Invoering van IT in organisaties	8	2003	4
1073805	MEIJER L E	237400	BedrijfsProces Ondersteuning	9	2003	1
1073805	MEIJER L E	239981	Integratieproject	5	1998	3
1073805	MEIJER L E	239981	Integratieproject	5	2000	4
1073805	MEIJER L E	239981	Integratieproject	8	2002	1
1073805	MEIJER L E	262000	Telematicanetwerken	6	2003	4
1073805	MEIJER L E	264001	Telematics and business strategies	4	2003	4
1073805	MEIJER L E	265110	Protocol Engineering	7	2003	3
1073805	MEIJER L E	266100	Patterns of software development	6	2003	4
1073805	MEIJER L E	269001	Portfolio ontwerp	5	2003	4
1073805	MEIJER L E	269004	Refresher Logics, Probability,Databases and JAVA	2	2003	1
1077133	VOLLENBROEK N L	151019	Analyse B	9	2003	4
1077133	VOLLENBROEK N L	151043	Seminarium mathematische fysica	4	2003	4
1077133	VOLLENBROEK N L	151070	Kwantitatieve methoden	9	2002	4
1077133	VOLLENBROEK N L	151082	Wiskunde II	5	2003	4
1077133	VOLLENBROEK N L	151091	Modelvorming I	8	2003	1
1077133	VOLLENBROEK N L	151202	Calculus B	6	2003	3
1077133	VOLLENBROEK N L	151530	Continuous Time Finance	3	2003	4
1077133	VOLLENBROEK N L	152027	Calculus II	8	2003	3
1077133	VOLLENBROEK N L	152030	Tensoranalyse	7	2003	3
1077133	VOLLENBROEK N L	152070	Meetkunde	8	2003	1
1077133	VOLLENBROEK N L	153029	Statistiek II	4	2003	4
1077133	VOLLENBROEK N L	153041	Inleiding statistiek	6	2003	4
1077133	VOLLENBROEK N L	154023	Numerieke wiskunde en programmeermethoden	9	2003	3
1077133	VOLLENBROEK N L	154023	Numerieke wiskunde en programmeermethoden	7	2003	1
1077133	VOLLENBROEK N L	155009	Fundamenten van de methode der eindige elementen	8	2003	3
1077133	VOLLENBROEK N L	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	8	2003	1
1077133	VOLLENBROEK N L	155019	Practicum softwarepakketten PDV	4	2003	3
1077133	VOLLENBROEK N L	156014	Analyse B	4	2003	4
1077133	VOLLENBROEK N L	156057	Inleiding wiskundige systeemtheorie	7	2003	4
1077133	VOLLENBROEK N L	157035	Financial Econometrics	8	2003	3
1077133	VOLLENBROEK N L	211038	Spraak- en taaltechnologie	6	2002	3
1077133	VOLLENBROEK N L	211078	Database-ontwerp	9	2003	4
1077133	VOLLENBROEK N L	211081	Distributed E-business Techniques	6	2003	1
1077133	VOLLENBROEK N L	211090	Databasetoepassingen	9	2003	4
1077133	VOLLENBROEK N L	211097	Bijzondere onderwerpen gegevensbanken	9	2003	3
1077133	VOLLENBROEK N L	211109	Voortgezette logica	7	2003	3
1077133	VOLLENBROEK N L	211123	Component- en aspect georienteerd progammeren	4	2003	3
1077133	VOLLENBROEK N L	211127	Formele analyse van natuurlijke taal	3	2003	4
1077133	VOLLENBROEK N L	211128	Informatica en taal	4	2003	4
1077133	VOLLENBROEK N L	211133	Ontwerpen van Software Architecturen	5	2003	3
1077133	VOLLENBROEK N L	212010	Informatiesystemen	6	2003	1
1077133	VOLLENBROEK N L	212018	Kennistechnologie voor bedrijfskundige toep.	1	2003	2
1077133	VOLLENBROEK N L	213012	Hardware/software co-design	8	2003	2
1077133	VOLLENBROEK N L	213125	Computersystemen	8	2003	4
1077133	VOLLENBROEK N L	214030	Artificial Intelligence	9	2002	1
1077133	VOLLENBROEK N L	214030	Artificial Intelligence	5	2003	2
1077133	VOLLENBROEK N L	219801	Hypermedia structuren en systemen	1	2003	1
1077133	VOLLENBROEK N L	219910	Ontwerpproject	5	2003	3
1077133	VOLLENBROEK N L	232020	Data warehousing & data mining	8	2003	4
1077133	VOLLENBROEK N L	232050	Electronic Commerce	9	2002	4
1077133	VOLLENBROEK N L	232050	Electronic Commerce	5	2003	4
1077133	VOLLENBROEK N L	232055	XML-technologie in E-Commerce	3	2003	4
1077133	VOLLENBROEK N L	232060	Multi-agent systemen	7	2003	4
1077133	VOLLENBROEK N L	232080	Requirements Engineering	1	2003	3
1077133	VOLLENBROEK N L	233030	Specificeren van informatiesystemen	8	2003	3
1077133	VOLLENBROEK N L	235005	Inleiding bedrijfsinformatiesystemen	3	2003	3
1077133	VOLLENBROEK N L	239801	BIT-BV 2	6	2003	4
1077133	VOLLENBROEK N L	239981	Integratieproject	6	2003	3
1077133	VOLLENBROEK N L	239981	Integratieproject	7	2001	2
1077133	VOLLENBROEK N L	262001	Mobile and wireless networking	8	2003	2
1077133	VOLLENBROEK N L	263200	Gedistribueerde multimedia database systemen	8	2003	4
1077133	VOLLENBROEK N L	264000	Telematicatoepassingen	3	2003	3
1077133	VOLLENBROEK N L	265200	Implementatie van telematicasystemen	4	2003	1
1077133	VOLLENBROEK N L	266100	Patterns of software development	7	2003	4
1077961	DE JONG H A	121003	Elektronische functies	7	2003	3
1077961	DE JONG H A	121006	Practicum Meetinstrumenten/Netwerkanalyse	8	2003	3
1077961	DE JONG H A	121007	Elektromagnetische Veldtheorie	4	2003	3
1077961	DE JONG H A	121008	Practicum Elektromagnetische Veldtheorie	5	2002	1
1077961	DE JONG H A	121018	Stage	8	2003	3
1077961	DE JONG H A	121019	D-opdracht	7	2003	3
1077961	DE JONG H A	121041	Elektrodynamica	8	2003	2
1077961	DE JONG H A	121045	Project Mechatronica	2	2001	4
1077961	DE JONG H A	121049	Practicum Medische Elektronica	8	2003	3
1077961	DE JONG H A	121052	Imaging	5	2003	3
1077961	DE JONG H A	121054	Neurotechnologie	8	2003	4
1077961	DE JONG H A	121706	Halfgeleiderdevices	9	2003	3
1077961	DE JONG H A	121709	Reliability Engineering	4	2003	2
1077961	DE JONG H A	122230	Integrated circuits and systems for mixed signals	9	2003	4
1077961	DE JONG H A	122481	Systems engineering	6	2003	3
1077961	DE JONG H A	122816	Mechanica en transductietechniek	1	2003	4
1077961	DE JONG H A	122816	Mechanica en transductietechniek	3	2002	2
1077961	DE JONG H A	122816	Mechanica en transductietechniek	3	2003	2
1077961	DE JONG H A	122821	Microtechnologie t.b.v. transducenten	5	2003	3
1077961	DE JONG H A	122830	Micro electro mechanische systemen	5	2003	4
1077961	DE JONG H A	123112	Moderne modulatie- en detectietechnieken	5	2003	4
1077961	DE JONG H A	123140	Inleiding systeem- en signaaltheorie voor HBO	6	2003	3
1077961	DE JONG H A	123153	Embedded Signal Processing	5	2003	1
1077961	DE JONG H A	125118	Practicum informatie-overdracht	4	2003	2
1077961	DE JONG H A	125159	Optische communicatienetwerken	8	2003	4
1077961	DE JONG H A	129344	Literatuuronderzoek	5	2003	3
1077961	DE JONG H A	129347	Deelname aan een project	5	2003	4
1077961	DE JONG H A	129351	Fysiologie II	6	2003	1
1077961	DE JONG H A	151015	Numerieke lineaire algebra	6	2003	3
1077961	DE JONG H A	151043	Seminarium mathematische fysica	9	2003	4
1077961	DE JONG H A	151044	Analyse C	8	2003	3
1077961	DE JONG H A	151051	Fundamentele analyse I	7	2003	1
1077961	DE JONG H A	151070	Kwantitatieve methoden	7	2003	3
1077961	DE JONG H A	151070	Kwantitatieve methoden	4	2003	1
1077961	DE JONG H A	151073	Calculus III	5	2003	4
1077961	DE JONG H A	151092	Modelvorming II	7	2003	2
1077961	DE JONG H A	151140	Wiskunde III	5	2003	3
1077961	DE JONG H A	151510	Introduction to Risk Theory	5	2003	3
1077961	DE JONG H A	152027	Calculus II	5	2003	3
1077961	DE JONG H A	152038	Grafentheorie	4	2003	2
1077961	DE JONG H A	152100	Calculus I	4	2003	4
1077961	DE JONG H A	153006	Kansrekening	5	2003	3
1077961	DE JONG H A	153008	Kansrekening en statistiek	8	2003	3
1077961	DE JONG H A	153023	Statistiek II voor TBK	5	2003	3
1077961	DE JONG H A	153083	Stochastische modellen in productie en logistiek	6	2003	2
1077961	DE JONG H A	153084	Analyse en besturing van productie systemen	9	2003	3
1077961	DE JONG H A	153088	Stochastische modellen voor Operations Management	7	2003	3
1077961	DE JONG H A	153110	Inleiding statistiek	4	2003	3
1077961	DE JONG H A	153120	Statistiek	4	2003	4
1077961	DE JONG H A	154021	Numerieke wiskunde en programmeermethoden	7	2003	3
1077961	DE JONG H A	154021	Numerieke wiskunde en programmeermethoden	6	2003	1
1077961	DE JONG H A	156012	Gewone differentiaalvergelijkingen	8	2003	3
1077961	DE JONG H A	156080	Signalen en transformaties	5	2003	3
1077961	DE JONG H A	157030	Structured Products	4	2003	3
1077961	DE JONG H A	157035	Financial Econometrics	1	2003	3
1077961	DE JONG H A	158006	Operationele research II	1	2003	4
1077961	DE JONG H A	211022	Programmeren in C++	8	2003	3
1077961	DE JONG H A	211038	Spraak- en taaltechnologie	6	2003	1
1077961	DE JONG H A	211081	Distributed E-business Techniques	9	2003	3
1077961	DE JONG H A	211095	Gedistribueerde databases & middleware technologie	4	2003	4
1077961	DE JONG H A	211096	XML & Databases	3	2003	1
1077961	DE JONG H A	211123	Component- en aspect georienteerd progammeren	9	2003	3
1077961	DE JONG H A	211185	Taal- en rekenmodellen	6	2003	4
1077961	DE JONG H A	213011	Gedistribueerde systemen	7	2003	4
1077961	DE JONG H A	213110	Computerorganisatie	9	2003	4
1077961	DE JONG H A	214010	Complexiteit van berekeningen	5	2003	3
1077961	DE JONG H A	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2001	3
1077961	DE JONG H A	214500	Communicatie en ontwerpen in ICT-projecten 1	1	2002	3
1077961	DE JONG H A	214510	MMI-project	4	2003	3
1077961	DE JONG H A	214511	Database Project	4	2003	3
1077961	DE JONG H A	214513	Internet & Web Architecturen	6	2002	2
1077961	DE JONG H A	219801	Hypermedia structuren en systemen	5	2003	4
1077961	DE JONG H A	232020	Data warehousing & data mining	7	2002	3
1077961	DE JONG H A	232020	Data warehousing & data mining	5	2003	2
1077961	DE JONG H A	232050	Electronic Commerce	1	2002	4
1077961	DE JONG H A	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1077961	DE JONG H A	239981	Integratieproject	3	2001	2
1077961	DE JONG H A	239981	Integratieproject	6	2003	2
1077961	DE JONG H A	261000	Telematicasystemen en toepassingen	5	2003	2
1077961	DE JONG H A	262020	Bijzondere onderwerpen Telematica	2	2003	4
1078214	SCHAEY G B	121002	Practicum elektronische basisschakelingen	8	2003	1
1078214	SCHAEY G B	121028	Computer vision	6	2003	4
1078214	SCHAEY G B	121035	Mid P-project	7	2003	3
1078214	SCHAEY G B	121041	Elektrodynamica	8	2003	4
1078214	SCHAEY G B	121049	Practicum Medische Elektronica	6	2003	3
1078214	SCHAEY G B	121062	Eind P-project	5	2003	4
1078214	SCHAEY G B	121067	Signaal analyse practicum	4	2003	2
1078214	SCHAEY G B	121714	I.C. technologie	4	2003	2
1078214	SCHAEY G B	122227	Voortgezette analoge IC elektronica	5	2003	2
1078214	SCHAEY G B	122733	VLSI signal processing	4	2003	2
1078214	SCHAEY G B	122815	Materiaalkunde van microsystemen	1	2003	2
1078214	SCHAEY G B	122828	Practicum realiseren in materialen	5	2003	1
1078214	SCHAEY G B	122830	Micro electro mechanische systemen	7	2003	4
1078214	SCHAEY G B	122831	Geintegreerde optica	8	2003	2
1078214	SCHAEY G B	123152	Signal processing in acoustics and audio	8	2003	3
1078214	SCHAEY G B	123152	Signal processing in acoustics and audio	9	2003	1
1078214	SCHAEY G B	124113	Optimal estimation in dynamic systems	8	2003	3
1078214	SCHAEY G B	124151	Mechatronica	6	2003	2
1078214	SCHAEY G B	124177	Inleiding elektrische energietechniek	6	2002	4
1078214	SCHAEY G B	125151	Schakel- en controlesystemen v. Multi-service netw	7	2003	3
1078214	SCHAEY G B	125156	Transmissiemedia- en systemen	9	2003	4
1078214	SCHAEY G B	125159	Optische communicatienetwerken	6	2003	4
1078214	SCHAEY G B	127116	Elektromagnetisme I voor HBO	3	2003	3
1078214	SCHAEY G B	127116	Elektromagnetisme I voor HBO	4	2003	2
1078214	SCHAEY G B	127117	Biomechatronica	4	2003	3
1078214	SCHAEY G B	129344	Literatuuronderzoek	9	2003	3
1078214	SCHAEY G B	150527	Wiskundig modelleren II	5	2003	3
1078214	SCHAEY G B	150610	Statistics and probability	9	2003	3
1078214	SCHAEY G B	150620	Systems and signals	4	2003	3
1078214	SCHAEY G B	151012	Calculus I	7	2003	4
1078214	SCHAEY G B	151073	Calculus III	5	2003	4
1078214	SCHAEY G B	151088	Practicum Wiskundig modelleren	6	2003	4
1078214	SCHAEY G B	151092	Modelvorming II	7	2003	4
1078214	SCHAEY G B	151120	Wiskunde I	4	2003	4
1078214	SCHAEY G B	151140	Wiskunde III	6	2003	3
1078214	SCHAEY G B	151204	Calculus C	9	2003	4
1078214	SCHAEY G B	152027	Calculus II	5	2003	2
1078214	SCHAEY G B	152120	Lineaire algebra	1	2003	4
1078214	SCHAEY G B	153029	Statistiek II	7	2003	4
1078214	SCHAEY G B	153039	Kansrekening en statistiek	5	2003	3
1078214	SCHAEY G B	153080	Stochastische modellen in de operationele research	7	2003	4
1078214	SCHAEY G B	153081	Stochastische modellen v. telecommunicatie syst.	6	2003	3
1078214	SCHAEY G B	153100	Statistiek	6	2003	3
1078214	SCHAEY G B	153110	Inleiding statistiek	1	2003	3
1078214	SCHAEY G B	153120	Statistiek	5	2003	4
1078214	SCHAEY G B	154021	Numerieke wiskunde en programmeermethoden	7	2003	3
1078214	SCHAEY G B	154021	Numerieke wiskunde en programmeermethoden	1	2003	1
1078214	SCHAEY G B	156012	Gewone differentiaalvergelijkingen	1	2003	3
1078214	SCHAEY G B	157008	Stochastische processen in dynamische systemen	3	2003	3
1078214	SCHAEY G B	159927	Doctoraalstage	4	2003	4
1078214	SCHAEY G B	211022	Programmeren in C++	6	2003	3
1078214	SCHAEY G B	211024	Programmeren in C++	4	2003	4
1078214	SCHAEY G B	211054	Computersystemen	9	2003	3
1078214	SCHAEY G B	211054	Computersystemen	5	2003	2
1078214	SCHAEY G B	211111	Parallelle processen	1	2003	3
1078214	SCHAEY G B	211123	Component- en aspect georienteerd progammeren	5	2003	1
1078214	SCHAEY G B	211131	Statische Objectanalyse en Typering	8	2003	4
1078214	SCHAEY G B	211180	Basismodellen in de informatica	5	2003	2
1078214	SCHAEY G B	212018	Kennistechnologie voor bedrijfskundige toep.	8	2003	4
1078214	SCHAEY G B	213002	Ontwerpen van digitale systemen	5	2003	4
1078214	SCHAEY G B	213009	Fouten tolererende digitale systemen	4	2003	4
1078214	SCHAEY G B	213014	Procesbesturing en robotica	8	2003	3
1078214	SCHAEY G B	213120	Inleiding informatie- en communicatietechnologie	7	2003	2
1078214	SCHAEY G B	213500	Programmeren 1	5	2003	4
1078214	SCHAEY G B	213540	Advanced Design of Software Architectures	8	2002	4
1078214	SCHAEY G B	214010	Complexiteit van berekeningen	8	2003	3
1078214	SCHAEY G B	214030	Artificial Intelligence	6	2003	4
1078214	SCHAEY G B	214030	Artificial Intelligence	2	2003	2
1078214	SCHAEY G B	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2003	3
1078214	SCHAEY G B	214513	Internet & Web Architecturen	4	2002	4
1078214	SCHAEY G B	232016	Prestatie-analyse van informatiesystemen	1	2003	2
1078214	SCHAEY G B	237201	Oriëntatie ICT	6	2002	2
1078214	SCHAEY G B	239981	Integratieproject	9	2003	3
1078214	SCHAEY G B	239981	Integratieproject	8	1999	1
1078214	SCHAEY G B	239981	Integratieproject	1	2000	1
1078214	SCHAEY G B	261010	Computer netwerken	1	2003	3
1078214	SCHAEY G B	264001	Telematics and business strategies	8	2003	4
1078214	SCHAEY G B	265300	Operationeel management van telematicasystemen	6	2003	3
1078214	SCHAEY G B	265310	Internet management architecturen	8	2003	3
1078214	SCHAEY G B	266100	Patterns of software development	8	2003	2
1079199	ELSINGA E	121002	Practicum elektronische basisschakelingen	8	2003	3
1079199	ELSINGA E	121006	Practicum Meetinstrumenten/Netwerkanalyse	9	2003	3
1079199	ELSINGA E	121007	Elektromagnetische Veldtheorie	3	2002	4
1079199	ELSINGA E	121007	Elektromagnetische Veldtheorie	6	2002	1
1079199	ELSINGA E	121008	Practicum Elektromagnetische Veldtheorie	2	2002	4
1079199	ELSINGA E	121021	Inleiding in de biomedische technologie	8	2002	4
1079199	ELSINGA E	121021	Inleiding in de biomedische technologie	7	2003	2
1079199	ELSINGA E	121026	Hands-on dig.image proces. and graphical pres.	6	2002	3
1079199	ELSINGA E	121035	Mid P-project	9	2003	3
1079199	ELSINGA E	121053	Zekere- en onzekere informatie	4	2003	3
1079199	ELSINGA E	121067	Signaal analyse practicum	6	2003	4
1079199	ELSINGA E	122227	Voortgezette analoge IC elektronica	6	2003	2
1079199	ELSINGA E	122833	Integratieproject	8	2003	2
1079199	ELSINGA E	123152	Signal processing in acoustics and audio	9	2003	1
1079199	ELSINGA E	123153	Embedded Signal Processing	4	2003	1
1079199	ELSINGA E	125119	Signaaltheorie	1	2003	4
1079199	ELSINGA E	125153	Inleiding communicatiesystemen	5	2003	3
1079199	ELSINGA E	125160	Mobiele communicatie	4	2003	3
1079199	ELSINGA E	127116	Elektromagnetisme I voor HBO	7	2003	2
1079199	ELSINGA E	129362	Start P-project	7	2003	2
1079199	ELSINGA E	150630	Applied functional analysis	6	2003	4
1079199	ELSINGA E	150700	Introduction to operations research	8	2003	4
1079199	ELSINGA E	150730	Experimental design	4	2003	3
1079199	ELSINGA E	150910	Advanced modelling	7	2003	4
1079199	ELSINGA E	151025	Functionaalanalyse II	7	2003	3
1079199	ELSINGA E	151043	Seminarium mathematische fysica	9	2003	1
1079199	ELSINGA E	151072	Wiskunde II	1	2003	1
1079199	ELSINGA E	151086	Vectoranalyse voor BMT	2	2003	3
1079199	ELSINGA E	151210	Wiskunde A	4	2003	4
1079199	ELSINGA E	152070	Meetkunde	5	2003	1
1079199	ELSINGA E	153002	Discrete kansrekening	7	2003	3
1079199	ELSINGA E	153033	Statistiek	6	2003	4
1079199	ELSINGA E	153034	Kansrekening en statistiek	7	2003	3
1079199	ELSINGA E	153055	Parametervrije statistische methoden	5	2003	3
1079199	ELSINGA E	153083	Stochastische modellen in productie en logistiek	6	2003	3
1079199	ELSINGA E	153084	Analyse en besturing van productie systemen	3	2003	3
1079199	ELSINGA E	153088	Stochastische modellen voor Operations Management	8	2003	3
1079199	ELSINGA E	153110	Inleiding statistiek	6	2003	3
1079199	ELSINGA E	153135	Statistical techniques	3	2003	4
1079199	ELSINGA E	154023	Numerieke wiskunde en programmeermethoden	5	2003	1
1093449	JANSEN W J	152068	Discrete wiskunde	2	2003	2
1083842	BOOSE E	237201	Oriëntatie ICT	2	2002	3
1079199	ELSINGA E	155009	Fundamenten van de methode der eindige elementen	7	2003	3
1079199	ELSINGA E	156037	Applied Analytical Methods	7	2003	3
1079199	ELSINGA E	156066	Besturingstheorie van economische systemen	5	2003	4
1079199	ELSINGA E	156080	Signalen en transformaties	5	2003	3
1079199	ELSINGA E	157016	Stochastische filter- en besturingstheorie	9	2003	3
1079199	ELSINGA E	158025	Mathematische programmering I	6	2003	3
1079199	ELSINGA E	211027	Inleiding programmeren met MATLAB	2	2003	3
1079199	ELSINGA E	211038	Spraak- en taaltechnologie	4	2003	4
1079199	ELSINGA E	211054	Computersystemen	4	2003	3
1079199	ELSINGA E	211054	Computersystemen	4	2003	2
1079199	ELSINGA E	211123	Component- en aspect georienteerd progammeren	9	2003	1
1079199	ELSINGA E	211127	Formele analyse van natuurlijke taal	1	2003	4
1079199	ELSINGA E	212010	Informatiesystemen	6	2003	1
1079199	ELSINGA E	212018	Kennistechnologie voor bedrijfskundige toep.	6	2003	4
1079199	ELSINGA E	213005	Computerarchitectuur	8	2003	4
1079199	ELSINGA E	213120	Inleiding informatie- en communicatietechnologie	5	2003	2
1079199	ELSINGA E	213540	Advanced Design of Software Architectures	8	2003	1
1079199	ELSINGA E	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2001	3
1079199	ELSINGA E	214511	Database Project	5	2003	3
1079199	ELSINGA E	214513	Internet & Web Architecturen	9	2002	2
1079199	ELSINGA E	219803	Neurale netwerken	9	2003	4
1079199	ELSINGA E	232016	Prestatie-analyse van informatiesystemen	5	2003	3
1079199	ELSINGA E	232020	Data warehousing & data mining	8	2003	2
1079199	ELSINGA E	232050	Electronic Commerce	9	2003	4
1079199	ELSINGA E	232081	Requirements Engineering	6	2003	4
1079199	ELSINGA E	234020	Ontwerpen van mens-machine interactie	9	2003	4
1079199	ELSINGA E	237201	Oriëntatie ICT	5	2003	4
1079199	ELSINGA E	237201	Oriëntatie ICT	7	2003	2
1079199	ELSINGA E	237400	BedrijfsProces Ondersteuning	5	2003	3
1079199	ELSINGA E	239981	Integratieproject	2	2001	2
1079199	ELSINGA E	269001	Portfolio ontwerp	1	2003	4
1079991	SMIT C	263100	Mobile E-health application and services	9	2003	4
1079991	SMIT C	263200	Gedistribueerde multimedia database systemen	6	2003	4
1079991	SMIT C	265300	Operationeel management van telematicasystemen	2	2003	3
1079991	SMIT C	265310	Internet management architecturen	9	2003	3
1079991	SMIT C	266100	Patterns of software development	9	2003	4
1080294	JANSDR C	121002	Practicum elektronische basisschakelingen	3	2003	3
1080294	JANSDR C	121007	Elektromagnetische Veldtheorie	8	2002	1
1080294	JANSDR C	121007	Elektromagnetische Veldtheorie	9	2003	1
1080294	JANSDR C	121026	Hands-on dig.image proces. and graphical pres.	6	2002	3
1080294	JANSDR C	121028	Computer vision	3	2003	4
1080294	JANSDR C	121045	Project Mechatronica	7	2002	2
1080294	JANSDR C	121053	Zekere- en onzekere informatie	9	2003	3
1080294	JANSDR C	121706	Halfgeleiderdevices	2	2003	3
1080294	JANSDR C	121709	Reliability Engineering	2	2002	4
1080294	JANSDR C	121717	Advanced semiconductor devices	9	2003	3
1080294	JANSDR C	122634	Real-time software development	7	2003	3
1080294	JANSDR C	122821	Microtechnologie t.b.v. transducenten	5	2003	3
1080294	JANSDR C	122829	Systemen en technieken voor informatieopslag	7	2003	1
1080294	JANSDR C	122830	Micro electro mechanische systemen	3	2003	4
1080294	JANSDR C	122833	Integratieproject	4	2003	2
1080294	JANSDR C	123112	Moderne modulatie- en detectietechnieken	5	2003	4
1080294	JANSDR C	124151	Mechatronica	8	2003	2
1080294	JANSDR C	125113	Analoge communicatietechniek	8	2003	4
1080294	JANSDR C	125114	Prestatieanalyse van communicatienetwerken	9	2003	4
1080294	JANSDR C	125152	Glasvezelcommunicatie	8	2003	3
1080294	JANSDR C	125156	Transmissiemedia- en systemen	1	2003	4
1080294	JANSDR C	125159	Optische communicatienetwerken	3	2003	4
1080294	JANSDR C	125160	Mobiele communicatie	1	2003	3
1080294	JANSDR C	125163	Electromagnetische compatibiliteit	5	2003	4
1080294	JANSDR C	127113	Elektrofysiologische signalen en bio-electriciteit	4	2003	1
1080294	JANSDR C	127116	Elektromagnetisme I voor HBO	7	2003	2
1080294	JANSDR C	127117	Biomechatronica	7	2002	3
1080294	JANSDR C	129351	Fysiologie II	7	2003	1
1080294	JANSDR C	129354	Literatuuronderzoek	4	2003	4
1080294	JANSDR C	129367	Individual project	9	2003	3
1080294	JANSDR C	150433	Wiskundig modelleren voor CiT	6	2003	4
1080294	JANSDR C	150539	Maple practicum	5	2003	4
1080294	JANSDR C	150620	Systems and signals	7	2003	3
1080294	JANSDR C	151072	Wiskunde II	9	2003	4
1080294	JANSDR C	151080	Bijscholing wiskunde B2	4	2003	3
1080294	JANSDR C	151120	Wiskunde I	8	2003	4
1080294	JANSDR C	151140	Wiskunde III	9	2003	3
1080294	JANSDR C	151150	Wiskunde IV	9	2003	3
1080294	JANSDR C	151210	Wiskunde A	6	2003	4
1080294	JANSDR C	151250	Modellen en systemen	6	2003	4
1080294	JANSDR C	151520	Mathematical Finance	9	2003	4
1080294	JANSDR C	152028	Analyse A	8	2003	4
1080294	JANSDR C	152056	Combinatoriek	8	2003	4
1080294	JANSDR C	152068	Discrete wiskunde	9	2003	3
1080294	JANSDR C	152070	Meetkunde	5	2003	1
1080294	JANSDR C	152080	Deterministische en stochastische speltheorie	4	2003	1
1080294	JANSDR C	153021	Statistiek I voor TBK	4	2003	4
1080294	JANSDR C	153026	Asymptotische technieken in de statistiek	4	2003	3
1080294	JANSDR C	153029	Statistiek II	5	2003	4
1080294	JANSDR C	153032	Kansrekening en stochastische processen	7	2003	4
1080294	JANSDR C	153034	Kansrekening en statistiek	6	2003	3
1080294	JANSDR C	156037	Applied Analytical Methods	6	2003	3
1080294	JANSDR C	156067	Robust Control	4	2003	4
1080294	JANSDR C	157004	Stochastische processen in financien	6	2003	3
1080294	JANSDR C	157008	Stochastische processen in dynamische systemen	8	2003	3
1080294	JANSDR C	157016	Stochastische filter- en besturingstheorie	4	2003	3
1080294	JANSDR C	158006	Operationele research II	7	2003	4
1080294	JANSDR C	158018	Operationele research I, practicum	3	2003	4
1080294	JANSDR C	158038	Discrete optimalisering	9	2003	3
1080294	JANSDR C	158075	Deterministische modellen in de OR	9	2003	1
1080294	JANSDR C	159928	Doctoraalstage	4	2003	3
1080294	JANSDR C	211035	Vertalerbouw	1	2003	4
1080294	JANSDR C	211037	Graphics & Virtual Reality	4	2003	3
1080294	JANSDR C	211038	Spraak- en taaltechnologie	5	2001	3
1080294	JANSDR C	211038	Spraak- en taaltechnologie	6	2002	1
1080294	JANSDR C	211038	Spraak- en taaltechnologie	9	2003	1
1080294	JANSDR C	211045	Besturingssystemen	9	2003	2
1080294	JANSDR C	211095	Gedistribueerde databases & middleware technologie	6	2003	4
1080294	JANSDR C	211097	Bijzondere onderwerpen gegevensbanken	4	2003	3
1080294	JANSDR C	211131	Statische Objectanalyse en Typering	5	2003	4
1080294	JANSDR C	211185	Taal- en rekenmodellen	6	2003	1
1080294	JANSDR C	213130	Computer Organisatie INF/TEL	9	2003	3
1080294	JANSDR C	213530	Concurrent and distributed programming	7	2002	4
1080294	JANSDR C	213530	Concurrent and distributed programming	4	2003	4
1080294	JANSDR C	213530	Concurrent and distributed programming	4	2003	2
1080294	JANSDR C	213540	Advanced Design of Software Architectures	8	2003	3
1080294	JANSDR C	214012	Systeemvalidatie	9	2003	3
1080294	JANSDR C	214020	Algoritmen,datastructuren en complexiteit	5	2003	4
1080294	JANSDR C	214513	Internet & Web Architecturen	1	2003	4
1080294	JANSDR C	232016	Prestatie-analyse van informatiesystemen	4	2003	2
1080294	JANSDR C	232050	Electronic Commerce	3	2002	4
1080294	JANSDR C	232060	Multi-agent systemen	9	2003	4
1080294	JANSDR C	232060	Multi-agent systemen	8	2003	2
1080294	JANSDR C	232081	Requirements Engineering	5	2003	4
1080294	JANSDR C	233035	Practicum Databases in Informatiesystemen	7	2002	1
1080294	JANSDR C	234026	Voortgezette informatiesysteemmodellering	7	2003	4
1080294	JANSDR C	237201	Oriëntatie ICT	8	2002	3
1080294	JANSDR C	239981	Integratieproject	7	2000	4
1080294	JANSDR C	261000	Telematicasystemen en toepassingen	4	2003	2
1080294	JANSDR C	262020	Bijzondere onderwerpen Telematica	4	2003	1
1080294	JANSDR C	263000	Telematicadiensten	7	2003	4
1080294	JANSDR C	263200	Gedistribueerde multimedia database systemen	2	2003	4
1080294	JANSDR C	265300	Operationeel management van telematicasystemen	9	2003	3
1080294	JANSDR C	269004	Refresher Logics, Probability,Databases and JAVA	7	2003	1
1080354	WERNERS O	211097	Bijzondere onderwerpen gegevensbanken	8	2003	1
1080354	WERNERS O	211098	Databasetransacties en -processen	4	2003	3
1080354	WERNERS O	211109	Voortgezette logica	9	2003	3
1080354	WERNERS O	211113	Constraint Logic Programming	4	2003	4
1080354	WERNERS O	211180	Basismodellen in de informatica	7	2003	4
1080354	WERNERS O	213001	Basisbegrippen digitale techniek	5	2003	4
1080354	WERNERS O	213016	Bijzondere onderwerpen computerarchitectuur	6	2003	3
1080354	WERNERS O	213530	Concurrent and distributed programming	3	2003	4
1080354	WERNERS O	213540	Advanced Design of Software Architectures	6	2003	3
1080354	WERNERS O	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	1
1080354	WERNERS O	214510	MMI-project	7	2003	3
1080354	WERNERS O	214513	Internet & Web Architecturen	8	2002	4
1080354	WERNERS O	214513	Internet & Web Architecturen	6	2003	4
1080354	WERNERS O	219803	Neurale netwerken	6	2003	4
1080354	WERNERS O	219910	Ontwerpproject	5	2003	3
1080354	WERNERS O	232016	Prestatie-analyse van informatiesystemen	7	2002	4
1080354	WERNERS O	232016	Prestatie-analyse van informatiesystemen	8	2003	2
1080354	WERNERS O	232020	Data warehousing & data mining	6	2003	4
1080354	WERNERS O	232050	Electronic Commerce	7	2002	4
1080354	WERNERS O	232050	Electronic Commerce	4	2003	4
1080354	WERNERS O	234010	Invoering van IT in organisaties	7	2003	2
1080354	WERNERS O	235005	Inleiding bedrijfsinformatiesystemen	9	2003	3
1080354	WERNERS O	237600	Business Case Development for IT-projects	3	2003	1
1080354	WERNERS O	265201	Middleware for distributed objects	1	2003	3
1080354	WERNERS O	269000	Orientatie ICT	5	2003	3
1080354	WERNERS O	269100	P-project TEL	8	2003	4
1080779	SMIT R P	121003	Elektronische functies	6	2003	3
1080779	SMIT R P	121008	Practicum Elektromagnetische Veldtheorie	1	2003	3
1080779	SMIT R P	121021	Inleiding in de biomedische technologie	4	2002	4
1080779	SMIT R P	121022	Neurofysiologie	9	2003	4
1080779	SMIT R P	121033	Project "computer vision"	7	2003	3
1080779	SMIT R P	121035	Mid P-project	7	2003	3
1080779	SMIT R P	121035	Mid P-project	8	2003	1
1080779	SMIT R P	121041	Elektrodynamica	5	2003	4
1080779	SMIT R P	121043	Dynamische systemen	9	2003	4
1080779	SMIT R P	121045	Project Mechatronica	6	2003	3
1080779	SMIT R P	121045	Project Mechatronica	4	2003	1
1080779	SMIT R P	121049	Practicum Medische Elektronica	9	2003	3
1080779	SMIT R P	121053	Zekere- en onzekere informatie	7	2003	2
1080779	SMIT R P	121067	Signaal analyse practicum	1	2003	2
1080779	SMIT R P	121709	Reliability Engineering	8	2003	4
1080779	SMIT R P	121714	I.C. technologie	5	2003	2
1080779	SMIT R P	122634	Real-time software development	5	2003	3
1080779	SMIT R P	122733	VLSI signal processing	5	2003	4
1080779	SMIT R P	122733	VLSI signal processing	6	2003	2
1080779	SMIT R P	122828	Practicum realiseren in materialen	7	2003	1
1080779	SMIT R P	122831	Geintegreerde optica	4	2003	3
1080779	SMIT R P	124151	Mechatronica	1	2003	4
1080779	SMIT R P	124151	Mechatronica	7	2003	2
1080779	SMIT R P	124162	Modelvorming en simulatie	8	2003	4
1080779	SMIT R P	127115	Praktische biomedische signaalanalyse	8	2003	4
1080779	SMIT R P	127116	Elektromagnetisme I voor HBO	5	2003	3
1080779	SMIT R P	129347	Deelname aan een project	1	2003	4
1080779	SMIT R P	129355	Deelname aan een studiegroep	4	2003	3
1080779	SMIT R P	129357	Deelname aan een project	8	2003	4
1080779	SMIT R P	129367	Individual project	7	2003	2
1080779	SMIT R P	150529	Wiskundig modelleren IV	4	2003	1
1080779	SMIT R P	150532	Maple practicum	8	2003	4
1080779	SMIT R P	150630	Applied functional analysis	5	2003	4
1080779	SMIT R P	150710	Modelling project	1	2003	3
1080779	SMIT R P	151004	Calculus II-A	5	2003	4
1080779	SMIT R P	151005	Calculus II-B	7	2003	3
1080779	SMIT R P	151039	Algebra	5	2003	4
1080779	SMIT R P	151072	Wiskunde II	3	2003	4
1080779	SMIT R P	151085	Wiskunde I	3	2003	3
1080779	SMIT R P	151086	Vectoranalyse voor BMT	5	2003	3
1080779	SMIT R P	151093	Modelvorming III	8	2003	1
1080779	SMIT R P	151150	Wiskunde IV	9	2003	3
1080779	SMIT R P	151206	Lineaire Algebra A	6	2003	3
1080779	SMIT R P	151208	Lineaire Algebra B	5	2003	3
1080779	SMIT R P	151210	Wiskunde A	8	2003	1
1080779	SMIT R P	151530	Continuous Time Finance	7	2003	4
1080779	SMIT R P	152068	Discrete wiskunde	7	2003	3
1080779	SMIT R P	152080	Deterministische en stochastische speltheorie	8	2003	4
1080779	SMIT R P	153002	Discrete kansrekening	6	2003	3
1080779	SMIT R P	153016	Voortgezette wiskundige statistiek	9	2003	3
1080779	SMIT R P	153045	Lineaire statistische modellen	6	2003	4
1080779	SMIT R P	153080	Stochastische modellen in de operationele research	3	2003	4
1080779	SMIT R P	153110	Inleiding statistiek	6	2003	3
1080779	SMIT R P	155009	Fundamenten van de methode der eindige elementen	5	2003	3
1080779	SMIT R P	155019	Practicum softwarepakketten PDV	4	2003	3
1080779	SMIT R P	156014	Analyse B	6	2003	4
1080779	SMIT R P	157004	Stochastische processen in financien	4	2003	3
1080779	SMIT R P	157009	Tijdreeksenanalyse en identificatietheorie	8	2003	3
1080779	SMIT R P	158018	Operationele research I, practicum	2	2003	4
1080779	SMIT R P	159928	Doctoraalstage	9	2003	3
1080779	SMIT R P	211038	Spraak- en taaltechnologie	6	2001	3
1080779	SMIT R P	211045	Besturingssystemen	4	2003	3
1080779	SMIT R P	211098	Databasetransacties en -processen	7	2003	3
1080779	SMIT R P	211131	Statische Objectanalyse en Typering	6	2003	4
1080779	SMIT R P	211133	Ontwerpen van Software Architecturen	4	2003	3
1080779	SMIT R P	211180	Basismodellen in de informatica	8	2003	4
1080779	SMIT R P	212018	Kennistechnologie voor bedrijfskundige toep.	5	2003	2
1080779	SMIT R P	213001	Basisbegrippen digitale techniek	8	2003	2
1080779	SMIT R P	213110	Computerorganisatie	8	2003	1
1080779	SMIT R P	213130	Computer Organisatie INF/TEL	3	2003	2
1080779	SMIT R P	213505	Programmeren 2	7	2003	4
1080779	SMIT R P	213505	Programmeren 2	2	2003	1
1080779	SMIT R P	214030	Artificial Intelligence	8	2002	3
1080779	SMIT R P	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2002	1
1080779	SMIT R P	219801	Hypermedia structuren en systemen	9	2003	1
1080779	SMIT R P	219910	Ontwerpproject	9	2003	3
1080779	SMIT R P	232055	XML-technologie in E-Commerce	5	2003	1
1080779	SMIT R P	233030	Specificeren van informatiesystemen	9	2003	3
1080779	SMIT R P	237600	Business Case Development for IT-projects	9	2003	3
1080779	SMIT R P	239801	BIT-BV 2	9	2003	4
1080779	SMIT R P	239981	Integratieproject	9	2002	3
1080779	SMIT R P	239981	Integratieproject	4	2003	2
1080779	SMIT R P	261000	Telematicasystemen en toepassingen	1	2003	2
1080779	SMIT R P	265100	Ontwerpen van telematicasystemen	6	2003	1
1080779	SMIT R P	265201	Middleware for distributed objects	5	2003	2
1080779	SMIT R P	265400	Beveiliging van telematicasystemen	7	2003	3
1080779	SMIT R P	266100	Patterns of software development	3	2003	2
1080779	SMIT R P	269100	P-project TEL	3	2003	2
1081047	MEIJER N W	121003	Elektronische functies	4	2003	3
1081047	MEIJER N W	121008	Practicum Elektromagnetische Veldtheorie	3	2002	4
1081047	MEIJER N W	121008	Practicum Elektromagnetische Veldtheorie	5	2002	1
1081047	MEIJER N W	121035	Mid P-project	3	2003	3
1081047	MEIJER N W	121045	Project Mechatronica	5	2003	1
1081047	MEIJER N W	121067	Signaal analyse practicum	4	2002	4
1081047	MEIJER N W	121713	VLSI system design	4	2003	4
1081047	MEIJER N W	121714	I.C. technologie	3	2003	4
1081047	MEIJER N W	122226	Project voortgezette elektronica	4	2003	3
1081047	MEIJER N W	122815	Materiaalkunde van microsystemen	4	2003	2
1081047	MEIJER N W	122816	Mechanica en transductietechniek	4	2002	3
1081047	MEIJER N W	122816	Mechanica en transductietechniek	8	2003	2
1081047	MEIJER N W	122829	Systemen en technieken voor informatieopslag	4	2003	1
1081047	MEIJER N W	123112	Moderne modulatie- en detectietechnieken	8	2003	4
1081047	MEIJER N W	124177	Inleiding elektrische energietechniek	6	2002	4
1081047	MEIJER N W	124177	Inleiding elektrische energietechniek	2	2002	1
1081047	MEIJER N W	124177	Inleiding elektrische energietechniek	5	2003	1
1081047	MEIJER N W	125118	Practicum informatie-overdracht	4	2003	3
1081047	MEIJER N W	125151	Schakel- en controlesystemen v. Multi-service netw	8	2003	1
1081047	MEIJER N W	127117	Biomechatronica	6	2002	2
1081047	MEIJER N W	129362	Start P-project	4	2003	3
1081047	MEIJER N W	150432	Maple practicum II	6	2003	4
1081047	MEIJER N W	150910	Advanced modelling	8	2003	4
1081047	MEIJER N W	151004	Calculus II-A	4	2003	4
1081047	MEIJER N W	151005	Calculus II-B	4	2003	3
1081047	MEIJER N W	151012	Calculus I	5	2003	4
1081047	MEIJER N W	151014	Analyse A	6	2003	3
1081047	MEIJER N W	151020	Functionaalanalyse I	1	2003	3
1081047	MEIJER N W	151043	Seminarium mathematische fysica	4	2003	1
1081047	MEIJER N W	151052	Fundamentele analyse II	5	2003	3
1081047	MEIJER N W	151092	Modelvorming II	5	2003	4
1081047	MEIJER N W	151092	Modelvorming II	8	2003	2
1081047	MEIJER N W	151600	Modelleren en redeneren	8	2003	4
1081047	MEIJER N W	152068	Discrete wiskunde	6	2003	3
1081047	MEIJER N W	152068	Discrete wiskunde	5	2003	2
1081047	MEIJER N W	152070	Meetkunde	5	2003	4
1081047	MEIJER N W	152080	Deterministische en stochastische speltheorie	8	2003	1
1081047	MEIJER N W	152120	Lineaire algebra	6	2003	4
1081047	MEIJER N W	153003	Kansrekening	4	2003	3
1081047	MEIJER N W	153036	Statistiek II	5	2003	4
1081047	MEIJER N W	153080	Stochastische modellen in de operationele research	7	2003	4
1081047	MEIJER N W	153081	Stochastische modellen v. telecommunicatie syst.	9	2003	2
1081047	MEIJER N W	155010	Part. differentiaalverg. uit de math. fysica	9	2003	4
1081047	MEIJER N W	156037	Applied Analytical Methods	8	2003	3
1081047	MEIJER N W	156062	Systeem- en besturingstheorie	4	2003	4
1081047	MEIJER N W	156066	Besturingstheorie van economische systemen	7	2003	4
1081047	MEIJER N W	157020	Dynamische discrete gebeurtenissen	1	2003	4
1081047	MEIJER N W	158017	Operationele research I	7	2003	4
1081047	MEIJER N W	211022	Programmeren in C++	8	2003	3
1081047	MEIJER N W	211024	Programmeren in C++	7	2003	4
1081047	MEIJER N W	211032	Seminarium Taal, Kennis & Interactie	4	2003	4
1081047	MEIJER N W	211035	Vertalerbouw	7	2003	4
1081047	MEIJER N W	211038	Spraak- en taaltechnologie	9	2002	3
1081047	MEIJER N W	211045	Besturingssystemen	5	2003	3
1081047	MEIJER N W	211050	Structuur van programmeertalen	6	2003	3
1081047	MEIJER N W	211096	XML & Databases	3	2003	1
1081047	MEIJER N W	211127	Formele analyse van natuurlijke taal	7	2003	4
1081047	MEIJER N W	211129	Taaltechnologie	7	2003	4
1081047	MEIJER N W	211131	Statische Objectanalyse en Typering	8	2003	4
1081047	MEIJER N W	213001	Basisbegrippen digitale techniek	4	2002	3
1081047	MEIJER N W	213130	Computer Organisatie INF/TEL	6	2003	3
1081047	MEIJER N W	213540	Advanced Design of Software Architectures	6	2003	3
1081047	MEIJER N W	214511	Database Project	5	2003	3
1081047	MEIJER N W	214513	Internet & Web Architecturen	6	2003	2
1081047	MEIJER N W	217001	Testtechnieken	9	2003	3
1081047	MEIJER N W	232016	Prestatie-analyse van informatiesystemen	4	2002	4
1081047	MEIJER N W	232080	Requirements Engineering	8	2003	3
1081047	MEIJER N W	234007	Systemen voor cooperatief werk	1	2003	4
1081047	MEIJER N W	266100	Patterns of software development	9	2003	2
1081920	JANSEN L	121001	Elektronische basisschakelingen	4	2003	4
1081920	JANSEN L	121019	D-opdracht	5	2003	3
1081920	JANSEN L	121039	Biomedische signaal- en systeemanalyse	3	2003	3
1081920	JANSEN L	121043	Dynamische systemen	6	2003	4
1081920	JANSEN L	121043	Dynamische systemen	8	2003	2
1081920	JANSEN L	121044	Regeltechniek	6	2003	4
1081920	JANSEN L	121045	Project Mechatronica	9	2001	4
1081920	JANSEN L	121049	Practicum Medische Elektronica	6	2003	3
1081920	JANSEN L	121060	Optische basisfuncties en microsystemen	7	2003	4
1081920	JANSEN L	121062	Eind P-project	6	2003	4
1081920	JANSEN L	121067	Signaal analyse practicum	1	2002	4
1081920	JANSEN L	121714	I.C. technologie	4	2003	4
1081920	JANSEN L	121717	Advanced semiconductor devices	5	2003	3
1081920	JANSEN L	122226	Project voortgezette elektronica	5	2003	3
1081920	JANSEN L	122711	Digitale meetsystemen	3	2003	4
1086962	SCHURINGA U	151004	Calculus II-A	5	2003	4
1081920	JANSEN L	122815	Materiaalkunde van microsystemen	4	2003	2
1081920	JANSEN L	122816	Mechanica en transductietechniek	9	2003	2
1081920	JANSEN L	122828	Practicum realiseren in materialen	8	2003	3
1081920	JANSEN L	123152	Signal processing in acoustics and audio	6	2003	3
1081920	JANSEN L	124176	Digitale Regeltechniek	5	2003	3
1081920	JANSEN L	124177	Inleiding elektrische energietechniek	6	2002	4
1081920	JANSEN L	124177	Inleiding elektrische energietechniek	9	2002	1
1081920	JANSEN L	124177	Inleiding elektrische energietechniek	8	2003	1
1081920	JANSEN L	125119	Signaaltheorie	4	2003	4
1081920	JANSEN L	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	3
1081920	JANSEN L	125152	Glasvezelcommunicatie	4	2003	2
1081920	JANSEN L	125159	Optische communicatienetwerken	8	2003	4
1081920	JANSEN L	129351	Fysiologie II	8	2003	1
1081920	JANSEN L	129362	Start P-project	9	2003	2
1081920	JANSEN L	150500	Presentatie van een wiskundig onderwerp	4	2003	3
1081920	JANSEN L	150529	Wiskundig modelleren IV	6	2003	4
1081920	JANSEN L	151012	Calculus I	6	2003	4
1081920	JANSEN L	151044	Analyse C	8	2003	3
1081920	JANSEN L	151051	Fundamentele analyse I	5	2003	1
1081920	JANSEN L	151070	Kwantitatieve methoden	8	2002	4
1081920	JANSEN L	151080	Bijscholing wiskunde B2	6	2003	3
1081920	JANSEN L	151091	Modelvorming I	4	2003	1
1081920	JANSEN L	151092	Modelvorming II	6	2003	4
1081920	JANSEN L	151120	Wiskunde I	7	2003	4
1081920	JANSEN L	151210	Wiskunde A	6	2003	4
1081920	JANSEN L	151250	Modellen en systemen	7	2003	4
1081920	JANSEN L	151600	Modelleren en redeneren	6	2003	4
1081920	JANSEN L	153004	Statistiek I	6	2003	3
1081920	JANSEN L	153008	Kansrekening en statistiek	6	2003	3
1081920	JANSEN L	153045	Lineaire statistische modellen	6	2003	4
1081920	JANSEN L	153055	Parametervrije statistische methoden	6	2003	3
1081920	JANSEN L	153082	Stochastische simulatie	5	2003	3
1081920	JANSEN L	153086	Telecommunicatiesystemen	2	2003	1
1081920	JANSEN L	153110	Inleiding statistiek	8	2003	3
1081920	JANSEN L	156080	Signalen en transformaties	3	2003	3
1081920	JANSEN L	157004	Stochastische processen in financien	6	2003	3
1081920	JANSEN L	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1081920	JANSEN L	158006	Operationele research II	6	2003	4
1081920	JANSEN L	211027	Inleiding programmeren met MATLAB	4	2003	3
1081920	JANSEN L	211033	Neurale netwerken en neuro-computing	7	2003	3
1081920	JANSEN L	211035	Vertalerbouw	8	2003	4
1081920	JANSEN L	211095	Gedistribueerde databases & middleware technologie	8	2003	4
1081920	JANSEN L	211098	Databasetransacties en -processen	3	2003	3
1081920	JANSEN L	211112	Inleiding Logica	5	2003	4
1081920	JANSEN L	211123	Component- en aspect georienteerd progammeren	9	2003	1
1081920	JANSEN L	211130	Ubiquitous Computing	4	2003	3
1081920	JANSEN L	211133	Ontwerpen van Software Architecturen	7	2003	1
1081920	JANSEN L	213009	Fouten tolererende digitale systemen	9	2003	1
1081920	JANSEN L	213110	Computerorganisatie	2	2003	4
1081920	JANSEN L	213130	Computer Organisatie INF/TEL	9	2003	2
1081920	JANSEN L	213520	Formele Methoden voor Software Engineering	5	2003	4
1081920	JANSEN L	213545	Advanced Design of Software Architectures 2	8	2003	3
1081920	JANSEN L	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2001	3
1081920	JANSEN L	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2002	1
1081920	JANSEN L	214510	MMI-project	5	2003	2
1081920	JANSEN L	214515	Codesign project	5	2003	3
1081920	JANSEN L	217001	Testtechnieken	7	2003	3
1081920	JANSEN L	233035	Practicum Databases in Informatiesystemen	2	2002	1
1081920	JANSEN L	235005	Inleiding bedrijfsinformatiesystemen	7	2003	3
1081920	JANSEN L	237600	Business Case Development for IT-projects	9	2003	1
1081920	JANSEN L	239801	BIT-BV 2	8	2003	4
1081920	JANSEN L	263100	Mobile E-health application and services	5	2003	4
1081920	JANSEN L	265100	Ontwerpen van telematicasystemen	7	2002	4
1081920	JANSEN L	265201	Middleware for distributed objects	6	2002	4
1081920	JANSEN L	265201	Middleware for distributed objects	6	2003	3
1082226	OVERMAN Q P	153045	Lineaire statistische modellen	2	2003	4
1082226	OVERMAN Q P	153083	Stochastische modellen in productie en logistiek	8	2003	3
1082226	OVERMAN Q P	153120	Statistiek	5	2003	4
1082226	OVERMAN Q P	153135	Statistical techniques	1	2003	4
1082226	OVERMAN Q P	155015	Part.diff.verg.: Numerieke oplossingsmethoden I	7	2003	4
1082226	OVERMAN Q P	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	4	2003	3
1082226	OVERMAN Q P	157008	Stochastische processen in dynamische systemen	5	2003	3
1082226	OVERMAN Q P	157009	Tijdreeksenanalyse en identificatietheorie	6	2003	3
1082226	OVERMAN Q P	158025	Mathematische programmering I	9	2003	3
1082226	OVERMAN Q P	211017	Inleiding programmeren met JAVA	9	2003	1
1082226	OVERMAN Q P	211038	Spraak- en taaltechnologie	1	2002	3
1082226	OVERMAN Q P	211095	Gedistribueerde databases & middleware technologie	8	2003	1
1082226	OVERMAN Q P	211129	Taaltechnologie	9	2003	4
1082226	OVERMAN Q P	212018	Kennistechnologie voor bedrijfskundige toep.	4	2003	2
1082226	OVERMAN Q P	213001	Basisbegrippen digitale techniek	9	2002	3
1082226	OVERMAN Q P	213001	Basisbegrippen digitale techniek	5	2003	2
1082226	OVERMAN Q P	213014	Procesbesturing en robotica	5	2003	3
1082226	OVERMAN Q P	213120	Inleiding informatie- en communicatietechnologie	5	2003	2
1082226	OVERMAN Q P	213130	Computer Organisatie INF/TEL	8	2003	3
1082226	OVERMAN Q P	214030	Artificial Intelligence	4	2003	2
1082226	OVERMAN Q P	232020	Data warehousing & data mining	8	2003	4
1082226	OVERMAN Q P	232085	Voortgezette Requirements Engineering	9	2003	4
1082226	OVERMAN Q P	233030	Specificeren van informatiesystemen	7	2003	3
1082226	OVERMAN Q P	233035	Practicum Databases in Informatiesystemen	6	2002	1
1082226	OVERMAN Q P	234001	Productie-informatietechnologie	8	2003	3
1082226	OVERMAN Q P	234020	Ontwerpen van mens-machine interactie	6	2003	1
1082226	OVERMAN Q P	236001	Kwaliteit van de informatievoorziening	4	2003	4
1082226	OVERMAN Q P	236050	E-health Strategies	4	2003	4
1082226	OVERMAN Q P	237400	BedrijfsProces Ondersteuning	4	2003	1
1082226	OVERMAN Q P	239800	BIT-BV 1	2	2003	4
1082226	OVERMAN Q P	239981	Integratieproject	9	1999	1
1082226	OVERMAN Q P	239981	Integratieproject	4	2000	1
1082226	OVERMAN Q P	239981	Integratieproject	8	2003	2
1082226	OVERMAN Q P	261000	Telematicasystemen en toepassingen	5	2003	2
1082226	OVERMAN Q P	262001	Mobile and wireless networking	8	2003	4
1082226	OVERMAN Q P	262020	Bijzondere onderwerpen Telematica	8	2003	1
1082226	OVERMAN Q P	263000	Telematicadiensten	9	2003	4
1082750	JANSEN O	121001	Elektronische basisschakelingen	5	2003	4
1082750	JANSEN O	121019	D-opdracht	6	2003	3
1082750	JANSEN O	121040	Medische elektronica	4	2003	3
1082750	JANSEN O	121044	Regeltechniek	3	2003	2
1082750	JANSEN O	121709	Reliability Engineering	1	2003	4
1082750	JANSEN O	122821	Microtechnologie t.b.v. transducenten	7	2003	3
1082750	JANSEN O	124176	Digitale Regeltechniek	8	2003	3
1082750	JANSEN O	125118	Practicum informatie-overdracht	7	2003	3
1082750	JANSEN O	125118	Practicum informatie-overdracht	5	2003	2
1082750	JANSEN O	125153	Inleiding communicatiesystemen	2	2003	3
1082750	JANSEN O	125163	Electromagnetische compatibiliteit	4	2003	4
1082750	JANSEN O	129347	Deelname aan een project	6	2003	4
1082750	JANSEN O	129348	Maken van een scriptie	6	2003	3
1082750	JANSEN O	150810	Modelling project	5	2003	3
1082750	JANSEN O	151005	Calculus II-B	8	2003	3
1082750	JANSEN O	151007	Lineaire algebra	1	2003	4
1082750	JANSEN O	151012	Calculus I	8	2003	4
1082750	JANSEN O	151043	Seminarium mathematische fysica	8	2003	4
1082750	JANSEN O	151044	Analyse C	2	2003	3
1082750	JANSEN O	151070	Kwantitatieve methoden	5	2002	4
1082750	JANSEN O	151072	Wiskunde II	8	2003	4
1082750	JANSEN O	151085	Wiskunde I	5	2003	3
1082750	JANSEN O	151092	Modelvorming II	7	2003	4
1082750	JANSEN O	151510	Introduction to Risk Theory	8	2003	3
1082750	JANSEN O	152025	Complexe functietheorie	9	2003	3
1082750	JANSEN O	152028	Analyse A	6	2003	4
1082750	JANSEN O	152068	Discrete wiskunde	7	2003	3
1082750	JANSEN O	152068	Discrete wiskunde	2	2003	2
1082750	JANSEN O	153016	Voortgezette wiskundige statistiek	2	2003	3
1082750	JANSEN O	153032	Kansrekening en stochastische processen	8	2003	4
1082750	JANSEN O	153036	Statistiek II	6	2003	4
1082750	JANSEN O	153041	Inleiding statistiek	6	2003	1
1082750	JANSEN O	153084	Analyse en besturing van productie systemen	5	2003	3
1082750	JANSEN O	153086	Telecommunicatiesystemen	9	2003	1
1082750	JANSEN O	155010	Part. differentiaalverg. uit de math. fysica	6	2003	2
1082750	JANSEN O	156029	Analyse C	9	2003	3
1082750	JANSEN O	156067	Robust Control	8	2003	4
1082750	JANSEN O	157009	Tijdreeksenanalyse en identificatietheorie	2	2003	3
1082750	JANSEN O	158006	Operationele research II	7	2003	4
1082750	JANSEN O	211033	Neurale netwerken en neuro-computing	9	2003	3
1082750	JANSEN O	211034	Spraaktechnologie	7	2003	2
1082750	JANSEN O	211074	Gegevensbanken	2	2003	4
1082750	JANSEN O	211081	Distributed E-business Techniques	5	2003	1
1082750	JANSEN O	211090	Databasetoepassingen	4	2003	4
1082750	JANSEN O	211123	Component- en aspect georienteerd progammeren	5	2003	1
1082750	JANSEN O	211130	Ubiquitous Computing	8	2003	3
1082750	JANSEN O	211133	Ontwerpen van Software Architecturen	3	2003	1
1082750	JANSEN O	213001	Basisbegrippen digitale techniek	5	2002	3
1082750	JANSEN O	213009	Fouten tolererende digitale systemen	8	2003	4
1082750	JANSEN O	213011	Gedistribueerde systemen	4	2003	2
1082750	JANSEN O	213016	Bijzondere onderwerpen computerarchitectuur	1	2003	3
1082750	JANSEN O	214010	Complexiteit van berekeningen	3	2003	3
1082750	JANSEN O	214501	Communicatie & ontwerpen in ICT-projecten 2	9	2003	3
1082750	JANSEN O	214513	Internet & Web Architecturen	9	2003	4
1082750	JANSEN O	232060	Multi-agent systemen	6	2003	4
1082750	JANSEN O	232060	Multi-agent systemen	6	2003	2
1082750	JANSEN O	233030	Specificeren van informatiesystemen	6	2003	3
1082750	JANSEN O	235022	Investeringen in informatietechnologie	6	2003	4
1082750	JANSEN O	237400	BedrijfsProces Ondersteuning	6	2003	3
1082750	JANSEN O	239801	BIT-BV 2	3	2003	4
1082750	JANSEN O	262000	Telematicanetwerken	8	2003	4
1082750	JANSEN O	263200	Gedistribueerde multimedia database systemen	1	2003	4
1082750	JANSEN O	265201	Middleware for distributed objects	7	2003	2
1082750	JANSEN O	269000	Orientatie ICT	6	2003	3
1083842	BOOSE E	121003	Elektronische functies	4	2003	2
1083842	BOOSE E	121006	Practicum Meetinstrumenten/Netwerkanalyse	8	2003	3
1083842	BOOSE E	121008	Practicum Elektromagnetische Veldtheorie	4	2002	1
1083842	BOOSE E	121021	Inleiding in de biomedische technologie	8	2003	4
1083842	BOOSE E	121026	Hands-on dig.image proces. and graphical pres.	8	2002	3
1083842	BOOSE E	121026	Hands-on dig.image proces. and graphical pres.	5	2003	1
1083842	BOOSE E	121034	Fysische modelvorming van embedded systemen	5	2003	4
1083842	BOOSE E	121035	Mid P-project	4	2003	3
1083842	BOOSE E	121038	Elektronica voor industrieel ontwerpers	8	2003	4
1083842	BOOSE E	121045	Project Mechatronica	8	2001	4
1083842	BOOSE E	121045	Project Mechatronica	9	2003	1
1083842	BOOSE E	121056	Laboratorium op een chip	2	2003	3
1083842	BOOSE E	121714	I.C. technologie	9	2003	4
1083842	BOOSE E	122226	Project voortgezette elektronica	8	2003	3
1083842	BOOSE E	122634	Real-time software development	5	2003	3
1083842	BOOSE E	122728	Classification, Estimation and Data Analysis	5	2003	4
1083842	BOOSE E	122816	Mechanica en transductietechniek	7	2002	3
1083842	BOOSE E	122816	Mechanica en transductietechniek	4	2003	4
1083842	BOOSE E	122821	Microtechnologie t.b.v. transducenten	7	2003	3
1083842	BOOSE E	123152	Signal processing in acoustics and audio	4	2003	3
1083842	BOOSE E	124151	Mechatronica	4	2003	2
1083842	BOOSE E	124177	Inleiding elektrische energietechniek	1	2002	4
1083842	BOOSE E	125159	Optische communicatienetwerken	4	2003	4
1083842	BOOSE E	127113	Elektrofysiologische signalen en bio-electriciteit	7	2003	4
1083842	BOOSE E	129348	Maken van een scriptie	8	2003	3
1083842	BOOSE E	129357	Deelname aan een project	5	2003	4
1083842	BOOSE E	129367	Individual project	7	2003	3
1083842	BOOSE E	150432	Maple practicum II	1	2003	4
1083842	BOOSE E	150500	Presentatie van een wiskundig onderwerp	5	2003	3
1083842	BOOSE E	150532	Maple practicum	3	2003	4
1083842	BOOSE E	150910	Advanced modelling	5	2003	4
1083842	BOOSE E	151004	Calculus II-A	2	2003	4
1083842	BOOSE E	151033	Numerieke analyse	5	2003	3
1083842	BOOSE E	151051	Fundamentele analyse I	8	2003	1
1083842	BOOSE E	151081	Wiskunde I	9	2003	3
1083842	BOOSE E	151083	Wiskunde III	3	2003	3
1083842	BOOSE E	151086	Vectoranalyse voor BMT	9	2003	3
1083842	BOOSE E	151092	Modelvorming II	5	2003	4
1083842	BOOSE E	151120	Wiskunde I	9	2003	4
1083842	BOOSE E	151200	Calculus A	7	2003	3
1083842	BOOSE E	151210	Wiskunde A	7	2003	4
1083842	BOOSE E	152056	Combinatoriek	9	2003	4
1083842	BOOSE E	153033	Statistiek	9	2003	4
1083842	BOOSE E	153045	Lineaire statistische modellen	9	2003	4
1083842	BOOSE E	153080	Stochastische modellen in de operationele research	8	2003	4
1083842	BOOSE E	153087	Wachttijdtheorie	7	2003	3
1083842	BOOSE E	156056	Inleiding wiskundige systeemtheorie	8	2003	4
1083842	BOOSE E	157016	Stochastische filter- en besturingstheorie	4	2003	3
1083842	BOOSE E	157021	Analyse van signaaloverdracht in communicatienetw.	5	2003	4
1083842	BOOSE E	158075	Deterministische modellen in de OR	7	2002	4
1083842	BOOSE E	158075	Deterministische modellen in de OR	3	2003	4
1083842	BOOSE E	159928	Doctoraalstage	9	2003	3
1083842	BOOSE E	211037	Graphics & Virtual Reality	3	2003	3
1083842	BOOSE E	211038	Spraak- en taaltechnologie	4	2003	4
1083842	BOOSE E	211090	Databasetoepassingen	5	2003	4
1083842	BOOSE E	211097	Bijzondere onderwerpen gegevensbanken	6	2003	3
1083842	BOOSE E	211108	Bijzondere onderwerpen uit de logica	4	2003	4
1083842	BOOSE E	211109	Voortgezette logica	2	2003	3
1083842	BOOSE E	211123	Component- en aspect georienteerd progammeren	6	2003	3
1083842	BOOSE E	211123	Component- en aspect georienteerd progammeren	5	2003	1
1083842	BOOSE E	211130	Ubiquitous Computing	4	2003	3
1083842	BOOSE E	211133	Ontwerpen van Software Architecturen	8	2003	3
1083842	BOOSE E	211185	Taal- en rekenmodellen	6	2003	4
1083842	BOOSE E	212018	Kennistechnologie voor bedrijfskundige toep.	5	2003	2
1083842	BOOSE E	213011	Gedistribueerde systemen	4	2003	2
1083842	BOOSE E	213500	Programmeren 1	4	2003	4
1083842	BOOSE E	213500	Programmeren 1	7	2003	1
1083842	BOOSE E	213510	Software Engineering Modellen	6	2003	4
1083842	BOOSE E	213530	Concurrent and distributed programming	1	2003	2
1083842	BOOSE E	214030	Artificial Intelligence	8	2002	1
1083842	BOOSE E	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2001	3
1083842	BOOSE E	214510	MMI-project	6	2003	2
1083842	BOOSE E	214513	Internet & Web Architecturen	7	2002	4
1083842	BOOSE E	232016	Prestatie-analyse van informatiesystemen	2	2002	4
1083842	BOOSE E	232020	Data warehousing & data mining	8	2002	3
1083842	BOOSE E	232050	Electronic Commerce	8	2003	4
1083842	BOOSE E	232055	XML-technologie in E-Commerce	9	2003	4
1083842	BOOSE E	232060	Multi-agent systemen	2	2003	2
1083842	BOOSE E	233030	Specificeren van informatiesystemen	5	2003	3
1083842	BOOSE E	234004	Softwaremanagement	5	2003	3
1083842	BOOSE E	234026	Voortgezette informatiesysteemmodellering	8	2003	4
1083842	BOOSE E	237400	BedrijfsProces Ondersteuning	5	2003	1
1088622	DOES O	151080	Bijscholing wiskunde B2	7	2003	3
1083842	BOOSE E	239981	Integratieproject	3	2002	1
1083842	BOOSE E	261010	Computer netwerken	2	2003	3
1083842	BOOSE E	265201	Middleware for distributed objects	4	2003	3
1083842	BOOSE E	269001	Portfolio ontwerp	9	2003	4
1085452	MULDER A P	153081	Stochastische modellen v. telecommunicatie syst.	7	2003	2
1085452	MULDER A P	153083	Stochastische modellen in productie en logistiek	7	2003	3
1085452	MULDER A P	153088	Stochastische modellen voor Operations Management	4	2003	3
1086678	STEIN E	121035	Mid P-project	4	2002	4
1085452	MULDER A P	155009	Fundamenten van de methode der eindige elementen	5	2003	3
1085452	MULDER A P	156012	Gewone differentiaalvergelijkingen	6	2003	3
1085452	MULDER A P	156066	Besturingstheorie van economische systemen	5	2003	4
1085452	MULDER A P	156067	Robust Control	3	2003	4
1085452	MULDER A P	156069	Systemen en Signalen	5	2003	3
1085452	MULDER A P	157020	Dynamische discrete gebeurtenissen	5	2003	4
1085452	MULDER A P	157035	Financial Econometrics	9	2003	3
1085452	MULDER A P	158070	Grafentheorie en operationele research	5	2003	1
1085452	MULDER A P	211035	Vertalerbouw	6	2003	4
1085452	MULDER A P	211037	Graphics & Virtual Reality	7	2003	3
1085452	MULDER A P	211038	Spraak- en taaltechnologie	5	2003	1
1085452	MULDER A P	211045	Besturingssystemen	9	2003	3
1085452	MULDER A P	211129	Taaltechnologie	5	2003	4
1085452	MULDER A P	211131	Statische Objectanalyse en Typering	8	2003	4
1085452	MULDER A P	213001	Basisbegrippen digitale techniek	1	2003	2
1085452	MULDER A P	213110	Computerorganisatie	8	2003	1
1085452	MULDER A P	213120	Inleiding informatie- en communicatietechnologie	6	2003	4
1085452	MULDER A P	213130	Computer Organisatie INF/TEL	7	2003	3
1085452	MULDER A P	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2003	2
1085452	MULDER A P	214511	Database Project	4	2003	3
1085452	MULDER A P	214513	Internet & Web Architecturen	8	2002	4
1085452	MULDER A P	214513	Internet & Web Architecturen	2	2002	2
1085452	MULDER A P	219803	Neurale netwerken	8	2003	4
1085452	MULDER A P	232080	Requirements Engineering	6	2003	3
1085452	MULDER A P	234004	Softwaremanagement	6	2003	3
1085452	MULDER A P	234007	Systemen voor cooperatief werk	6	2003	4
1085452	MULDER A P	234026	Voortgezette informatiesysteemmodellering	4	2003	1
1085452	MULDER A P	237600	Business Case Development for IT-projects	6	2003	1
1085452	MULDER A P	239981	Integratieproject	5	2000	4
1085452	MULDER A P	239981	Integratieproject	5	2003	2
1085452	MULDER A P	261000	Telematicasystemen en toepassingen	8	2003	2
1085452	MULDER A P	261010	Computer netwerken	4	2003	3
1085452	MULDER A P	266100	Patterns of software development	6	2003	4
1085452	MULDER A P	269100	P-project TEL	5	2003	2
1085510	WIJNGAARDEN L C	121003	Elektronische functies	6	2003	3
1085510	WIJNGAARDEN L C	121018	Stage	3	2003	1
1085510	WIJNGAARDEN L C	121021	Inleiding in de biomedische technologie	6	2002	2
1085510	WIJNGAARDEN L C	121035	Mid P-project	1	2003	1
1085510	WIJNGAARDEN L C	121037	Advanced digital signal processing	7	2003	3
1085510	WIJNGAARDEN L C	121043	Dynamische systemen	5	2003	2
1085510	WIJNGAARDEN L C	121045	Project Mechatronica	9	2001	4
1085510	WIJNGAARDEN L C	121050	Modern robotics	6	2003	3
1085510	WIJNGAARDEN L C	121053	Zekere- en onzekere informatie	9	2003	3
1085510	WIJNGAARDEN L C	121053	Zekere- en onzekere informatie	8	2003	2
1085510	WIJNGAARDEN L C	121714	I.C. technologie	4	2003	2
1085510	WIJNGAARDEN L C	122634	Real-time software development	1	2003	3
1085510	WIJNGAARDEN L C	122814	Elektromagnetisme II voor HBO	6	2003	4
1085510	WIJNGAARDEN L C	122814	Elektromagnetisme II voor HBO	7	2003	1
1085510	WIJNGAARDEN L C	122828	Practicum realiseren in materialen	9	2003	1
1085510	WIJNGAARDEN L C	123112	Moderne modulatie- en detectietechnieken	9	2003	4
1085510	WIJNGAARDEN L C	123140	Inleiding systeem- en signaaltheorie voor HBO	2	2003	3
1085510	WIJNGAARDEN L C	124113	Optimal estimation in dynamic systems	8	2003	3
1085510	WIJNGAARDEN L C	124177	Inleiding elektrische energietechniek	4	2002	4
1085510	WIJNGAARDEN L C	124177	Inleiding elektrische energietechniek	7	2003	3
1085510	WIJNGAARDEN L C	125118	Practicum informatie-overdracht	5	2003	2
1085510	WIJNGAARDEN L C	125156	Transmissiemedia- en systemen	4	2003	4
1085510	WIJNGAARDEN L C	127117	Biomechatronica	1	2001	3
1085510	WIJNGAARDEN L C	129354	Literatuuronderzoek	8	2003	4
1085510	WIJNGAARDEN L C	129355	Deelname aan een studiegroep	6	2003	3
1085510	WIJNGAARDEN L C	129362	Start P-project	7	2003	3
1085510	WIJNGAARDEN L C	129367	Individual project	8	2003	3
1085510	WIJNGAARDEN L C	150500	Presentatie van een wiskundig onderwerp	8	2003	3
1085510	WIJNGAARDEN L C	150500	Presentatie van een wiskundig onderwerp	2	2003	1
1085510	WIJNGAARDEN L C	150529	Wiskundig modelleren IV	5	2003	4
1085510	WIJNGAARDEN L C	150529	Wiskundig modelleren IV	8	2003	1
1085510	WIJNGAARDEN L C	150539	Maple practicum	5	2003	4
1085510	WIJNGAARDEN L C	151012	Calculus I	7	2003	4
1085510	WIJNGAARDEN L C	151019	Analyse B	1	2003	4
1085510	WIJNGAARDEN L C	151020	Functionaalanalyse I	8	2003	3
1085510	WIJNGAARDEN L C	151039	Algebra	9	2003	4
1085510	WIJNGAARDEN L C	151051	Fundamentele analyse I	8	2003	1
1085510	WIJNGAARDEN L C	151082	Wiskunde II	6	2003	4
1085510	WIJNGAARDEN L C	151088	Practicum Wiskundig modelleren	5	2003	4
1085510	WIJNGAARDEN L C	151130	Wiskunde II	4	2003	4
1085510	WIJNGAARDEN L C	151202	Calculus B	9	2003	3
1085510	WIJNGAARDEN L C	152006	Lineaire structuren	9	2003	4
1085510	WIJNGAARDEN L C	152026	Calculus I	4	2003	3
1085510	WIJNGAARDEN L C	152030	Tensoranalyse	2	2003	3
1085510	WIJNGAARDEN L C	153002	Discrete kansrekening	5	2003	3
1085510	WIJNGAARDEN L C	153004	Statistiek I	4	2003	3
1085510	WIJNGAARDEN L C	153006	Kansrekening	7	2003	3
1085510	WIJNGAARDEN L C	153023	Statistiek II voor TBK	7	2003	3
1085510	WIJNGAARDEN L C	153031	Statistiek	7	2003	3
1085510	WIJNGAARDEN L C	153038	Wiskundige statistiek	8	2003	4
1085510	WIJNGAARDEN L C	153083	Stochastische modellen in productie en logistiek	9	2003	3
1085510	WIJNGAARDEN L C	153086	Telecommunicatiesystemen	4	2003	4
1085510	WIJNGAARDEN L C	154023	Numerieke wiskunde en programmeermethoden	8	2003	3
1085510	WIJNGAARDEN L C	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	7	2003	1
1085510	WIJNGAARDEN L C	156014	Analyse B	5	2003	4
1085510	WIJNGAARDEN L C	156062	Systeem- en besturingstheorie	9	2003	4
1085510	WIJNGAARDEN L C	157004	Stochastische processen in financien	8	2003	3
1085510	WIJNGAARDEN L C	158017	Operationele research I	4	2003	4
1085510	WIJNGAARDEN L C	158061	Inleiding wiskundige economie	2	2003	4
1085510	WIJNGAARDEN L C	159928	Doctoraalstage	4	2003	3
1085510	WIJNGAARDEN L C	211038	Spraak- en taaltechnologie	9	2003	4
1085510	WIJNGAARDEN L C	211045	Besturingssystemen	6	2003	3
1085510	WIJNGAARDEN L C	211098	Databasetransacties en -processen	4	2003	2
1085510	WIJNGAARDEN L C	211123	Component- en aspect georienteerd progammeren	1	2003	3
1085510	WIJNGAARDEN L C	213002	Ontwerpen van digitale systemen	8	2003	4
1085510	WIJNGAARDEN L C	213125	Computersystemen	8	2003	4
1085510	WIJNGAARDEN L C	213130	Computer Organisatie INF/TEL	9	2003	3
1085510	WIJNGAARDEN L C	213530	Concurrent and distributed programming	1	2003	2
1085510	WIJNGAARDEN L C	217001	Testtechnieken	5	2003	3
1085510	WIJNGAARDEN L C	232012	Information retrieval en kennisbeheer	7	2003	3
1085510	WIJNGAARDEN L C	232016	Prestatie-analyse van informatiesystemen	5	2003	3
1085510	WIJNGAARDEN L C	232050	Electronic Commerce	8	2003	2
1085510	WIJNGAARDEN L C	232060	Multi-agent systemen	4	2003	4
1085510	WIJNGAARDEN L C	232060	Multi-agent systemen	4	2003	2
1085510	WIJNGAARDEN L C	233030	Specificeren van informatiesystemen	8	2003	3
1085510	WIJNGAARDEN L C	234004	Softwaremanagement	6	2003	3
1085510	WIJNGAARDEN L C	235022	Investeringen in informatietechnologie	9	2003	2
1085510	WIJNGAARDEN L C	237400	BedrijfsProces Ondersteuning	6	2003	1
1085510	WIJNGAARDEN L C	237600	Business Case Development for IT-projects	5	2003	1
1085510	WIJNGAARDEN L C	239805	BIT-BV	4	2003	4
1085510	WIJNGAARDEN L C	239981	Integratieproject	6	2000	4
1085510	WIJNGAARDEN L C	239981	Integratieproject	7	2003	3
1085510	WIJNGAARDEN L C	239981	Integratieproject	4	1999	1
1085510	WIJNGAARDEN L C	265100	Ontwerpen van telematicasystemen	6	2003	1
1085510	WIJNGAARDEN L C	269001	Portfolio ontwerp	3	2003	4
1086068	MEIJER S P	121003	Elektronische functies	6	2003	2
1086068	MEIJER S P	121005	Netwerkanalyse	4	2003	3
1086068	MEIJER S P	121006	Practicum Meetinstrumenten/Netwerkanalyse	9	2003	3
1086068	MEIJER S P	121007	Elektromagnetische Veldtheorie	8	2003	1
1086068	MEIJER S P	121008	Practicum Elektromagnetische Veldtheorie	6	2002	1
1086068	MEIJER S P	121035	Mid P-project	3	2003	1
1086068	MEIJER S P	121041	Elektrodynamica	3	2003	4
1086068	MEIJER S P	121044	Regeltechniek	6	2003	4
1086068	MEIJER S P	121050	Modern robotics	9	2003	3
1086068	MEIJER S P	121054	Neurotechnologie	4	2003	4
1086068	MEIJER S P	121706	Halfgeleiderdevices	8	2003	3
1086068	MEIJER S P	121709	Reliability Engineering	6	2003	2
1086068	MEIJER S P	122634	Real-time software development	9	2003	3
1086068	MEIJER S P	122816	Mechanica en transductietechniek	2	2002	2
1086068	MEIJER S P	122833	Integratieproject	2	2003	2
1086068	MEIJER S P	123152	Signal processing in acoustics and audio	9	2003	1
1086068	MEIJER S P	124163	Mechatronische meetsystemen	9	2003	4
1086068	MEIJER S P	124176	Digitale Regeltechniek	4	2003	2
1086068	MEIJER S P	125163	Electromagnetische compatibiliteit	5	2003	4
1086068	MEIJER S P	127117	Biomechatronica	4	2002	3
1086068	MEIJER S P	129348	Maken van een scriptie	4	2003	3
1086068	MEIJER S P	129351	Fysiologie II	4	2003	1
1086068	MEIJER S P	129356	Verrichten van experimenteel werk	6	2003	3
1086068	MEIJER S P	129362	Start P-project	8	2003	3
1086068	MEIJER S P	150432	Maple practicum II	4	2003	4
1086068	MEIJER S P	150528	Wiskundig modelleren III	6	2003	3
1086068	MEIJER S P	150529	Wiskundig modelleren IV	2	2003	1
1086068	MEIJER S P	150539	Maple practicum	5	2003	4
1086068	MEIJER S P	150600	Mathematical methods	7	2003	3
1086068	MEIJER S P	150620	Systems and signals	7	2003	3
1086068	MEIJER S P	150710	Modelling project	4	2003	3
1086068	MEIJER S P	151004	Calculus II-A	9	2003	4
1086068	MEIJER S P	151007	Lineaire algebra	7	2003	4
1086068	MEIJER S P	151019	Analyse B	5	2003	4
1086068	MEIJER S P	151039	Algebra	1	2003	4
1086068	MEIJER S P	151045	Functionaalanalyse III	4	2003	4
1086068	MEIJER S P	151081	Wiskunde I	1	2003	3
1086068	MEIJER S P	151088	Practicum Wiskundig modelleren	7	2003	4
1086068	MEIJER S P	151091	Modelvorming I	4	2003	3
1090264	AUBLIANDER I G	121050	Modern robotics	3	2003	3
1086068	MEIJER S P	151093	Modelvorming III	5	2003	3
1086068	MEIJER S P	151130	Wiskunde II	7	2003	4
1086068	MEIJER S P	151210	Wiskunde A	9	2003	4
1086068	MEIJER S P	151215	Wiskunde B	9	2003	4
1086068	MEIJER S P	151510	Introduction to Risk Theory	7	2003	3
1086068	MEIJER S P	151570	Financial Engineering	5	2003	3
1086068	MEIJER S P	151600	Modelleren en redeneren	9	2003	4
1086068	MEIJER S P	152056	Combinatoriek	7	2003	4
1086068	MEIJER S P	153002	Discrete kansrekening	6	2003	3
1086068	MEIJER S P	153003	Kansrekening	7	2003	3
1086068	MEIJER S P	153016	Voortgezette wiskundige statistiek	4	2003	3
1086068	MEIJER S P	153023	Statistiek II voor TBK	8	2003	3
1086068	MEIJER S P	153041	Inleiding statistiek	9	2003	1
1086068	MEIJER S P	153110	Inleiding statistiek	4	2003	3
1086068	MEIJER S P	153120	Statistiek	1	2003	4
1086068	MEIJER S P	154021	Numerieke wiskunde en programmeermethoden	4	2003	3
1086068	MEIJER S P	154023	Numerieke wiskunde en programmeermethoden	8	2003	3
1086068	MEIJER S P	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	5	2003	3
1086068	MEIJER S P	156016	Analyse B	4	2003	3
1086068	MEIJER S P	156067	Robust Control	2	2003	4
1086068	MEIJER S P	157008	Stochastische processen in dynamische systemen	6	2003	3
1086068	MEIJER S P	159927	Doctoraalstage	9	2003	4
1086068	MEIJER S P	211022	Programmeren in C++	3	2003	3
1086068	MEIJER S P	211109	Voortgezette logica	2	2003	3
1086068	MEIJER S P	211123	Component- en aspect georienteerd progammeren	8	2003	3
1086068	MEIJER S P	211129	Taaltechnologie	2	2003	4
1086068	MEIJER S P	211205	Functioneel programmeren	5	2003	4
1086068	MEIJER S P	213014	Procesbesturing en robotica	9	2003	3
1086068	MEIJER S P	213016	Bijzondere onderwerpen computerarchitectuur	8	2003	3
1086068	MEIJER S P	213130	Computer Organisatie INF/TEL	6	2003	3
1086068	MEIJER S P	213505	Programmeren 2	7	2003	4
1086068	MEIJER S P	214025	Algoritmen,datastructuren en complexiteit plus	1	2003	4
1086068	MEIJER S P	214513	Internet & Web Architecturen	8	2002	4
1086068	MEIJER S P	219801	Hypermedia structuren en systemen	4	2003	4
1086068	MEIJER S P	219801	Hypermedia structuren en systemen	6	2003	1
1086068	MEIJER S P	219910	Ontwerpproject	3	2003	3
1086068	MEIJER S P	232012	Information retrieval en kennisbeheer	4	2003	3
1086068	MEIJER S P	232060	Multi-agent systemen	2	2003	2
1086068	MEIJER S P	232080	Requirements Engineering	4	2003	3
1086068	MEIJER S P	233035	Practicum Databases in Informatiesystemen	9	2003	1
1086068	MEIJER S P	234004	Softwaremanagement	5	2003	3
1086068	MEIJER S P	234007	Systemen voor cooperatief werk	7	2003	4
1086068	MEIJER S P	234010	Invoering van IT in organisaties	9	2003	2
1086068	MEIJER S P	234026	Voortgezette informatiesysteemmodellering	7	2003	4
1086068	MEIJER S P	237450	Bedrijfsfunctie ondersteuning	8	2003	3
1086068	MEIJER S P	239981	Integratieproject	7	2003	2
1086068	MEIJER S P	261000	Telematicasystemen en toepassingen	7	2003	2
1086068	MEIJER S P	262020	Bijzondere onderwerpen Telematica	9	2003	1
1086068	MEIJER S P	263100	Mobile E-health application and services	8	2003	4
1086068	MEIJER S P	263200	Gedistribueerde multimedia database systemen	6	2003	4
1086068	MEIJER S P	265200	Implementatie van telematicasystemen	6	2003	1
1086678	STEIN E	121003	Elektronische functies	7	2003	3
1086678	STEIN E	121005	Netwerkanalyse	5	2003	3
1086678	STEIN E	121007	Elektromagnetische Veldtheorie	8	2002	1
1086678	STEIN E	121008	Practicum Elektromagnetische Veldtheorie	5	2003	3
1086678	STEIN E	121008	Practicum Elektromagnetische Veldtheorie	9	2002	1
1086678	STEIN E	121021	Inleiding in de biomedische technologie	6	2002	4
1086678	STEIN E	121021	Inleiding in de biomedische technologie	4	2002	2
1086678	STEIN E	121026	Hands-on dig.image proces. and graphical pres.	4	2003	1
1086678	STEIN E	121034	Fysische modelvorming van embedded systemen	8	2003	4
1086678	STEIN E	121044	Regeltechniek	3	2003	4
1086678	STEIN E	121044	Regeltechniek	9	2003	2
1086678	STEIN E	121045	Project Mechatronica	8	2001	4
1086678	STEIN E	121045	Project Mechatronica	9	2003	1
1086678	STEIN E	121049	Practicum Medische Elektronica	9	2003	3
1086678	STEIN E	121057	Bio-elektriciteit	5	2003	4
1086678	STEIN E	122226	Project voortgezette elektronica	8	2003	3
1086678	STEIN E	122728	Classification, Estimation and Data Analysis	4	2003	4
1086678	STEIN E	122733	VLSI signal processing	1	2003	4
1086678	STEIN E	122740	Netwerkanalyse voor TEL	9	2003	3
1086678	STEIN E	122816	Mechanica en transductietechniek	7	2002	2
1086678	STEIN E	122829	Systemen en technieken voor informatieopslag	8	2003	1
1086678	STEIN E	122833	Integratieproject	6	2003	2
1086678	STEIN E	123153	Embedded Signal Processing	8	2003	4
1086678	STEIN E	124153	Computer-aided design gereedschappen voor VLSI	4	2003	4
1086678	STEIN E	127113	Elektrofysiologische signalen en bio-electriciteit	9	2003	4
1086678	STEIN E	129345	Deelname aan een studiegroep	7	2003	3
1086678	STEIN E	129348	Maken van een scriptie	8	2003	3
1086678	STEIN E	129362	Start P-project	7	2003	3
1086678	STEIN E	150630	Applied functional analysis	5	2003	4
1086678	STEIN E	151007	Lineaire algebra	4	2003	4
1086678	STEIN E	151010	Lineaire structuren	6	2003	3
1086678	STEIN E	151019	Analyse B	6	2003	4
1086678	STEIN E	151033	Numerieke analyse	7	2003	3
1086678	STEIN E	151086	Vectoranalyse voor BMT	7	2003	3
1086678	STEIN E	151091	Modelvorming I	7	2003	3
1086678	STEIN E	151120	Wiskunde I	4	2003	4
1086678	STEIN E	151202	Calculus B	3	2003	3
1086678	STEIN E	151206	Lineaire Algebra A	1	2003	3
1086678	STEIN E	152051	Voortgezette grafentheorie	8	2003	3
1086678	STEIN E	152066	Capita selecta analyse	5	2003	2
1086678	STEIN E	152068	Discrete wiskunde	8	2003	2
1086678	STEIN E	152070	Meetkunde	7	2003	4
1086678	STEIN E	153003	Kansrekening	8	2003	3
1086678	STEIN E	153031	Statistiek	9	2003	3
1086678	STEIN E	153036	Statistiek II	9	2003	2
1086678	STEIN E	153041	Inleiding statistiek	2	2003	4
1086678	STEIN E	153045	Lineaire statistische modellen	8	2003	4
1086678	STEIN E	153087	Wachttijdtheorie	7	2003	3
1086678	STEIN E	153135	Statistical techniques	8	2003	4
1086678	STEIN E	154021	Numerieke wiskunde en programmeermethoden	9	2003	3
1086678	STEIN E	155010	Part. differentiaalverg. uit de math. fysica	2	2003	2
1086678	STEIN E	155019	Practicum softwarepakketten PDV	3	2003	3
1086678	STEIN E	156080	Signalen en transformaties	2	2003	3
1086678	STEIN E	157021	Analyse van signaaloverdracht in communicatienetw.	4	2003	4
1086678	STEIN E	158038	Discrete optimalisering	6	2003	3
1086678	STEIN E	211022	Programmeren in C++	9	2003	3
1086678	STEIN E	211032	Seminarium Taal, Kennis & Interactie	4	2003	4
1086678	STEIN E	211033	Neurale netwerken en neuro-computing	9	2003	3
1086678	STEIN E	211038	Spraak- en taaltechnologie	5	2002	1
1086678	STEIN E	211050	Structuur van programmeertalen	5	2003	3
1086678	STEIN E	211095	Gedistribueerde databases & middleware technologie	7	2003	1
1086678	STEIN E	211097	Bijzondere onderwerpen gegevensbanken	5	2003	1
1086678	STEIN E	211127	Formele analyse van natuurlijke taal	7	2003	4
1086678	STEIN E	211129	Taaltechnologie	4	2003	4
1086678	STEIN E	211180	Basismodellen in de informatica	2	2003	2
1086678	STEIN E	213001	Basisbegrippen digitale techniek	8	2003	4
1086678	STEIN E	213011	Gedistribueerde systemen	8	2003	4
1086678	STEIN E	213013	Real-time embedded systemen	6	2003	3
1086678	STEIN E	213014	Procesbesturing en robotica	4	2003	3
1086678	STEIN E	213130	Computer Organisatie INF/TEL	9	2003	3
1086678	STEIN E	214030	Artificial Intelligence	8	2003	4
1086678	STEIN E	214030	Artificial Intelligence	5	2002	1
1086678	STEIN E	214030	Artificial Intelligence	9	2003	2
1086678	STEIN E	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	3
1086678	STEIN E	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2002	1
1086678	STEIN E	219910	Ontwerpproject	9	2003	3
1086678	STEIN E	232050	Electronic Commerce	6	2003	4
1086678	STEIN E	232060	Multi-agent systemen	4	2003	4
1086678	STEIN E	234020	Ontwerpen van mens-machine interactie	9	2003	1
1086678	STEIN E	235022	Investeringen in informatietechnologie	7	2003	2
1086678	STEIN E	239805	BIT-BV	1	2003	4
1086678	STEIN E	265201	Middleware for distributed objects	6	2003	3
1086678	STEIN E	266100	Patterns of software development	4	2003	4
1086678	STEIN E	269100	P-project TEL	7	2003	4
1086857	REIDING G	154023	Numerieke wiskunde en programmeermethoden	5	2003	1
1086857	REIDING G	156012	Gewone differentiaalvergelijkingen	9	2003	3
1086857	REIDING G	156016	Analyse B	9	2003	3
1086857	REIDING G	156033	Bifurcatie theorie	1	2003	4
1086857	REIDING G	156069	Systemen en Signalen	7	2003	3
1086857	REIDING G	158006	Operationele research II	8	2003	4
1086857	REIDING G	158061	Inleiding wiskundige economie	5	2003	4
1086857	REIDING G	211038	Spraak- en taaltechnologie	6	2002	3
1086857	REIDING G	211038	Spraak- en taaltechnologie	6	2003	4
1086857	REIDING G	211095	Gedistribueerde databases & middleware technologie	6	2003	4
1086857	REIDING G	211123	Component- en aspect georienteerd progammeren	7	2003	3
1086857	REIDING G	211129	Taaltechnologie	6	2003	4
1086857	REIDING G	213005	Computerarchitectuur	7	2003	1
1086857	REIDING G	214010	Complexiteit van berekeningen	2	2003	3
1086857	REIDING G	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2002	3
1086857	REIDING G	214500	Communicatie en ontwerpen in ICT-projecten 1	5	2003	3
1086857	REIDING G	214501	Communicatie & ontwerpen in ICT-projecten 2	4	2003	3
1086857	REIDING G	232050	Electronic Commerce	5	2003	4
1086857	REIDING G	232055	XML-technologie in E-Commerce	4	2003	1
1086857	REIDING G	234001	Productie-informatietechnologie	4	2003	3
1086857	REIDING G	234026	Voortgezette informatiesysteemmodellering	9	2003	1
1086857	REIDING G	237201	Oriëntatie ICT	7	2003	4
1086857	REIDING G	262000	Telematicanetwerken	4	2003	4
1086857	REIDING G	264001	Telematics and business strategies	8	2003	2
1086857	REIDING G	265100	Ontwerpen van telematicasystemen	4	2003	1
1086857	REIDING G	265300	Operationeel management van telematicasystemen	8	2003	3
1086962	SCHURINGA U	121002	Practicum elektronische basisschakelingen	5	2003	3
1086962	SCHURINGA U	121006	Practicum Meetinstrumenten/Netwerkanalyse	6	2003	3
1086962	SCHURINGA U	121008	Practicum Elektromagnetische Veldtheorie	4	2002	1
1086962	SCHURINGA U	121008	Practicum Elektromagnetische Veldtheorie	5	2003	1
1086962	SCHURINGA U	121022	Neurofysiologie	3	2003	4
1086962	SCHURINGA U	121026	Hands-on dig.image proces. and graphical pres.	4	2002	3
1086962	SCHURINGA U	121026	Hands-on dig.image proces. and graphical pres.	2	2003	4
1086962	SCHURINGA U	121034	Fysische modelvorming van embedded systemen	1	2003	4
1086962	SCHURINGA U	121035	Mid P-project	8	2003	1
1086962	SCHURINGA U	121043	Dynamische systemen	7	2003	2
1086962	SCHURINGA U	121044	Regeltechniek	6	2003	2
1086962	SCHURINGA U	121050	Modern robotics	8	2003	3
1086962	SCHURINGA U	121056	Laboratorium op een chip	7	2003	3
1086962	SCHURINGA U	122227	Voortgezette analoge IC elektronica	7	2003	4
1086962	SCHURINGA U	122481	Systems engineering	5	2003	3
1086962	SCHURINGA U	122729	Image processing	7	2003	4
1086962	SCHURINGA U	122816	Mechanica en transductietechniek	9	2002	3
1086962	SCHURINGA U	122829	Systemen en technieken voor informatieopslag	6	2003	4
1086962	SCHURINGA U	122831	Geintegreerde optica	6	2003	2
1086962	SCHURINGA U	123152	Signal processing in acoustics and audio	5	2003	3
1086962	SCHURINGA U	124151	Mechatronica	7	2003	4
1086962	SCHURINGA U	124176	Digitale Regeltechniek	8	2003	3
1086962	SCHURINGA U	125118	Practicum informatie-overdracht	9	2003	2
1086962	SCHURINGA U	125151	Schakel- en controlesystemen v. Multi-service netw	4	2003	3
1086962	SCHURINGA U	125152	Glasvezelcommunicatie	5	2003	2
1086962	SCHURINGA U	125160	Mobiele communicatie	6	2003	3
1086962	SCHURINGA U	127115	Praktische biomedische signaalanalyse	6	2003	4
1086962	SCHURINGA U	127116	Elektromagnetisme I voor HBO	4	2003	3
1086962	SCHURINGA U	129351	Fysiologie II	3	2003	1
1086962	SCHURINGA U	129367	Individual project	6	2003	3
1086962	SCHURINGA U	150529	Wiskundig modelleren IV	5	2003	1
1086962	SCHURINGA U	150630	Applied functional analysis	4	2003	4
1086962	SCHURINGA U	150730	Experimental design	4	2003	3
1086962	SCHURINGA U	151045	Functionaalanalyse III	9	2003	4
1086962	SCHURINGA U	151052	Fundamentele analyse II	9	2003	3
1086962	SCHURINGA U	151070	Kwantitatieve methoden	6	2002	4
1086962	SCHURINGA U	151082	Wiskunde II	6	2003	4
1086962	SCHURINGA U	151085	Wiskunde I	8	2003	3
1086962	SCHURINGA U	151091	Modelvorming I	8	2003	1
1086962	SCHURINGA U	151092	Modelvorming II	8	2003	2
1086962	SCHURINGA U	151210	Wiskunde A	5	2003	4
1086962	SCHURINGA U	151210	Wiskunde A	9	2003	1
1086962	SCHURINGA U	151510	Introduction to Risk Theory	7	2003	3
1086962	SCHURINGA U	152025	Complexe functietheorie	6	2003	3
1086962	SCHURINGA U	152056	Combinatoriek	8	2003	4
1086962	SCHURINGA U	152070	Meetkunde	8	2003	1
1086962	SCHURINGA U	153006	Kansrekening	9	2003	3
1086962	SCHURINGA U	153032	Kansrekening en stochastische processen	6	2003	4
1086962	SCHURINGA U	153065	Markov ketens	5	2003	4
1086962	SCHURINGA U	153080	Stochastische modellen in de operationele research	7	2003	4
1086962	SCHURINGA U	153081	Stochastische modellen v. telecommunicatie syst.	6	2003	3
1086962	SCHURINGA U	153082	Stochastische simulatie	5	2003	3
1086962	SCHURINGA U	153100	Statistiek	6	2003	3
1086962	SCHURINGA U	155019	Practicum softwarepakketten PDV	5	2003	3
1086962	SCHURINGA U	156016	Analyse B	7	2003	3
1086962	SCHURINGA U	156029	Analyse C	4	2003	3
1086962	SCHURINGA U	156066	Besturingstheorie van economische systemen	6	2003	4
1086962	SCHURINGA U	156067	Robust Control	9	2003	4
1086962	SCHURINGA U	156069	Systemen en Signalen	9	2003	3
1086962	SCHURINGA U	157008	Stochastische processen in dynamische systemen	5	2003	3
1086962	SCHURINGA U	158075	Deterministische modellen in de OR	6	2002	4
1086962	SCHURINGA U	211024	Programmeren in C++	8	2003	4
1086962	SCHURINGA U	211034	Spraaktechnologie	9	2003	2
1086962	SCHURINGA U	211045	Besturingssystemen	1	2003	3
1086962	SCHURINGA U	211054	Computersystemen	5	2003	3
1086962	SCHURINGA U	211081	Distributed E-business Techniques	4	2003	3
1086962	SCHURINGA U	211097	Bijzondere onderwerpen gegevensbanken	5	2003	3
1086962	SCHURINGA U	211113	Constraint Logic Programming	4	2003	4
1086962	SCHURINGA U	211131	Statische Objectanalyse en Typering	1	2003	4
1086962	SCHURINGA U	213001	Basisbegrippen digitale techniek	4	2003	4
1086962	SCHURINGA U	213012	Hardware/software co-design	5	2003	4
1086962	SCHURINGA U	213110	Computerorganisatie	3	2003	1
1086962	SCHURINGA U	213530	Concurrent and distributed programming	6	2003	4
1086962	SCHURINGA U	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	3
1086962	SCHURINGA U	214513	Internet & Web Architecturen	6	2003	4
1086962	SCHURINGA U	232055	XML-technologie in E-Commerce	1	2003	4
1086962	SCHURINGA U	233035	Practicum Databases in Informatiesystemen	8	2002	3
1086962	SCHURINGA U	234010	Invoering van IT in organisaties	4	2002	4
1086962	SCHURINGA U	236050	E-health Strategies	4	2003	4
1086962	SCHURINGA U	237201	Oriëntatie ICT	4	2002	2
1086962	SCHURINGA U	237400	BedrijfsProces Ondersteuning	5	2003	3
1086962	SCHURINGA U	262001	Mobile and wireless networking	6	2003	4
1086962	SCHURINGA U	264000	Telematicatoepassingen	8	2003	3
1086962	SCHURINGA U	265400	Beveiliging van telematicasystemen	7	2003	3
1087744	BERFLO P S	122815	Materiaalkunde van microsystemen	9	2003	4
1087744	BERFLO P S	122821	Microtechnologie t.b.v. transducenten	9	2003	3
1087744	BERFLO P S	122828	Practicum realiseren in materialen	6	2003	1
1087744	BERFLO P S	123152	Signal processing in acoustics and audio	4	2003	1
1087744	BERFLO P S	124151	Mechatronica	9	2003	2
1087744	BERFLO P S	125114	Prestatieanalyse van communicatienetwerken	7	2003	4
1087744	BERFLO P S	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	3
1087744	BERFLO P S	125153	Inleiding communicatiesystemen	4	2003	3
1087744	BERFLO P S	127116	Elektromagnetisme I voor HBO	4	2003	2
1087744	BERFLO P S	127117	Biomechatronica	9	2001	3
1087744	BERFLO P S	129355	Deelname aan een studiegroep	9	2003	3
1087744	BERFLO P S	129358	Maken van een scriptie	8	2003	3
1087744	BERFLO P S	150529	Wiskundig modelleren IV	7	2003	1
1087744	BERFLO P S	151072	Wiskunde II	8	2003	1
1087744	BERFLO P S	151085	Wiskunde I	9	2003	3
1087744	BERFLO P S	151091	Modelvorming I	7	2003	3
1087744	BERFLO P S	151092	Modelvorming II	8	2003	2
1087744	BERFLO P S	151093	Modelvorming III	5	2003	3
1087744	BERFLO P S	151130	Wiskunde II	7	2003	4
1087744	BERFLO P S	151210	Wiskunde A	8	2003	1
1087744	BERFLO P S	151215	Wiskunde B	5	2003	4
1087744	BERFLO P S	151530	Continuous Time Finance	9	2003	4
1087744	BERFLO P S	151570	Financial Engineering	4	2003	3
1087744	BERFLO P S	152006	Lineaire structuren	5	2003	4
1087744	BERFLO P S	152027	Calculus II	1	2003	3
1087744	BERFLO P S	152061	Discrete wiskunde	9	2003	3
1087744	BERFLO P S	152068	Discrete wiskunde	2	2003	3
1087744	BERFLO P S	152070	Meetkunde	7	2003	1
1087744	BERFLO P S	152100	Calculus I	9	2003	4
1087744	BERFLO P S	153006	Kansrekening	5	2003	3
1087744	BERFLO P S	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	2
1087744	BERFLO P S	153086	Telecommunicatiesystemen	4	2003	4
1087744	BERFLO P S	154021	Numerieke wiskunde en programmeermethoden	1	2003	3
1087744	BERFLO P S	154023	Numerieke wiskunde en programmeermethoden	8	2003	1
1087744	BERFLO P S	157021	Analyse van signaaloverdracht in communicatienetw.	8	2003	4
1087744	BERFLO P S	158017	Operationele research I	2	2003	4
1087744	BERFLO P S	158038	Discrete optimalisering	2	2003	3
1087744	BERFLO P S	158070	Grafentheorie en operationele research	4	2003	1
1087744	BERFLO P S	211027	Inleiding programmeren met MATLAB	4	2003	3
1087744	BERFLO P S	211034	Spraaktechnologie	2	2003	3
1087744	BERFLO P S	211047	Besturingssystemen voor Telematica	5	2003	4
1087744	BERFLO P S	211095	Gedistribueerde databases & middleware technologie	6	2003	4
1087744	BERFLO P S	211108	Bijzondere onderwerpen uit de logica	7	2003	4
1087744	BERFLO P S	211123	Component- en aspect georienteerd progammeren	9	2003	3
1087744	BERFLO P S	211127	Formele analyse van natuurlijke taal	7	2003	4
1087744	BERFLO P S	213001	Basisbegrippen digitale techniek	4	2002	3
1087744	BERFLO P S	213005	Computerarchitectuur	1	2003	4
1087744	BERFLO P S	213016	Bijzondere onderwerpen computerarchitectuur	8	2003	3
1087744	BERFLO P S	213530	Concurrent and distributed programming	7	2002	4
1087744	BERFLO P S	213540	Advanced Design of Software Architectures	9	2003	3
1087744	BERFLO P S	214010	Complexiteit van berekeningen	2	2003	3
1087744	BERFLO P S	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1087744	BERFLO P S	214511	Database Project	4	2003	3
1087744	BERFLO P S	214515	Codesign project	7	2003	3
1087744	BERFLO P S	232016	Prestatie-analyse van informatiesystemen	4	2003	2
1087744	BERFLO P S	232050	Electronic Commerce	5	2003	2
1087744	BERFLO P S	233030	Specificeren van informatiesystemen	6	2003	1
1087744	BERFLO P S	234001	Productie-informatietechnologie	6	2003	3
1087744	BERFLO P S	234010	Invoering van IT in organisaties	3	2002	4
1087744	BERFLO P S	235022	Investeringen in informatietechnologie	6	2003	4
1087744	BERFLO P S	237201	Oriëntatie ICT	8	2003	2
1087744	BERFLO P S	237450	Bedrijfsfunctie ondersteuning	2	2003	3
1087744	BERFLO P S	239981	Integratieproject	4	2003	2
1087744	BERFLO P S	263000	Telematicadiensten	8	2003	4
1087744	BERFLO P S	263200	Gedistribueerde multimedia database systemen	6	2003	4
1087744	BERFLO P S	264001	Telematics and business strategies	3	2003	2
1088275	CROESKAMP S X	213510	Software Engineering Modellen	5	2003	4
1088275	CROESKAMP S X	213545	Advanced Design of Software Architectures 2	9	2003	3
1088275	CROESKAMP S X	214030	Artificial Intelligence	7	2003	4
1088275	CROESKAMP S X	214500	Communicatie en ontwerpen in ICT-projecten 1	2	2002	3
1088275	CROESKAMP S X	214501	Communicatie & ontwerpen in ICT-projecten 2	9	2003	3
1088275	CROESKAMP S X	214515	Codesign project	5	2003	3
1088275	CROESKAMP S X	219801	Hypermedia structuren en systemen	4	2003	1
1088275	CROESKAMP S X	232012	Information retrieval en kennisbeheer	5	2003	3
1088275	CROESKAMP S X	232050	Electronic Commerce	8	2003	2
1088275	CROESKAMP S X	233035	Practicum Databases in Informatiesystemen	5	2002	1
1088275	CROESKAMP S X	234001	Productie-informatietechnologie	7	2003	3
1088275	CROESKAMP S X	234010	Invoering van IT in organisaties	8	2003	4
1088275	CROESKAMP S X	237201	Oriëntatie ICT	4	2002	2
1088275	CROESKAMP S X	237600	Business Case Development for IT-projects	4	2003	1
1088275	CROESKAMP S X	239800	BIT-BV 1	5	2003	4
1088275	CROESKAMP S X	239981	Integratieproject	4	1999	1
1088275	CROESKAMP S X	261010	Computer netwerken	4	2003	3
1088275	CROESKAMP S X	264002	Business process engineering	1	2003	4
1088275	CROESKAMP S X	266100	Patterns of software development	9	2003	4
1088446	JOOSTINK A	121002	Practicum elektronische basisschakelingen	8	2003	3
1088446	JOOSTINK A	121007	Elektromagnetische Veldtheorie	5	2003	3
1088446	JOOSTINK A	121009	Inleiding telecommunicatie	6	2003	4
1088446	JOOSTINK A	121021	Inleiding in de biomedische technologie	6	2002	4
1088446	JOOSTINK A	121021	Inleiding in de biomedische technologie	8	2003	2
1088446	JOOSTINK A	121026	Hands-on dig.image proces. and graphical pres.	2	2002	3
1088446	JOOSTINK A	121026	Hands-on dig.image proces. and graphical pres.	8	2003	4
1088446	JOOSTINK A	121026	Hands-on dig.image proces. and graphical pres.	7	2003	1
1088446	JOOSTINK A	121028	Computer vision	9	2003	4
1088446	JOOSTINK A	121035	Mid P-project	5	2002	4
1088446	JOOSTINK A	121035	Mid P-project	6	2003	3
1088446	JOOSTINK A	121043	Dynamische systemen	6	2003	4
1088446	JOOSTINK A	121044	Regeltechniek	5	2003	2
1088446	JOOSTINK A	121045	Project Mechatronica	8	2002	4
1088446	JOOSTINK A	121049	Practicum Medische Elektronica	5	2003	3
1088446	JOOSTINK A	121053	Zekere- en onzekere informatie	4	2003	3
1088446	JOOSTINK A	121057	Bio-elektriciteit	4	2003	2
1088446	JOOSTINK A	121068	Signaaltheorie	3	2003	3
1088446	JOOSTINK A	121706	Halfgeleiderdevices	8	2003	1
1088446	JOOSTINK A	122829	Systemen en technieken voor informatieopslag	1	2003	4
1088446	JOOSTINK A	122830	Micro electro mechanische systemen	5	2003	4
1088446	JOOSTINK A	122831	Geintegreerde optica	7	2003	2
1088446	JOOSTINK A	123152	Signal processing in acoustics and audio	8	2003	3
1088446	JOOSTINK A	124113	Optimal estimation in dynamic systems	6	2003	3
1088446	JOOSTINK A	124153	Computer-aided design gereedschappen voor VLSI	8	2003	4
1088446	JOOSTINK A	124163	Mechatronische meetsystemen	9	2003	4
1088446	JOOSTINK A	124176	Digitale Regeltechniek	7	2003	3
1088446	JOOSTINK A	125113	Analoge communicatietechniek	8	2003	4
1088446	JOOSTINK A	125151	Schakel- en controlesystemen v. Multi-service netw	6	2003	3
1088446	JOOSTINK A	127113	Elektrofysiologische signalen en bio-electriciteit	6	2003	4
1088446	JOOSTINK A	127116	Elektromagnetisme I voor HBO	6	2003	3
1088446	JOOSTINK A	129351	Fysiologie II	4	2003	3
1088446	JOOSTINK A	129351	Fysiologie II	7	2003	1
1088446	JOOSTINK A	129356	Verrichten van experimenteel werk	1	2003	3
1088446	JOOSTINK A	129367	Individual project	3	2003	3
1088446	JOOSTINK A	150526	Wiskundig modelleren I	4	2003	3
1088446	JOOSTINK A	150539	Maple practicum	9	2003	4
1088446	JOOSTINK A	150710	Modelling project	7	2003	3
1088446	JOOSTINK A	151004	Calculus II-A	8	2003	4
1088446	JOOSTINK A	151025	Functionaalanalyse II	9	2003	3
1088446	JOOSTINK A	151039	Algebra	5	2003	4
1088446	JOOSTINK A	151045	Functionaalanalyse III	5	2003	4
1088446	JOOSTINK A	151070	Kwantitatieve methoden	3	2003	1
1088446	JOOSTINK A	151092	Modelvorming II	8	2003	2
1088446	JOOSTINK A	151120	Wiskunde I	6	2003	4
1088446	JOOSTINK A	151150	Wiskunde IV	7	2003	3
1088446	JOOSTINK A	151600	Modelleren en redeneren	9	2003	4
1088446	JOOSTINK A	152026	Calculus I	7	2003	3
1088446	JOOSTINK A	152030	Tensoranalyse	7	2003	3
1088446	JOOSTINK A	152070	Meetkunde	5	2003	4
1088446	JOOSTINK A	152110	Calculus II	8	2003	3
1088446	JOOSTINK A	153023	Statistiek II voor TBK	1	2003	3
1088446	JOOSTINK A	153087	Wachttijdtheorie	4	2003	3
1088446	JOOSTINK A	153088	Stochastische modellen voor Operations Management	8	2003	3
1088446	JOOSTINK A	153120	Statistiek	2	2003	4
1088446	JOOSTINK A	153135	Statistical techniques	9	2003	4
1088446	JOOSTINK A	154021	Numerieke wiskunde en programmeermethoden	4	2003	3
1088446	JOOSTINK A	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	4	2003	3
1088446	JOOSTINK A	156062	Systeem- en besturingstheorie	8	2003	4
1088446	JOOSTINK A	156066	Besturingstheorie van economische systemen	9	2003	4
1088446	JOOSTINK A	157004	Stochastische processen in financien	6	2003	3
1088446	JOOSTINK A	157008	Stochastische processen in dynamische systemen	8	2003	3
1088446	JOOSTINK A	157009	Tijdreeksenanalyse en identificatietheorie	9	2003	3
1088446	JOOSTINK A	157021	Analyse van signaaloverdracht in communicatienetw.	5	2003	4
1088446	JOOSTINK A	158018	Operationele research I, practicum	4	2003	4
1088446	JOOSTINK A	211038	Spraak- en taaltechnologie	7	2001	3
1088446	JOOSTINK A	211047	Besturingssystemen voor Telematica	8	2003	4
1088446	JOOSTINK A	211090	Databasetoepassingen	6	2003	4
1088446	JOOSTINK A	211098	Databasetransacties en -processen	4	2003	2
1088446	JOOSTINK A	211108	Bijzondere onderwerpen uit de logica	7	2003	4
1088446	JOOSTINK A	212018	Kennistechnologie voor bedrijfskundige toep.	8	2003	2
1088446	JOOSTINK A	213125	Computersystemen	5	2003	4
1088446	JOOSTINK A	213500	Programmeren 1	6	2003	1
1088446	JOOSTINK A	213530	Concurrent and distributed programming	4	2002	4
1088446	JOOSTINK A	214012	Systeemvalidatie	5	2003	3
1088446	JOOSTINK A	214030	Artificial Intelligence	7	2002	1
1088446	JOOSTINK A	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2001	3
1088446	JOOSTINK A	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	3
1088446	JOOSTINK A	214513	Internet & Web Architecturen	8	2002	2
1088446	JOOSTINK A	219801	Hypermedia structuren en systemen	2	2003	4
1088446	JOOSTINK A	219803	Neurale netwerken	4	2003	4
1088446	JOOSTINK A	232016	Prestatie-analyse van informatiesystemen	9	2002	4
1088446	JOOSTINK A	232016	Prestatie-analyse van informatiesystemen	4	2003	3
1088446	JOOSTINK A	232016	Prestatie-analyse van informatiesystemen	9	2003	2
1088446	JOOSTINK A	232055	XML-technologie in E-Commerce	4	2003	1
1088446	JOOSTINK A	232060	Multi-agent systemen	6	2003	2
1088446	JOOSTINK A	234010	Invoering van IT in organisaties	5	2003	4
1088446	JOOSTINK A	234026	Voortgezette informatiesysteemmodellering	8	2003	4
1088446	JOOSTINK A	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1088446	JOOSTINK A	236050	E-health Strategies	9	2003	4
1088446	JOOSTINK A	237400	BedrijfsProces Ondersteuning	4	2003	1
1088446	JOOSTINK A	239981	Integratieproject	4	2000	4
1088446	JOOSTINK A	239981	Integratieproject	7	2002	3
1088446	JOOSTINK A	239981	Integratieproject	8	2001	2
1088446	JOOSTINK A	239981	Integratieproject	3	2003	2
1088446	JOOSTINK A	262020	Bijzondere onderwerpen Telematica	2	2003	4
1088446	JOOSTINK A	264001	Telematics and business strategies	4	2003	2
1088446	JOOSTINK A	265201	Middleware for distributed objects	4	2002	4
1088446	JOOSTINK A	265310	Internet management architecturen	8	2003	3
1088446	JOOSTINK A	266100	Patterns of software development	5	2003	4
1088446	JOOSTINK A	269100	P-project TEL	3	2003	4
1088622	DOES O	121003	Elektronische functies	5	2003	3
1088622	DOES O	121007	Elektromagnetische Veldtheorie	1	2003	3
1088622	DOES O	121008	Practicum Elektromagnetische Veldtheorie	2	2002	4
1088622	DOES O	121021	Inleiding in de biomedische technologie	2	2002	2
1088622	DOES O	121022	Neurofysiologie	3	2003	4
1088622	DOES O	121025	Digitale beeldbewerking voor beta	4	2003	3
1088622	DOES O	121040	Medische elektronica	8	2003	3
1088622	DOES O	121043	Dynamische systemen	5	2003	2
1088622	DOES O	121049	Practicum Medische Elektronica	5	2003	3
1088622	DOES O	121057	Bio-elektriciteit	4	2003	2
1088622	DOES O	121709	Reliability Engineering	5	2003	2
1088622	DOES O	122729	Image processing	5	2003	4
1088622	DOES O	122816	Mechanica en transductietechniek	8	2002	3
1088622	DOES O	122816	Mechanica en transductietechniek	4	2003	4
1088622	DOES O	122831	Geintegreerde optica	6	2003	2
1088622	DOES O	123112	Moderne modulatie- en detectietechnieken	1	2003	4
1088622	DOES O	123152	Signal processing in acoustics and audio	6	2002	4
1088622	DOES O	123152	Signal processing in acoustics and audio	4	2003	3
1088622	DOES O	124162	Modelvorming en simulatie	5	2003	4
1088622	DOES O	125113	Analoge communicatietechniek	5	2003	4
1088622	DOES O	125151	Schakel- en controlesystemen v. Multi-service netw	7	2003	1
1088622	DOES O	127116	Elektromagnetisme I voor HBO	7	2003	3
1088622	DOES O	127116	Elektromagnetisme I voor HBO	3	2003	2
1088622	DOES O	129355	Deelname aan een studiegroep	7	2003	3
1088622	DOES O	129362	Start P-project	7	2003	2
1088622	DOES O	129367	Individual project	8	2003	2
1088622	DOES O	150433	Wiskundig modelleren voor CiT	7	2003	4
1088622	DOES O	150529	Wiskundig modelleren IV	3	2003	4
1088622	DOES O	150630	Applied functional analysis	1	2003	4
1088622	DOES O	150730	Experimental design	9	2003	3
1088622	DOES O	150740	Quality control	9	2003	4
1088622	DOES O	150910	Advanced modelling	8	2003	4
1088622	DOES O	151004	Calculus II-A	5	2003	4
1088622	DOES O	151015	Numerieke lineaire algebra	6	2003	3
1088622	DOES O	151073	Calculus III	9	2003	4
1088622	DOES O	151092	Modelvorming II	5	2003	2
1088622	DOES O	151130	Wiskunde II	4	2003	4
1088622	DOES O	151160	Wiskunde C	4	2003	3
1088622	DOES O	151210	Wiskunde A	1	2003	4
1088622	DOES O	151570	Financial Engineering	9	2003	3
1088622	DOES O	152027	Calculus II	6	2003	2
1088622	DOES O	152030	Tensoranalyse	5	2003	3
1088622	DOES O	152066	Capita selecta analyse	8	2003	3
1088622	DOES O	153026	Asymptotische technieken in de statistiek	1	2003	3
1088622	DOES O	153036	Statistiek II	4	2003	4
1088622	DOES O	153036	Statistiek II	5	2003	2
1088622	DOES O	153038	Wiskundige statistiek	9	2003	4
1088622	DOES O	154023	Numerieke wiskunde en programmeermethoden	6	2003	3
1088622	DOES O	156062	Systeem- en besturingstheorie	6	2003	4
1088622	DOES O	156066	Besturingstheorie van economische systemen	9	2003	4
1088622	DOES O	156067	Robust Control	8	2003	4
1088622	DOES O	158018	Operationele research I, practicum	8	2003	4
1088622	DOES O	158025	Mathematische programmering I	9	2003	3
1088622	DOES O	211024	Programmeren in C++	8	2003	4
1088622	DOES O	211033	Neurale netwerken en neuro-computing	7	2003	3
1088622	DOES O	211097	Bijzondere onderwerpen gegevensbanken	2	2003	3
1088622	DOES O	211113	Constraint Logic Programming	8	2003	4
1088622	DOES O	211129	Taaltechnologie	4	2003	4
1088622	DOES O	211130	Ubiquitous Computing	7	2003	3
1088622	DOES O	211133	Ontwerpen van Software Architecturen	4	2003	3
1088622	DOES O	213001	Basisbegrippen digitale techniek	8	2003	4
1088622	DOES O	213014	Procesbesturing en robotica	6	2003	3
1088622	DOES O	213125	Computersystemen	2	2003	4
1088622	DOES O	213500	Programmeren 1	7	2003	1
1088622	DOES O	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2002	1
1088622	DOES O	214512	Computerarchitectuur Project	4	2003	4
1088622	DOES O	219803	Neurale netwerken	4	2003	4
1088622	DOES O	232020	Data warehousing & data mining	6	2002	3
1088622	DOES O	232020	Data warehousing & data mining	6	2003	4
1088622	DOES O	234007	Systemen voor cooperatief werk	5	2003	4
1088622	DOES O	237600	Business Case Development for IT-projects	2	2003	1
1088622	DOES O	239981	Integratieproject	8	1999	1
1088622	DOES O	261000	Telematicasystemen en toepassingen	6	2003	3
1088622	DOES O	261000	Telematicasystemen en toepassingen	4	2003	2
1088682	BLOKKER K E	121001	Elektronische basisschakelingen	2	2003	4
1088682	BLOKKER K E	121006	Practicum Meetinstrumenten/Netwerkanalyse	9	2003	3
1088682	BLOKKER K E	121007	Elektromagnetische Veldtheorie	1	2003	3
1088682	BLOKKER K E	121008	Practicum Elektromagnetische Veldtheorie	7	2002	1
1088682	BLOKKER K E	121035	Mid P-project	9	2002	4
1088682	BLOKKER K E	121037	Advanced digital signal processing	2	2003	3
1088682	BLOKKER K E	121039	Biomedische signaal- en systeemanalyse	6	2003	3
1088682	BLOKKER K E	121041	Elektrodynamica	5	2003	4
1088682	BLOKKER K E	121045	Project Mechatronica	1	2003	1
1088682	BLOKKER K E	121050	Modern robotics	9	2003	3
1088682	BLOKKER K E	121062	Eind P-project	6	2003	4
1088682	BLOKKER K E	121067	Signaal analyse practicum	6	2002	4
1088682	BLOKKER K E	121713	VLSI system design	1	2003	4
1088682	BLOKKER K E	122226	Project voortgezette elektronica	3	2003	3
1088682	BLOKKER K E	122230	Integrated circuits and systems for mixed signals	4	2003	4
1088682	BLOKKER K E	122634	Real-time software development	1	2003	3
1088682	BLOKKER K E	122728	Classification, Estimation and Data Analysis	6	2003	4
1088682	BLOKKER K E	122729	Image processing	1	2003	4
1088682	BLOKKER K E	122733	VLSI signal processing	7	2003	4
1088682	BLOKKER K E	125159	Optische communicatienetwerken	9	2003	4
1088682	BLOKKER K E	125160	Mobiele communicatie	6	2003	3
1088682	BLOKKER K E	127116	Elektromagnetisme I voor HBO	6	2003	2
1088682	BLOKKER K E	127117	Biomechatronica	5	2003	2
1088682	BLOKKER K E	150433	Wiskundig modelleren voor CiT	8	2003	4
1088682	BLOKKER K E	150529	Wiskundig modelleren IV	5	2003	1
1088682	BLOKKER K E	150600	Mathematical methods	5	2003	3
1088682	BLOKKER K E	150620	Systems and signals	2	2003	3
1088682	BLOKKER K E	151005	Calculus II-B	9	2003	3
1088682	BLOKKER K E	151012	Calculus I	9	2003	4
1088682	BLOKKER K E	151015	Numerieke lineaire algebra	4	2003	3
1088682	BLOKKER K E	151025	Functionaalanalyse II	4	2003	3
1088682	BLOKKER K E	151081	Wiskunde I	8	2003	3
1088682	BLOKKER K E	151083	Wiskunde III	8	2003	3
1088682	BLOKKER K E	151160	Wiskunde C	4	2003	3
1088682	BLOKKER K E	151520	Mathematical Finance	1	2003	4
1088682	BLOKKER K E	152027	Calculus II	4	2003	2
1088682	BLOKKER K E	152066	Capita selecta analyse	5	2003	2
1088682	BLOKKER K E	153065	Markov ketens	9	2003	4
1088682	BLOKKER K E	153081	Stochastische modellen v. telecommunicatie syst.	3	2003	2
1088682	BLOKKER K E	153110	Inleiding statistiek	9	2003	3
1088682	BLOKKER K E	154023	Numerieke wiskunde en programmeermethoden	5	2003	3
1088682	BLOKKER K E	155019	Practicum softwarepakketten PDV	6	2003	3
1088682	BLOKKER K E	156012	Gewone differentiaalvergelijkingen	4	2003	3
1088682	BLOKKER K E	156014	Analyse B	9	2003	4
1088682	BLOKKER K E	156016	Analyse B	4	2003	1
1088682	BLOKKER K E	156029	Analyse C	6	2003	3
1088682	BLOKKER K E	156080	Signalen en transformaties	2	2003	3
1088682	BLOKKER K E	157021	Analyse van signaaloverdracht in communicatienetw.	6	2003	4
1088682	BLOKKER K E	158038	Discrete optimalisering	8	2003	3
1088682	BLOKKER K E	211022	Programmeren in C++	9	2003	3
1088682	BLOKKER K E	211038	Spraak- en taaltechnologie	9	2003	4
1088682	BLOKKER K E	211074	Gegevensbanken	8	2003	4
1088682	BLOKKER K E	211096	XML & Databases	3	2003	3
1088682	BLOKKER K E	211097	Bijzondere onderwerpen gegevensbanken	9	2003	3
1088682	BLOKKER K E	211108	Bijzondere onderwerpen uit de logica	4	2003	4
1088682	BLOKKER K E	211131	Statische Objectanalyse en Typering	6	2003	4
1088682	BLOKKER K E	211205	Functioneel programmeren	7	2003	4
1088682	BLOKKER K E	213002	Ontwerpen van digitale systemen	2	2003	4
1088682	BLOKKER K E	213505	Programmeren 2	3	2003	4
1088682	BLOKKER K E	213530	Concurrent and distributed programming	9	2003	2
1088682	BLOKKER K E	213540	Advanced Design of Software Architectures	1	2002	4
1088682	BLOKKER K E	213540	Advanced Design of Software Architectures	8	2003	3
1088682	BLOKKER K E	214030	Artificial Intelligence	3	2002	3
1088682	BLOKKER K E	214513	Internet & Web Architecturen	6	2003	4
1088682	BLOKKER K E	214513	Internet & Web Architecturen	5	2002	2
1088682	BLOKKER K E	219910	Ontwerpproject	8	2003	3
1088682	BLOKKER K E	232012	Information retrieval en kennisbeheer	9	2003	3
1088682	BLOKKER K E	232020	Data warehousing & data mining	4	2002	3
1088682	BLOKKER K E	232055	XML-technologie in E-Commerce	5	2003	1
1088682	BLOKKER K E	237450	Bedrijfsfunctie ondersteuning	1	2003	3
1088682	BLOKKER K E	237600	Business Case Development for IT-projects	4	2003	1
1088682	BLOKKER K E	239981	Integratieproject	7	1999	1
1088682	BLOKKER K E	262000	Telematicanetwerken	6	2003	4
1088682	BLOKKER K E	265100	Ontwerpen van telematicasystemen	2	2003	3
1088682	BLOKKER K E	265200	Implementatie van telematicasystemen	5	2003	1
1088682	BLOKKER K E	269100	P-project TEL	7	2003	2
1088785	HOFSTRA D	121000	Instrumentatie van embedded systemen	4	2003	3
1088785	HOFSTRA D	121007	Elektromagnetische Veldtheorie	8	2001	4
1088785	HOFSTRA D	121007	Elektromagnetische Veldtheorie	5	2003	1
1088785	HOFSTRA D	121018	Stage	9	2003	1
1088785	HOFSTRA D	121021	Inleiding in de biomedische technologie	4	2002	2
1088785	HOFSTRA D	121026	Hands-on dig.image proces. and graphical pres.	4	2003	4
1088785	HOFSTRA D	121026	Hands-on dig.image proces. and graphical pres.	1	2003	1
1088785	HOFSTRA D	121039	Biomedische signaal- en systeemanalyse	7	2003	3
1088785	HOFSTRA D	121045	Project Mechatronica	6	2001	4
1088785	HOFSTRA D	121054	Neurotechnologie	1	2003	4
1088785	HOFSTRA D	121057	Bio-elektriciteit	5	2003	2
1088785	HOFSTRA D	121067	Signaal analyse practicum	8	2002	4
1088785	HOFSTRA D	121068	Signaaltheorie	9	2003	3
1088785	HOFSTRA D	121717	Advanced semiconductor devices	8	2003	3
1088785	HOFSTRA D	122634	Real-time software development	5	2003	3
1088785	HOFSTRA D	122733	VLSI signal processing	7	2003	2
1088785	HOFSTRA D	122816	Mechanica en transductietechniek	9	2002	3
1088785	HOFSTRA D	122816	Mechanica en transductietechniek	7	2003	2
1088785	HOFSTRA D	122828	Practicum realiseren in materialen	7	2003	1
1088785	HOFSTRA D	122833	Integratieproject	4	2003	2
1088785	HOFSTRA D	123112	Moderne modulatie- en detectietechnieken	4	2003	4
1088785	HOFSTRA D	124151	Mechatronica	2	2003	4
1088785	HOFSTRA D	127117	Biomechatronica	4	2002	3
1088785	HOFSTRA D	129354	Literatuuronderzoek	6	2003	4
1088785	HOFSTRA D	150527	Wiskundig modelleren II	7	2003	3
1088785	HOFSTRA D	150610	Statistics and probability	3	2003	3
1088785	HOFSTRA D	150630	Applied functional analysis	6	2003	4
1088785	HOFSTRA D	151010	Lineaire structuren	5	2003	3
1088785	HOFSTRA D	151012	Calculus I	8	2003	4
1088785	HOFSTRA D	151044	Analyse C	9	2003	3
1088785	HOFSTRA D	151051	Fundamentele analyse I	8	2003	1
1088785	HOFSTRA D	151093	Modelvorming III	8	2003	3
1088785	HOFSTRA D	151150	Wiskunde IV	2	2003	3
1088785	HOFSTRA D	151160	Wiskunde C	5	2003	3
1088785	HOFSTRA D	151208	Lineaire Algebra B	4	2003	3
1088785	HOFSTRA D	151540	Computational Methods in Finance	8	2003	4
1088785	HOFSTRA D	152006	Lineaire structuren	2	2003	4
1088785	HOFSTRA D	152028	Analyse A	2	2003	4
1088785	HOFSTRA D	152038	Grafentheorie	8	2003	3
1088785	HOFSTRA D	152056	Combinatoriek	6	2003	4
1088785	HOFSTRA D	152068	Discrete wiskunde	1	2003	3
1088785	HOFSTRA D	153021	Statistiek I voor TBK	8	2003	4
1088785	HOFSTRA D	153135	Statistical techniques	7	2003	4
1088785	HOFSTRA D	155009	Fundamenten van de methode der eindige elementen	8	2003	3
1088785	HOFSTRA D	156016	Analyse B	7	2003	3
1088785	HOFSTRA D	158018	Operationele research I, practicum	4	2003	4
1088785	HOFSTRA D	158042	Modelbouw in de optimalisatie	7	2003	4
1088785	HOFSTRA D	211032	Seminarium Taal, Kennis & Interactie	5	2002	3
1088785	HOFSTRA D	211038	Spraak- en taaltechnologie	3	2001	3
1088785	HOFSTRA D	211038	Spraak- en taaltechnologie	9	2003	1
1088785	HOFSTRA D	211045	Besturingssystemen	8	2003	3
1088785	HOFSTRA D	212018	Kennistechnologie voor bedrijfskundige toep.	9	2003	4
1088785	HOFSTRA D	213005	Computerarchitectuur	9	2003	4
1088785	HOFSTRA D	214030	Artificial Intelligence	4	2003	2
1088785	HOFSTRA D	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2001	3
1088785	HOFSTRA D	214511	Database Project	7	2003	3
1088785	HOFSTRA D	219803	Neurale netwerken	2	2003	4
1088785	HOFSTRA D	232055	XML-technologie in E-Commerce	8	2003	1
1088785	HOFSTRA D	232085	Voortgezette Requirements Engineering	9	2003	4
1088785	HOFSTRA D	234020	Ontwerpen van mens-machine interactie	4	2003	4
1088785	HOFSTRA D	234026	Voortgezette informatiesysteemmodellering	6	2003	1
1088785	HOFSTRA D	239805	BIT-BV	5	2003	4
1088785	HOFSTRA D	262001	Mobile and wireless networking	5	2003	4
1088785	HOFSTRA D	265110	Protocol Engineering	4	2003	3
1088785	HOFSTRA D	265200	Implementatie van telematicasystemen	7	2003	1
1088785	HOFSTRA D	266100	Patterns of software development	4	2003	4
1090264	AUBLIANDER I G	121002	Practicum elektronische basisschakelingen	4	2003	3
1090264	AUBLIANDER I G	121007	Elektromagnetische Veldtheorie	8	2001	4
1090264	AUBLIANDER I G	121008	Practicum Elektromagnetische Veldtheorie	8	2003	1
1090264	AUBLIANDER I G	121009	Inleiding telecommunicatie	1	2003	4
1090264	AUBLIANDER I G	121026	Hands-on dig.image proces. and graphical pres.	7	2003	4
1090264	AUBLIANDER I G	121045	Project Mechatronica	5	2002	4
1090264	AUBLIANDER I G	121049	Practicum Medische Elektronica	5	2003	3
1090264	AUBLIANDER I G	121052	Imaging	8	2003	3
1090264	AUBLIANDER I G	121060	Optische basisfuncties en microsystemen	7	2003	4
1090264	AUBLIANDER I G	122728	Classification, Estimation and Data Analysis	1	2003	4
1090264	AUBLIANDER I G	122733	VLSI signal processing	3	2003	4
1090264	AUBLIANDER I G	122733	VLSI signal processing	8	2003	2
1090264	AUBLIANDER I G	122829	Systemen en technieken voor informatieopslag	4	2003	1
1090264	AUBLIANDER I G	122830	Micro electro mechanische systemen	5	2003	4
1090264	AUBLIANDER I G	123112	Moderne modulatie- en detectietechnieken	6	2003	4
1090264	AUBLIANDER I G	123152	Signal processing in acoustics and audio	9	2003	1
1090264	AUBLIANDER I G	123153	Embedded Signal Processing	7	2003	1
1090264	AUBLIANDER I G	124153	Computer-aided design gereedschappen voor VLSI	9	2003	4
1090264	AUBLIANDER I G	125156	Transmissiemedia- en systemen	3	2003	4
1090264	AUBLIANDER I G	125163	Electromagnetische compatibiliteit	6	2003	4
1090264	AUBLIANDER I G	127116	Elektromagnetisme I voor HBO	3	2003	3
1090264	AUBLIANDER I G	127117	Biomechatronica	4	2002	3
1090264	AUBLIANDER I G	129347	Deelname aan een project	1	2003	4
1090264	AUBLIANDER I G	129354	Literatuuronderzoek	5	2003	4
1090264	AUBLIANDER I G	129356	Verrichten van experimenteel werk	8	2003	3
1090264	AUBLIANDER I G	129367	Individual project	7	2003	2
1090264	AUBLIANDER I G	150433	Wiskundig modelleren voor CiT	7	2003	4
1090264	AUBLIANDER I G	150500	Presentatie van een wiskundig onderwerp	2	2003	1
1090264	AUBLIANDER I G	150600	Mathematical methods	6	2003	3
1090264	AUBLIANDER I G	150700	Introduction to operations research	4	2003	4
1090264	AUBLIANDER I G	151005	Calculus II-B	7	2003	3
1090264	AUBLIANDER I G	151018	Analyse A	6	2003	3
1090264	AUBLIANDER I G	151020	Functionaalanalyse I	7	2003	3
1090264	AUBLIANDER I G	151044	Analyse C	6	2003	3
1090264	AUBLIANDER I G	151051	Fundamentele analyse I	1	2003	1
1090264	AUBLIANDER I G	151130	Wiskunde II	7	2003	4
1090264	AUBLIANDER I G	151210	Wiskunde A	3	2003	4
1090264	AUBLIANDER I G	151215	Wiskunde B	9	2003	4
1090264	AUBLIANDER I G	151540	Computational Methods in Finance	5	2003	4
1090264	AUBLIANDER I G	152028	Analyse A	8	2003	4
1090264	AUBLIANDER I G	152038	Grafentheorie	6	2003	3
1090264	AUBLIANDER I G	153028	Statistiek I	7	2003	4
1090264	AUBLIANDER I G	153032	Kansrekening en stochastische processen	8	2003	4
1090264	AUBLIANDER I G	153045	Lineaire statistische modellen	8	2003	4
1090264	AUBLIANDER I G	153081	Stochastische modellen v. telecommunicatie syst.	7	2003	2
1090264	AUBLIANDER I G	153086	Telecommunicatiesystemen	7	2003	4
1090264	AUBLIANDER I G	154021	Numerieke wiskunde en programmeermethoden	8	2003	3
1090264	AUBLIANDER I G	156067	Robust Control	6	2003	4
1090264	AUBLIANDER I G	157009	Tijdreeksenanalyse en identificatietheorie	7	2003	3
1090264	AUBLIANDER I G	157016	Stochastische filter- en besturingstheorie	4	2003	3
1090264	AUBLIANDER I G	157020	Dynamische discrete gebeurtenissen	4	2003	4
1090264	AUBLIANDER I G	158017	Operationele research I	7	2003	4
1090264	AUBLIANDER I G	158022	Operationele research III	8	2003	3
1090264	AUBLIANDER I G	158025	Mathematische programmering I	4	2003	3
1090264	AUBLIANDER I G	159928	Doctoraalstage	5	2003	3
1090264	AUBLIANDER I G	211017	Inleiding programmeren met JAVA	8	2003	3
1090264	AUBLIANDER I G	211027	Inleiding programmeren met MATLAB	4	2003	3
1090264	AUBLIANDER I G	211081	Distributed E-business Techniques	5	2003	1
1090264	AUBLIANDER I G	211095	Gedistribueerde databases & middleware technologie	8	2003	1
1090264	AUBLIANDER I G	211127	Formele analyse van natuurlijke taal	7	2003	4
1090264	AUBLIANDER I G	213505	Programmeren 2	4	2003	4
1090264	AUBLIANDER I G	213505	Programmeren 2	7	2003	1
1090264	AUBLIANDER I G	214011	Tool Architectuur	6	2003	4
1090264	AUBLIANDER I G	214511	Database Project	8	2003	3
1090264	AUBLIANDER I G	214513	Internet & Web Architecturen	8	2002	2
1090264	AUBLIANDER I G	232020	Data warehousing & data mining	4	2003	4
1090264	AUBLIANDER I G	232020	Data warehousing & data mining	5	2003	2
1090264	AUBLIANDER I G	232085	Voortgezette Requirements Engineering	2	2003	4
1090264	AUBLIANDER I G	233035	Practicum Databases in Informatiesystemen	7	2002	1
1090264	AUBLIANDER I G	234026	Voortgezette informatiesysteemmodellering	2	2003	1
1090264	AUBLIANDER I G	235022	Investeringen in informatietechnologie	1	2003	2
1090264	AUBLIANDER I G	236002	Beheer van ICT voorzieningen	6	2003	3
1090264	AUBLIANDER I G	237201	Oriëntatie ICT	9	2002	2
1090264	AUBLIANDER I G	237600	Business Case Development for IT-projects	4	2003	3
1090264	AUBLIANDER I G	239981	Integratieproject	6	2000	1
1090264	AUBLIANDER I G	263000	Telematicadiensten	8	2003	1
1090264	AUBLIANDER I G	264000	Telematicatoepassingen	1	2003	3
1090264	AUBLIANDER I G	265110	Protocol Engineering	3	2003	3
1090264	AUBLIANDER I G	269001	Portfolio ontwerp	8	2003	4
1090559	MIDDELBERG F	121001	Elektronische basisschakelingen	8	2003	4
1090559	MIDDELBERG F	121021	Inleiding in de biomedische technologie	7	2002	2
1090559	MIDDELBERG F	121026	Hands-on dig.image proces. and graphical pres.	6	2002	3
1090559	MIDDELBERG F	121051	Informatie Opslag	4	2003	3
1090559	MIDDELBERG F	121053	Zekere- en onzekere informatie	2	2003	3
1090559	MIDDELBERG F	121054	Neurotechnologie	1	2003	4
1090559	MIDDELBERG F	121706	Halfgeleiderdevices	8	2003	3
1090559	MIDDELBERG F	122733	VLSI signal processing	8	2003	4
1090559	MIDDELBERG F	122740	Netwerkanalyse voor TEL	9	2003	3
1090559	MIDDELBERG F	123152	Signal processing in acoustics and audio	8	2002	4
1090559	MIDDELBERG F	125118	Practicum informatie-overdracht	6	2003	2
1090559	MIDDELBERG F	127113	Elektrofysiologische signalen en bio-electriciteit	4	2003	4
1090559	MIDDELBERG F	127116	Elektromagnetisme I voor HBO	8	2003	3
1090559	MIDDELBERG F	129357	Deelname aan een project	5	2003	4
1090559	MIDDELBERG F	129358	Maken van een scriptie	3	2003	3
1090559	MIDDELBERG F	150433	Wiskundig modelleren voor CiT	4	2003	4
1090559	MIDDELBERG F	150526	Wiskundig modelleren I	7	2003	3
1090559	MIDDELBERG F	150600	Mathematical methods	9	2003	3
1090559	MIDDELBERG F	151044	Analyse C	5	2003	3
1090559	MIDDELBERG F	151045	Functionaalanalyse III	4	2003	4
1090559	MIDDELBERG F	151080	Bijscholing wiskunde B2	7	2003	3
1090559	MIDDELBERG F	151086	Vectoranalyse voor BMT	1	2003	3
1090559	MIDDELBERG F	151091	Modelvorming I	6	2003	1
1090559	MIDDELBERG F	151092	Modelvorming II	1	2003	4
1090559	MIDDELBERG F	151120	Wiskunde I	5	2003	4
1090559	MIDDELBERG F	151200	Calculus A	8	2003	3
1090559	MIDDELBERG F	151202	Calculus B	4	2003	3
1090559	MIDDELBERG F	152006	Lineaire structuren	4	2003	4
1090559	MIDDELBERG F	152027	Calculus II	8	2003	2
1090559	MIDDELBERG F	152038	Grafentheorie	4	2003	3
1090559	MIDDELBERG F	152068	Discrete wiskunde	4	2003	2
1090559	MIDDELBERG F	153002	Discrete kansrekening	8	2003	3
1090559	MIDDELBERG F	153023	Statistiek II voor TBK	7	2003	3
1090559	MIDDELBERG F	153036	Statistiek II	4	2003	4
1090559	MIDDELBERG F	153036	Statistiek II	8	2003	2
1090559	MIDDELBERG F	153045	Lineaire statistische modellen	6	2003	4
1090559	MIDDELBERG F	153080	Stochastische modellen in de operationele research	7	2003	4
1090559	MIDDELBERG F	153083	Stochastische modellen in productie en logistiek	6	2003	3
1090559	MIDDELBERG F	154021	Numerieke wiskunde en programmeermethoden	2	2003	3
1090559	MIDDELBERG F	156012	Gewone differentiaalvergelijkingen	2	2003	3
1090559	MIDDELBERG F	156014	Analyse B	8	2003	4
1090559	MIDDELBERG F	156066	Besturingstheorie van economische systemen	5	2003	4
1090559	MIDDELBERG F	156067	Robust Control	2	2003	4
1090559	MIDDELBERG F	158006	Operationele research II	6	2003	4
1090559	MIDDELBERG F	158025	Mathematische programmering I	7	2003	3
1090559	MIDDELBERG F	158070	Grafentheorie en operationele research	8	2003	3
1090559	MIDDELBERG F	211017	Inleiding programmeren met JAVA	4	2003	1
1090559	MIDDELBERG F	211038	Spraak- en taaltechnologie	9	2003	1
1090559	MIDDELBERG F	211045	Besturingssystemen	4	2003	3
1090559	MIDDELBERG F	211095	Gedistribueerde databases & middleware technologie	3	2003	4
1090559	MIDDELBERG F	211096	XML & Databases	7	2003	1
1090559	MIDDELBERG F	211109	Voortgezette logica	9	2003	3
1090559	MIDDELBERG F	211127	Formele analyse van natuurlijke taal	8	2003	4
1090559	MIDDELBERG F	211129	Taaltechnologie	7	2003	4
1090559	MIDDELBERG F	211130	Ubiquitous Computing	8	2003	2
1090559	MIDDELBERG F	213002	Ontwerpen van digitale systemen	9	2003	4
1090559	MIDDELBERG F	213125	Computersystemen	9	2003	4
1090559	MIDDELBERG F	213540	Advanced Design of Software Architectures	7	2002	4
1090559	MIDDELBERG F	213540	Advanced Design of Software Architectures	6	2003	3
1090559	MIDDELBERG F	214500	Communicatie en ontwerpen in ICT-projecten 1	9	2002	3
1090559	MIDDELBERG F	214513	Internet & Web Architecturen	3	2003	4
1090559	MIDDELBERG F	232050	Electronic Commerce	9	2003	4
1090559	MIDDELBERG F	232060	Multi-agent systemen	6	2003	2
1090559	MIDDELBERG F	232085	Voortgezette Requirements Engineering	7	2003	4
1090559	MIDDELBERG F	234007	Systemen voor cooperatief werk	8	2003	4
1090559	MIDDELBERG F	239981	Integratieproject	8	1999	3
1090559	MIDDELBERG F	262000	Telematicanetwerken	6	2003	4
1090559	MIDDELBERG F	265201	Middleware for distributed objects	4	2003	3
1093147	LIENESCH Q	121003	Elektronische functies	4	2003	3
1093147	LIENESCH Q	121007	Elektromagnetische Veldtheorie	3	2003	3
1093147	LIENESCH Q	121007	Elektromagnetische Veldtheorie	6	2003	1
1093147	LIENESCH Q	121008	Practicum Elektromagnetische Veldtheorie	6	2002	1
1093147	LIENESCH Q	121008	Practicum Elektromagnetische Veldtheorie	8	2003	1
1093147	LIENESCH Q	121009	Inleiding telecommunicatie	6	2003	4
1093147	LIENESCH Q	121021	Inleiding in de biomedische technologie	1	2002	2
1093147	LIENESCH Q	121021	Inleiding in de biomedische technologie	5	2003	2
1093147	LIENESCH Q	121025	Digitale beeldbewerking voor beta	3	2003	3
1093147	LIENESCH Q	121026	Hands-on dig.image proces. and graphical pres.	4	2003	1
1093147	LIENESCH Q	121028	Computer vision	7	2003	4
1093147	LIENESCH Q	121040	Medische elektronica	1	2003	3
1093147	LIENESCH Q	121050	Modern robotics	7	2003	3
1093147	LIENESCH Q	121054	Neurotechnologie	9	2003	4
1093147	LIENESCH Q	121060	Optische basisfuncties en microsystemen	6	2003	4
1093147	LIENESCH Q	121067	Signaal analyse practicum	9	2003	4
1093147	LIENESCH Q	122227	Voortgezette analoge IC elektronica	4	2003	4
1093147	LIENESCH Q	122230	Integrated circuits and systems for mixed signals	8	2003	4
1093147	LIENESCH Q	122481	Systems engineering	8	2003	3
1093147	LIENESCH Q	122833	Integratieproject	1	2003	2
1093147	LIENESCH Q	123153	Embedded Signal Processing	7	2003	1
1093147	LIENESCH Q	124113	Optimal estimation in dynamic systems	4	2003	3
1093147	LIENESCH Q	124177	Inleiding elektrische energietechniek	8	2002	1
1093147	LIENESCH Q	124177	Inleiding elektrische energietechniek	7	2003	1
1093147	LIENESCH Q	125113	Analoge communicatietechniek	1	2003	4
1093147	LIENESCH Q	125118	Practicum informatie-overdracht	6	2003	3
1093147	LIENESCH Q	125151	Schakel- en controlesystemen v. Multi-service netw	9	2003	3
1093147	LIENESCH Q	127116	Elektromagnetisme I voor HBO	5	2003	3
1093147	LIENESCH Q	129345	Deelname aan een studiegroep	8	2003	3
1093147	LIENESCH Q	129346	Verrichten van experimenteel werk	6	2003	4
1093147	LIENESCH Q	129367	Individual project	8	2003	3
1093147	LIENESCH Q	150528	Wiskundig modelleren III	9	2003	3
1093147	LIENESCH Q	150625	Scientific communication	8	2003	3
1093147	LIENESCH Q	150630	Applied functional analysis	8	2003	4
1093147	LIENESCH Q	151039	Algebra	5	2003	4
1093147	LIENESCH Q	151051	Fundamentele analyse I	4	2003	1
1093147	LIENESCH Q	151080	Bijscholing wiskunde B2	7	2003	3
1093147	LIENESCH Q	151083	Wiskunde III	6	2003	3
1093147	LIENESCH Q	151085	Wiskunde I	8	2003	3
1093147	LIENESCH Q	151093	Modelvorming III	1	2003	3
1093147	LIENESCH Q	151215	Wiskunde B	6	2003	4
1093147	LIENESCH Q	151220	Wiskunde C	9	2003	3
1093147	LIENESCH Q	152028	Analyse A	4	2003	4
1093147	LIENESCH Q	152030	Tensoranalyse	1	2003	3
1093147	LIENESCH Q	152033	Globale analyse	9	2003	4
1093147	LIENESCH Q	152066	Capita selecta analyse	6	2003	3
1093147	LIENESCH Q	152068	Discrete wiskunde	4	2003	3
1093147	LIENESCH Q	152068	Discrete wiskunde	7	2003	2
1093147	LIENESCH Q	152150	Wiskundig modelleren I	3	2003	4
1093147	LIENESCH Q	153004	Statistiek I	3	2003	3
1093147	LIENESCH Q	153023	Statistiek II voor TBK	4	2003	3
1093147	LIENESCH Q	153036	Statistiek II	5	2003	2
1093147	LIENESCH Q	153041	Inleiding statistiek	7	2003	4
1093147	LIENESCH Q	153045	Lineaire statistische modellen	4	2003	4
1093147	LIENESCH Q	153082	Stochastische simulatie	7	2003	3
1093147	LIENESCH Q	153083	Stochastische modellen in productie en logistiek	6	2003	2
1093147	LIENESCH Q	153084	Analyse en besturing van productie systemen	7	2003	3
1093147	LIENESCH Q	156033	Bifurcatie theorie	5	2003	4
1093147	LIENESCH Q	156062	Systeem- en besturingstheorie	4	2003	4
1093147	LIENESCH Q	156069	Systemen en Signalen	8	2003	3
1093147	LIENESCH Q	158022	Operationele research III	6	2003	3
1093147	LIENESCH Q	158025	Mathematische programmering I	8	2003	3
1093147	LIENESCH Q	158070	Grafentheorie en operationele research	8	2003	3
1093147	LIENESCH Q	158075	Deterministische modellen in de OR	6	2003	4
1093147	LIENESCH Q	211022	Programmeren in C++	1	2003	3
1093147	LIENESCH Q	211050	Structuur van programmeertalen	6	2003	3
1093147	LIENESCH Q	211081	Distributed E-business Techniques	8	2003	1
1093147	LIENESCH Q	211113	Constraint Logic Programming	7	2003	4
1093147	LIENESCH Q	211130	Ubiquitous Computing	4	2003	3
1093147	LIENESCH Q	213001	Basisbegrippen digitale techniek	8	2002	3
1093147	LIENESCH Q	213001	Basisbegrippen digitale techniek	9	2003	2
1093147	LIENESCH Q	213500	Programmeren 1	5	2003	1
1093147	LIENESCH Q	213505	Programmeren 2	5	2003	4
1093147	LIENESCH Q	214500	Communicatie en ontwerpen in ICT-projecten 1	1	2002	3
1093147	LIENESCH Q	214500	Communicatie en ontwerpen in ICT-projecten 1	1	2003	3
1093147	LIENESCH Q	214513	Internet & Web Architecturen	2	2002	2
1093147	LIENESCH Q	232081	Requirements Engineering	8	2003	4
1093147	LIENESCH Q	233035	Practicum Databases in Informatiesystemen	4	2003	4
1093147	LIENESCH Q	234010	Invoering van IT in organisaties	9	2003	4
1093147	LIENESCH Q	234010	Invoering van IT in organisaties	6	2003	2
1093147	LIENESCH Q	261000	Telematicasystemen en toepassingen	6	2003	2
1093147	LIENESCH Q	262000	Telematicanetwerken	1	2003	4
1093147	LIENESCH Q	262020	Bijzondere onderwerpen Telematica	5	2003	4
1093147	LIENESCH Q	265100	Ontwerpen van telematicasystemen	9	2003	1
1093147	LIENESCH Q	265200	Implementatie van telematicasystemen	8	2003	1
1093147	LIENESCH Q	269000	Orientatie ICT	9	2003	3
1093449	JANSEN W J	121003	Elektronische functies	9	2003	3
1093449	JANSEN W J	121004	Practicum elektronische functies	7	2003	2
1093449	JANSEN W J	121006	Practicum Meetinstrumenten/Netwerkanalyse	9	2003	3
1093449	JANSEN W J	121007	Elektromagnetische Veldtheorie	7	2003	1
1093449	JANSEN W J	121008	Practicum Elektromagnetische Veldtheorie	7	2003	1
1093449	JANSEN W J	121009	Inleiding telecommunicatie	1	2003	4
1093449	JANSEN W J	121018	Stage	7	2003	1
1093449	JANSEN W J	121019	D-opdracht	9	2003	3
1093449	JANSEN W J	121021	Inleiding in de biomedische technologie	2	2003	2
1093449	JANSEN W J	121026	Hands-on dig.image proces. and graphical pres.	7	2003	1
1093449	JANSEN W J	121045	Project Mechatronica	2	2002	4
1093449	JANSEN W J	121045	Project Mechatronica	6	2003	3
1093449	JANSEN W J	121057	Bio-elektriciteit	9	2003	2
1093449	JANSEN W J	121706	Halfgeleiderdevices	2	2003	3
1093449	JANSEN W J	122227	Voortgezette analoge IC elektronica	6	2003	2
1093449	JANSEN W J	122733	VLSI signal processing	7	2003	2
1093449	JANSEN W J	122815	Materiaalkunde van microsystemen	5	2003	4
1093449	JANSEN W J	122831	Geintegreerde optica	9	2002	4
1093449	JANSEN W J	123149	Lineaire systemen	4	2003	4
1093449	JANSEN W J	123152	Signal processing in acoustics and audio	1	2003	3
1093449	JANSEN W J	124151	Mechatronica	9	2003	2
1093449	JANSEN W J	125160	Mobiele communicatie	2	2003	3
1093449	JANSEN W J	129351	Fysiologie II	7	2003	3
1093449	JANSEN W J	129367	Individual project	6	2003	3
1093449	JANSEN W J	150432	Maple practicum II	5	2003	4
1093449	JANSEN W J	150500	Presentatie van een wiskundig onderwerp	4	2003	3
1093449	JANSEN W J	150500	Presentatie van een wiskundig onderwerp	4	2003	1
1093449	JANSEN W J	150528	Wiskundig modelleren III	9	2003	3
1093449	JANSEN W J	150620	Systems and signals	8	2003	3
1093449	JANSEN W J	151012	Calculus I	8	2003	4
1093449	JANSEN W J	151018	Analyse A	8	2003	3
1093449	JANSEN W J	151033	Numerieke analyse	7	2003	3
1093449	JANSEN W J	151070	Kwantitatieve methoden	8	2003	3
1093449	JANSEN W J	151082	Wiskunde II	9	2003	4
1010191	TUSVELD M W	121003	Elektronische functies	4	2003	3
1010191	TUSVELD M W	121006	Practicum Meetinstrumenten/Netwerkanalyse	6	2003	3
1010191	TUSVELD M W	121009	Inleiding telecommunicatie	9	2003	4
1010191	TUSVELD M W	121021	Inleiding in de biomedische technologie	5	2003	2
1010191	TUSVELD M W	121037	Advanced digital signal processing	9	2003	3
1010191	TUSVELD M W	121039	Biomedische signaal- en systeemanalyse	4	2003	3
1010191	TUSVELD M W	121045	Project Mechatronica	2	2003	1
1010191	TUSVELD M W	121053	Zekere- en onzekere informatie	5	2003	3
1010191	TUSVELD M W	121054	Neurotechnologie	6	2003	4
1010191	TUSVELD M W	121056	Laboratorium op een chip	6	2003	3
1010191	TUSVELD M W	121057	Bio-elektriciteit	8	2003	2
1010191	TUSVELD M W	121067	Signaal analyse practicum	4	2002	4
1010191	TUSVELD M W	121709	Reliability Engineering	7	2003	2
1010191	TUSVELD M W	121714	I.C. technologie	4	2003	4
1010191	TUSVELD M W	121714	I.C. technologie	8	2003	2
1010191	TUSVELD M W	121717	Advanced semiconductor devices	9	2003	3
1010191	TUSVELD M W	122815	Materiaalkunde van microsystemen	9	2003	2
1010191	TUSVELD M W	122828	Practicum realiseren in materialen	2	2003	3
1010191	TUSVELD M W	122829	Systemen en technieken voor informatieopslag	6	2003	1
1010191	TUSVELD M W	123140	Inleiding systeem- en signaaltheorie voor HBO	8	2003	3
1010191	TUSVELD M W	123152	Signal processing in acoustics and audio	9	2002	4
1010191	TUSVELD M W	123152	Signal processing in acoustics and audio	4	2003	1
1010191	TUSVELD M W	124176	Digitale Regeltechniek	4	2003	3
1010191	TUSVELD M W	125119	Signaaltheorie	8	2003	4
1010191	TUSVELD M W	127117	Biomechatronica	3	2003	3
1010191	TUSVELD M W	129344	Literatuuronderzoek	4	2003	3
1010191	TUSVELD M W	129362	Start P-project	9	2003	3
1010191	TUSVELD M W	129362	Start P-project	3	2003	2
1023494	VELTHUIS P	151044	Analyse C	4	2003	3
1025142	BOER Y	151210	Wiskunde A	8	2003	1
1053534	DE JONG Y	239981	Integratieproject	9	1999	3
1065635	BOLDRING F	121052	Imaging	2	2003	3
1073805	MEIJER L E	121052	Imaging	7	2003	3
1079199	ELSINGA E	121018	Stage	9	2003	3
1088785	HOFSTRA D	269100	P-project TEL	7	2003	2
1097074	TENSING Y P	211054	Computersystemen	4	2003	3
1093449	JANSEN W J	152070	Meetkunde	4	2003	4
1093449	JANSEN W J	152070	Meetkunde	8	2003	1
1093449	JANSEN W J	152075	Grafentheorie	5	2003	3
1093449	JANSEN W J	152100	Calculus I	2	2003	4
1093449	JANSEN W J	153006	Kansrekening	9	2003	3
1093449	JANSEN W J	153038	Wiskundige statistiek	8	2003	4
1093449	JANSEN W J	153045	Lineaire statistische modellen	4	2003	4
1093449	JANSEN W J	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	2
1093449	JANSEN W J	155009	Fundamenten van de methode der eindige elementen	5	2003	3
1093449	JANSEN W J	155015	Part.diff.verg.: Numerieke oplossingsmethoden I	9	2003	4
1093449	JANSEN W J	156033	Bifurcatie theorie	8	2003	4
1093449	JANSEN W J	156069	Systemen en Signalen	5	2003	3
1093449	JANSEN W J	157008	Stochastische processen in dynamische systemen	5	2003	3
1093449	JANSEN W J	157016	Stochastische filter- en besturingstheorie	5	2003	3
1093449	JANSEN W J	158018	Operationele research I, practicum	3	2003	4
1093449	JANSEN W J	158022	Operationele research III	5	2003	3
1093449	JANSEN W J	158038	Discrete optimalisering	8	2003	3
1093449	JANSEN W J	159918	Bibliotheekgebruik en literatuuropdracht	8	2003	3
1093449	JANSEN W J	211026	Theoretische informatica	8	2003	3
1093449	JANSEN W J	211045	Besturingssystemen	9	2003	3
1093449	JANSEN W J	211081	Distributed E-business Techniques	9	2003	3
1093449	JANSEN W J	211096	XML & Databases	1	2003	1
1093449	JANSEN W J	211097	Bijzondere onderwerpen gegevensbanken	9	2003	1
1093449	JANSEN W J	213120	Inleiding informatie- en communicatietechnologie	8	2003	4
1093449	JANSEN W J	213510	Software Engineering Modellen	6	2003	4
1093449	JANSEN W J	213530	Concurrent and distributed programming	2	2002	4
1093449	JANSEN W J	213530	Concurrent and distributed programming	9	2003	4
1093449	JANSEN W J	214011	Tool Architectuur	8	2003	4
1093449	JANSEN W J	214030	Artificial Intelligence	7	2002	1
1093449	JANSEN W J	219801	Hypermedia structuren en systemen	6	2003	1
1093449	JANSEN W J	219803	Neurale netwerken	7	2003	4
1093449	JANSEN W J	232020	Data warehousing & data mining	4	2002	3
1093449	JANSEN W J	232080	Requirements Engineering	7	2003	3
1093449	JANSEN W J	232081	Requirements Engineering	7	2003	4
1093449	JANSEN W J	234004	Softwaremanagement	8	2003	3
1093449	JANSEN W J	235005	Inleiding bedrijfsinformatiesystemen	2	2003	3
1093449	JANSEN W J	237201	Oriëntatie ICT	7	2003	2
1093449	JANSEN W J	265100	Ontwerpen van telematicasystemen	5	2002	4
1093449	JANSEN W J	265201	Middleware for distributed objects	4	2002	4
1094064	LENES S C	121001	Elektronische basisschakelingen	5	2003	4
1094064	LENES S C	121008	Practicum Elektromagnetische Veldtheorie	7	2003	1
1094064	LENES S C	121009	Inleiding telecommunicatie	8	2003	4
1094064	LENES S C	121018	Stage	1	2003	3
1094064	LENES S C	121025	Digitale beeldbewerking voor beta	7	2003	3
1094064	LENES S C	121026	Hands-on dig.image proces. and graphical pres.	7	2003	1
1094064	LENES S C	121035	Mid P-project	8	2003	1
1094064	LENES S C	121043	Dynamische systemen	7	2003	2
1094064	LENES S C	121053	Zekere- en onzekere informatie	8	2003	2
1094064	LENES S C	121706	Halfgeleiderdevices	9	2003	1
1094064	LENES S C	122226	Project voortgezette elektronica	5	2003	3
1094064	LENES S C	122728	Classification, Estimation and Data Analysis	1	2003	4
1094064	LENES S C	122740	Netwerkanalyse voor TEL	6	2003	3
1094064	LENES S C	122814	Elektromagnetisme II voor HBO	7	2003	4
1094064	LENES S C	122816	Mechanica en transductietechniek	2	2002	3
1094064	LENES S C	122829	Systemen en technieken voor informatieopslag	5	2003	1
1094064	LENES S C	122830	Micro electro mechanische systemen	9	2003	4
1094064	LENES S C	122831	Geintegreerde optica	9	2003	2
1094064	LENES S C	123153	Embedded Signal Processing	5	2003	1
1094064	LENES S C	124113	Optimal estimation in dynamic systems	8	2003	3
1094064	LENES S C	124153	Computer-aided design gereedschappen voor VLSI	9	2003	4
1094064	LENES S C	124176	Digitale Regeltechniek	6	2003	3
1094064	LENES S C	125118	Practicum informatie-overdracht	4	2003	2
1094064	LENES S C	125159	Optische communicatienetwerken	7	2003	4
1094064	LENES S C	125163	Electromagnetische compatibiliteit	9	2003	4
1094064	LENES S C	127116	Elektromagnetisme I voor HBO	8	2003	2
1094064	LENES S C	127117	Biomechatronica	5	2002	2
1094064	LENES S C	129362	Start P-project	5	2003	3
1094064	LENES S C	150433	Wiskundig modelleren voor CiT	7	2003	4
1094064	LENES S C	150539	Maple practicum	4	2003	4
1094064	LENES S C	151015	Numerieke lineaire algebra	6	2003	3
1094064	LENES S C	151039	Algebra	7	2003	4
1094064	LENES S C	151045	Functionaalanalyse III	3	2003	4
1094064	LENES S C	151070	Kwantitatieve methoden	8	2002	4
1094064	LENES S C	151080	Bijscholing wiskunde B2	7	2003	3
1094064	LENES S C	151083	Wiskunde III	7	2003	3
1094064	LENES S C	151091	Modelvorming I	6	2003	3
1094064	LENES S C	151130	Wiskunde II	8	2003	4
1094064	LENES S C	151150	Wiskunde IV	9	2003	3
1094064	LENES S C	151202	Calculus B	8	2003	3
1094064	LENES S C	151550	Life Insurance	6	2003	4
1094064	LENES S C	152006	Lineaire structuren	1	2003	4
1094064	LENES S C	153003	Kansrekening	5	2003	3
1094064	LENES S C	153016	Voortgezette wiskundige statistiek	1	2003	3
1094064	LENES S C	153023	Statistiek II voor TBK	9	2003	3
1094064	LENES S C	153033	Statistiek	8	2003	4
1094064	LENES S C	153036	Statistiek II	7	2003	4
1094064	LENES S C	153082	Stochastische simulatie	4	2003	3
1094064	LENES S C	153083	Stochastische modellen in productie en logistiek	9	2003	2
1094064	LENES S C	153086	Telecommunicatiesystemen	7	2003	1
1094064	LENES S C	153100	Statistiek	6	2003	3
1094064	LENES S C	153110	Inleiding statistiek	6	2003	3
1094064	LENES S C	155010	Part. differentiaalverg. uit de math. fysica	7	2003	2
1094064	LENES S C	156016	Analyse B	5	2003	3
1094064	LENES S C	156016	Analyse B	7	2003	1
1094064	LENES S C	158075	Deterministische modellen in de OR	5	2003	1
1094064	LENES S C	211038	Spraak- en taaltechnologie	5	2003	1
1094064	LENES S C	211050	Structuur van programmeertalen	4	2003	3
1094064	LENES S C	211095	Gedistribueerde databases & middleware technologie	4	2003	1
1094064	LENES S C	211111	Parallelle processen	9	2003	3
1094064	LENES S C	211123	Component- en aspect georienteerd progammeren	9	2003	1
1094064	LENES S C	211130	Ubiquitous Computing	7	2003	3
1094064	LENES S C	211185	Taal- en rekenmodellen	9	2003	1
1094064	LENES S C	213014	Procesbesturing en robotica	7	2003	3
1094064	LENES S C	213530	Concurrent and distributed programming	6	2002	4
1094064	LENES S C	214500	Communicatie en ontwerpen in ICT-projecten 1	8	2003	3
1094064	LENES S C	214513	Internet & Web Architecturen	7	2002	4
1094064	LENES S C	219803	Neurale netwerken	5	2003	4
1094064	LENES S C	232060	Multi-agent systemen	8	2003	2
1094064	LENES S C	233030	Specificeren van informatiesystemen	9	2003	1
1094064	LENES S C	234001	Productie-informatietechnologie	2	2003	3
1094064	LENES S C	235022	Investeringen in informatietechnologie	9	2003	4
1094064	LENES S C	237201	Oriëntatie ICT	9	2003	2
1094064	LENES S C	239981	Integratieproject	7	2000	1
1094064	LENES S C	239981	Integratieproject	9	2003	2
1094064	LENES S C	261000	Telematicasystemen en toepassingen	6	2003	3
1094711	MEER T Z	121003	Elektronische functies	7	2003	3
1094711	MEER T Z	121004	Practicum elektronische functies	6	2003	2
1094711	MEER T Z	121005	Netwerkanalyse	9	2003	3
1094711	MEER T Z	121007	Elektromagnetische Veldtheorie	7	2002	1
1094711	MEER T Z	121017	D1-project	8	2003	4
1094711	MEER T Z	121035	Mid P-project	8	2002	4
1094711	MEER T Z	121037	Advanced digital signal processing	8	2003	3
1094711	MEER T Z	121045	Project Mechatronica	7	2001	4
1094711	MEER T Z	121049	Practicum Medische Elektronica	8	2003	3
1094711	MEER T Z	121053	Zekere- en onzekere informatie	7	2003	3
1094711	MEER T Z	121706	Halfgeleiderdevices	7	2003	3
1094711	MEER T Z	121709	Reliability Engineering	6	2003	2
1094711	MEER T Z	122634	Real-time software development	5	2003	3
1094711	MEER T Z	122729	Image processing	4	2003	4
1094711	MEER T Z	122815	Materiaalkunde van microsystemen	7	2003	2
1094711	MEER T Z	122830	Micro electro mechanische systemen	6	2003	4
1094711	MEER T Z	122831	Geintegreerde optica	1	2003	2
1094711	MEER T Z	122833	Integratieproject	9	2003	2
1094711	MEER T Z	124151	Mechatronica	3	2003	4
1094711	MEER T Z	124162	Modelvorming en simulatie	6	2003	4
1094711	MEER T Z	124177	Inleiding elektrische energietechniek	8	2002	4
1094711	MEER T Z	125118	Practicum informatie-overdracht	9	2003	3
1094711	MEER T Z	127113	Elektrofysiologische signalen en bio-electriciteit	7	2003	4
1094711	MEER T Z	127115	Praktische biomedische signaalanalyse	6	2003	4
1094711	MEER T Z	150700	Introduction to operations research	7	2003	4
1094711	MEER T Z	150710	Modelling project	5	2003	3
1094711	MEER T Z	150740	Quality control	7	2003	4
1094711	MEER T Z	151007	Lineaire algebra	8	2003	4
1094711	MEER T Z	151015	Numerieke lineaire algebra	1	2003	3
1094711	MEER T Z	151033	Numerieke analyse	6	2003	3
1094711	MEER T Z	151039	Algebra	4	2003	4
1094711	MEER T Z	151070	Kwantitatieve methoden	4	2003	1
1094711	MEER T Z	151600	Modelleren en redeneren	9	2003	4
1094711	MEER T Z	153021	Statistiek I voor TBK	7	2003	4
1094711	MEER T Z	153023	Statistiek II voor TBK	4	2003	3
1094711	MEER T Z	153028	Statistiek I	8	2003	4
1094711	MEER T Z	153038	Wiskundige statistiek	6	2003	4
1094711	MEER T Z	153086	Telecommunicatiesystemen	9	2003	1
1094711	MEER T Z	153088	Stochastische modellen voor Operations Management	6	2003	3
1094711	MEER T Z	153100	Statistiek	5	2003	3
1094711	MEER T Z	154023	Numerieke wiskunde en programmeermethoden	5	2003	3
1094711	MEER T Z	156014	Analyse B	4	2003	4
1094711	MEER T Z	156056	Inleiding wiskundige systeemtheorie	7	2003	4
1094711	MEER T Z	158017	Operationele research I	5	2003	4
1094711	MEER T Z	211022	Programmeren in C++	7	2003	3
1094711	MEER T Z	211038	Spraak- en taaltechnologie	5	2003	1
1094711	MEER T Z	211123	Component- en aspect georienteerd progammeren	5	2003	3
1094711	MEER T Z	211130	Ubiquitous Computing	5	2003	2
1094711	MEER T Z	213120	Inleiding informatie- en communicatietechnologie	5	2003	2
1094711	MEER T Z	214500	Communicatie en ontwerpen in ICT-projecten 1	7	2002	3
1094711	MEER T Z	219801	Hypermedia structuren en systemen	7	2003	4
1094711	MEER T Z	233035	Practicum Databases in Informatiesystemen	9	2002	1
1094711	MEER T Z	234004	Softwaremanagement	1	2003	3
1094711	MEER T Z	236002	Beheer van ICT voorzieningen	2	2003	3
1094711	MEER T Z	237201	Oriëntatie ICT	9	2002	2
1094711	MEER T Z	239981	Integratieproject	9	2002	3
1094711	MEER T Z	265110	Protocol Engineering	6	2003	3
1095291	BORGESIUS E	121003	Elektronische functies	5	2003	2
1095291	BORGESIUS E	121007	Elektromagnetische Veldtheorie	1	2003	1
1095291	BORGESIUS E	121009	Inleiding telecommunicatie	3	2003	4
1095291	BORGESIUS E	121017	D1-project	3	2003	4
1095291	BORGESIUS E	121044	Regeltechniek	5	2003	2
1095291	BORGESIUS E	121053	Zekere- en onzekere informatie	9	2003	2
1095291	BORGESIUS E	121057	Bio-elektriciteit	5	2003	2
1095291	BORGESIUS E	121067	Signaal analyse practicum	2	2002	4
1095291	BORGESIUS E	121067	Signaal analyse practicum	8	2003	4
1095291	BORGESIUS E	121706	Halfgeleiderdevices	2	2003	1
1095291	BORGESIUS E	121709	Reliability Engineering	3	2002	4
1095291	BORGESIUS E	121714	I.C. technologie	5	2003	2
1095291	BORGESIUS E	122227	Voortgezette analoge IC elektronica	7	2003	4
1095291	BORGESIUS E	122733	VLSI signal processing	1	2003	4
1095291	BORGESIUS E	122733	VLSI signal processing	5	2003	2
1095291	BORGESIUS E	122816	Mechanica en transductietechniek	9	2003	4
1095291	BORGESIUS E	122829	Systemen en technieken voor informatieopslag	7	2003	4
1095291	BORGESIUS E	122830	Micro electro mechanische systemen	5	2003	4
1095291	BORGESIUS E	122833	Integratieproject	5	2003	2
1095291	BORGESIUS E	123152	Signal processing in acoustics and audio	8	2003	1
1095291	BORGESIUS E	124151	Mechatronica	5	2003	4
1095291	BORGESIUS E	124163	Mechatronische meetsystemen	4	2003	4
1095291	BORGESIUS E	124177	Inleiding elektrische energietechniek	4	2002	1
1095291	BORGESIUS E	124177	Inleiding elektrische energietechniek	1	2003	1
1095291	BORGESIUS E	125113	Analoge communicatietechniek	7	2003	4
1095291	BORGESIUS E	125156	Transmissiemedia- en systemen	9	2003	4
1095291	BORGESIUS E	125160	Mobiele communicatie	8	2003	3
1095291	BORGESIUS E	127116	Elektromagnetisme I voor HBO	7	2003	3
1095291	BORGESIUS E	129348	Maken van een scriptie	6	2003	3
1095291	BORGESIUS E	129367	Individual project	5	2003	3
1095291	BORGESIUS E	150433	Wiskundig modelleren voor CiT	5	2003	4
1095291	BORGESIUS E	150528	Wiskundig modelleren III	5	2003	3
1095291	BORGESIUS E	150700	Introduction to operations research	9	2003	4
1095291	BORGESIUS E	150910	Advanced modelling	6	2003	4
1095291	BORGESIUS E	151025	Functionaalanalyse II	5	2003	3
1095291	BORGESIUS E	151043	Seminarium mathematische fysica	9	2003	4
1095291	BORGESIUS E	151092	Modelvorming II	9	2003	2
1095291	BORGESIUS E	151130	Wiskunde II	8	2003	4
1095291	BORGESIUS E	151160	Wiskunde C	4	2003	3
1095291	BORGESIUS E	151206	Lineaire Algebra A	5	2003	3
1095291	BORGESIUS E	151570	Financial Engineering	2	2003	3
1095291	BORGESIUS E	152025	Complexe functietheorie	9	2003	3
1095291	BORGESIUS E	152026	Calculus I	5	2003	3
1095291	BORGESIUS E	152028	Analyse A	6	2003	4
1095291	BORGESIUS E	152066	Capita selecta analyse	5	2003	2
1095291	BORGESIUS E	152080	Deterministische en stochastische speltheorie	5	2003	1
1095291	BORGESIUS E	152100	Calculus I	5	2003	4
1095291	BORGESIUS E	153006	Kansrekening	1	2003	3
1095291	BORGESIUS E	153028	Statistiek I	3	2003	4
1095291	BORGESIUS E	153034	Kansrekening en statistiek	9	2003	3
1095291	BORGESIUS E	153038	Wiskundige statistiek	9	2003	4
1095291	BORGESIUS E	153039	Kansrekening en statistiek	2	2003	3
1095291	BORGESIUS E	153081	Stochastische modellen v. telecommunicatie syst.	3	2003	2
1095291	BORGESIUS E	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	7	2003	3
1095291	BORGESIUS E	156062	Systeem- en besturingstheorie	5	2003	4
1095291	BORGESIUS E	156080	Signalen en transformaties	3	2003	3
1095291	BORGESIUS E	157009	Tijdreeksenanalyse en identificatietheorie	8	2003	3
1098652	KROESKAMP M	239801	BIT-BV 2	7	2003	4
1095291	BORGESIUS E	157030	Structured Products	9	2003	3
1095291	BORGESIUS E	158022	Operationele research III	5	2003	3
1095291	BORGESIUS E	158025	Mathematische programmering I	5	2003	3
1095291	BORGESIUS E	158070	Grafentheorie en operationele research	4	2003	1
1095291	BORGESIUS E	159927	Doctoraalstage	9	2003	4
1095291	BORGESIUS E	211026	Theoretische informatica	6	2003	3
1095291	BORGESIUS E	211032	Seminarium Taal, Kennis & Interactie	8	2002	3
1095291	BORGESIUS E	211090	Databasetoepassingen	7	2003	4
1095291	BORGESIUS E	211095	Gedistribueerde databases & middleware technologie	8	2003	1
1095291	BORGESIUS E	211096	XML & Databases	3	2003	1
1095291	BORGESIUS E	211109	Voortgezette logica	8	2003	3
1095291	BORGESIUS E	211130	Ubiquitous Computing	4	2003	3
1095291	BORGESIUS E	212018	Kennistechnologie voor bedrijfskundige toep.	7	2003	4
1095291	BORGESIUS E	213505	Programmeren 2	8	2003	4
1095291	BORGESIUS E	213530	Concurrent and distributed programming	2	2002	4
1095291	BORGESIUS E	214020	Algoritmen,datastructuren en complexiteit	7	2003	4
1095291	BORGESIUS E	214025	Algoritmen,datastructuren en complexiteit plus	2	2003	4
1095291	BORGESIUS E	214030	Artificial Intelligence	9	2003	2
1095291	BORGESIUS E	232011	Architectuur van informatiesystemen	9	2003	4
1095291	BORGESIUS E	232020	Data warehousing & data mining	4	2003	2
1095291	BORGESIUS E	232055	XML-technologie in E-Commerce	7	2003	4
1095291	BORGESIUS E	233030	Specificeren van informatiesystemen	7	2003	1
1095291	BORGESIUS E	234010	Invoering van IT in organisaties	5	2003	4
1095291	BORGESIUS E	237600	Business Case Development for IT-projects	8	2003	1
1095291	BORGESIUS E	239801	BIT-BV 2	9	2003	4
1095291	BORGESIUS E	239801	BIT-BV 2	8	2003	2
1095291	BORGESIUS E	239981	Integratieproject	6	1999	3
1095291	BORGESIUS E	239981	Integratieproject	9	2000	1
1095291	BORGESIUS E	261000	Telematicasystemen en toepassingen	7	2003	2
1095291	BORGESIUS E	265110	Protocol Engineering	2	2003	1
1095291	BORGESIUS E	265201	Middleware for distributed objects	8	2003	3
1095291	BORGESIUS E	269000	Orientatie ICT	8	2003	3
1095755	DOFF T	262020	Bijzondere onderwerpen Telematica	2	2003	1
1095755	DOFF T	265100	Ontwerpen van telematicasystemen	7	2003	3
1095755	DOFF T	265200	Implementatie van telematicasystemen	4	2003	4
1095755	DOFF T	265201	Middleware for distributed objects	9	2002	4
1095755	DOFF T	265201	Middleware for distributed objects	9	2003	3
1095755	DOFF T	265310	Internet management architecturen	7	2003	3
1095755	DOFF T	269100	P-project TEL	5	2003	2
1097074	TENSING Y P	121001	Elektronische basisschakelingen	9	2003	2
1097074	TENSING Y P	121007	Elektromagnetische Veldtheorie	9	2002	4
1097074	TENSING Y P	121007	Elektromagnetische Veldtheorie	8	2003	3
1097074	TENSING Y P	121007	Elektromagnetische Veldtheorie	4	2002	1
1097074	TENSING Y P	121008	Practicum Elektromagnetische Veldtheorie	8	2002	1
1097074	TENSING Y P	121019	D-opdracht	8	2003	3
1097074	TENSING Y P	121022	Neurofysiologie	6	2003	4
1097074	TENSING Y P	121041	Elektrodynamica	4	2003	2
1097074	TENSING Y P	121051	Informatie Opslag	8	2003	3
1097074	TENSING Y P	121054	Neurotechnologie	7	2003	4
1097074	TENSING Y P	121067	Signaal analyse practicum	9	2002	4
1097074	TENSING Y P	121709	Reliability Engineering	3	2003	4
1097074	TENSING Y P	122729	Image processing	6	2003	4
1097074	TENSING Y P	122828	Practicum realiseren in materialen	6	2003	1
1097074	TENSING Y P	122829	Systemen en technieken voor informatieopslag	2	2003	1
1097074	TENSING Y P	122830	Micro electro mechanische systemen	5	2003	4
1097074	TENSING Y P	123140	Inleiding systeem- en signaaltheorie voor HBO	9	2003	3
1097074	TENSING Y P	123152	Signal processing in acoustics and audio	1	2003	3
1097074	TENSING Y P	123153	Embedded Signal Processing	6	2003	1
1097074	TENSING Y P	124151	Mechatronica	4	2003	2
1097074	TENSING Y P	125113	Analoge communicatietechniek	5	2003	4
1097074	TENSING Y P	125114	Prestatieanalyse van communicatienetwerken	5	2003	4
1097074	TENSING Y P	125151	Schakel- en controlesystemen v. Multi-service netw	1	2003	1
1097074	TENSING Y P	125159	Optische communicatienetwerken	8	2003	4
1097074	TENSING Y P	127115	Praktische biomedische signaalanalyse	4	2003	4
1097074	TENSING Y P	127117	Biomechatronica	5	2001	3
1097074	TENSING Y P	129358	Maken van een scriptie	4	2003	3
1097074	TENSING Y P	129367	Individual project	3	2003	2
1097074	TENSING Y P	150526	Wiskundig modelleren I	4	2003	3
1097074	TENSING Y P	150528	Wiskundig modelleren III	3	2003	3
1097074	TENSING Y P	150600	Mathematical methods	8	2003	3
1097074	TENSING Y P	150740	Quality control	4	2003	4
1097074	TENSING Y P	150910	Advanced modelling	1	2003	4
1097074	TENSING Y P	151004	Calculus II-A	6	2003	4
1097074	TENSING Y P	151007	Lineaire algebra	6	2003	4
1097074	TENSING Y P	151024	Lineaire analyse	8	2003	4
1097074	TENSING Y P	151051	Fundamentele analyse I	6	2003	3
1097074	TENSING Y P	151051	Fundamentele analyse I	7	2003	1
1097074	TENSING Y P	151072	Wiskunde II	7	2003	4
1097074	TENSING Y P	151080	Bijscholing wiskunde B2	3	2003	3
1097074	TENSING Y P	151202	Calculus B	7	2003	3
1097074	TENSING Y P	151208	Lineaire Algebra B	3	2003	3
1097074	TENSING Y P	151510	Introduction to Risk Theory	4	2003	3
1097074	TENSING Y P	151540	Computational Methods in Finance	6	2003	4
1093449	JANSEN W J	151084	Wiskunde IV	8	2003	4
1093449	JANSEN W J	151086	Vectoranalyse voor BMT	8	2003	3
1093449	JANSEN W J	151091	Modelvorming I	8	2003	1
1093449	JANSEN W J	151204	Calculus C	3	2003	4
1093449	JANSEN W J	151215	Wiskunde B	4	2003	4
1093449	JANSEN W J	151220	Wiskunde C	6	2003	3
1093449	JANSEN W J	151250	Modellen en systemen	9	2003	4
1093449	JANSEN W J	152038	Grafentheorie	8	2003	3
1093449	JANSEN W J	152056	Combinatoriek	7	2003	4
1097074	TENSING Y P	152026	Calculus I	4	2003	3
1097074	TENSING Y P	152027	Calculus II	9	2003	3
1097074	TENSING Y P	152033	Globale analyse	7	2003	4
1097074	TENSING Y P	152038	Grafentheorie	3	2003	2
1097074	TENSING Y P	152070	Meetkunde	9	2003	4
1097074	TENSING Y P	152070	Meetkunde	3	2003	1
1097074	TENSING Y P	153080	Stochastische modellen in de operationele research	9	2003	4
1097074	TENSING Y P	153100	Statistiek	6	2003	3
1097074	TENSING Y P	153110	Inleiding statistiek	8	2003	3
1097074	TENSING Y P	153135	Statistical techniques	6	2003	4
1097074	TENSING Y P	155010	Part. differentiaalverg. uit de math. fysica	7	2003	4
1097074	TENSING Y P	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	5	2003	3
1097074	TENSING Y P	156067	Robust Control	9	2003	4
1097074	TENSING Y P	157030	Structured Products	4	2003	3
1097074	TENSING Y P	158022	Operationele research III	6	2003	3
1097074	TENSING Y P	158075	Deterministische modellen in de OR	6	2003	4
1097074	TENSING Y P	158075	Deterministische modellen in de OR	8	2003	1
1097074	TENSING Y P	211047	Besturingssystemen voor Telematica	9	2003	4
1097074	TENSING Y P	211096	XML & Databases	5	2003	1
1097074	TENSING Y P	211108	Bijzondere onderwerpen uit de logica	8	2003	4
1097074	TENSING Y P	211130	Ubiquitous Computing	1	2003	2
1097074	TENSING Y P	213011	Gedistribueerde systemen	5	2003	4
1097074	TENSING Y P	213505	Programmeren 2	8	2003	1
1097074	TENSING Y P	213545	Advanced Design of Software Architectures 2	6	2003	3
1097074	TENSING Y P	214011	Tool Architectuur	7	2003	4
1097074	TENSING Y P	214025	Algoritmen,datastructuren en complexiteit plus	4	2003	4
1097074	TENSING Y P	214030	Artificial Intelligence	7	2002	1
1097074	TENSING Y P	214030	Artificial Intelligence	2	2003	2
1097074	TENSING Y P	214500	Communicatie en ontwerpen in ICT-projecten 1	6	2003	3
1097074	TENSING Y P	217001	Testtechnieken	6	2003	3
1097074	TENSING Y P	234007	Systemen voor cooperatief werk	6	2003	4
1097074	TENSING Y P	234026	Voortgezette informatiesysteemmodellering	5	2003	1
1097074	TENSING Y P	237400	BedrijfsProces Ondersteuning	8	2003	1
1097074	TENSING Y P	237600	Business Case Development for IT-projects	8	2003	1
1097074	TENSING Y P	239981	Integratieproject	9	1998	3
1097074	TENSING Y P	239981	Integratieproject	6	2003	2
1097074	TENSING Y P	265300	Operationeel management van telematicasystemen	8	2003	3
1097074	TENSING Y P	269000	Orientatie ICT	8	2003	3
1097567	MAIJ T S	121000	Instrumentatie van embedded systemen	6	2003	3
1097567	MAIJ T S	121008	Practicum Elektromagnetische Veldtheorie	1	2002	1
1097567	MAIJ T S	121008	Practicum Elektromagnetische Veldtheorie	5	2003	1
1097567	MAIJ T S	121017	D1-project	6	2003	4
1097567	MAIJ T S	121018	Stage	8	2003	3
1097567	MAIJ T S	121021	Inleiding in de biomedische technologie	8	2002	4
1097567	MAIJ T S	121025	Digitale beeldbewerking voor beta	2	2003	3
1097567	MAIJ T S	121034	Fysische modelvorming van embedded systemen	7	2003	4
1097567	MAIJ T S	121041	Elektrodynamica	7	2003	2
1097567	MAIJ T S	121044	Regeltechniek	8	2003	4
1097567	MAIJ T S	121045	Project Mechatronica	2	2003	1
1097567	MAIJ T S	121051	Informatie Opslag	4	2003	3
1097567	MAIJ T S	121713	VLSI system design	2	2003	4
1097567	MAIJ T S	122227	Voortgezette analoge IC elektronica	4	2003	2
1097567	MAIJ T S	122481	Systems engineering	8	2003	3
1097567	MAIJ T S	122711	Digitale meetsystemen	6	2003	4
1097567	MAIJ T S	122740	Netwerkanalyse voor TEL	1	2003	3
1097567	MAIJ T S	122816	Mechanica en transductietechniek	8	2002	2
1097567	MAIJ T S	122831	Geintegreerde optica	6	2002	4
1097567	MAIJ T S	123140	Inleiding systeem- en signaaltheorie voor HBO	5	2003	3
1097567	MAIJ T S	124113	Optimal estimation in dynamic systems	8	2003	3
1097567	MAIJ T S	124151	Mechatronica	6	2003	4
1097567	MAIJ T S	124163	Mechatronische meetsystemen	3	2003	4
1097567	MAIJ T S	124177	Inleiding elektrische energietechniek	8	2002	4
1097567	MAIJ T S	124177	Inleiding elektrische energietechniek	6	2003	1
1097567	MAIJ T S	125151	Schakel- en controlesystemen v. Multi-service netw	5	2003	3
1097567	MAIJ T S	127117	Biomechatronica	6	2003	2
1097567	MAIJ T S	129357	Deelname aan een project	9	2003	4
1097567	MAIJ T S	129362	Start P-project	4	2003	3
1097567	MAIJ T S	150529	Wiskundig modelleren IV	4	2003	4
1095291	BORGESIUS E	151019	Analyse B	5	2003	4
1097074	TENSING Y P	121004	Practicum elektronische functies	2	2003	4
1097567	MAIJ T S	237201	Oriëntatie ICT	7	2003	2
1097567	MAIJ T S	150620	Systems and signals	6	2003	3
1097567	MAIJ T S	151565	Praktische opdracht Financial Engineering	8	2003	4
1097567	MAIJ T S	151570	Financial Engineering	8	2003	3
1097567	MAIJ T S	151600	Modelleren en redeneren	4	2003	4
1097567	MAIJ T S	152066	Capita selecta analyse	7	2003	2
1097567	MAIJ T S	152120	Lineaire algebra	6	2003	4
1097567	MAIJ T S	153045	Lineaire statistische modellen	4	2003	4
1097567	MAIJ T S	153082	Stochastische simulatie	6	2003	3
1097567	MAIJ T S	154021	Numerieke wiskunde en programmeermethoden	9	2003	1
1097567	MAIJ T S	156037	Applied Analytical Methods	1	2003	3
1097567	MAIJ T S	156062	Systeem- en besturingstheorie	4	2003	4
1097567	MAIJ T S	156080	Signalen en transformaties	4	2003	3
1097567	MAIJ T S	157008	Stochastische processen in dynamische systemen	9	2003	3
1097567	MAIJ T S	157021	Analyse van signaaloverdracht in communicatienetw.	8	2003	4
1097567	MAIJ T S	158075	Deterministische modellen in de OR	5	2002	4
1097567	MAIJ T S	159918	Bibliotheekgebruik en literatuuropdracht	9	2003	3
1097567	MAIJ T S	211035	Vertalerbouw	3	2003	4
1097567	MAIJ T S	211038	Spraak- en taaltechnologie	5	2002	1
1097567	MAIJ T S	211077	Database-ontwerp	8	2003	4
1097567	MAIJ T S	211090	Databasetoepassingen	6	2003	4
1097567	MAIJ T S	211095	Gedistribueerde databases & middleware technologie	6	2003	1
1097567	MAIJ T S	211096	XML & Databases	8	2003	3
1097567	MAIJ T S	211111	Parallelle processen	5	2003	3
1097567	MAIJ T S	211113	Constraint Logic Programming	4	2003	4
1097567	MAIJ T S	211123	Component- en aspect georienteerd progammeren	7	2003	3
1097567	MAIJ T S	211131	Statische Objectanalyse en Typering	6	2003	4
1097567	MAIJ T S	211133	Ontwerpen van Software Architecturen	3	2003	1
1097567	MAIJ T S	211185	Taal- en rekenmodellen	3	2003	1
1097567	MAIJ T S	213005	Computerarchitectuur	4	2003	1
1097567	MAIJ T S	213011	Gedistribueerde systemen	6	2003	4
1097567	MAIJ T S	213530	Concurrent and distributed programming	6	2003	4
1097567	MAIJ T S	213540	Advanced Design of Software Architectures	6	2003	3
1097567	MAIJ T S	219801	Hypermedia structuren en systemen	9	2003	1
1097567	MAIJ T S	232050	Electronic Commerce	5	2002	4
1097567	MAIJ T S	232060	Multi-agent systemen	6	2003	2
1097567	MAIJ T S	232080	Requirements Engineering	6	2003	3
1097567	MAIJ T S	236002	Beheer van ICT voorzieningen	2	2003	3
1097567	MAIJ T S	239981	Integratieproject	7	2000	1
1097567	MAIJ T S	239981	Integratieproject	6	2002	1
1097567	MAIJ T S	261000	Telematicasystemen en toepassingen	6	2003	2
1097567	MAIJ T S	261010	Computer netwerken	4	2003	1
1097567	MAIJ T S	263200	Gedistribueerde multimedia database systemen	2	2003	4
1097865	HAEN D	121000	Instrumentatie van embedded systemen	7	2003	3
1097865	HAEN D	121006	Practicum Meetinstrumenten/Netwerkanalyse	9	2003	3
1097865	HAEN D	121017	D1-project	4	2003	4
1097865	HAEN D	121034	Fysische modelvorming van embedded systemen	7	2003	4
1097865	HAEN D	121038	Elektronica voor industrieel ontwerpers	7	2003	4
1097865	HAEN D	121043	Dynamische systemen	4	2003	4
1097865	HAEN D	121057	Bio-elektriciteit	9	2003	4
1097865	HAEN D	121057	Bio-elektriciteit	1	2003	2
1097865	HAEN D	121067	Signaal analyse practicum	8	2002	4
1097865	HAEN D	121067	Signaal analyse practicum	7	2003	4
1097865	HAEN D	121714	I.C. technologie	3	2003	2
1097865	HAEN D	122227	Voortgezette analoge IC elektronica	7	2003	4
1097865	HAEN D	122740	Netwerkanalyse voor TEL	5	2003	3
1097865	HAEN D	123152	Signal processing in acoustics and audio	4	2003	3
1097865	HAEN D	123152	Signal processing in acoustics and audio	7	2003	1
1097865	HAEN D	124176	Digitale Regeltechniek	7	2003	3
1097865	HAEN D	124177	Inleiding elektrische energietechniek	4	2002	4
1097865	HAEN D	124177	Inleiding elektrische energietechniek	6	2002	1
1097865	HAEN D	125156	Transmissiemedia- en systemen	7	2003	1
1097865	HAEN D	127116	Elektromagnetisme I voor HBO	5	2003	2
1097865	HAEN D	127117	Biomechatronica	3	2002	3
1097865	HAEN D	129351	Fysiologie II	4	2003	3
1097865	HAEN D	150528	Wiskundig modelleren III	1	2003	3
1097865	HAEN D	151025	Functionaalanalyse II	6	2003	3
1097865	HAEN D	151039	Algebra	9	2003	4
1097865	HAEN D	151051	Fundamentele analyse I	3	2003	1
1097865	HAEN D	151052	Fundamentele analyse II	5	2003	3
1097865	HAEN D	151073	Calculus III	4	2003	4
1097865	HAEN D	151081	Wiskunde I	6	2003	3
1097865	HAEN D	151088	Practicum Wiskundig modelleren	5	2003	4
1097865	HAEN D	151150	Wiskunde IV	4	2003	3
1097865	HAEN D	151202	Calculus B	9	2003	3
1097865	HAEN D	151210	Wiskunde A	5	2003	4
1097865	HAEN D	151215	Wiskunde B	4	2003	4
1097865	HAEN D	151540	Computational Methods in Finance	2	2003	4
1097865	HAEN D	152030	Tensoranalyse	8	2003	3
1097865	HAEN D	152070	Meetkunde	8	2003	1
1097865	HAEN D	152120	Lineaire algebra	6	2003	4
1097865	HAEN D	153002	Discrete kansrekening	9	2003	3
1097865	HAEN D	153036	Statistiek II	5	2003	2
1097865	HAEN D	153080	Stochastische modellen in de operationele research	4	2003	4
1097865	HAEN D	153081	Stochastische modellen v. telecommunicatie syst.	5	2003	3
1097865	HAEN D	155009	Fundamenten van de methode der eindige elementen	8	2003	3
1097865	HAEN D	155010	Part. differentiaalverg. uit de math. fysica	5	2003	4
1097865	HAEN D	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	5	2003	3
1097865	HAEN D	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	5	2003	1
1097865	HAEN D	156068	Niet-lineaire besturingstheorie	4	2003	3
1097865	HAEN D	157004	Stochastische processen in financien	6	2003	3
1097865	HAEN D	158070	Grafentheorie en operationele research	7	2003	3
1097865	HAEN D	159927	Doctoraalstage	5	2003	4
1097865	HAEN D	159960	Multidisciplinaire ontwerpopdracht	4	2003	3
1097865	HAEN D	211034	Spraaktechnologie	6	2003	2
1097865	HAEN D	211038	Spraak- en taaltechnologie	2	2002	3
1097865	HAEN D	211045	Besturingssystemen	7	2003	3
1097865	HAEN D	211050	Structuur van programmeertalen	8	2003	3
1097865	HAEN D	211074	Gegevensbanken	9	2003	4
1097865	HAEN D	211095	Gedistribueerde databases & middleware technologie	3	2003	4
1097865	HAEN D	211097	Bijzondere onderwerpen gegevensbanken	5	2003	3
1097865	HAEN D	211098	Databasetransacties en -processen	9	2003	2
1097865	HAEN D	211108	Bijzondere onderwerpen uit de logica	7	2003	4
1097865	HAEN D	211109	Voortgezette logica	9	2003	3
1097865	HAEN D	211123	Component- en aspect georienteerd progammeren	1	2003	3
1097865	HAEN D	211123	Component- en aspect georienteerd progammeren	4	2003	1
1097865	HAEN D	211128	Informatica en taal	6	2003	4
1097865	HAEN D	211129	Taaltechnologie	4	2003	4
1097865	HAEN D	211185	Taal- en rekenmodellen	7	2003	4
1097865	HAEN D	213510	Software Engineering Modellen	6	2003	4
1097865	HAEN D	213530	Concurrent and distributed programming	7	2003	2
1097865	HAEN D	213540	Advanced Design of Software Architectures	3	2003	3
1097865	HAEN D	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	1
1097865	HAEN D	214501	Communicatie & ontwerpen in ICT-projecten 2	5	2003	3
1097865	HAEN D	214515	Codesign project	6	2003	3
1097865	HAEN D	217001	Testtechnieken	5	2003	3
1097865	HAEN D	232055	XML-technologie in E-Commerce	5	2003	1
1097865	HAEN D	234004	Softwaremanagement	6	2003	3
1097865	HAEN D	234010	Invoering van IT in organisaties	8	2003	4
1097865	HAEN D	234026	Voortgezette informatiesysteemmodellering	8	2003	1
1097865	HAEN D	237600	Business Case Development for IT-projects	3	2003	3
1097865	HAEN D	239981	Integratieproject	6	1999	3
1097865	HAEN D	239981	Integratieproject	7	2003	2
1097865	HAEN D	261000	Telematicasystemen en toepassingen	9	2003	2
1097865	HAEN D	261010	Computer netwerken	5	2003	1
1097865	HAEN D	265300	Operationeel management van telematicasystemen	9	2003	3
1097865	HAEN D	265310	Internet management architecturen	6	2003	3
1098086	BAARSCHERS D I	121002	Practicum elektronische basisschakelingen	5	2003	1
1098086	BAARSCHERS D I	121005	Netwerkanalyse	1	2003	1
1098086	BAARSCHERS D I	121017	D1-project	3	2003	4
1098086	BAARSCHERS D I	121018	Stage	8	2003	1
1098086	BAARSCHERS D I	121039	Biomedische signaal- en systeemanalyse	6	2003	3
1098086	BAARSCHERS D I	121041	Elektrodynamica	8	2003	4
1098086	BAARSCHERS D I	121041	Elektrodynamica	5	2003	2
1098086	BAARSCHERS D I	121045	Project Mechatronica	2	2002	4
1098086	BAARSCHERS D I	121052	Imaging	4	2003	3
1098086	BAARSCHERS D I	121053	Zekere- en onzekere informatie	3	2003	2
1098086	BAARSCHERS D I	121054	Neurotechnologie	4	2003	4
1098086	BAARSCHERS D I	121060	Optische basisfuncties en microsystemen	6	2003	4
1098086	BAARSCHERS D I	121062	Eind P-project	9	2003	4
1098086	BAARSCHERS D I	121067	Signaal analyse practicum	9	2002	4
1098086	BAARSCHERS D I	121714	I.C. technologie	7	2003	4
1098086	BAARSCHERS D I	122230	Integrated circuits and systems for mixed signals	7	2003	4
1098086	BAARSCHERS D I	122816	Mechanica en transductietechniek	5	2002	2
1098086	BAARSCHERS D I	122828	Practicum realiseren in materialen	5	2003	1
1098086	BAARSCHERS D I	123152	Signal processing in acoustics and audio	4	2003	3
1098086	BAARSCHERS D I	123152	Signal processing in acoustics and audio	1	2003	1
1098086	BAARSCHERS D I	124113	Optimal estimation in dynamic systems	6	2003	3
1098086	BAARSCHERS D I	129348	Maken van een scriptie	4	2003	3
1098086	BAARSCHERS D I	129351	Fysiologie II	5	2003	1
1098086	BAARSCHERS D I	129362	Start P-project	7	2003	2
1098086	BAARSCHERS D I	150600	Mathematical methods	7	2003	3
1098086	BAARSCHERS D I	150610	Statistics and probability	5	2003	3
1098086	BAARSCHERS D I	151012	Calculus I	8	2003	4
1098086	BAARSCHERS D I	151019	Analyse B	6	2003	4
1098086	BAARSCHERS D I	151043	Seminarium mathematische fysica	5	2003	4
1098086	BAARSCHERS D I	151086	Vectoranalyse voor BMT	8	2003	3
1098086	BAARSCHERS D I	151160	Wiskunde C	7	2003	3
1098086	BAARSCHERS D I	151202	Calculus B	6	2003	3
1098086	BAARSCHERS D I	151220	Wiskunde C	5	2003	3
1098086	BAARSCHERS D I	152006	Lineaire structuren	8	2003	4
1098086	BAARSCHERS D I	152028	Analyse A	9	2003	4
1098086	BAARSCHERS D I	152051	Voortgezette grafentheorie	6	2003	3
1098086	BAARSCHERS D I	152056	Combinatoriek	4	2003	4
1098086	BAARSCHERS D I	152068	Discrete wiskunde	7	2003	3
1098086	BAARSCHERS D I	152068	Discrete wiskunde	7	2003	2
1098086	BAARSCHERS D I	152070	Meetkunde	7	2003	4
1098086	BAARSCHERS D I	153023	Statistiek II voor TBK	4	2003	3
1098086	BAARSCHERS D I	153026	Asymptotische technieken in de statistiek	5	2003	3
1098086	BAARSCHERS D I	153033	Statistiek	4	2003	4
1098086	BAARSCHERS D I	153036	Statistiek II	7	2003	2
1098086	BAARSCHERS D I	154021	Numerieke wiskunde en programmeermethoden	2	2003	3
1098086	BAARSCHERS D I	154023	Numerieke wiskunde en programmeermethoden	5	2003	3
1098086	BAARSCHERS D I	155010	Part. differentiaalverg. uit de math. fysica	9	2003	4
1098086	BAARSCHERS D I	156016	Analyse B	6	2003	1
1098086	BAARSCHERS D I	156037	Applied Analytical Methods	2	2003	3
1098086	BAARSCHERS D I	156067	Robust Control	8	2003	4
1098086	BAARSCHERS D I	157004	Stochastische processen in financien	5	2003	3
1098086	BAARSCHERS D I	157035	Financial Econometrics	4	2003	3
1098086	BAARSCHERS D I	158075	Deterministische modellen in de OR	1	2003	4
1098086	BAARSCHERS D I	158075	Deterministische modellen in de OR	1	2003	1
1098086	BAARSCHERS D I	211033	Neurale netwerken en neuro-computing	1	2003	3
1098086	BAARSCHERS D I	211037	Graphics & Virtual Reality	5	2003	3
1098086	BAARSCHERS D I	211095	Gedistribueerde databases & middleware technologie	9	2003	4
1098086	BAARSCHERS D I	211123	Component- en aspect georienteerd progammeren	4	2003	1
1098086	BAARSCHERS D I	211133	Ontwerpen van Software Architecturen	7	2003	1
1098086	BAARSCHERS D I	213014	Procesbesturing en robotica	6	2003	3
1098086	BAARSCHERS D I	213510	Software Engineering Modellen	6	2003	4
1098086	BAARSCHERS D I	213545	Advanced Design of Software Architectures 2	9	2003	3
1098086	BAARSCHERS D I	214011	Tool Architectuur	4	2003	4
1098086	BAARSCHERS D I	214500	Communicatie en ontwerpen in ICT-projecten 1	4	2002	1
1098086	BAARSCHERS D I	214510	MMI-project	8	2003	3
1098086	BAARSCHERS D I	214513	Internet & Web Architecturen	9	2002	2
1098086	BAARSCHERS D I	217001	Testtechnieken	8	2003	3
1098086	BAARSCHERS D I	219803	Neurale netwerken	9	2003	4
1098086	BAARSCHERS D I	219910	Ontwerpproject	9	2003	3
1098086	BAARSCHERS D I	232012	Information retrieval en kennisbeheer	5	2003	3
1098086	BAARSCHERS D I	232060	Multi-agent systemen	4	2003	4
1098086	BAARSCHERS D I	232060	Multi-agent systemen	9	2003	2
1098086	BAARSCHERS D I	233035	Practicum Databases in Informatiesystemen	5	2002	1
1098086	BAARSCHERS D I	234010	Invoering van IT in organisaties	6	2003	2
1098086	BAARSCHERS D I	235022	Investeringen in informatietechnologie	4	2003	4
1098086	BAARSCHERS D I	237600	Business Case Development for IT-projects	9	2003	3
1098086	BAARSCHERS D I	239801	BIT-BV 2	4	2003	4
1098086	BAARSCHERS D I	239801	BIT-BV 2	6	2003	2
1098086	BAARSCHERS D I	239805	BIT-BV	6	2003	4
1098086	BAARSCHERS D I	239981	Integratieproject	6	1999	1
1098086	BAARSCHERS D I	239981	Integratieproject	7	2003	2
1098086	BAARSCHERS D I	261010	Computer netwerken	9	2003	1
1098086	BAARSCHERS D I	262001	Mobile and wireless networking	8	2003	4
1098086	BAARSCHERS D I	262020	Bijzondere onderwerpen Telematica	3	2003	1
1098086	BAARSCHERS D I	263000	Telematicadiensten	7	2003	1
1098086	BAARSCHERS D I	265400	Beveiliging van telematicasystemen	5	2003	3
1098351	DE JONG A	265200	Implementatie van telematicasystemen	6	2003	4
1098351	DE JONG A	265310	Internet management architecturen	9	2003	3
1098652	KROESKAMP M	213510	Software Engineering Modellen	6	2003	4
1098652	KROESKAMP M	213530	Concurrent and distributed programming	8	2003	4
1098652	KROESKAMP M	214010	Complexiteit van berekeningen	6	2003	3
1098652	KROESKAMP M	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1098652	KROESKAMP M	214030	Artificial Intelligence	7	2002	1
1098652	KROESKAMP M	219801	Hypermedia structuren en systemen	7	2003	4
1098652	KROESKAMP M	232011	Architectuur van informatiesystemen	8	2003	4
1098652	KROESKAMP M	232050	Electronic Commerce	6	2003	4
1098652	KROESKAMP M	233035	Practicum Databases in Informatiesystemen	5	2003	1
1098652	KROESKAMP M	237450	Bedrijfsfunctie ondersteuning	9	2003	3
1098652	KROESKAMP M	239981	Integratieproject	9	1998	3
1098652	KROESKAMP M	239981	Integratieproject	4	2001	2
1098652	KROESKAMP M	263000	Telematicadiensten	5	2003	1
1099038	BAARSCHERS E A	150529	Wiskundig modelleren IV	8	2003	4
1099038	BAARSCHERS E A	150630	Applied functional analysis	8	2003	4
1099038	BAARSCHERS E A	150810	Modelling project	4	2003	3
1099038	BAARSCHERS E A	151007	Lineaire algebra	4	2003	4
1099038	BAARSCHERS E A	151019	Analyse B	7	2003	4
1099038	BAARSCHERS E A	151043	Seminarium mathematische fysica	8	2003	1
1099038	BAARSCHERS E A	151091	Modelvorming I	6	2003	3
1099038	BAARSCHERS E A	151202	Calculus B	9	2003	3
1099038	BAARSCHERS E A	151210	Wiskunde A	8	2003	1
1099038	BAARSCHERS E A	151560	Introduction to Investment Theory	9	2003	4
1099038	BAARSCHERS E A	151570	Financial Engineering	8	2003	3
1099038	BAARSCHERS E A	151600	Modelleren en redeneren	9	2003	4
1099038	BAARSCHERS E A	152006	Lineaire structuren	6	2003	4
1099038	BAARSCHERS E A	152026	Calculus I	7	2003	3
1099038	BAARSCHERS E A	152028	Analyse A	2	2003	4
1099038	BAARSCHERS E A	152033	Globale analyse	7	2003	4
1099038	BAARSCHERS E A	152056	Combinatoriek	8	2003	4
1099038	BAARSCHERS E A	152068	Discrete wiskunde	1	2003	3
1099038	BAARSCHERS E A	153036	Statistiek II	8	2003	2
1099038	BAARSCHERS E A	153038	Wiskundige statistiek	6	2003	4
1099038	BAARSCHERS E A	153041	Inleiding statistiek	7	2003	1
1099038	BAARSCHERS E A	153045	Lineaire statistische modellen	8	2003	4
1099038	BAARSCHERS E A	153086	Telecommunicatiesystemen	4	2003	1
1099038	BAARSCHERS E A	153088	Stochastische modellen voor Operations Management	7	2003	3
1099038	BAARSCHERS E A	154021	Numerieke wiskunde en programmeermethoden	6	2003	3
1099038	BAARSCHERS E A	155010	Part. differentiaalverg. uit de math. fysica	7	2003	2
1099038	BAARSCHERS E A	155016	Part.diff.verg.: Numerieke oplossingsmethoden II	1	2003	3
1099038	BAARSCHERS E A	155019	Practicum softwarepakketten PDV	1	2003	3
1099038	BAARSCHERS E A	156016	Analyse B	7	2003	1
1099038	BAARSCHERS E A	158025	Mathematische programmering I	8	2003	3
1099038	BAARSCHERS E A	158075	Deterministische modellen in de OR	5	2003	1
1099038	BAARSCHERS E A	211038	Spraak- en taaltechnologie	4	2002	3
1099038	BAARSCHERS E A	211038	Spraak- en taaltechnologie	7	2002	1
1099038	BAARSCHERS E A	211045	Besturingssystemen	8	2003	3
1099038	BAARSCHERS E A	211081	Distributed E-business Techniques	6	2003	3
1099038	BAARSCHERS E A	211095	Gedistribueerde databases & middleware technologie	7	2003	4
1099038	BAARSCHERS E A	211096	XML & Databases	7	2003	1
1099038	BAARSCHERS E A	211123	Component- en aspect georienteerd progammeren	8	2003	1
1099038	BAARSCHERS E A	211133	Ontwerpen van Software Architecturen	4	2003	3
1099038	BAARSCHERS E A	211185	Taal- en rekenmodellen	8	2003	1
1099038	BAARSCHERS E A	211205	Functioneel programmeren	1	2003	4
1099038	BAARSCHERS E A	212018	Kennistechnologie voor bedrijfskundige toep.	8	2003	4
1099038	BAARSCHERS E A	213009	Fouten tolererende digitale systemen	5	2003	4
1099038	BAARSCHERS E A	213130	Computer Organisatie INF/TEL	6	2003	3
1099038	BAARSCHERS E A	213510	Software Engineering Modellen	6	2003	4
1099038	BAARSCHERS E A	214010	Complexiteit van berekeningen	7	2003	3
1099038	BAARSCHERS E A	219801	Hypermedia structuren en systemen	4	2003	1
1099038	BAARSCHERS E A	232016	Prestatie-analyse van informatiesystemen	6	2003	2
1099038	BAARSCHERS E A	232055	XML-technologie in E-Commerce	9	2003	4
1099038	BAARSCHERS E A	232080	Requirements Engineering	6	2003	3
1099038	BAARSCHERS E A	232085	Voortgezette Requirements Engineering	3	2003	4
1099038	BAARSCHERS E A	234020	Ontwerpen van mens-machine interactie	2	2003	4
1099038	BAARSCHERS E A	235022	Investeringen in informatietechnologie	9	2003	2
1099038	BAARSCHERS E A	237201	Oriëntatie ICT	4	2002	3
1099038	BAARSCHERS E A	237201	Oriëntatie ICT	9	2002	2
1099038	BAARSCHERS E A	237600	Business Case Development for IT-projects	5	2003	3
1099038	BAARSCHERS E A	239981	Integratieproject	4	2002	3
1099038	BAARSCHERS E A	261010	Computer netwerken	3	2003	1
1099038	BAARSCHERS E A	265200	Implementatie van telematicasystemen	8	2003	1
1099038	BAARSCHERS E A	269001	Portfolio ontwerp	9	2003	4
1099645	SPROCK J	121002	Practicum elektronische basisschakelingen	5	2003	1
1099645	SPROCK J	121006	Practicum Meetinstrumenten/Netwerkanalyse	4	2003	3
1099645	SPROCK J	121008	Practicum Elektromagnetische Veldtheorie	8	2002	4
1099645	SPROCK J	121019	D-opdracht	9	2003	3
1099645	SPROCK J	121026	Hands-on dig.image proces. and graphical pres.	7	2002	3
1099645	SPROCK J	121035	Mid P-project	4	2003	1
1099645	SPROCK J	121053	Zekere- en onzekere informatie	4	2003	2
1099645	SPROCK J	121067	Signaal analyse practicum	5	2003	2
1099645	SPROCK J	121709	Reliability Engineering	6	2003	4
1099645	SPROCK J	121709	Reliability Engineering	3	2003	2
1099645	SPROCK J	122227	Voortgezette analoge IC elektronica	8	2003	2
1099645	SPROCK J	122815	Materiaalkunde van microsystemen	6	2003	2
1099645	SPROCK J	122816	Mechanica en transductietechniek	4	2002	3
1099645	SPROCK J	122816	Mechanica en transductietechniek	9	2003	4
1099645	SPROCK J	122828	Practicum realiseren in materialen	9	2003	1
1099645	SPROCK J	122831	Geintegreerde optica	9	2003	3
1099645	SPROCK J	123152	Signal processing in acoustics and audio	6	2003	1
1099645	SPROCK J	124151	Mechatronica	7	2003	2
1099645	SPROCK J	124153	Computer-aided design gereedschappen voor VLSI	2	2003	4
1099645	SPROCK J	124163	Mechatronische meetsystemen	2	2003	4
1099645	SPROCK J	125151	Schakel- en controlesystemen v. Multi-service netw	4	2003	1
1099645	SPROCK J	125153	Inleiding communicatiesystemen	4	2003	3
1099645	SPROCK J	125156	Transmissiemedia- en systemen	9	2003	4
1099645	SPROCK J	127116	Elektromagnetisme I voor HBO	9	2003	2
1099645	SPROCK J	150810	Modelling project	7	2003	3
1099645	SPROCK J	151012	Calculus I	3	2003	4
1099645	SPROCK J	151018	Analyse A	9	2003	3
1099645	SPROCK J	151019	Analyse B	7	2003	4
1099645	SPROCK J	151051	Fundamentele analyse I	3	2003	3
1099645	SPROCK J	151070	Kwantitatieve methoden	1	2003	1
1099645	SPROCK J	151091	Modelvorming I	6	2003	3
1099645	SPROCK J	151092	Modelvorming II	4	2003	2
1099645	SPROCK J	151510	Introduction to Risk Theory	4	2003	3
1099645	SPROCK J	151540	Computational Methods in Finance	4	2003	4
1099645	SPROCK J	152006	Lineaire structuren	9	2003	4
1099645	SPROCK J	152028	Analyse A	1	2003	4
1099645	SPROCK J	152033	Globale analyse	4	2003	4
1099645	SPROCK J	152051	Voortgezette grafentheorie	8	2003	3
1099645	SPROCK J	152068	Discrete wiskunde	4	2003	2
1099645	SPROCK J	153006	Kansrekening	5	2003	3
1099645	SPROCK J	153016	Voortgezette wiskundige statistiek	7	2003	3
1099645	SPROCK J	153036	Statistiek II	6	2003	4
1099645	SPROCK J	153086	Telecommunicatiesystemen	4	2003	4
1099645	SPROCK J	153088	Stochastische modellen voor Operations Management	6	2003	3
1099645	SPROCK J	153135	Statistical techniques	9	2003	4
1099645	SPROCK J	154021	Numerieke wiskunde en programmeermethoden	7	2003	1
1099645	SPROCK J	155009	Fundamenten van de methode der eindige elementen	6	2003	3
1099645	SPROCK J	155019	Practicum softwarepakketten PDV	7	2003	3
1099645	SPROCK J	156057	Inleiding wiskundige systeemtheorie	4	2003	4
1099645	SPROCK J	156068	Niet-lineaire besturingstheorie	9	2003	3
1099645	SPROCK J	156069	Systemen en Signalen	5	2003	3
1099645	SPROCK J	157035	Financial Econometrics	8	2003	3
1099645	SPROCK J	158006	Operationele research II	8	2003	4
1099645	SPROCK J	158017	Operationele research I	4	2003	4
1099645	SPROCK J	158075	Deterministische modellen in de OR	8	2003	1
1099645	SPROCK J	211024	Programmeren in C++	8	2003	4
1099645	SPROCK J	211038	Spraak- en taaltechnologie	8	2001	3
1099645	SPROCK J	211045	Besturingssystemen	4	2003	2
1099645	SPROCK J	211096	XML & Databases	4	2003	1
1099645	SPROCK J	211123	Component- en aspect georienteerd progammeren	8	2003	1
1099645	SPROCK J	211127	Formele analyse van natuurlijke taal	1	2003	4
1099645	SPROCK J	213005	Computerarchitectuur	7	2003	1
1099645	SPROCK J	213009	Fouten tolererende digitale systemen	4	2003	4
1099645	SPROCK J	213016	Bijzondere onderwerpen computerarchitectuur	3	2003	3
1099645	SPROCK J	213125	Computersystemen	8	2003	4
1099645	SPROCK J	214025	Algoritmen,datastructuren en complexiteit plus	7	2003	4
1099645	SPROCK J	214030	Artificial Intelligence	1	2002	1
1099645	SPROCK J	214511	Database Project	9	2003	2
1099645	SPROCK J	219910	Ontwerpproject	2	2003	3
1099645	SPROCK J	232011	Architectuur van informatiesystemen	7	2003	4
1099645	SPROCK J	232050	Electronic Commerce	5	2003	2
1099645	SPROCK J	234010	Invoering van IT in organisaties	8	2002	4
1099645	SPROCK J	234010	Invoering van IT in organisaties	8	2003	4
1099645	SPROCK J	234020	Ontwerpen van mens-machine interactie	9	2003	1
1099645	SPROCK J	234026	Voortgezette informatiesysteemmodellering	2	2003	4
1099645	SPROCK J	239981	Integratieproject	6	2002	3
1099645	SPROCK J	262000	Telematicanetwerken	4	2003	4
1099645	SPROCK J	262001	Mobile and wireless networking	7	2003	4
1099645	SPROCK J	265100	Ontwerpen van telematicasystemen	9	2002	4
1099645	SPROCK J	265400	Beveiliging van telematicasystemen	4	2003	3
1099645	SPROCK J	269100	P-project TEL	5	2003	4
\.


--
-- Data for Name: education; Type: TABLE DATA; Schema: srs; Owner: db00
--

COPY education (course_code, course, study, teacher_id, teacher, year, quarter) FROM stdin;
121021	Inleiding in de biomedische technologie	EL 	17	VELTINK DR IR P H	2002	2
121022	Neurofysiologie	BMT	14	MARANI PROF DR E	2003	4
121025	Digitale beeldbewerking voor beta	BIT	18	HEIJDEN DR IR F VAN DER	2003	3
121026	Hands-on dig.image proces. and graphical pres.	BIT	1	REGTIEN PROF DR IR P P L	2003	4
121026	Hands-on dig.image proces. and graphical pres.	BIT	19	HOUKES DR IR Z	2003	1
121026	Hands-on dig.image proces. and graphical pres.	BIT	7	ELWENSPOEK PROF DR M C	2002	3
121028	Computer vision	BIT	18	HEIJDEN DR IR F VAN DER	2003	4
121033	Project "computer vision"	BIT	18	HEIJDEN DR IR F VAN DER	2003	3
121034	Fysische modelvorming van embedded systemen	INF	20	BROENINK DR IR J F	2003	4
121035	Mid P-project	EL 	1	REGTIEN PROF DR IR P P L	2003	3
121035	Mid P-project	EL 	6	KORSTEN DR M J	2003	1
121035	Mid P-project	EL 	9	OLTHUIS DR IR W	2002	4
121035	Mid P-project	EL 	21	HEYSTERS IR P M	2002	1
121037	Advanced digital signal processing	EL 	5	SLUMP PROF DR IR C H	2003	3
121038	Elektronica voor industrieel ontwerpers	EL 	1	REGTIEN PROF DR IR P P L	2003	4
121039	Biomedische signaal- en systeemanalyse	BMT	22	RUTTEN PROF DR W L C	2003	3
121040	Medische elektronica	BMT	23	BUITENWEG DR IR J R	2003	3
121041	Elektrodynamica	EL 	24	DRIESSEN DR A	2003	4
121041	Elektrodynamica	EL 	25	RIDDER DR IR R M DE	2003	2
121042	Meettechniek	EL 	1	REGTIEN PROF DR IR P P L	2003	3
121043	Dynamische systemen	EL 	20	BROENINK DR IR J F	2003	4
121043	Dynamische systemen	EL 	26	BREEDVELD DR IR P C	2003	2
121044	Regeltechniek	EL 	27	AMERONGEN PROF DR IR J VAN	2003	4
121044	Regeltechniek	EL 	28	STRAMIGIOLI DR IR S	2003	2
121045	Project Mechatronica	EL 	27	AMERONGEN PROF DR IR J VAN	2003	3
121045	Project Mechatronica	EL 	26	BREEDVELD DR IR P C	2003	1
121045	Project Mechatronica	EL 	6	KORSTEN DR M J	2002	4
121045	Project Mechatronica	EL 	29	LAMMERINK DR IR T S J	2002	2
121045	Project Mechatronica	EL 	8	WIEGERINK DR IR R J	2001	4
121049	Practicum Medische Elektronica	BMT	17	VELTINK DR IR P H	2003	3
121050	Modern robotics	EL 	28	STRAMIGIOLI DR IR S	2003	3
121051	Informatie Opslag	EL 	10	ABELMANN DR IR L	2003	3
121052	Imaging	BMT	5	SLUMP PROF DR IR C H	2003	3
121053	Zekere- en onzekere informatie	EL 	22	RUTTEN PROF DR W L C	2003	3
121053	Zekere- en onzekere informatie	EL 	30	OMMEREN DR J C W VAN	2003	2
121054	Neurotechnologie	BMT	22	RUTTEN PROF DR W L C	2003	4
121056	Laboratorium op een chip	EL 	31	GARDENIERS DR J G E	2003	3
121057	Bio-elektriciteit	BMT	16	HOLSHEIMER DR J	2003	4
121057	Bio-elektriciteit	BMT	17	VELTINK DR IR P H	2003	2
121060	Optische basisfuncties en microsystemen	EL 	25	RIDDER DR IR R M DE	2003	4
121062	Eind P-project	EL 	9	OLTHUIS DR IR W	2003	4
121067	Signaal analyse practicum	BMT	32	HEMMES DR H K	2003	4
121067	Signaal analyse practicum	BMT	17	VELTINK DR IR P H	2003	2
121067	Signaal analyse practicum	BMT	23	BUITENWEG DR IR J R	2002	4
121068	Signaaltheorie	EL 	33	ETTEN PROF DR IR W C VAN	2003	3
121706	Halfgeleiderdevices	EL 	34	SCHMITZ PROF DR J	2003	3
121706	Halfgeleiderdevices	EL 	35	WALLINGA PROF DR H	2003	1
121709	Reliability Engineering	EL 	36	KUPER PROF DR IR F G	2003	4
121709	Reliability Engineering	EL 	37	MOUTHAAN PROF DR IR A J	2003	2
121709	Reliability Engineering	EL 	38	SALM DR IR C	2002	4
121713	VLSI system design	EL 	39	GEREZ DR IR S H	2003	4
121714	I.C. technologie	EL 	40	HOLLEMAN DR J	2003	4
121714	I.C. technologie	EL 	29	LAMMERINK DR IR T S J	2003	2
121717	Advanced semiconductor devices	EL 	38	SALM DR IR C	2003	3
122226	Project voortgezette elektronica	EL 	41	KLUMPERINK DR ING E A M	2003	3
122227	Voortgezette analoge IC elektronica	EL 	41	KLUMPERINK DR ING E A M	2003	4
122227	Voortgezette analoge IC elektronica	EL 	42	NAUTA PROF DR IR B	2003	2
122230	Integrated circuits and systems for mixed signals	EL 	43	TUIJL PROF IR A J M VAN	2003	4
122230	Integrated circuits and systems for mixed signals	EL 	42	NAUTA PROF DR IR B	2003	2
122481	Systems engineering	EL 	20	BROENINK DR IR J F	2003	3
122634	Real-time software development	EL 	20	BROENINK DR IR J F	2003	3
122711	Digitale meetsystemen	EL 	6	KORSTEN DR M J	2003	4
122728	Classification, Estimation and Data Analysis	EL 	18	HEIJDEN DR IR F VAN DER	2003	4
122729	Image processing	EL 	18	HEIJDEN DR IR F VAN DER	2003	4
122733	VLSI signal processing	EL 	5	SLUMP PROF DR IR C H	2003	4
122733	VLSI signal processing	EL 	39	GEREZ DR IR S H	2003	2
122740	Netwerkanalyse voor TEL	TEL	5	SLUMP PROF DR IR C H	2003	3
122814	Elektromagnetisme II voor HBO	EL 	7	ELWENSPOEK PROF DR M C	2003	4
122814	Elektromagnetisme II voor HBO	EL 	44	KRIJNEN DR IR G J M	2003	1
122815	Materiaalkunde van microsystemen	EL 	45	LODDER PROF DR J C	2003	4
122815	Materiaalkunde van microsystemen	EL 	46	WORHOFF DR K	2003	2
122816	Mechanica en transductietechniek	EL 	44	KRIJNEN DR IR G J M	2003	4
122816	Mechanica en transductietechniek	EL 	7	ELWENSPOEK PROF DR M C	2003	2
122816	Mechanica en transductietechniek	EL 	8	WIEGERINK DR IR R J	2002	3
122816	Mechanica en transductietechniek	EL 	29	LAMMERINK DR IR T S J	2002	2
122821	Microtechnologie t.b.v. transducenten	EL 	45	LODDER PROF DR J C	2003	3
122828	Practicum realiseren in materialen	EL 	18	HEIJDEN DR IR F VAN DER	2003	3
122828	Practicum realiseren in materialen	EL 	5	SLUMP PROF DR IR C H	2003	1
122829	Systemen en technieken voor informatieopslag	EL 	47	GROENLAND DR IR J P J	2003	4
122829	Systemen en technieken voor informatieopslag	EL 	45	LODDER PROF DR J C	2003	1
122830	Micro electro mechanische systemen	EL 	48	JANSEN DR IR H V	2003	4
122831	Geintegreerde optica	EL 	49	HOEKSTRA DR H J W M	2003	3
122831	Geintegreerde optica	EL 	24	DRIESSEN DR A	2003	2
122831	Geintegreerde optica	EL 	25	RIDDER DR IR R M DE	2002	4
122833	Integratieproject	EL 	38	SALM DR IR C	2003	4
122833	Integratieproject	EL 	46	WORHOFF DR K	2003	2
123112	Moderne modulatie- en detectietechnieken	EL 	50	SRINIVASAN DR.R.	2003	4
123140	Inleiding systeem- en signaaltheorie voor HBO	EL 	51	BRINK DRS R W	2003	3
123149	Lineaire systemen	EL 	4	VELDHUIS DR IR R N J	2003	4
123152	Signal processing in acoustics and audio	EL 	52	BERKHOFF DR IR A P	2003	3
123152	Signal processing in acoustics and audio	EL 	53	DRUYVESTEYN PROF DR IR W F	2003	1
123152	Signal processing in acoustics and audio	EL 	4	VELDHUIS DR IR R N J	2002	4
123153	Embedded Signal Processing	EL 	42	NAUTA PROF DR IR B	2003	4
123153	Embedded Signal Processing	EL 	5	SLUMP PROF DR IR C H	2003	1
124113	Optimal estimation in dynamic systems	EL 	18	HEIJDEN DR IR F VAN DER	2003	3
124151	Mechatronica	EL 	54	SOEMERS PROF IR H M J R	2003	4
124151	Mechatronica	EL 	55	VRIES DR IR T J A DE	2003	2
124151	Mechatronica	EL 	56	DIJK DR IR J VAN	2002	4
124153	Computer-aided design gereedschappen voor VLSI	EL 	39	GEREZ DR IR S H	2003	4
124162	Modelvorming en simulatie	EL 	26	BREEDVELD DR IR P C	2003	4
124163	Mechatronische meetsystemen	EL 	1	REGTIEN PROF DR IR P P L	2003	4
124176	Digitale Regeltechniek	INF	28	STRAMIGIOLI DR IR S	2003	3
124176	Digitale Regeltechniek	INF	27	AMERONGEN PROF DR IR J VAN	2003	2
124177	Inleiding elektrische energietechniek	EL 	4	VELDHUIS DR IR R N J	2003	3
124177	Inleiding elektrische energietechniek	EL 	55	VRIES DR IR T J A DE	2003	1
124177	Inleiding elektrische energietechniek	EL 	54	SOEMERS PROF IR H M J R	2002	4
124177	Inleiding elektrische energietechniek	EL 	27	AMERONGEN PROF DR IR J VAN	2002	1
125113	Analoge communicatietechniek	EL 	45	LODDER PROF DR J C	2003	4
125114	Prestatieanalyse van communicatienetwerken	BIT	57	HAVERKORT PROF DR IR B R H M	2003	4
125118	Practicum informatie-overdracht	EL 	33	ETTEN PROF DR IR W C VAN	2003	3
125118	Practicum informatie-overdracht	EL 	12	ROELOFFZEN DR IR C G H	2003	2
125119	Signaaltheorie	EL 	33	ETTEN PROF DR IR W C VAN	2003	4
125151	Schakel- en controlesystemen v. Multi-service netw	BIT	58	KARAGIANNIS DR IR G	2003	3
125151	Schakel- en controlesystemen v. Multi-service netw	BIT	59	BERG DR J L VAN DEN	2003	1
125152	Glasvezelcommunicatie	EL 	33	ETTEN PROF DR IR W C VAN	2003	3
125152	Glasvezelcommunicatie	EL 	12	ROELOFFZEN DR IR C G H	2003	2
125153	Inleiding communicatiesystemen	EL 	18	HEIJDEN DR IR F VAN DER	2003	3
125156	Transmissiemedia- en systemen	BIT	33	ETTEN PROF DR IR W C VAN	2003	4
125156	Transmissiemedia- en systemen	BIT	60	LEFERINK PROF DR IR F B J	2003	1
125159	Optische communicatienetwerken	EL 	61	BOCHOVE PROF IR A C VAN	2003	4
125160	Mobiele communicatie	EL 	62	HAARTSEN PROF DR IR J C	2003	3
125163	Electromagnetische compatibiliteit	EL 	60	LEFERINK PROF DR IR F B J	2003	4
127113	Elektrofysiologische signalen en bio-electriciteit	EL 	16	HOLSHEIMER DR J	2003	4
127113	Elektrofysiologische signalen en bio-electriciteit	EL 	22	RUTTEN PROF DR W L C	2003	1
127115	Praktische biomedische signaalanalyse	EL 	22	RUTTEN PROF DR W L C	2003	4
127116	Elektromagnetisme I voor HBO	EL 	7	ELWENSPOEK PROF DR M C	2003	3
127116	Elektromagnetisme I voor HBO	EL 	44	KRIJNEN DR IR G J M	2003	2
127117	Biomechatronica	EL 	63	KOOPMAN DR IR H F J M	2003	3
127117	Biomechatronica	EL 	64	HELM PROF DR F C T VAN DER	2003	2
127117	Biomechatronica	EL 	31	GARDENIERS DR J G E	2002	3
127117	Biomechatronica	EL 	2	ANNEMA DR IR A J	2002	2
127117	Biomechatronica	EL 	17	VELTINK DR IR P H	2001	3
129344	Literatuuronderzoek	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	3
129345	Deelname aan een studiegroep	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	3
129346	Verrichten van experimenteel werk	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	4
129347	Deelname aan een project	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	4
129348	Maken van een scriptie	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	3
129351	Fysiologie II	EL 	14	MARANI PROF DR E	2003	3
129351	Fysiologie II	EL 	24	DRIESSEN DR A	2003	1
129354	Literatuuronderzoek	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	4
129355	Deelname aan een studiegroep	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	3
129356	Verrichten van experimenteel werk	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	3
129357	Deelname aan een project	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	4
129358	Maken van een scriptie	EL 	65	DIRECTE BEGELEIDER UIT EEN LEERSTOEL	2003	3
129362	Start P-project	EL 	66	SCHWIRTZ ING M H	2003	3
129362	Start P-project	EL 	9	OLTHUIS DR IR W	2003	2
129367	Individual project	EL 	67	VOS DR H	2003	3
129367	Individual project	EL 	27	AMERONGEN PROF DR IR J VAN	2003	2
150432	Maple practicum II	CIT	47	GROENLAND DR IR J P J	2003	4
150433	Wiskundig modelleren voor CiT	CIT	68	MEER IR A W J VAN DER	2003	4
150500	Presentatie van een wiskundig onderwerp	TW 	69	WELLING DRS E M	2003	3
150500	Presentatie van een wiskundig onderwerp	TW 	70	POORTEMA DR K	2003	1
150526	Wiskundig modelleren I	TW 	30	OMMEREN DR J C W VAN	2003	3
150527	Wiskundig modelleren II	TW 	71	MOLENAAR PROF DR J	2003	3
150528	Wiskundig modelleren III	TW 	72	MEINSMA DR IR G	2003	3
150529	Wiskundig modelleren IV	TW 	68	MEER IR A W J VAN DER	2003	4
150529	Wiskundig modelleren IV	TW 	73	VAJTA DR M	2003	1
150532	Maple practicum	CIT	73	VAJTA DR M	2003	4
150539	Maple practicum	TW 	74	LAAN-DE KLERK IR P.	2003	4
150600	Mathematical methods	TW 	75	DAMME DR R M J VAN	2003	3
150610	Statistics and probability	TW 	41	KLUMPERINK DR ING E A M	2003	3
150620	Systems and signals	TW 	76	ZWART DR H J	2003	3
150625	Scientific communication	TEL	11	JANSEN DR R	2003	3
150630	Applied functional analysis	TW 	77	JEURNINK DR G A M	2003	4
150700	Introduction to operations research	TW 	78	HURINK DR J L	2003	4
150710	Modelling project	TW 	31	GARDENIERS DR J G E	2003	3
150730	Experimental design	TW 	70	POORTEMA DR K	2003	3
150740	Quality control	TW 	70	POORTEMA DR K	2003	4
150810	Modelling project	TW 	73	VAJTA DR M	2003	3
150910	Advanced modelling	TW 	79	BECKUM DR F P H  VAN	2003	4
151004	Calculus II-A	TW 	80	STILL DR G J	2003	4
151005	Calculus II-B	TW 	81	KERSTEN DR P H M	2003	3
151007	Lineaire algebra	TW 	82	HELMINCK DR G F	2003	4
151010	Lineaire structuren	TW 	83	DRIESSEN DR T S H	2003	3
151012	Calculus I	TW 	81	KERSTEN DR P H M	2003	4
151014	Analyse A	TW 	84	AL-DHAHIR DRS A	2003	3
151015	Numerieke lineaire algebra	TW 	85	BOCHEV DR M A	2003	3
151018	Analyse A	TW 	86	ZWIER DR IR G	2003	3
151019	Analyse B	TW 	87	GEURTS DR IR B J	2003	4
151020	Functionaalanalyse I	TW 	77	JEURNINK DR G A M	2003	3
151024	Lineaire analyse	TW 	81	KERSTEN DR P H M	2003	4
151025	Functionaalanalyse II	TW 	88	MARTINI PROF DR IR R	2003	3
151033	Numerieke analyse	TW 	75	DAMME DR R M J VAN	2003	3
151039	Algebra	INF	82	HELMINCK DR G F	2003	4
151043	Seminarium mathematische fysica	TW 	89	GROESEN PROF DR IR E W C VAN	2003	4
151043	Seminarium mathematische fysica	TW 	90	GILS DR S A VAN	2003	1
151044	Analyse C	TW 	87	GEURTS DR IR B J	2003	3
151045	Functionaalanalyse III	TW 	88	MARTINI PROF DR IR R	2003	4
151051	Fundamentele analyse I	TW 	88	MARTINI PROF DR IR R	2003	3
151051	Fundamentele analyse I	TW 	81	KERSTEN DR P H M	2003	1
151052	Fundamentele analyse II	TW 	82	HELMINCK DR G F	2003	3
151070	Kwantitatieve methoden	BSK	77	JEURNINK DR G A M	2003	3
151070	Kwantitatieve methoden	BSK	91	RUIZENAAR DRS H W A	2003	1
151070	Kwantitatieve methoden	BSK	73	VAJTA DR M	2002	4
151072	Wiskunde II	TW 	92	AARTS DR H F M	2003	4
151072	Wiskunde II	TW 	93	HOEVENAARS DR L K	2003	1
151073	Calculus III	TW 	86	ZWIER DR IR G	2003	4
151080	Bijscholing wiskunde B2	TW 	25	RIDDER DR IR R M DE	2003	3
151081	Wiskunde I	CIT	77	JEURNINK DR G A M	2003	3
151082	Wiskunde II	CIT	92	AARTS DR H F M	2003	4
151083	Wiskunde III	CIT	68	MEER IR A W J VAN DER	2003	3
151084	Wiskunde IV	CIT	68	MEER IR A W J VAN DER	2003	4
151085	Wiskunde I	BMT	68	MEER IR A W J VAN DER	2003	3
151086	Vectoranalyse voor BMT	BMT	68	MEER IR A W J VAN DER	2003	3
151088	Practicum Wiskundig modelleren	BMT	68	MEER IR A W J VAN DER	2003	4
151091	Modelvorming I	TW 	86	ZWIER DR IR G	2003	3
151091	Modelvorming I	TW 	94	STEEGE IR H TER	2003	1
151092	Modelvorming II	TW 	79	BECKUM DR F P H  VAN	2003	4
151092	Modelvorming II	TW 	95	GEIJSELAERS DR IR H J M	2003	2
151093	Modelvorming III	TW 	79	BECKUM DR F P H  VAN	2003	3
151093	Modelvorming III	TW 	96	KOK DR IR J B W	2003	1
151120	Wiskunde I	BIT	92	AARTS DR H F M	2003	4
151130	Wiskunde II	BIT	92	AARTS DR H F M	2003	4
151140	Wiskunde III	INF	92	AARTS DR H F M	2003	3
151150	Wiskunde IV	INF	76	ZWART DR H J	2003	3
151160	Wiskunde C	TW 	80	STILL DR G J	2003	3
151200	Calculus A	TW 	97	MAREL DR L VAN DER	2003	3
151204	Calculus C	TW 	76	ZWART DR H J	2003	4
151206	Lineaire Algebra A	TW 	97	MAREL DR L VAN DER	2003	3
151208	Lineaire Algebra B	TW 	97	MAREL DR L VAN DER	2003	3
151210	Wiskunde A	TW 	98	GEVELING DRS B M	2003	4
151210	Wiskunde A	TW 	69	WELLING DRS E M	2003	1
151215	Wiskunde B	TW 	98	GEVELING DRS B M	2003	4
151220	Wiskunde C	TBK	98	GEVELING DRS B M	2003	3
151250	Modellen en systemen	TW 	68	MEER IR A W J VAN DER	2003	4
151510	Introduction to Risk Theory	TW 	66	SCHWIRTZ ING M H	2003	3
151520	Mathematical Finance	TBK	99	BAGCHI PROF DR A	2003	4
151530	Continuous Time Finance	TW 	100	VELLEKOOP DR IR M H	2003	4
151540	Computational Methods in Finance	TW 	101	BROEK DR IR W A VAN DEN	2003	4
151550	Life Insurance	TW 	102	DOORN DR IR E A VAN	2003	4
151560	Introduction to Investment Theory	TBK	100	VELLEKOOP DR IR M H	2003	4
151565	Praktische opdracht Financial Engineering	CIT	100	VELLEKOOP DR IR M H	2003	4
151570	Financial Engineering	TW 	100	VELLEKOOP DR IR M H	2003	3
151600	Modelleren en redeneren	TW 	77	JEURNINK DR G A M	2003	4
152006	Lineaire structuren	TW 	83	DRIESSEN DR T S H	2003	4
152025	Complexe functietheorie	TW 	77	JEURNINK DR G A M	2003	3
152026	Calculus I	TW 	86	ZWIER DR IR G	2003	3
152027	Calculus II	TW 	81	KERSTEN DR P H M	2003	3
152027	Calculus II	TW 	86	ZWIER DR IR G	2003	2
152028	Analyse A	TW 	86	ZWIER DR IR G	2003	4
152030	Tensoranalyse	TW 	88	MARTINI PROF DR IR R	2003	3
152033	Globale analyse	TW 	103	TWILT DR F	2003	4
152038	Grafentheorie	TW 	104	WOEGINGER PROF DR G	2003	3
152038	Grafentheorie	TW 	105	BROERSMA DR IR H J	2003	2
152051	Voortgezette grafentheorie	INF	104	WOEGINGER PROF DR G	2003	3
152056	Combinatoriek	INF	106	POST DR IR G F	2003	4
152061	Discrete wiskunde	TW 	69	WELLING DRS E M	2003	3
152066	Capita selecta analyse	TW 	88	MARTINI PROF DR IR R	2003	3
152066	Capita selecta analyse	TW 	106	POST DR IR G F	2003	2
152068	Discrete wiskunde	BIT	107	PAULUSMA DR IR D	2003	3
152068	Discrete wiskunde	BIT	69	WELLING DRS E M	2003	2
152070	Meetkunde	TW 	77	JEURNINK DR G A M	2003	4
152070	Meetkunde	TW 	69	WELLING DRS E M	2003	1
152075	Grafentheorie	BIT	105	BROERSMA DR IR H J	2003	3
152080	Deterministische en stochastische speltheorie	TW 	83	DRIESSEN DR T S H	2003	4
152080	Deterministische en stochastische speltheorie	TW 	108	TIMMER DR J B	2003	1
152100	Calculus I	TW 	81	KERSTEN DR P H M	2003	4
152110	Calculus II	TW 	81	KERSTEN DR P H M	2003	3
152120	Lineaire algebra	TW 	83	DRIESSEN DR T S H	2003	4
152130	Fundamentele analyse	TW 	82	HELMINCK DR G F	2003	3
152150	Wiskundig modelleren I	TW 	30	OMMEREN DR J C W VAN	2003	4
153002	Discrete kansrekening	TW 	70	POORTEMA DR K	2003	3
153003	Kansrekening	TW 	102	DOORN DR IR E A VAN	2003	3
153004	Statistiek I	BSK	109	MEIJER IR T M J	2003	3
153006	Kansrekening	TW 	30	OMMEREN DR J C W VAN	2003	3
153008	Kansrekening en statistiek	INF	109	MEIJER IR T M J	2003	3
153016	Voortgezette wiskundige statistiek	TW 	110	ALBERS PROF DR W	2003	3
153021	Statistiek I voor TBK	TBK	111	KALLENBERG DR W C M	2003	4
153023	Statistiek II voor TBK	TBK	111	KALLENBERG DR W C M	2003	3
153026	Asymptotische technieken in de statistiek	TW 	111	KALLENBERG DR W C M	2003	3
153028	Statistiek I	CIT	70	POORTEMA DR K	2003	4
153029	Statistiek II	CIT	70	POORTEMA DR K	2003	4
153031	Statistiek	BIT	109	MEIJER IR T M J	2003	3
153032	Kansrekening en stochastische processen	TW 	102	DOORN DR IR E A VAN	2003	4
153033	Statistiek	TW 	70	POORTEMA DR K	2003	4
153034	Kansrekening en statistiek	TEL	109	MEIJER IR T M J	2003	3
153036	Statistiek II	BSK	109	MEIJER IR T M J	2003	4
153036	Statistiek II	BSK	112	KAAP DRS H G VAN DER	2003	2
153038	Wiskundige statistiek	TW 	110	ALBERS PROF DR W	2003	4
153039	Kansrekening en statistiek	BMT	89	GROESEN PROF DR IR E W C VAN	2003	3
153041	Inleiding statistiek	PSY	113	NIJDAM DRS W	2003	4
153041	Inleiding statistiek	PSY	114	HOUWELING IR F	2003	1
153045	Lineaire statistische modellen	TW 	70	POORTEMA DR K	2003	4
153055	Parametervrije statistische methoden	TW 	110	ALBERS PROF DR W	2003	3
153065	Markov ketens	TW 	115	SCHEINHARDT DR IR W R W	2003	4
153080	Stochastische modellen in de operationele research	TW 	116	LITVAK DR N	2003	4
153081	Stochastische modellen v. telecommunicatie syst.	TW 	117	MANDJES PROF DR M R H	2003	3
153081	Stochastische modellen v. telecommunicatie syst.	TW 	59	BERG DR J L VAN DEN	2003	2
153082	Stochastische simulatie	TW 	30	OMMEREN DR J C W VAN	2003	3
153083	Stochastische modellen in productie en logistiek	TW 	30	OMMEREN DR J C W VAN	2003	3
153083	Stochastische modellen in productie en logistiek	TW 	118	ZIJM PROF DR W H M	2003	2
153084	Analyse en besturing van productie systemen	TBK	30	OMMEREN DR J C W VAN	2003	3
153086	Telecommunicatiesystemen	TW 	119	BOUCHERIE DR R J	2003	4
153086	Telecommunicatiesystemen	TW 	105	BROERSMA DR IR H J	2003	1
153087	Wachttijdtheorie	TW 	119	BOUCHERIE DR R J	2003	3
153088	Stochastische modellen voor Operations Management	INF	119	BOUCHERIE DR R J	2003	3
153100	Statistiek	TW 	109	MEIJER IR T M J	2003	3
153110	Inleiding statistiek	TW 	70	POORTEMA DR K	2003	3
153120	Statistiek	TW 	110	ALBERS PROF DR W	2003	4
153135	Statistical techniques	BIT	70	POORTEMA DR K	2003	4
154021	Numerieke wiskunde en programmeermethoden	BMT	86	ZWIER DR IR G	2003	3
154021	Numerieke wiskunde en programmeermethoden	BMT	85	BOCHEV DR M A	2003	1
154023	Numerieke wiskunde en programmeermethoden	TW 	23	BUITENWEG DR IR J R	2003	3
154023	Numerieke wiskunde en programmeermethoden	TW 	86	ZWIER DR IR G	2003	1
155009	Fundamenten van de methode der eindige elementen	TW 	120	VEGT PROF DR IR J J W VAN DER	2003	3
155010	Part. differentiaalverg. uit de math. fysica	TW 	90	GILS DR S A VAN	2003	4
155010	Part. differentiaalverg. uit de math. fysica	TW 	121	HAMMER DR M	2003	2
155015	Part.diff.verg.: Numerieke oplossingsmethoden I	TW 	122	BOKHOVE DR IR O	2003	4
155016	Part.diff.verg.: Numerieke oplossingsmethoden II	TW 	120	VEGT PROF DR IR J J W VAN DER	2003	3
155016	Part.diff.verg.: Numerieke oplossingsmethoden II	TW 	122	BOKHOVE DR IR O	2003	1
155019	Practicum softwarepakketten PDV	TW 	87	GEURTS DR IR B J	2003	3
156012	Gewone differentiaalvergelijkingen	TW 	90	GILS DR S A VAN	2003	3
156016	Analyse B	TW 	87	GEURTS DR IR B J	2003	3
156016	Analyse B	TW 	123	JONG DR IR B DE	2003	1
156029	Analyse C	TW 	90	GILS DR S A VAN	2003	3
156033	Bifurcatie theorie	TW 	90	GILS DR S A VAN	2003	4
156037	Applied Analytical Methods	TW 	121	HAMMER DR M	2003	3
156056	Inleiding wiskundige systeemtheorie	TW 	72	MEINSMA DR IR G	2003	4
156057	Inleiding wiskundige systeemtheorie	INF	124	POLDERMAN DR J W	2003	4
156062	Systeem- en besturingstheorie	TW 	125	SCHAFT PROF DR A J VAN DER	2003	4
156066	Besturingstheorie van economische systemen	TW 	124	POLDERMAN DR J W	2003	4
156067	Robust Control	TW 	76	ZWART DR H J	2003	4
156068	Niet-lineaire besturingstheorie	TW 	125	SCHAFT PROF DR A J VAN DER	2003	3
156069	Systemen en Signalen	TEL	76	ZWART DR H J	2003	3
156080	Signalen en transformaties	BMT	72	MEINSMA DR IR G	2003	3
157004	Stochastische processen in financien	TBK	101	BROEK DR IR W A VAN DEN	2003	3
157008	Stochastische processen in dynamische systemen	TW 	99	BAGCHI PROF DR A	2003	3
157009	Tijdreeksenanalyse en identificatietheorie	TW 	72	MEINSMA DR IR G	2003	3
157016	Stochastische filter- en besturingstheorie	TW 	99	BAGCHI PROF DR A	2003	3
157020	Dynamische discrete gebeurtenissen	INF	125	SCHAFT PROF DR A J VAN DER	2003	4
157021	Analyse van signaaloverdracht in communicatienetw.	TW 	124	POLDERMAN DR J W	2003	4
157030	Structured Products	TBK	60	LEFERINK PROF DR IR F B J	2003	3
157035	Financial Econometrics	TBK	80	STILL DR G J	2003	3
158006	Operationele research II	INF	119	BOUCHERIE DR R J	2003	4
158017	Operationele research I	TW 	78	HURINK DR J L	2003	4
158018	Operationele research I, practicum	INF	78	HURINK DR J L	2003	4
158022	Operationele research III	TW 	126	KERN DR W	2003	3
158025	Mathematische programmering I	TW 	80	STILL DR G J	2003	3
158038	Discrete optimalisering	TW 	126	KERN DR W	2003	3
158042	Modelbouw in de optimalisatie	TW 	127	BISSCHOP PROF DR J J	2003	4
158061	Inleiding wiskundige economie	TW 	128	DIEBEN DRS L B M	2003	4
158070	Grafentheorie en operationele research	TEL	105	BROERSMA DR IR H J	2003	3
158070	Grafentheorie en operationele research	TEL	78	HURINK DR J L	2003	1
158075	Deterministische modellen in de OR	BIT	78	HURINK DR J L	2003	4
158075	Deterministische modellen in de OR	BIT	106	POST DR IR G F	2003	1
158075	Deterministische modellen in de OR	BIT	129	WEGEN DR IR L L M VAN DER	2002	4
159918	Bibliotheekgebruik en literatuuropdracht	TW 	130	WISSEN DRS R J VAN	2003	3
159927	Doctoraalstage	TW 	131	SCHREUDER DR IR J A M	2003	4
159928	Doctoraalstage	TW 	131	SCHREUDER DR IR J A M	2003	3
159960	Multidisciplinaire ontwerpopdracht	TW 	79	BECKUM DR F P H  VAN	2003	3
211017	Inleiding programmeren met JAVA	INF	132	BONNES IR H J G	2003	3
211017	Inleiding programmeren met JAVA	INF	129	WEGEN DR IR L L M VAN DER	2003	1
211022	Programmeren in C++	INF	133	VERVOORT IR W A	2003	3
211024	Programmeren in C++	INF	133	VERVOORT IR W A	2003	4
211026	Theoretische informatica	INF	134	ASVELD DR IR P R J	2003	3
211027	Inleiding programmeren met MATLAB	BMT	135	SCHUT DRS J	2003	3
211032	Seminarium Taal, Kennis & Interactie	INF	31	GARDENIERS DR J G E	2003	4
211032	Seminarium Taal, Kennis & Interactie	INF	136	THEUNE DR M	2003	1
211032	Seminarium Taal, Kennis & Interactie	INF	137	NIJHOLT PROF DR IR A	2002	3
211033	Neurale netwerken en neuro-computing	INF	138	POEL DR M	2003	3
211034	Spraaktechnologie	INF	137	NIJHOLT PROF DR IR A	2003	3
211034	Spraaktechnologie	INF	139	HESSEN DR A J VAN	2003	2
211035	Vertalerbouw	INF	140	RUIJS DR IR T C	2003	4
211037	Graphics & Virtual Reality	INF	141	ZWIERS DR J	2003	3
211038	Spraak- en taaltechnologie	INF	142	AKKER DR IR H J A OP DEN	2003	4
211038	Spraak- en taaltechnologie	INF	136	THEUNE DR M	2003	1
211038	Spraak- en taaltechnologie	INF	39	GEREZ DR IR S H	2002	3
211038	Spraak- en taaltechnologie	INF	143	JONG PROF DR F M G DE	2002	1
211038	Spraak- en taaltechnologie	INF	139	HESSEN DR A J VAN	2001	3
211045	Besturingssystemen	INF	144	SCHOUTE DR A L	2003	3
211045	Besturingssystemen	INF	145	ETALLE DR S	2003	2
211047	Besturingssystemen voor Telematica	TEL	144	SCHOUTE DR A L	2003	4
211050	Structuur van programmeertalen	INF	146	BROEK DR P M VAN DEN	2003	3
211054	Computersystemen	INF	147	SCHOLTEN IR J	2003	3
211054	Computersystemen	INF	148	KOKKELER IR A B J	2003	2
211074	Gegevensbanken	BIT	149	FOKKINGA DR M M	2003	4
211077	Database-ontwerp	TBK	150	BLANKEN DR H M	2003	4
211078	Database-ontwerp	TBK	150	BLANKEN DR H M	2003	4
211081	Distributed E-business Techniques	BIT	151	HARTEL PROF DR P H	2003	3
211081	Distributed E-business Techniques	BIT	145	ETALLE DR S	2003	1
211090	Databasetoepassingen	BIT	152	HIEMSTRA DR IR D	2003	4
211095	Gedistribueerde databases & middleware technologie	INF	153	JONKER PROF DR W	2003	4
211095	Gedistribueerde databases & middleware technologie	INF	152	HIEMSTRA DR IR D	2003	1
211096	XML & Databases	INF	152	HIEMSTRA DR IR D	2003	3
211096	XML & Databases	INF	154	KEULEN DR IR M VAN	2003	1
211097	Bijzondere onderwerpen gegevensbanken	INF	152	HIEMSTRA DR IR D	2003	3
211097	Bijzondere onderwerpen gegevensbanken	INF	154	KEULEN DR IR M VAN	2003	1
211098	Databasetransacties en -processen	INF	155	DERKS IR W L A	2003	3
211098	Databasetransacties en -processen	INF	149	FOKKINGA DR M M	2003	2
211108	Bijzondere onderwerpen uit de logica	BIT	156	KUPER DR IR J	2003	4
211109	Voortgezette logica	INF	156	KUPER DR IR J	2003	3
211111	Parallelle processen	INF	141	ZWIERS DR J	2003	3
211112	Inleiding Logica	WTM	156	KUPER DR IR J	2003	4
211113	Constraint Logic Programming	INF	145	ETALLE DR S	2003	4
211123	Component- en aspect georienteerd progammeren	INF	157	BERGMANS DR IR L M J	2003	3
211123	Component- en aspect georienteerd progammeren	INF	158	AKSIT PROF DR IR M	2003	1
211127	Formele analyse van natuurlijke taal	INF	142	AKKER DR IR H J A OP DEN	2003	4
211128	Informatica en taal	INF	143	JONG PROF DR F M G DE	2003	4
211129	Taaltechnologie	INF	143	JONG PROF DR F M G DE	2003	4
211130	Ubiquitous Computing	INF	159	HAVINGA DR P J M	2003	3
211130	Ubiquitous Computing	INF	147	SCHOLTEN IR J	2003	2
211131	Statische Objectanalyse en Typering	INF	160	RENSINK DR IR A	2003	4
211133	Ontwerpen van Software Architecturen	BIT	158	AKSIT PROF DR IR M	2003	3
211133	Ontwerpen van Software Architecturen	BIT	161	TEKINERDOGAN DR IR B	2003	1
211180	Basismodellen in de informatica	INF	141	ZWIERS DR J	2003	4
211180	Basismodellen in de informatica	INF	137	NIJHOLT PROF DR IR A	2003	2
211185	Taal- en rekenmodellen	INF	134	ASVELD DR IR P R J	2003	4
211185	Taal- en rekenmodellen	INF	47	GROENLAND DR IR J P J	2003	1
211205	Functioneel programmeren	INF	156	KUPER DR IR J	2003	4
212010	Informatiesystemen	BIT	162	WEG DR R L W VAN DE	2003	3
212010	Informatiesystemen	BIT	163	ECK DR P A T VAN	2003	1
212018	Kennistechnologie voor bedrijfskundige toep.	BIT	138	POEL DR M	2003	4
212018	Kennistechnologie voor bedrijfskundige toep.	BIT	164	VET DR P E VAN DER	2003	2
213001	Basisbegrippen digitale techniek	INF	159	HAVINGA DR P J M	2003	4
213001	Basisbegrippen digitale techniek	INF	165	SMIT DR IR G J M	2003	2
213001	Basisbegrippen digitale techniek	INF	166	MOLENKAMP IR E	2002	3
213002	Ontwerpen van digitale systemen	INF	166	MOLENKAMP IR E	2003	4
213005	Computerarchitectuur	INF	147	SCHOLTEN IR J	2003	4
213005	Computerarchitectuur	INF	148	KOKKELER IR A B J	2003	1
213009	Fouten tolererende digitale systemen	INF	167	KROL PROF DR IR T	2003	4
213009	Fouten tolererende digitale systemen	INF	168	KERKHOFF DR IR H G	2003	1
213011	Gedistribueerde systemen	INF	169	JANSEN IR P G	2003	4
213011	Gedistribueerde systemen	INF	170	MULLENDER PROF DR S J	2003	2
213012	Hardware/software co-design	INF	159	HAVINGA DR P J M	2003	4
213012	Hardware/software co-design	INF	165	SMIT DR IR G J M	2003	2
213013	Real-time embedded systemen	INF	169	JANSEN IR P G	2003	3
213014	Procesbesturing en robotica	INF	144	SCHOUTE DR A L	2003	3
213016	Bijzondere onderwerpen computerarchitectuur	INF	167	KROL PROF DR IR T	2003	3
213110	Computerorganisatie	INF	166	MOLENKAMP IR E	2003	4
213110	Computerorganisatie	INF	165	SMIT DR IR G J M	2003	1
213120	Inleiding informatie- en communicatietechnologie	TBK	166	MOLENKAMP IR E	2003	4
213120	Inleiding informatie- en communicatietechnologie	TBK	165	SMIT DR IR G J M	2003	2
213125	Computersystemen	INF	147	SCHOLTEN IR J	2003	4
213130	Computer Organisatie INF/TEL	INF	166	MOLENKAMP IR E	2003	3
213130	Computer Organisatie INF/TEL	INF	165	SMIT DR IR G J M	2003	2
213500	Programmeren 1	BIT	160	RENSINK DR IR A	2003	4
213500	Programmeren 1	BIT	140	RUIJS DR IR T C	2003	1
213505	Programmeren 2	BIT	140	RUIJS DR IR T C	2003	4
213505	Programmeren 2	BIT	160	RENSINK DR IR A	2003	1
213510	Software Engineering Modellen	BIT	171	BERG DR IR K G VAN DEN	2003	4
213520	Formele Methoden voor Software Engineering	BIT	172	LANGERAK DR IR R	2003	4
213530	Concurrent and distributed programming	INF	151	HARTEL PROF DR P H	2003	4
213530	Concurrent and distributed programming	INF	173	BRINKSMA PROF DR H	2003	2
213530	Concurrent and distributed programming	INF	140	RUIJS DR IR T C	2002	4
213540	Advanced Design of Software Architectures	BIT	171	BERG DR IR K G VAN DEN	2003	3
213540	Advanced Design of Software Architectures	BIT	157	BERGMANS DR IR L M J	2003	1
213540	Advanced Design of Software Architectures	BIT	161	TEKINERDOGAN DR IR B	2002	4
213545	Advanced Design of Software Architectures 2	INF	171	BERG DR IR K G VAN DEN	2003	3
214010	Complexiteit van berekeningen	INF	134	ASVELD DR IR P R J	2003	3
214011	Tool Architectuur	INF	140	RUIJS DR IR T C	2003	4
214012	Systeemvalidatie	INF	174	KATOEN DR IR J P	2003	3
214020	Algoritmen,datastructuren en complexiteit	INF	174	KATOEN DR IR J P	2003	4
214025	Algoritmen,datastructuren en complexiteit plus	BIT	174	KATOEN DR IR J P	2003	4
214030	Artificial Intelligence	BIT	138	POEL DR M	2003	4
214030	Artificial Intelligence	BIT	142	AKKER DR IR H J A OP DEN	2003	2
214030	Artificial Intelligence	BIT	156	KUPER DR IR J	2002	3
214030	Artificial Intelligence	BIT	164	VET DR P E VAN DER	2002	1
214500	Communicatie en ontwerpen in ICT-projecten 1	INF	154	KEULEN DR IR M VAN	2003	3
214500	Communicatie en ontwerpen in ICT-projecten 1	INF	175	LIPS-JOOSSE DRS W.H.A.	2003	2
214500	Communicatie en ontwerpen in ICT-projecten 1	INF	116	LITVAK DR N	2002	3
214500	Communicatie en ontwerpen in ICT-projecten 1	INF	176	GEEST DR T M VAN DER	2002	1
214500	Communicatie en ontwerpen in ICT-projecten 1	INF	84	AL-DHAHIR DRS A	2001	3
214501	Communicatie & ontwerpen in ICT-projecten 2	INF	154	KEULEN DR IR M VAN	2003	3
214510	MMI-project	INF	177	KOPPELMAN IR H	2003	3
214510	MMI-project	INF	178	DIJK DR E M A G VAN	2003	2
214511	Database Project	INF	149	FOKKINGA DR M M	2003	3
214511	Database Project	INF	150	BLANKEN DR H M	2003	2
214512	Computerarchitectuur Project	INF	147	SCHOLTEN IR J	2003	4
214513	Internet & Web Architecturen	INF	179	PRAS DR IR A	2003	4
214513	Internet & Web Architecturen	INF	180	NIEUWENHUIS PROF DR IR L J M	2003	2
214513	Internet & Web Architecturen	INF	181	QUARTEL DR IR D A C	2002	4
214513	Internet & Web Architecturen	INF	182	SINDEREN DR IR M J VAN	2002	2
214515	Codesign project	INF	159	HAVINGA DR P J M	2003	3
217001	Testtechnieken	INF	173	BRINKSMA PROF DR H	2003	3
219801	Hypermedia structuren en systemen	INF	98	GEVELING DRS B M	2003	4
219801	Hypermedia structuren en systemen	INF	83	DRIESSEN DR T S H	2003	1
219803	Neurale netwerken	INF	163	ECK DR P A T VAN	2003	4
219910	Ontwerpproject	INF	12	ROELOFFZEN DR IR C G H	2003	3
232011	Architectuur van informatiesystemen	BIT	150	BLANKEN DR H M	2003	4
232012	Information retrieval en kennisbeheer	BIT	164	VET DR P E VAN DER	2003	3
232016	Prestatie-analyse van informatiesystemen	BIT	183	BOER DR IR P T DE	2003	3
232016	Prestatie-analyse van informatiesystemen	BIT	144	SCHOUTE DR A L	2003	2
232016	Prestatie-analyse van informatiesystemen	BIT	150	BLANKEN DR H M	2002	4
232020	Data warehousing & data mining	BIT	138	POEL DR M	2003	4
232020	Data warehousing & data mining	BIT	184	ROSSUM PROF DR W VAN	2003	2
232020	Data warehousing & data mining	BIT	154	KEULEN DR IR M VAN	2002	3
232050	Electronic Commerce	BIT	185	STEGWEE PROF DR R A	2003	4
232050	Electronic Commerce	BIT	186	PIEPER PROF IR R	2003	2
232050	Electronic Commerce	BIT	28	STRAMIGIOLI DR IR S	2002	4
232055	XML-technologie in E-Commerce	BIT	171	BERG DR IR K G VAN DEN	2003	4
232055	XML-technologie in E-Commerce	BIT	122	BOKHOVE DR IR O	2003	1
232060	Multi-agent systemen	BIT	138	POEL DR M	2003	4
232060	Multi-agent systemen	BIT	75	DAMME DR R M J VAN	2003	2
232080	Requirements Engineering	BIT	187	WIERINGA PROF DR R J	2003	3
232081	Requirements Engineering	BIT	187	WIERINGA PROF DR R J	2003	4
232085	Voortgezette Requirements Engineering	BIT	187	WIERINGA PROF DR R J	2003	4
233030	Specificeren van informatiesystemen	BIT	162	WEG DR R L W VAN DE	2003	3
233030	Specificeren van informatiesystemen	BIT	187	WIERINGA PROF DR R J	2003	1
233035	Practicum Databases in Informatiesystemen	BIT	162	WEG DR R L W VAN DE	2003	4
233035	Practicum Databases in Informatiesystemen	BIT	187	WIERINGA PROF DR R J	2003	1
233035	Practicum Databases in Informatiesystemen	BIT	150	BLANKEN DR H M	2002	3
233035	Practicum Databases in Informatiesystemen	BIT	149	FOKKINGA DR M M	2002	1
234001	Productie-informatietechnologie	BIT	162	WEG DR R L W VAN DE	2003	3
234004	Softwaremanagement	BIT	171	BERG DR IR K G VAN DEN	2003	3
234007	Systemen voor cooperatief werk	BIT	188	SIKKEL DR N	2003	4
234010	Invoering van IT in organisaties	BIT	189	LIMBURG DR IR D O	2003	4
234010	Invoering van IT in organisaties	BIT	190	STIJN IR E J VAN	2003	2
234010	Invoering van IT in organisaties	BIT	191	MUNTSLAG PROF DR IR D R	2002	4
234020	Ontwerpen van mens-machine interactie	BIT	178	DIJK DR E M A G VAN	2003	4
234020	Ontwerpen van mens-machine interactie	BIT	177	KOPPELMAN IR H	2003	1
234026	Voortgezette informatiesysteemmodellering	BIT	187	WIERINGA PROF DR R J	2003	4
234026	Voortgezette informatiesysteemmodellering	BIT	192	MADER DR A H	2003	1
235005	Inleiding bedrijfsinformatiesystemen	BIT	189	LIMBURG DR IR D O	2003	3
235022	Investeringen in informatietechnologie	BIT	193	SWAGERMAN DR D M	2003	4
235022	Investeringen in informatietechnologie	BIT	119	BOUCHERIE DR R J	2003	2
236001	Kwaliteit van de informatievoorziening	BIT	194	SPIL DR IR A A M	2003	4
236002	Beheer van ICT voorzieningen	BIT	70	POORTEMA DR K	2003	3
236050	E-health Strategies	BIT	194	SPIL DR IR A A M	2003	4
237201	Oriëntatie ICT	BIT	195	HUIJS DRS C	2003	4
237201	Oriëntatie ICT	BIT	26	BREEDVELD DR IR P C	2003	2
237201	Oriëntatie ICT	BIT	140	RUIJS DR IR T C	2002	3
237201	Oriëntatie ICT	BIT	92	AARTS DR H F M	2002	2
237400	BedrijfsProces Ondersteuning	BIT	185	STEGWEE PROF DR R A	2003	3
121000	Instrumentatie van embedded systemen	INF	1	REGTIEN PROF DR IR P P L	2003	3
121001	Elektronische basisschakelingen	EL 	2	ANNEMA DR IR A J	2003	4
121001	Elektronische basisschakelingen	EL 	3	WEL IR A P VAN DER	2003	2
121002	Practicum elektronische basisschakelingen	EL 	2	ANNEMA DR IR A J	2003	3
121002	Practicum elektronische basisschakelingen	EL 	2	ANNEMA DR IR A J	2003	1
121003	Elektronische functies	EL 	2	ANNEMA DR IR A J	2003	3
121003	Elektronische functies	EL 	3	WEL IR A P VAN DER	2003	2
121004	Practicum elektronische functies	EL 	2	ANNEMA DR IR A J	2003	2
121005	Netwerkanalyse	EL 	4	VELDHUIS DR IR R N J	2003	3
121005	Netwerkanalyse	EL 	5	SLUMP PROF DR IR C H	2003	1
121006	Practicum Meetinstrumenten/Netwerkanalyse	EL 	6	KORSTEN DR M J	2003	3
121007	Elektromagnetische Veldtheorie	EL 	7	ELWENSPOEK PROF DR M C	2003	3
121007	Elektromagnetische Veldtheorie	EL 	8	WIEGERINK DR IR R J	2003	1
121007	Elektromagnetische Veldtheorie	EL 	9	OLTHUIS DR IR W	2002	4
121007	Elektromagnetische Veldtheorie	EL 	10	ABELMANN DR IR L	2002	1
121007	Elektromagnetische Veldtheorie	EL 	11	JANSEN DR R	2001	4
121008	Practicum Elektromagnetische Veldtheorie	EL 	10	ABELMANN DR IR L	2003	3
121008	Practicum Elektromagnetische Veldtheorie	EL 	7	ELWENSPOEK PROF DR M C	2003	1
121008	Practicum Elektromagnetische Veldtheorie	EL 	9	OLTHUIS DR IR W	2002	4
121008	Practicum Elektromagnetische Veldtheorie	EL 	8	WIEGERINK DR IR R J	2002	1
121008	Practicum Elektromagnetische Veldtheorie	EL 	11	JANSEN DR R	2001	3
121009	Inleiding telecommunicatie	TEL	12	ROELOFFZEN DR IR C G H	2003	4
121017	D1-project	EL 	5	SLUMP PROF DR IR C H	2003	4
121018	Stage	EL 	3	WEL IR A P VAN DER	2003	3
121018	Stage	EL 	13	WALLINGA-DE JONGE DR W.	2003	1
121019	D-opdracht	EL 	11	JANSEN DR R	2003	3
121021	Inleiding in de biomedische technologie	EL 	14	MARANI PROF DR E	2003	4
121021	Inleiding in de biomedische technologie	EL 	15	GEELEN DR J A G	2003	2
121021	Inleiding in de biomedische technologie	EL 	16	HOLSHEIMER DR J	2002	4
151202	Calculus B	TW 	97	MAREL DR L VAN DER	2003	3
237400	BedrijfsProces Ondersteuning	BIT	187	WIERINGA PROF DR R J	2003	1
237450	Bedrijfsfunctie ondersteuning	BIT	196	KATSMA IR C P	2003	3
237500	BP lab	BIT	189	LIMBURG DR IR D O	2003	3
237600	Business Case Development for IT-projects	BIT	197	WOGNUM DR P M	2003	3
237600	Business Case Development for IT-projects	BIT	198	MICHEL-VERKERKE DRS IR M.B.	2003	1
239800	BIT-BV 1	BIT	163	ECK DR P A T VAN	2003	4
239801	BIT-BV 2	BIT	197	WOGNUM DR P M	2003	4
239801	BIT-BV 2	BIT	169	JANSEN IR P G	2003	2
239805	BIT-BV	BIT	195	HUIJS DRS C	2003	4
239981	Integratieproject	BIT	188	SIKKEL DR N	2003	3
239981	Integratieproject	BIT	163	ECK DR P A T VAN	2003	2
239981	Integratieproject	BIT	195	HUIJS DRS C	2002	3
239981	Integratieproject	BIT	199	BECHT DR IR J G M	2002	1
121004	Practicum elektronische functies	EL 	2	ANNEMA DR IR A J	2003	3
121004	Practicum elektronische functies	EL 	2	ANNEMA DR IR A J	2003	4
151070	Kwantitatieve methoden	BSK	77	JEURNINK DR G A M	2004	3
156014	Analyse B	TW 	84	AL-DHAHIR DRS A	2003	4
239981	Integratieproject	BIT	200	BERG IR F M J W VAN DEN	2001	3
239981	Integratieproject	BIT	78	HURINK DR J L	2001	2
239981	Integratieproject	BIT	201	HEERKENS DR J M G	2000	4
239981	Integratieproject	BIT	202	HEIJDEN DR B I J M VAN DER	2000	1
239981	Integratieproject	BIT	175	LIPS-JOOSSE DRS W.H.A.	1999	3
239981	Integratieproject	BIT	194	SPIL DR IR A A M	1999	1
239981	Integratieproject	BIT	203	TOLLENAAR DRS W B	1998	3
261000	Telematicasystemen en toepassingen	BIT	57	HAVERKORT PROF DR IR B R H M	2003	3
261000	Telematicasystemen en toepassingen	BIT	204	HEIJENK DR IR G J	2003	2
261010	Computer netwerken	BIT	205	WIDYA DR IR I A	2003	3
261010	Computer netwerken	BIT	206	HALTEREN DR IR A T VAN	2003	1
262000	Telematicanetwerken	TEL	183	BOER DR IR P T DE	2003	4
262001	Mobile and wireless networking	TEL	204	HEIJENK DR IR G J	2003	4
262001	Mobile and wireless networking	TEL	207	HEEMSTRA DE GROOT DR IR S M	2003	2
262020	Bijzondere onderwerpen Telematica	BIT	204	HEIJENK DR IR G J	2003	4
262020	Bijzondere onderwerpen Telematica	BIT	141	ZWIERS DR J	2003	1
263000	Telematicadiensten	TEL	205	WIDYA DR IR I A	2003	4
263000	Telematicadiensten	TEL	208	HUIZER PROF DR E	2003	1
263100	Mobile E-health application and services	TEL	206	HALTEREN DR IR A T VAN	2003	4
263200	Gedistribueerde multimedia database systemen	TEL	15	GEELEN DR J A G	2003	4
264000	Telematicatoepassingen	TEL	206	HALTEREN DR IR A T VAN	2003	3
264001	Telematics and business strategies	TEL	68	MEER IR A W J VAN DER	2003	4
264001	Telematics and business strategies	TEL	156	KUPER DR IR J	2003	2
264002	Business process engineering	TEL	50	SRINIVASAN DR.R.	2003	4
265100	Ontwerpen van telematicasystemen	TEL	209	FERREIRA PIRES DR L	2003	3
265100	Ontwerpen van telematicasystemen	TEL	181	QUARTEL DR IR D A C	2003	1
265100	Ontwerpen van telematicasystemen	TEL	182	SINDEREN DR IR M J VAN	2002	4
265110	Protocol Engineering	TEL	209	FERREIRA PIRES DR L	2003	3
265110	Protocol Engineering	TEL	181	QUARTEL DR IR D A C	2003	1
265200	Implementatie van telematicasystemen	TEL	181	QUARTEL DR IR D A C	2003	4
265200	Implementatie van telematicasystemen	TEL	209	FERREIRA PIRES DR L	2003	1
265201	Middleware for distributed objects	TEL	209	FERREIRA PIRES DR L	2003	3
265201	Middleware for distributed objects	TEL	181	QUARTEL DR IR D A C	2003	2
265201	Middleware for distributed objects	TEL	182	SINDEREN DR IR M J VAN	2002	4
265300	Operationeel management van telematicasystemen	TEL	210	BEIJNUM DR IR B J F VAN	2003	3
265310	Internet management architecturen	TEL	210	BEIJNUM DR IR B J F VAN	2003	3
265400	Beveiliging van telematicasystemen	BIT	211	MICHIELS PROF IR E F	2003	3
266100	Patterns of software development	BIT	158	AKSIT PROF DR IR M	2003	4
266100	Patterns of software development	BIT	157	BERGMANS DR IR L M J	2003	2
269000	Orientatie ICT	TEL	195	HUIJS DRS C	2003	3
269001	Portfolio ontwerp	TEL	135	SCHUT DRS J	2003	4
269004	Refresher Logics, Probability,Databases and JAVA	TEL	135	SCHUT DRS J	2003	4
269004	Refresher Logics, Probability,Databases and JAVA	TEL	150	BLANKEN DR H M	2003	1
269100	P-project TEL	TEL	212	KARAGIANNIS IR G	2003	4
269100	P-project TEL	TEL	183	BOER DR IR P T DE	2003	2
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: srs; Owner: db00
--

COPY courses (course_code, description, course) FROM stdin;
121005	Het vak geeft een inleiding in het op een systematische wijze berekenen van spanningen, stromen en vermogens in elektrische netwerken opgebouwd uit lineaire tijdonafhankelijke en geconcentreerde basiselementen. Verschillende begrippen en analysemethoden worden behandeld: de Wetten van Kirchhoff, netwerkelementen, parallel- en serieschakelingen van netwerkelementen, spanning- en stroomdeling, knooppunt- en maasanalyse, vermogensaanpassing, responsies van eerste-orde en tweede-orde netwerken, responsies op sinusvormige signalen, impedantie, admittantie, wijzerdiagram, overdrachtsfuncties, convulutie integraal, Bodediagram serie- en parallelresonatie, momentaan vermogen, gemiddeld vermogen en tweepoorten, de Laplacetransformatie.	Netwerkanalyse
121007	In dit vak wordt een inleiding gegeven in statische elektromagnetische velden. Fenomenen en technische toepassingen worden beschreven m.b.v. de Maxwell vergelijkingen. Fysische interpretatie van de vergelijkingen, het verbinden van fenomenen en toepassingen met de Maxwell vergelijkingen, zowel als hun gebruik voor het beschrijven van eenvoudige situaties en toepassingen vormen de kern van het vak	Elektromagnetische Veldtheorie
121008	Het practicum is gekoppeld aan het vak Elektromagnetische veldtheorie (121007). De student maakt kennis met vectorvelden in de vorm van een 2D eletrostatisch en een 3D magnetostatisch veld. Begrippen uit de vectorcalculus (rotatie, divergentie, wetten van Gauss en Stokes) worden toegepast op deze velden. Naast beschrijvende metingen en tekeningen worden velden gemeten, en gedurende het college emveld in de vorm van huiswerkopgaven geanalyseerd en vergeleken met de theorie. Hiervoor worden Maple sheets gebruikt.	Practicum Elektromagnetische Veldtheorie
121009	Dit vak biedt een kennismaking met de communicatie-techniek. Dit vakgebied houdt zich bezig met systemen die transport van informatie over (grote) afstanden mogelijk maken. Het vak is op te splitsen in 3 onderdelen.	Inleiding telecommunicatie
121013	De individuele onderzoeksopdracht is een project van 7 sp (8 sp toegekend) waarin je individueel een onderzoek doet bij een leerstoel of groep naar keuze. Dit project is de afsluiting van het verplichte programma en biedt een oefening in het individueel doen van een onderzoek en is het eerste grote project dat je zelfstandig doet. De leerstoelen zijn op de hoogte van dit curriculumonderdeel en je mag zelf bepalen waar je de opdracht doet. Het best kun je naar de secretaresse van de leerstoel van je keuze gaan die je zal doorverwijzen naar een staflid die mogelijk een 'portefeuille' van opdrachten heeft en aan wie je je specifieke belangstelling kunt doorgeven of die je in contact brengt met onderzoekers.	Individueel onderzoek project
121017	Een groep van vier studenten kiest een ontwerp gericht opdracht bij een van de leerstoelen. Groepsgewijs wordt de globale opdracht in de eerste periode van vijf weken omgezet in een concreet (schriftelijk) projectplan. Dit plan wordt na 5 weken mondeling gepresenteerd. In de hierop volgende periode van zeven weken wordt het plan uitgevoerd met individuele en gezamenlijke onderzoeksontwerp- of ontwikkelingswerkzaamheden. Het onderzoeksverslag wordt mondeling gepresenteerd. Tot slot wordt een gezamenlijke poster gepresenteerd. Voordrachten en rapportages zijn strak verroosterd. Een verplichte training in schriftelijke en mondeling communiceren (1 SP) is verweven met het project.	D1-project
122226	Dit project biedt een training in analoge IC ontwerpvaardigheden (zie ook 122227) via een deels verplichte en deel vrije opdracht. Het project wordt individueel of met een andere student uitgevoerd. De belangrijkste ontwerpvaardigheden die getraind worden zijn:	Project voortgezette elektronica
121018	Externe stage bij de industrie of een onderzoeksinstituut, b.v.k. in het buitenland. Kennis en vaardigheden van de voorafgaande studie op technisch-wetenschappelijk gebied worden toegepast in een praktijksituatie. De duur van de stage is minimaal 15 weken. Tweemaal per jaar is er een stagevoorlichting. Aanmelden op het stagebureau ongeveer een jaar voor aanvang van de stage. Na aanmelding krijgt de student toegang tot TeleTOP informatie.	Stage
121020	Deze opdracht van 9 SP is te zien als een oefenopdracht voor de doctoraal-opdracht, en dient ook als brug tussen de theoretische vakken en de doctoraal-opdracht. De hoofddoelstelling  van de predoctoraal-opdracht  is niet zozeer het voltooien van een technische "klus", maar het oefenen  in:	Pre-doktoraalopdracht
121021	De Biomedische Technologie draagt vanuit de technologie bij aan het multidisciplinair oplossen van klinische en biomedische vraagstellingen. Deze multidisciplinaire benadering is de basis voor dit college Inleiding Biomedische Technologie. Aan de hand van een klinische casus van een dwarslaesiepatiënt komen achtereenvolgens het klinische, neuroanatomische, neurofysiologische en technologische blikveld aan de orde. De doelstelling is dat studenten kennismaken met elk van deze gezichtspunten en in dit multidisciplinair perspectief kunnen bijdragen aan het oplossen van een eenvoudig biomedische vraagstelling.	Inleiding in de biomedische technologie
121022	Het vak neurofysiologie behandelt:	Neurofysiologie
121025	Dit vak verschaft het theoretisch fundament voor 2-dimensionale digitale bewerking. Aan de orde komen	Digitale beeldbewerking voor beta
121026	Het doel van dit vak is om de studenten met een niet technische achtergrond vaardigheden bij te brengen voor het gebruik van de computer tbv grafische vormgeving: presentaties, websites, video. Ook image processing software wordt daartoe gerekend. De eindtermen van dit vak zijn afhankelijk van het instroomniveau van de betreffende student. Mogelijke softwarepakketten: PowerPoint, FrontPage, AdobeShop, MediaStudioPro, Optimas, ImagePro.	Hands-on dig.image proces. and graphical pres.
121028	Voor technische opleidingen: 	Computer vision
121031	Kwaliteitsinspectie van groenten in de agrarische industrie:	MDOO "computer vision"
121033	In een project wordt een computer vision system ontworpen voor een nader aan te wijzen toepassing.	Project "computer vision"
121034	Het doel van dit vak is het leren modelleren en analyseren van het gedrag van fysische systemen, waarin mogelijk meerdere fysische domeinen optreden (bijv. een luidspreker, een elektrische bestuurde vloeistofpomp, een versnellingsbak en een elektromotor). Bondgrafen worden gebruikt als modelvomingstaal: onafhankelijk van het fysisch domein wordt het systeem afgebeeld in elementaire gedragsfuncties met hun onderlinge verbindingen. Deze modelvormingswijze is gebaseerd op een energie-aanpak. Het interatieve simulatieprogramma 20-sim wordt gebruikt om deze dynamische modellen te simuleren en te analyseren. Daarnaast wordt ingegaan op het gebruik van de numerieke oplosmethoden bij simulatie. Doel hierbij is, om de juiste numerieke methode te vinden bij gegeven modellen, en de resultaten te beoordelen op nauwkeurigheid.	Fysische modelvorming van embedded systemen
121035	Onderwerp: Het ontwerpen en bouwen van een systeem dat een vooraf gespecificeerde functie kan verrichten. Afwegiging tussen analoge en digitale alternatieven. Toepassing van kennis opgedaan in een viertal EL-vakken (met bijbehorende practica). Er vindt reflectie plaats op aspecten van ontwerpen, planning en/of groepswerk via het vak DOEL in TeleTOP. De vereiste voorkennis voor dit project is het Start P-project. Het Mid P-project dient als voorkennis voor het Eind P-project. Frequentie: éénmaal per jaar.	Mid P-project
121037	In vervolg op het basisvak Embedded Signal Processing worden onderwerpen behandeld die de student in staat stellen op aktief aan actuele onderzoekprojecten op het gebied van de digitale signaalbewerking mee te kunnen werken. Naast de uitbreiding van de theorie wordt vooral aandacht besteed aan de verificatie van de theorie m.b.v. wiskundige simulaties en de praktische toepassing bij het ontwerpen van signaal processing systemen voor verschillende applicaties, zoals bij elektro-akoestiek en software radio.	Advanced digital signal processing
121038	Doel van dit vak is vooral begrips- en beeldvorming m.b.t. de elektronica, het vertrouwd maken met de terminologie, het inzichtelijk maken van de functionaliteit van elektronische systemen.	Elektronica voor industrieel ontwerpers
121039	Biomedische signaal- en systeemananalyse is belangrijk voor diagnose, therapie en biomedisch onderzoek. Het wordt gebruikt om lichaamsfuncties te modelleren en het gedrag ervan te voorspellen. Essentieel is de meting van dit gedrag aan het lichaam. Door middel van biomedische signaalanalyse wordt relevante informatie uit deze metingen gehaald. Biomedische signaalanalyse: signaaltermen, empirische modellering en benadering, Fourieranalyse, concepten uit de waarschijnlijkheidberekening en signaaleigenschappen, stochastische signalen, spectrale analyse van stochastische signalen.	Biomedische signaal- en systeemanalyse
121040	In een groot aantal biomedische onderzoeksprojecten worden metingen uitgevoerd bij patiënten, proefpersonen of aan experimentele opstellingen. Vaak worden hierbij allerlei fysische grootheden door sensoren (transducenten) naar het elektrische domein overgebracht, omdat dit de bewerking, registratie en presentatie van de meetgegevens vergemakkelijkt. Om een betrouwbaar signaal te krijgen dat representatief is voor de te meten grootheid, kan bijvoorbeeld versterking, filtering, of artefact-onderdrukking nodig zijn. In dit vak worden werkingsprincipes en eigenschappen van een aantal typen sensoren en elektronische schakelingen behandeld en afgezet tegen mogelijke eisen die nodig zijn voor het beantwoorden van een biomedische onderzoeksvraag. Het doel van het vak is dat de student op basis van documentatie en/of zelf uitgevoerde testen de geschiktheid van elektrische apparatuur voor toepassing in een biomedisch experiment kan beoordelen.	Medische elektronica
121041	Dit vak bouwt voort op Elektromagnetisch veldtheorie (121007) en heeft als globaal doel zoveel basiskennis van het elektromagnetisme en inzicht in de belangrijke grootheden aan te reiken dat de kennis van dit vakgebied verder zelfstandig kan worden aangevuld. In beide vakken gaat het om oplossingen van de vier Maxwell-vergelijkingen voor bepaalde randvoorwaarden. In de Electrodynamica worden deze vergelijkingen toegepast op situaties waar de tijds-afhankelijkheid een essentiele rol speelt. Na introductie van de theorie aan de hand van inzichtelijke en relatief eenvoudige problemen worden ook de belangrijke technologische toepassingen zoals transmissielijnen, golfgeleiders, antennes, radar en optica behandeld.	Elektrodynamica
129357	Deelname aan een project is bedoeld als keuzevak waarin op een bepaald, nieuw, vakgebied aan een project wordt deelgenomen om bv. onderzoeksprojecten voor te bereiden.	Deelname aan een project
121042	Combinatie van hoorcollege en prakticum. Meettheorie; eenheden en standaarden. Meetnauwkeurigheid, statistiek van(meet)fouten; foutanalyse en foutreductiemethoden. Meetversterkers en signaalconditionering. Principes van AD- en DA-omzetting. Meten van elektrischegrootheden, sensoren voor het meten van niet-elektrische grootheden; meten van ruimtelijke grootheden. Test- en meetinstrumenten; data-acquisitiesystemen; presentatie en registratie van meetgegevens. Ontwerpen van meetsystemen; virtuele instrumentatie.	Meettechniek
121043	Het doel van dit vak is het leren modelleren en analyseren van het gedrag van fysische systemen, waarin mogelijk meerdere fysische domeinen optreden (bijv. een luidspreker, een elektrisch bestuurde vloeistof-pomp, een versnellingsbak en een elektromotor). Bondgrafen worden gebruikt als modelvormingstaal: onafhankelijk van het fysisch domein wordt het systeem afgebeeld in elementaire gedragsfuncties met hun onderlinge verbindingen. Deze modelvormingswijze is gebaseerd op een energie-aanpak. Het interactieve simulatieprogramma 20-sim wordt gebruikt om deze dynamische modellen te simuleren en te analyseren. Daarnaast wordt ingegaan op het gebruik van de numerieke oplosmethoden bij simulatie. Doel hierbij is, om de juiste numerieke methode te vinden bij gegeven modellen, en de resultaten te beoordelen op nauwkeurigheid. Dit vak en de vakken Mechanica en Transductietechniek (122816), Meettechniek (121042) en Regeltechniek (121044) worden toegepast in het project Mechatronica (121045), dat als integratieproject parallel loopt.	Dynamische systemen
121044	Behandeling van de regeltechniek met continue tijddiscrete signalen. Beschrijving van dynamische systemen met behulp van blokschema's, overdrachtsfuncties, frequentiekarakteristieken en toestandsbeschrijving. Stabiliteit en gevoeligheid.	Regeltechniek
121045	Van de studenten wordt verwacht dat ze een geregeld (mechatronisch) systeem kunnen ontwerpen, analyseren en realiseren. In het ontwerpproces wordt bijzondere aandacht besteedt aan de modellering van een (mechanisch) systeem in samenhang met de functionele doelen die via een regeling verkregen moeten worden. Zowel bij het vaststellen van de actuele parameterwaarden als bij het regelen zijn sensoren en meettechniek van essentieel belang. Tijdens de regeling zullen actuatoren, voor zover ze al niet deel uitmaken van het te regelen proces zelf, bijzondere aandacht krijgen. De voorzieningen bij dit project zijn dusdanig dat de aandacht van de student niet hoofdzakelijk uitgaat naar op laag niveau programmeren of naar het bouwen van schakelingen die ook standaard verstrekt kunnen worden zoals versterkers, aangezien dit een te zware wissel trekt op de beschikbare tijd en de vakken 'elektronica' en 'programmeren/ computerarchitectuur' anderszins door een projectvorm ondersteund worden. Daarom wordt het hart van het geregelde systeem op een wijze aangeleverd dat er zonder al te veel problemen mee geëxperimenteerd kan worden t.b.v. data acquisitie en regeling. Dit betekent dat er voor dit doel digitale hardware beschikbaar is die op hoog niveau aanstuurbaar is vanuit de software die in het project en de ondersteunende vakken gebruikt wordt, te weten LabView en 20-sim.	Project Mechatronica
121048	In this course Dr. ir. Marcel Pelgrom from Philips Research will teach you	A/D converters
121049	De invloed van verschillende elektronische aspecten van elektrofysiologische metingen op de eigenschappen van de verkregen signalen wordt experimenteel onderzocht. De signalen moeten de gewenste bronnen zo goed mogelijk representeren en fysiologische en niet-fysiologische storingen onderdrukken. De volgende aspecten komen aan de orde: polariseerbare en niet-polariseerbare elektroden, aarding, elektrodenconfiguratie (single-ended / differentieel), ingangsimpedante van de versterker, AC of DC meten, versterkingsfactor, presamplingfilter, samplefrequentie.	Practicum Medische Elektronica
121050	zie vakbeschrijving Engels	Modern robotics
121051	In dit vak wordt een overzicht gegeven van informatie opslag systemen, met een nadruk op breedte in plaats van diepte. The studenten leren de huidige informatie-opslagsystemen te evalueren, en opkomende nieuwe technieken te beoordelen op hun relevantie en mogelijke toepassingsgebieden.	Informatie Opslag
121052	In het vak Imaging maakt de student kennis met de belangrijkste beeldvormende modaliteiten uit de medische diagnostiek, de diagnostic imaging systemen en de daaraan gerelateerde medische beeldbewerking. Aan de orde komen Röntgen, inclusief (coronair) angiografie, Computed Radiography (CR), Computed Tomography (CT) en Magnetic Resonance Imaging (MRI) met bijbehorende beeldreconstructie en beeldanalyse. Niet behandeld wordt de belangrijke Ultrasound (US)  techniek. Aan het vak is een beeldbewerkingspracticum (25%) verbonden waarin de student de mogelijkheden en beperkingen van de diverse modaliteiten leert onderkennen. Het vak wordt afgesloten met een studie stimuleringstoets (50%) en een verdiepingsproject (25%) naar keuze in één van de onderwerpen van het vak.	Imaging
121053	Bij allerlei processen speelt onzekerheid een grote rol, bijvoorbeeld bij signalen die verzonden worden en door allerlei oorzaken vervormd raken. Die vervorming kunnen we in veel gevallen niet voorspellen door een gebrek aan informatie. Dit gebrek aan informatie speelt ons ook parten in meetsituaties. Goed meten houdt vragen in zoals: wat is de gewenste informatie ? wat is ongewenste informatie ? wat is de signaal-ruisverhouding ? wat is de kans op meetfouten ? 	Zekere- en onzekere informatie
121054	Implantation of artificial organs and prosthetic devices into the human body becomes everyday clinical practice. Examples are the cochlear implant, neural stimulators for muscle control and treatment of Parkinson disease. New developments are artificial vison for the blind and connections to the neural system and the brain. 	Neurotechnologie
121056	A "lab-on-a-chip" consists of electrical, fluidic, and optical functions integrated in a microsystem, and has applications in (bio)chemical and medical fields. The core of the lab-on-a-chip system is a microfluidic channel structure, through which fluid sample plugs with less than a nanoliter volume are propelled by hydraulic or electrokinetic forces. The fluidic structures are machined in materials like fused silica, borofloat glass, or plastics. The course will discuss all aspects of such microsystems. Topics will be: microfabrication, fluidic behaviour in dimensions ranging from the micrometer to the nanometer scale, fluidic control by electronic or other means, microreactors, analysis and manipulation of (living) cells and biomolecules, detection principles (optical, electrical), chemical analysis on a chip (electrophoresis, chromatography).	Laboratorium op een chip
121057	In dit college worden de elektrofysiologische en biofysische processen behandeld die ten grondslag liggen aan het ontstaan van bio-elektrische activiteit in met name het zenuwstelsel en spieren, in relatie tot de aan de lichaamsoppervlakte meetbare electrische signalen, zoals het elektro-encefalo-gram (EEG), het elektrocardiogram (ECG), het elektromyogram (EMG) en het elektroneurogram (ENG). Deze signalen zijn klinisch van belang omdat ze informatie geven over de (patho)fysiologische toestand van de betreffende weefselstrukturen.	Bio-elektriciteit
129358	Het maken van een scriptie is bedoeld als keuzevak waar over een bepaald, nieuw, vakgebied een scriptie wordt gemaakt om bv. onderzoeksprojecten voor te bereiden.	Maken van een scriptie
121060	Het vak behandelt optische basisfuncties en microsystemen die in optische informatieoverdrachtsystemen toegepast worden.Hiertoe worden eerst enkele relevante aspecten uit de basisoptica behandeld zoals de voortplanting van zowel vrije als geleide lichtbundels. Aandacht wordt besteed aan de werking van halfgeleider lasers, halfgeleider detectoren en de fiber als transportmiddel voor licht. Daarnaast aan geïntegreerd optische devices en microsystemen voor o.a. het schakelen van optische informatiestromen. Na afloop moet de student voldoende inzicht hebben verkregen in de werking van deze basisfuncties, om hun rol in en hun mogelijkheden en beperkingen voor optische informatiesystemen te kunnen inschatten.	Optische basisfuncties en microsystemen
121062	In dit project dient de opgedane kennis uit alle propaedeusevakken zo goed mogelijk geïntegreerd te worden benut. Een keuze kan gemaakt worden uit de volgende onderwerpen:- Het verbeteren van het programmeerbare robotsysteem. Dit systeem dient als model voor een "magazijnrobot" in een wedstrijd.- Het ontwerpen en bouwen van een aantal specifieke functies van een multimeter of- Het realiseren van een eigen (groeps) idee.Met betrekking tot het laatste onderwerp (het eigen idee) geldt de regel, dat er uiterlijk 1 week voor aanvang van het project een helder gestructureerd projectvoorstel ingediend moet zijn bij BOOZ-EL waarin twee alternatieve uitvoeringen worden voorgesteld.Er vindt reflectie plaats op aspecten van ontwerpen, planning, groepswerk en studeren via het vak DOEL in TeleTOP. De vereiste voorkennis voor dit project is het Start P- en het Mid P-project.	Eind P-project
121067	In deze cursus staat de analyse van biomedische signalen in tijd- en frequentiedomein centraal. De theoretische voorkennis over begrippen zoals DFT, convolutie, aliasing en digitale filters zal op een praktische wijze verdiept worden en toegepast in een biomedische context. Verder wordt veel aandacht besteed aan het softwarepakket MATLAB als gereedschap voor deze analyses. Studenten gaan hierbij zoveel mogelijk zelfstandig (in tweetallen) te werk. De cursus is vormgegeven als een practicum waarin de studenten een tweetal opdrachten uitvoeren en daarvan verslag doen:	Signaal analyse practicum
127116	Dit vak vormt een inleiding in de elektrodynamica voor HTS'ers. Elektrostatica, magnetostatica, elektromagnetische golven en de hierbij horende wiskunde worden in een samenhangend geheel gegeven. Het vak draait om het leren begrijpen, interpreteren van het omgaan met de vergelijkingen van Maxwell, en de samenhang van deze vergelijkingen met enerzijds de waargenomen experimentele feiten en anderzijds het ontwerpen van technische systemen waarin elektromagnetische fenomenen een rol spelen (componenten in circuits, microgolven, optica).	Elektromagnetisme I voor HBO
151510	Doel: het college geeft een overzicht van de belangrijkste technieken in de schadeverzekerings-wiskunde.	Introduction to Risk Theory
120102	In de techniek worden grootheden en eigenschappen van materialen uitgedrukt in getallen. Wat stellen die getallen voor, en hoe meet je die? Bijvoorbeeld de sterkte van coatings. Hoe meet je verkeerssnelheden, hoe meet je kleur, hoe meet je het zuurstofgehalte in bloed, hoe meet je pcb's in voedsel? Je gaat zelf (uiteraard onder begeleiding) dit soort metingen doen.	Kort technologie practicum
120103	De laatste fase is een stage in een technische omgeving, zoals je die aantreft bij een technische faculteit aan de UT of bij een daarmee samenwerkend bedrijf. Je hebt hier twee mogelijkheden. Een stage met een voornamelijk observerend karakter: je maakt mee hoe technici werken, hoe ze denken, hoe ze overleggen, hoe ze tot hun conclusies komen, en je vormt hier (in een rapport) een gestructureerd beeld van aan de hand van een aantal vragen die we je meegeven.	Stage in een technische onderzoeks/ontwikkelgroep
121000	Dit vak is bestemd voor studenten Informatica die de Masterstudie Embedded Systemen hebben gekozen. Het doel is deze studenten kennis te verschaffen over de opbouw en functionaliteit van instrumentatiesystemen, en vertrouwd te maken met de terminologie van de instrumentatie-ingenieur. Aan het einde van de cursus dient de student:	Instrumentatie van embedded systemen
219801	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen.	Hypermedia structuren en systemen
121001	Doel is hier tweeledig. Eerst wordt een eerste inzicht gegeven in de fysische werking van de PN-overgang, de bipolaire transistor en de MOS-transistor. Daarna worden enkele elementaire schakelingen geconstrueerd en geanalyseerd. Aandacht wordt gegevens aan het toepassen van deze basisschakelingen voor eenvoudige analoge en digitale signaalbewerking. Een belangrijk onderdeel is het gelinialiseerde vervangmodel van de transistor en het doen van berekeningen daarmee. De (model)uitkomsten daarvan worden door middel van experimenten en metingen in het practicum getoetst.	Elektronische basisschakelingen
121002	Dit practicum is een kennismaking met dioden en BJT zowel als MOS-transistoren, toegepast in gelijkrichting en versterking. Er wordt door middel van metingen, berekeningen en simulaties inzicht verkregen in de werking van basisschakelingen. Een belangrijk aspect is het onderkennen van de begrippen in- en uitgangsweerstand van een circuit in combinatie met serie- en/of parallel capaciteiten, een en ander in relatie tot het begrip "bandbreedte".	Practicum elektronische basisschakelingen
121003	Gestart wordt met de introductie van het begrip tegenkoppeling. Aan de hand van frequentie-afhankelijkheid worden de begrippen meekoppeling en stabiliteit geïntroduceerd. Toepassingen van tegenkoppeling (ondermeer in oscillatoren) worden behandeld. Het tweede deel behandelt de opbouw van een (operationele) versterker met verschilversterker, stroombron, stroomspiegel en vermogenstrap op transistorniveau en bouwt als zodanig voort op Elektronische basisschakelingen. Het vak wordt afgesloten met een introductie in door niet-lineariteit en ruis opgelegde begrenzingen aan signaalbewerking (121001). 	Elektronische functies
121004	In de eerste helft van dit practicum worden tegengekoppelde en meegekoppelde schakelingen met een (operationele) versterker gebouwd, bemeten, berekend en gesimuleerd. Het voornaamste doel daarbij is het analyseren van terugkoppeling en frequentieafhankelijk gedrag. De tweede helft is in de vorm van een ontwerp-project gegoten, waarin een elektronisch (deel)systeem wordt ontworpen en gerealiseerd. Dit project-deel wordt in groepsverband uitgevoerd.	Practicum elektronische functies
121006	Dit practicum wordt gegeven tijdens het blok netwerkanalyse. Het is het eerste practicum van het curriculum en het heeft een tweeledig doel.	Practicum Meetinstrumenten/Netwerkanalyse
121019	Het afstudeerwerk vormt het sluitstuk van de opleiding en hier dient de student op een geïntegreerde manier zijn kennis en inzicht op een methodisch verantwoorde manier in te zetten.	D-opdracht
151051	n.n.b.	Fundamentele analyse I
219996	niet beschikbaar	Doctoraalstage
121068	Het doel van het college is de student inzicht te geven in de beschrijvingswijze van stochastische signalen en de wijze waarop systemen (i.h.b. lineaire tijdinvariante) dergelijke signalen beïnvloeden. In het college wordt in het bijzonder ingegaan op de beschrijvingswijze: autocorrelatiefunctie, spectrale dichtheid; voorts wordt behandeld op welke wijze lineaire tijdsinvarianten de parameters van een stochastisch signaal beïnvloeden. Er wordt tevens aandacht besteed aan het eigen ruisgedrag van systemen, en er wordt ingegaan op het meten van parameters van stochastische signalen d.m.v. tijdmiddeling. Voorts is er aandacht voor een adequate beschrijving van bandpass-signalen. Tenslotte wordt in het kader van optimale detectie het matched filter en de correlator ontvanger behandeld.	Signaaltheorie
121069	This course treats control structures that are referred to as intelligent control and go beyond the more simple classical feedback control systems: adaptive control, learning control and fuzzy control. These control systems have in common that they can handle systems with partly unknown or time-varying characteristics. The course starts with a classification of these control systems. Direct adaptive control systems (such as MRAC: Model Reference Adaptive Control) are able to automatically adjust controller parameters, without prior identification of a model. Indirect adaptive control systems (such as Self Tuning Regulators) require adjust controller parameters based on the results of model identification. Learning control systems use various knowledge representations to deal, for instance, with non-linear system behaviour or repetitive disturbances. In the course especially Iterative Learning Control and Learning Feed-Forward Control will be treated. Fuzzy control systems can deal with vague information in a similar way as human operators would do.	Intelligent control
121706	Dit vak beschrijft de transistorwerking op een fysisch niveau en vertaalt die naar elektrische karakteristieken. Op basis van deze karakteristieken worden elektronische vervangschema's en simulatiemodellen behandeld. Aan de orde komen:	Halfgeleiderdevices
121709	Alle systemen zijn onderhevig aan degradatie en slijtage. Als we de fysische processen begrijpen die slijtage veroorzaken kunnen we die kennis gebruiken om het ontwerp en de technologie te optimaliseren en zo robuuste en betrouwbare systemen te maken. In dit vak worden de factoren bestudeerd die de levensduur beperken van halfgeleider componenten, micro-mechanische devices alsmede magnetische opslag media. Oplossingen om divices te beschermen tegen het falen en om de levensduur te verlengen, door verbetering van het ontwerp, de fabricage technologie en de materiaalkeuze zullen behandeld worden.	Reliability Engineering
151025	Doel van het college is dat deel van de functionaalanalyse te behandelen dat vooral van groot belang is voor de moderne theorie van partiele differentiaalvergelijkingen en numerieke methoden. Tevens is het behandelde van steeds grotere betekenis voor de besturingstheorie en stochastiek.	Functionaalanalyse II
269995	niet beschikbaar	Stage
121713	Doel: het zelfstandig leren ontwerpen van complexe digitale systemen met CMOS vanuit een gegeven functionele specificatie. Het college begint met de behandeling van bouwstenen zoals optellers, vermenigvuldigers en geheugens. Vervolgens worden de ontwerpkeuzes die gemaakt kunnen worden om snelheid, oppervlakte dan wel vermogen van complexe geïntegreerde systemen te optimaliseren gepresenteerd en geïllustreerd door middel van diverse case studies. Er is ook aandacht voor de programmatuur voor de automatisering van diverse stadia in het ontwerpproces zonder welke het ontwerpen van moderne IC's onmogelijk is. Het vak dient afgerond te worden met een praktische ontwerpopdracht waarin de student moet aantonen relevante ontwerpkeuzes te kunnen maken. Ter ondersteuning van het ontwerp zijn moderne, industriële ontwerpgereedschappen beschikbaar.	VLSI system design
122814	Dit vak vormt een inleiding in de elektrodynamica voor HTS'ers. Elektrostatica, magnetostatica, elektromagnetische golven en de hierbij horende wiskunde worden in een samenhangend geheel gegeven. Het vak draait om het leren begrijpen, interpreteren en het omgaan met de vergelijkingen van Maxwell, en de samenhang van deze vergelijkingen met enerzijds de waargenomen experimentele feiten en anderzijds het ontwerpen van technische systemen waarin elektromagnetische fenomenen een rol spelen (componenten in circuits, microgolven, optica).	Elektromagnetisme II voor HBO
124177	Elektrische energie-overdracht: gelijk-, wissel- en draaistroom, vermogen, elektriciteitsvoorziening.	Inleiding elektrische energietechniek
125113	Dit vak wordt in cursusjaar 2003-2004 niet gedoceerd.	Analoge communicatietechniek
121714	In dit college wordt een overzicht gegeven van de technologieën die gebruikt worden in de fabricage van state-of-the-art IC's (Integrated Circuits, geïntegreerde schakelingen). Het accent ligt daarbij op silicium CMOS technologie. Het college bestaat uit de volgende onderdelen: de evolutie van de silicium halfgeleider technologie, technologische(schaling van afmetingen, wet van Moore) en economische trends, basis processtappen (oxidatie, diffusie, lithografie,depositie, etsen), integratie van processtappen tot een compleet CMOS proces, circuit opbrengst en proces simulatie. Bij het college hoort een praktische oefening waarbij met moderne simulatie software zowel technologische processen als MOS transistoren nader bestudeerd worden. Voorwaarde voor het kunnen afleggen van mondeling examen is het met goed gevolg doorlopen hebben van de praktische oefeningen. De collegestof is multi-disciplinair van aard (elektrotechnisch, fysisch, chemisch) en relevant voor geïnteresseerden in halfgeleider processing alsmede voor studenten in aanverwante disciplines zoals micro-systeem fabricage, nano-technologie, natuurkunde en IC ontwerp. Het bijwonen van het hoorcollege wordt aanbevolen.	I.C. technologie
121717	Het vak Advanced Semiconductor Devices kan worden afgerond door middel van het uitvoeren van een opdracht over een "advanced device", bijvoorbeeld deep-submicrometer transistorn, silicon-on-insulator devices of moleculaire-electronica. Dit vak is hoofdzakelijk, maar niet exclusief, bedoeld als keuzevak naast het vak "Reliability Engineering". Het vak kan op ieder moment worden afgerond.	Advanced semiconductor devices
122227	Analoge circuits spelen een cruciale rol in moderne systemen voor telecommunicatie en multi-media toepassingen, waarin digitale signaal bewerking gecombineerd wordt met gemengd analoog-digitale interface functies (bv. naar communicatie kanalen en sensoren en actuatoren). Vanwege kosten en afmetingen worden deze systemen bij voorkeur geïmplementeerd in gangbare IC technologieën (CMOS, BiCMOS, Bipolar). Dit vak behandelt analoge circuit bouwstenen, en concentreert zich op twee aspecten:	Voortgezette analoge IC elektronica
122230	Dit vak heeft een tweeledige doelstelling. Enerzijds legt het college zich toe op de problematiek van het op specificatie ontwerpen van elektronische systemen voor gemengd analoog-digitale signalen; anderzijds geeft het zicht op	Integrated circuits and systems for mixed signals
122481	Systems engineering omvat activiteiten die samenhangen met het ontwerpen, ontwikkelen, produceren en toepassen van apparaten en systemen. De beoefening van het vak is gericht op de ontwikkeling van een ontwerpmentaliteit en het hanteren van grondregels (methoden en technieken) voor de probleemanalyse en de synthese van gevonden oplossingen voor de realisatie van het ontwerp. Daarbij staat een systeembenadering centraal, d.w.z. optimalisatie van het gedrag van het systeem als geheel. In het bijzonder wordt ingegaan op het gebied van de professionele (industriële) apparatuur.	Systems engineering
122634	Het doel van dit vak is leren software ontwerpen en testen voor complexe, real-time systemen. In de regel gaat het  hierbij om parallelle programma's, waarbij het parallellisme dat in real-time systemen op natuurlijke wijze aanwezig is, kan worden gehandhaafd. 	Real-time software development
122711	In dit vak staat het ontwerpen en realiseren van de instrumentatie voor meetsystemen centraal. Als een vervolg op het vak Meettechniek, waarin vooral de functionele en operationele structuur aan de orde zijn gesteld, richt dit vak zich in het bijzonder op de realisatie van meetsystemen. Uitgaande van een specifieke functionele structuur dienen in de realisatiefase keuzes te worden gemaakt t.a.v. hardware en software, analoog en digitaal, componenten, organieke structuur, procedures, enz. Aan de orde komen onderwerpen als elektronische instrumentatie, DSP's, PIC's en andere specifiek op meetsystemen gerichte programmeerbare logica, virtuele instrumentatie, embedded instrumentatie, netwerkgestuurde instrumentatie en interfacing.	Digitale meetsystemen
122728	In geavanceerde meetsystemen dienen de signalen afkomstig van de sensoren verder bewerkt te worden om uiteindelijk tot een bruikbaar meetresultaat te komen. De informatie die verpakt zit in de sensorsignalen moet tot een betekeninsvol en interpretabel niveau gebracht worden. Patroonclassificatie en parameterschatting vormen de basis hiertoe. Beide onderwerpen hebben een gemeenschappelijke grondslag: Bayes decision theory. Op zich is deze theorie voldoende om optimale classificatoren en schatters te ontwerpen. Maar, deze theorie gaat uit van de beschikbaarheid van mathematische modellen die het fysische proces in probabilistische zin beschrijven. In de praktijk zijn deze modellen nu juist niet gemakkelijk verkrijgbaar. Het alternatief is om het ontwerp te trainen d.m.v. data sets afkomstig van de sensors. Deze datasets vormen een statistische representatie van de ontbrekende modellen. Naast patroonclassificatie en parameterschatting gaat het vak in hoe uit de data sets de benodigde informatie geëxtraheerd kan worden. De student zal zich bekwamen in het vak d.m.v. een paar ontwerp-opdrachten die m.b.v. MatLab opgelost gaan worden. Hiervoor zijn de benodigde toolboxen aanwezig.	Classification, Estimation and Data Analysis
122729	Het vak maakt de student vertrouwd met digitale beeldbewerkingstechnieken. Deze zijn nodig om m.b.v. camera's aan objecten te kunnen meten (computer vision). Die meetobjecten zijn vaak 3-dimensionale voorwerpen.	Image processing
122733	Bij het ontwerpen van een IC voor signaalbewerking hebben ontwerpbeslissingen in de eerste fases van het ontwerp de grootste invloed op de kwaliteit van het eindresultaat. Moderne CAD gereedschappen voor architectuursynthese stellen de ontwerper in staat snel diverse alternatieven te onderzoeken en vervolgens een gemotiveerde keuze te maken voor een bepaalde architectuur. In dit vak wordt enerzijds ingegaan op diverse aspecten van architectuursynthese en anderzijds op algoritmen voor signaalbewerking die zich door de gereedschappen min of meer automatisch laten afbeelden. In de afsluitende opdracht wordt de theorie in de praktijk gebracht door gebruik te maken van een commercieel pakket voor architectuursynthese.	VLSI signal processing
127115	Het college + practicum richt zich op het verkrijgen van praktische vaardigheid in het hanteren van technieken voor biomedische signaalanalyse. (Is ook geschikt voor TN en WB studenten en ook wel, in iets mindere mate, voor INF-studenten.)	Praktische biomedische signaalanalyse
151033	The course "Numerical Analysis" (Numerieke Analyse)	Numerieke analyse
122740	Dit vak behandelt de basis van de elektrotechniek. Op een systematische wijze worden van elektrische circuits opgebouwd uit geïdealiseerde componenten de betreffende stromen, spanningen en vermogens berekend. Behandeld worden de basis netwerk elementen, de één poorten (R,L en C) en twee poorten, versterker en spanningsgestuurde stroombron. Wetten van Kirchhoff. Fysische interpretatie tweede orde differentiaal vergelijking, equivalentie massa - veer systeem met elektrisch netwerk. Analyse van transport van logische signalen over computer hardware en op afstand verbonden hardware. Analyse in tijddomein en frequentiedomein, wanneer is welke beschrijvingswijze handig. Gebruik van de Fourier reeks, inleiding overdrachtsfuncties. Systeem beschrijving met impuls responsie en convolutie integraal.	Netwerkanalyse voor TEL
125114	De doelstelling van het vak is het door middel van eenvoudige modellen 	Prestatieanalyse van communicatienetwerken
122815	Dit vak geeft de student enige kijk op de toepassing van materialen in devices, en hoe materialen op hun specifieke toepassing toegesneden kunnen worden. Op deze manier wordt een breder inzicht verkregen in de materiaalkundige aspecten van het ontwerpen en realiseren van microsystemen. De voorbeelden en toepassingsgebieden zijn genomen uit het lopende onderzoek in de micromechanica, geintegreerde optica en magnetische data-opslag binnen MESA+. Na een serie hoorcolleges worden in kleine groepen bepaalde 'cases' nader uitgewerkt.	Materiaalkunde van microsystemen
125119	Het doel van het college is de student inzicht te geven in de beschrijvingswijze van stochastische signalen en de wijze waarop systemen (i.h.b. lineaire tijdinvariante) dergelijke signalen beïnvloeden. In het college wordt in het bijzonder ingegaan op de beschrijvingswijze: autocorrelatiefunctie, spectrale dichtheid; voorts wordt behandeld op welke wijze lineaire tijdsinvarianten de parameters van een stochastisch signaal beïnvloeden. Er wordt tevens aandacht besteed aan het eigen ruisgedrag van systemen, en er wordt ingegaan op het meten van parameters van stochastische signalen d.m.v. tijdmiddeling. Voorts is er aandacht voor een adequate beschrijving van bandpass-signalen. Tenslotte wordt in het kader van optimale detectie het matched filter en de correlator ontvanger behandeld.	Signaaltheorie
122816	Transducenten (elementen waarmee energie en informatie van het ene fysische domein in een ander worden overgezet) spelen een belangrijke rol in vele technische systemen onder andere daar waar informatie moet worden vergaard, bewerkt (bijvoorbeeld voor besturing), gebruikt, opgeslagen of gerepresenteerd. Voorbeelden zijn luidsprekers, elektromotoren, recorder-kopjes voor magnetische data-opslag, microfoons, druk-sensoren etc. In dit vak krijgt met name het mechanische domein bijzondere aandacht omdat dit bij veel transducenten een rol speelt. Onderwerpen die aan de orde komen zijn krachten, arbeid en energie, impuls, impulsmoment, behouden grootheden, rotaties, massatraag-heidsmoment, trillingen, golven en systemen van meerdere oscillatoren. Centraal bij de beschrijving van transducenten staan de begrippen energie, poorten, extensieve en intensieve (toestands-)grootheden, Legendre transformatie en co-energie, electrostatische-, magnetische-, piezo-elektrische en mechanische energiedichtheden. Bij de analyse van transducenten wordt o.a. gekeken naar de mate waarin transducenten in staat zijn een energietranformatie te bewerkstelligen, of ze stabiel zijn, alsmede naar hun statisch en dynamisch gedrag in zowel onbelaste als belaste toestand.	Mechanica en transductietechniek
122821	De multidisciplinaire samenwerking tussen fysici, elektrotechnici, chemici en technologen heeft tot de realisatie van een groot aantal sensoren en actuatoren geleid. In dit college wordt een overzicht gegeven van methoden en technieken die relevant zijn voor het vervaardigen en ontwikkelen van micro-transducenten. Het college bestaat uit drie delen. Het eerste deel bestaat uit alle aspecten van de dunne laagtechnologie zoals depositiemethoden (sputteren, opdampen, MBE), nucleatie en groei mechanismen en de ontwikkeling van microstructuur en morfologie (groeimodellen, textuur, epitaxie). Deel twee besteedt ruime aandacht aan de specifieke karakterisering en microanalyse methoden voor dunne lagen, oppervlakken en interface (elektronenmicroscopie, probe microscopie, AES, XPS, XRD). Deel drie behandelt de verschillende laterale vormgevingstechnieken zoals lithografische methoden (licht, diep UV, e-beam), natte en droge etstechnieken, focussed ion beam processen etc.	Microtechnologie t.b.v. transducenten
122828	Grondgedachte bij dit practicum is, naast het verder verbreden van de praktische vaardigheden, de kennismaking met enkele in de informatietechniek veel voorkomende technologieën & vervaardigingsmethoden, waarbij verband wordt gelegd tussen de microscopische eigenschappen en de voor toepassing belangrijke macroscopische eigenschappen van materialen.	Practicum realiseren in materialen
122829	Dit vak heeft tevens TN-codenummer 143007. Behandeld wordt de techniek van (moderne) systemen en methodes voor de magnetische opslag van digitale informatie. Aan de orde komen achtereenvolgens de grondslagen van magnetisme, magnetisatie in materialen, het lees- en schrijfproces, recording-koppen en -media, het recordingkanaal, egalisatie en kanaalkodering, ruis,bitfoutdetectie/correctie.	Systemen en technieken voor informatieopslag
122830	The course Micro Electro Mechanical Systems (MEMS) explores the science of miniaturization. Miniaturization methods and materials surveyed include micromachining in or on top of single crystal silicon and other materials based on planar Integrated Circuit (IC) lithography as well as more traditional non-lithography miniaturization options and materials. All these techniques are specialically enhanced or modified for creating small three-dimensional structures with dimensions ranging from sub-centimeters to sub-micrometers, involving sensors, actuators, or other micro-components and microsystems.	Micro electro mechanische systemen
122831	In dit keuzevak zal de student kennis maken met de basisbegrippen van de geïntegreerde optica. Dit gebeurt door een combinatie van hoorcolleges met werkcolleges/computerpracticum, waar d.m.v. het zelfstandig oplossen van problemen de aangereikte stof wordt verdiept. Hierbij wordt uitgebreid gebruik gemaakt van de computer met bijbehorende specifiek voor de geïntegreerde optica ontwikkelde software. Het verslag van het oplossen van de problemen dient als basis voor de beoordeling.	Geintegreerde optica
122833	In kleine groepjes per 2 studenten wordt in dit project een ontvangergedeelte t.b.v. een LAN netwerk geoptimaliseerd. Dit gebeurt door middel van computersimulaties. In dit project worden kenniselementen uit de vakken Optische basisfuncties en Halfgeleider devices met elkaar verbonden.	Integratieproject
123112	De doelstelling van dit college is inzicht te geven in de principes van communicatiesystemen, die in de praktijk veel gebruikt worden. Daarbij ligt de nadruk op de moderne modulatie- en detectieproblemen.	Moderne modulatie- en detectietechnieken
123131	Dit keuzevak behandelt rekenmethodes die hun inspiratie vinden in de biologie. "Neurale netwerken" gebruiken een abstract model van een zenuwcel als bouwsteen. Door het basismodel zelf, de verbindingstructuren en leerregels te variëren ontstaan verschillende soorten netwerken die geschikt zijn voor signaalbewerking, patroonclassificatie, dataclustering, datacompressie, dataopslag, etc. "Genetische algoritmen" vormen een algemeen toepasbare optimalisatiemethode gebaseerd op het prinicipe van de evolutietheorie: in een populatie van mogelijke oplossingen worden de betere gecombineerd met het doel een optimale oplossing te vinden. Bij "genetisch programmeren" wordt hetzelfde principe op executeerbare programma's toegepast om tot een programma te komen dat een bepaalde taak optimaal uitvoert.	Neurale netwerken
123140	Systeem. Lineariteit, tijdsinvariantie, stabiliteit, continuïteit, differentieerbaarheid.  Signalen, signaalruimtes; gegeneraliseerde functies. Input-outputsystemen. Lineaire differentie- en differentiaalvergelijkingen, fundamentele oplossingen, partikuliere oplossingen, algemene oplossing. Lineaire differentie en differentiaalvergelijkingen met constante vorm van fundamentele oplossingen, coëfficienten,  karakteristieke vergelijking, meervoudige wortels. Decompositie signaal in impulsen; kern en convolutie. 	Inleiding systeem- en signaaltheorie voor HBO
123149	In dit vak maakt u kennis met begrippen die betrekking hebben op systemen en signalen en doet u ervaring op met methodieken welke gericht zijn op het systematisch analyseren van de eigenschappen van lineaire, tijdinvariante systemen, zowel in continue als discrete tijd. Methoden ter beschrijving van systemen en signalen: differentie- en differentiaalvergelijkingen, toestandsbeschrijving, impuls- en stapresponsie, frekwentieresponsie, overdrachtsfunctie, convolutie-som en -integraal, stabiliteit, toestandsovergangsmatrix, Fourier-reeksen, Fourier-transformatie, Laplace- en z-transformatie.	Lineaire systemen
125151	De doelstelling van dit vak is het leren analyseren van de functionaliteit en de prestatie van schakel- en controle systemen in vaste en draadloze netwerken. De volgende onderwerpen komen aan bod:	Schakel- en controlesystemen v. Multi-service netw
125152	Analyse van het gedrag van een stepindex glasvezel vanuit de algemene golfvergelijking. Multimodus en monomodus gedrag. Numerieke apertuur van multimodus vezel. Dispersiemechanismes. Modusveld van monomodusvezel. Dispersieverschoven en dispersie-afgevlakte monomodusvezels. Lichtbronnen en -detectoren. LED's.	Glasvezelcommunicatie
123151	Doel: Het in real-time zichtbaar maken van beschrijvingen van 3D objecten is van groot belang voor het interactief bestuderen genoemde objecten. Het vakgebied kan gezien worden als een uitbreiding van het vakgebied van de digitale signaalbewerking, zij het dat het aantal wiskundige concepten en operaties veel rijker geschakeerd is. Voor het college wordt gebruik gemaakt van het zeer complete boek van Alan Watt. De volgende onderwerpen worden behandeld: 3D Geometry, Representaties van Objecten, Observatie systemen, Reflecties en Belichtings Modellen, Rendering Algoritmen, Parametrische Representaties, Shaduw en Textuur, Volume Rendering, Radiosity, Anti aliasing, Modellering gebaseerd op functionele modellen, 3D Computer Animatie, Kleurruimtes en Monitor eigenschappen. Naast de inhoud van het boek zal speciale aandacht worden gegeven aan aspecten van snelle implementaties van 3D computer graphics, zowel in de context van vrij programmeerbare computers alsook in de context van dedicated hardware. Additioneel materiaal zal worden gebruikt voor het hoofdstuk Volume Rendering. Eindtermen: De student moet, op basis van de collegestof, zelfstandig bij kunnen dragen aan het ontwerpen van zeer snelle 3D Computer Graphics systemen. 	Real-time 3D computer graphics
123152	Het college bestaat uit drie gedeelten: Akoestiek (Druyvesteyn, 6x2 uur), Actieve geluidsbeheersing (Berkhoff, 5x2 uur) en Audio codering (Veldhuis, 1x2 uur). Bij akoestiek zullen een aantal basisbegrippen worden behandeld, zoals o.a. de golfvergelijking met de oplossingen voor vlakke- en bolvormige golven, impedanties, reflecties/transmissie in pijpen en kamerakoestiek. Tijdens de hoorcolleges zullen luister demonstraties worden gereproduceerd betreffende de perceptie van het menselijk horen (deze demonstraties maken geen deel uit van de verplichte examenstof). Het tweede gedeelte betreft actieve beïnvloeding van harmonische en stochastische geluidsvelden, via optimale en adaptieve regelsystemen. Causale, inverse filtering, sensoren voor geluidafstraling, afstraalmodes, meerkanaals - en gedecentraliseerde regelsystemen zullen worden behandeld. Het derde gedeelte betreft een inleiding in de audiocodering. De concepten die worden behandeld zijn: subbandcoding, transformcoding, en sinusoidale codering van audiosignalen en kwantisering.	Signal processing in acoustics and audio
123153	In dit vak wordt de basis van digitale signaalbewerking aangereikt. Onderwerpen: Input /output relaties; impulsresponsie, input / output relaties vervolg: frequentie responsie, overdrachtsfunctie, standaard differentie vergelijking, tijd-discrete Fourier analyse, convolutie in tijd en frequentie domain, vensterfuncties, DFT en FFT, decimatie en interpolatie, approximatie van overdrachtsfuncties (Fourier), ontwerp en realisatie van eindige impulsresponsie filters, window, equiriple (Remez algoritme), woordlengte effecten, ontwerp en realisatie van oneindige impulsresponsie filters, woordlengte effecten bij recursieve structuren, overdrachtsfunctie omzetten in tweede orde secties. Paren van polen en nulpunten (methode van Jackson). Fundamentele behandeling van de afweging tussen vermogensdissipatie en ruis / nauwkeurigheid, analoge versus digitale signaal behandeling, AD converter architecturen, (flash folding, pipeline 2 step, sigma delta) analoog actief filter ontwerp (gm-C en actief RC) klok generatie, frequentie synthese, implementatiemethoden.	Embedded Signal Processing
124113	Het vak maakt studenten vertrouwd met methoden voor het schatten van toestandsgrootheden in dynamische systemen. Allereerst wordt het onderwerp 'parameter estimation' als basis ingeleid. Daarna volgt de toepassing hiervan in dynamische systemen. Voor lineaire systemen leidt dit tot het bekende Kalman filter, de predictor en de 'smoother'. Voor niet-lineaire dynamische systemen is het zgn. 'extended Kalman filter' een suboptimale oplossing. Een alternatief is het 'particle filter'. Dit is een numerieke methode die optimaal is, maar als nadeel heeft dat het rekenintensief is.	Optimal estimation in dynamic systems
124151	Zie vakbeschrijving Engels.	Mechatronica
124153	Doel van het vak is de gebruiker van IC-ontwerpprogrammatuur kennis te laten maken met de in de programmatuur gebruikte technieken om zo beter inzicht te verkrijgen in hun mogelijkheden en onmogelijkheden. De onderwerpen die aan de orde komen zijn o.a.: het VLSI ontwerptraject, layoutcompactie, placement en routing, floorplanning, simulatie, logische synthese en hoog-niveausynthese. Voor een goed begrip van enkele van deze onderwerpen wordt tevens in het kort ingegaan op de grafentheorie de complexiteit van algoritmen en algemeen toepasbare methodes voor combinatorische optimalisatie.	Computer-aided design gereedschappen voor VLSI
151039	Het doel van dit college is een wiskundige uiteenzetting te geven van fundamentele begrippen, resultaten en technieken uit de moderne algebra die nodig zijn bij beoefenen van informatica; onderwerpen zijn groepen, ringen, lichamen, codes.	Algebra
124162	Uitgaande van de basiskennis uit het vak Dynamische Systemen (eventueel van tevoren opfrissen) wordt de modelvorming van het dynamisch gedrag van complexe multidomein systemen behandeld, met name op basis van het poortbegrip. De student leert modellen maken en in te voeren in 20-sim, zowel traditioneel op basis van vergelijkingen en blokschema's, maar ook middels bondgrafen, 20-sim wordt gebruikt om deze modellen te analyseren, te stimuleren en te optimaliseren. De rol van de samenhang tussen conceptuele complexiteit enerzijds en numerieke complexiteit anderzijds in het beslissingsproces van de modelvorming, wordt benadrukt. Met name is er aandacht voor planair en ruimtelijk bewegende mechanische systemen en systemen waarin het thermische domein een rol speelt. Deze aanpak van modelvorming speelt een belangrijke rol bij het ontwerpen en analyseren van systemen uit mechatronica en robotica.	Modelvorming en simulatie
124163	Transducenten voor signaalomzetting vanuit het mechanische naar het elektrische domein. Indeling naar fysisch principe: resistief, capacitief, induktief, magnetisch, optisch, piezo-elektrisch en akoestisch. Fysische achtergronden: piezo-elektrische, opto-elektrische en akoesto-elektrische effecten.	Mechatronische meetsystemen
124176	In Digitale Regeltechniek worden behandeld: multivariabele systemen, stabiliteit volgens Liapunov, regelbaarheid en	Digitale Regeltechniek
125118	Ter afsluiting en afronding van het cluster Informatie-overdracht, is een clusteropdracht gepland. Het doel van deze opdracht is om te komen tot vergroting van inzicht in de aangeboden stof en om een geïntegreerde kijk te krijgen op de stof. Daartoe worden metingen en berekeningen aan stochastische signalen uitgevoerd. Ook worden een aantal simulatie experimenten uitgevoerd met signalen zoals die gebruikt worden in de communicatietechniek.	Practicum informatie-overdracht
129355	Deelname aan een studiegroep is bedoeld als keuzevak waarin op een bepaald, nieuw, vakgebied een studiegroep wordt gevormd om bv. onderzoeksprojecten voor te bereiden.	Deelname aan een studiegroep
129356	Het verrichten van experimenteel werk is bedoeld als keuzevak waarin op een bepaald, nieuw, vakgebied experimenteel werk wordt verricht om bv. onderzoeksprojecten voor te bereiden.	Verrichten van experimenteel werk
125153	Dit vak vormt een eerste kennismaking met de Communicatietechniek. Om te beginnen zal er een kort overzicht worden gegeven van de diverse transmissie-media en hun transmissie-karakteristieken. Vervolgens wordt het belang en het principe van modulatie en demodulatie behandeld, te beginnen bij de klassieke analoge modulatiemethoden. Meer en meer echter wordt digitale transmissie van belang vanwege de inherente signaalverwerkings- en de coderingsmogelijkheden en mede daardoor de betrouwbaarheid. De specifieke moeilijkheden en signaaleisen bij deze transmissievorm worden onder de loep genomen en mogelijke oplossingen geanalyseerd. Dan volgt een overzicht van de verschillende vormen van digitale modulatie en de kwaliteit van die systemen. Tenslotte worden de prestaties van de verschillende modulatiemethoden naast elkaar gelegd en vergeleken met de kanaalcapaciteit volgens Shannon.	Inleiding communicatiesystemen
125156	Transmissielijnen: telegraafvergelijking, verschillende soorten lijnen, kabelparameters, invloed van het skin effect,reflecties, afsluitingen, overdracht via kabels, staande golven, reflectometrie. Glasvezels: golfgeleidingprincipe in optische vezels, enkele belangrijke elektro-optische componenten (LED's, lasers en fotodiodes), glasvezelsystemen, OTDR, de evolutie van netwerkstructuren, netwerkdiensten en de telecommunicatiewereld als gevolg van de invoering van glasvezels en Internet. Antennes en propagatie: basisbegrippen, antennestraling, antennediagrammen en uitvoeringsvormen, verzwakking van radiogolven, het radiospectrum, buiging en schaduwwerking, fading en spreading als gevolg van multipad-transmissie. Multiplex- en accesstechnieken: SDM, FDM, TDM (synchroon en asynchroon), WDM, OTDM,OCDM, SCM, coherence multiplexing, CDMA, ISDN, PDH, SDH, ADSL, Wireless Acces. Netstructuren: vaste net (van long haul tot LAN),cellulaire netten en opbouw van mobiele netten.	Transmissiemedia- en systemen
125159	Doel: De studenten in staat te stellen een communicatienetwerk te ontwerpen met een goede afweging welke netwerkfuncties met welke technieken en welke kwaliteit in het optische domein geïmplementeerd kunnen worden, en welke in het elektrische domein.	Optische communicatienetwerken
125160	Het vak bouwt voort op de verplichte vakken "Inleiding communicatiesystemen" (voorheen Transmissiemedia en Modulatie;125153). Behandeld worden de principes van cellulaire mobiele communicatie met nadruk op de transmissie-aspecten. Aan de orde komen: het cellulaire concept, radio-propagatie, fading en multipath,modulatietechnieken, egalisatie en diversity, "multiple access" technieken, draadloze netwerken. Tenslotte worden een aantal bestaande systemen en standaarden behandeld, zoals GSM, UMTS en Bluetooth.	Mobiele communicatie
125163	Elektromagnetische compatibiliteit (EMC) is het vermogen van een product om in zijn elektromagnetisch milieu bevredigend te kunnen functioneren zonder zelf ontoelaatbare stoorsignalen voor iets in dat milieu toe te voegen. Voorbeelden van niet-EMC zijn een GSM telefoon die een pacemaker of de elektronica in een vliegtuig stoort, de verstoring van de elektronische besturing van een auto door zendinstallaties of een betaalautomaat die gestoord wordt door een piëzo-elektrische aansteker. Het college gaat in op de basisprincipes en preventieve maatregelen. Elementen die ter sprake komen zijn o.a. transmissielijnen, uitstraling van EM-velden door transmissielijnen (PCB-sporen), inkoppeling van EM-velden, voortplanting storingen via velden en geleiding, niet ideaal gedrag van componenten, overspraak in en tussen transmissielijnen, filters, afscherming e.d.. De overgang van velden naar circuits en omgekeerd zal regelmatig worden gemaakt. Door middel van voorbeelden en demo's zal regelmatig de koppeling tussen theorie en praktijk worden gelegd. Na het college moet men in staat zijn om, naast het functionele ontwerp, te herkennen waar en welke additionele maatregelen in een ontwerp moeten worden getroffen voor EM-compatibiliteit. Naast deze kwalitatieve eis moet de student het kwantitatieve deel beheersen, ofwel in welke mate maatregelen in een ontwerp getroffen moeten worden.	Electromagnetische compatibiliteit
127113	In het college worden de elektrofysiologische en biofysische processen behandeld die ten grondslag liggen aan het ontstaan van bio-elektrische activiteit in met name de hersenen en het hart, in relatie tot de aan de lichaamsoppervlakte meetbare potentiaalverschillen, respektievelijk het elektro-encefalogram (EEG) en het elektrocardiogram (ECG). Deze elektrische signalen kunnen informatie geven over de (patho)fysiologische toestand van het betreffende orgaan.	Elektrofysiologische signalen en bio-electriciteit
151043	In dit seminarium worden onderwerpen behandeld die nauw samenhangen met het onderzoek dat in de groep Van Groesen gebeurt. Dit jaar is het onderwerp: Mathematische Optica.	Seminarium mathematische fysica
127117	Het menselijk bewegingssturingssysteem bestaat uit een sensorisch systeem, regelaar (centraal zenuwstelsel), aktuatoren(spieren) en mechanisch systeem (skelet). Bij mensen met neuromusculaire aandoeningen kunnen delen van deze keten onvoldoende functioneren. Het vak Biomechatronica heeft tot doel om methoden aan te reiken voor het ontwerpen van ondersteunende bewegingssturingssystemen.	Biomechatronica
129344	De literatuurstudie is bedoeld als keuzevak waarin op een bepaald nieuw vakgebied een literatuuroverzicht wordt gemaakt om bv. onderzoek projecten voor te bereiden.	Literatuuronderzoek
129345	De studiegroep is bedoeld als keuzevak waarin op een bepaald, nieuw vakgebied een studiegroep wordt gevormd om bv. onderzoeksprojecten voor te bereiden.	Deelname aan een studiegroep
129346	Het experimenteel werk is bedoeld als keuzevak waarin op een bepaald, nieuw, vakgebied experimenteel werk wordt gedaan om bv. onderzoeksprojecten voor te bereiden.	Verrichten van experimenteel werk
129347	De deelname aan een project is bedoeld als keuzevak waarin op een bepaald, nieuw, vakgebied deelname aan een project wordt verricht om bv. onderzoeksprojecten voor te bereiden.	Deelname aan een project
129348	De scriptie is bedoeld als keuzevak waarin op een bepaald nieuw vakgebied een scriptie te maken om bv. onderzoeksprojecten voor te bereiden.	Maken van een scriptie
129349	Niet aanwezig	Activiteit i.h. maatschap. en bestuurlijke vlak
129351	Het college Fysiologie II gaat in op zenuw-, spier- en zintuigfysiologie en is een logische voortzetting van Fysiologie I (135528). Belangrijke items zijn: membraanfysiologie, de moleculaire en cellulaire receptor, motoriek en	Fysiologie II
129354	De literatuurstudie is bedoeld als keuzevak waarin op een bepaald, nieuw, vakgebied een literatuuroverzicht wordt gemaakt om bv. onderzoeksprojecten voor te bereiden.	Literatuuronderzoek
129362	Onderwerp: Het bouwen van een hiërarchisch multidisciplinair systeem (een programmeerbaar mobiel robotsysteem). De onderdelen ervan worden opgebouwd en met moderne apparatuur doorgemeten en gesimuleerd. Het gehele systeem wordt gebouwd en getest. Er vindt een kennismaking met elementaire elektronische schakelingen plaats, een orientatie op de inhoud van de Propedeuse en een eerste reflectie op de ervaring met groepswerk. Frequentie: éénmaal per jaar. Dit project dient als voorkennis voor het Mid P-project. (121035)	Start P-project
129367	Het doel van dit project is het introduceren van een gestructureerde benadering van het onderzoekproject aan studenten. Alle studenten maken individueel een keuze voor een onderzoekproject in een van de onderzoekgroepen/leerstoelen van de faculteit die relevant is aan hun master studie.	Individual project
150432	Introductie in het gebruik van het symbolische rekenprogramma Maple bij het oplossen van wiskundeproblemen uit de vakken Wiskunde III en Wiskunde IV.	Maple practicum II
150433	Oefening in het opzetten en analyseren van wiskundige modellen	Wiskundig modelleren voor CiT
150500	Inhoud: In de beroepspraktijk van de wiskundig ingenieur komt het regelmatig voor dat er een korte presentatie verzorgd moet worden. Naast algemene vaardigheden die nodig zijn voor een succesvolle presentatie stelt de aard van het onderwerp, namelijk op het gebied van de wiskunde of daar rechtstreeks aan gerelateerd, nog een aantal specifieke eisen. Deze eisen vloeien voort uit het feit dat wiskundige onderwerpen vaak lastiger te begrijpen zijn dan de spreker zich realiseert, dat niet altijd het publiek over de nodige voorkennis beschikt en dat wiskunde voor velen toch nog steeds als abstract en ondoorgrondelijk gezien wordt.	Presentatie van een wiskundig onderwerp
150526	Doelstelling: het oefenen in de eerste principes van het vertalen van een praktijkprobleem in wiskundige termen en het interpreteren van resultaten. Leren rapporteren en wiskundige conclusies begrijpelijk maken voor een niet wiskundig geschoolde. Oefening in het toepassen van de analyse, lineaire algebra en discrete kansrekening bij niet wiskundige problemen, bij vraagstukken van economische/besliskundige en fysische/technische aard. Verder oefening in het gebruik van computeralgebra bij formulemanipulatie. Beperkte instructie in het gebruik van LaTeX/Scientific Workplace.	Wiskundig modelleren I
150527	Doelstelling: Kennis maken met het algehele proces van wiskundig modelleren. Verdere ervaring opdoen in probleemanalyse en het opzetten van een model.	Wiskundig modelleren II
150528	Doelstelling: Kennis maken met specifieke technieken die bruikbaar zijn bij het wiskundig modelleren en met een aantal standaardmodellen. Vaardigheid opdoen in het toepassen hiervan.	Wiskundig modelleren III
150529	Doelstelling: Oefenen in het opstellen en toepassen van een wiskundig model voor een complex probleem. Studenten aandacht laten besteden aan modelimplementatie, verificatie en toepassing naast modelopzet. Studenten ervaring laten opdoen in het werken in teamverband.	Wiskundig modelleren IV
150532	Introductie in het gebruik van het symbolische rekenprogramma Maple bij het oplossen van wiskundeproblemen uit de vakken Wiskunde I (151081) en Wiskunde II (151082). Deze vakken moeten parallel aan het prakticum worden gevolgd.	Maple practicum
150539	Introductie in het gebruik van het symbolische rekenprogramma Maple bij het oplossen van wiskundeproblemen. Oefeningen aan de hand van vraagstukken uit de vakken Calculus I, Calculus II en Lineaire structuren.	Maple practicum
150600	Part of the course is meant as a refreshment of some basic elements from analysis (functions of several variables) and linear algebra (matrix theory, eigenvalues). Aspects of  ordinary differential equations deal in particular with phase plane analysis for linear and nonlinear equations. Furthermore programming in C++ will be discussed in connection with numerical analysis.	Mathematical methods
150610	Properties of probability, combinatorics, Bayes' rule, random variables, distribution function, density, examples of discrete and continuous distributions (binomial, normal, etc.), joint distributions, multinomial, bivariate normal, independence, convolution. Expectation, variance, covariance, correlation, moment generating function, law of large numbers, central limit theorem. 	Statistics and probability
151044	Gewone differentiaalvergelijkingen komen voor in allerlei toepassingen uit de Mechanica. Het doel van dit vak is studenten te introduceren in en vertrouwd te maken met relevante oplossingsmethoden voor deze vergelijkingen, die niet eerder behandeld zijn in Analyse A en B. Specifieke gereedschappen voor het oplossen van gewone differentiaalvergelijkingen die aan de orde komen zijn: de methoden van orde-verlaging, reeksontwikkeling voor lineaire vergelijkingen van hogere orde; de methode der variatie van constanten voor lineaire stelsels; het bepalen van de algemene oplossingen van lineaire stelsels met constante coefficienten; fase-vlak analyse voor twee-dimensionale autonome stelsels; linearisering rond evenwichtspunten; stabiliteit; reguliere storingsproblemen en softwarepakketten.	Analyse C
152068	Inhoud: Basisbegrippen en elementaire resultaten met betrekking tot de onderwerpen tellen, logica, verzamelingen, inductie/recursie, relaties.	Discrete wiskunde
152070	Doel: 	Meetkunde
152075	nnb	Grafentheorie
150620	The course in an introduction to the mathematics of systems and signals, and at the same time may be understood as an advanced calculus course. Treated are periodic signals and their Fourier series expansion, aperiodic signals and the Fourier transform of absolutely integrable signals, and the Laplace and z-transform. in a separate chapter the delta function and other generalized functions are introduced. Ultimately, we want to be able to change the signal properties. In the course this is approached from a system-theoretical angle. Treated are: various convolutions, impulse response, step response, frequency response, transfer function, linearity and time-invariance of systems, as well as the system notions BIBO-stability and causality. Both continuous and discrete-time systems are considered. The course takes a closer look at systems described by high-order linear differential and difference equations and their state space descriptions. Some applications are included, such as Shannon's sampling theorem, Amplitude Modulation (AM) and the problem of low-pass filter design. The course further includes an introduction to Matlab.	Systems and signals
150625	The course will consist of theoretical lectures backud up by exercises to highlight key areas. Although the course does cover certain English grammatical and language isseurs, the prime focus is on how ot produce an effective report. The course will be subject to continuous assesment based primarily on three assignments. Each student will receive three individual tutorials in which these assignments, and any other relevant issues, will be discussed.	Scientific communication
150630	Contents: 	Applied functional analysis
219803	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen.	Neurale netwerken
150700	Linear programs.The simplex algorithm. Sensitivity analysis and duality. Transportation problems. Network models	Introduction to operations research
150710	To confront the students with a "real-life" problem for which they have to build a mathematical model.  In the modeling process they must analyze what information they have, what additional information they need in order to model the situation, and aided by literature research, determine which techniques and models are most appropriate for the problem at hand.	Modelling project
150730	Analysis of variance, between-subject designs, one-way analysis, multiple comparisons, Bonferroni, Tukey, Scheffe, contrasts, trend analysis, two-way analysis, interactions, unbalanced designs, type I-III comparisons, ANCOVA, blocking, random factors, nested factors, within-subject designs, uni- and multivariate approaches.	Experimental design
150740	Upper and lower control limits, X-bar chart, R-chart, s-chart, CUSUM-chart, FIR, Shewhart-Cusum, robustness aspects (normality, auto-correlation), charts for individual measurements, process capability, attributes, multivariate control charts, acceptance sampling	Quality control
150810	To teach the application of mathematical modeling techniques to a realistic and complex modeling problem in the field of systems and control, with an emphasis on engineering skills, teamwork and scientific reporting	Modelling project
150910	Contents: Introduction of the basic equations from the physical and technical sciences (Navier Stokes, Maxwell, diffusion) and of important approximate model equations (like Korteweg - de Vries, nonlinear Schrodinger, and Ginzburg-Landau).	Advanced modelling
150920	Depends on the specific topics that are assigned and related to the final project of each individual student.	Modelling project
151003	Voor inhoud en trefwoorden zie 152017 + enige aandacht voor Fourierreeksen tevens zal in dit vak een introductie worden gegeven tot een aantal wiskunde keuzevakken (schilvakken).	Calculus III
151004	Introductie tot complexe getallen. Orientatie op functies van meerdere variabelen: differentieerbaarheid, totale differentiaal. Partieel differentieren, richtingsafgeleide, (Frechet) differentieerbaarheid, Taylorontwikkeling voor functies van meerdere variabelen. Extrema onder nevenvoorwaarden (Lagrange). Inverse en impliciete functiestelling.	Calculus II-A
151005	Meervoudige en herhaalde integratie; lijn- en oppervlakte-integralen. Gradient, rotatie en divergentie. Integraalstellingen van Green, Stokes en Gauss.	Calculus II-B
151007	Inhoud: Complexe getallen, complexe vlak (als R2 + vermenigvuldigingsstructuur), formule van Euler. Toepassingen op 1e en 2e orde lineaire differentiaalvergelijkingen met constante coefficienten. Algemene lineaire ruimten (ook over C, zoals de Cn). Eigenwaarden en eigenvectoren. Gram-Schmidt procedure. Unitaire en Hermitische matrices. Oplossingtechnieken voor  een 1e orde DV.	Lineaire algebra
151010	Elementaire Lineaire Algebra ten behoeve van de P- en D-studie. Stelsels van (in-)homogene lineaire vergelijkingen. Euclidische ruimte van dimensie n (Rn), in- en uitwendig product, (on-)afhankelijk stelsel van vectoren, basis. Matrix, determinant. Lineaire deelruimten (van Rn); meetkundige interpretaties. Lineaire afbeeldingen, alsmede hun matrix representatie.	Lineaire structuren
151012	Functies van een reele variabele: standaard-functies, limieten, continuiteit, differentieren, Taylor-ontwikkeling, bepaalde integraal, systematisch integreren. Introductie tot complexe getallen. Rijen en differentiaalvergelijkingen.	Calculus I
151014	Eerste orde Differentiaal vergelijkingen, richtingsvelden, logistieke vergelijkingen, existentie- en uniciteit van de oplossing van een eenvoudig beginwaardenprobleem. Methoden van Euler en Picard. Homogene en inhomogene lineaire differentiaalvergelijkingen. Indien bij voldoende tijd aandacht besteden aan de elemataire begrippen van de Laplace-getransformeerde.	Analyse A
151015	Doel en korte inhoud: Een overzicht te geven van een aantal numerieke methoden voor stelsels lineaire vergelijkingen en eigenwaardeproblemen. In het practicum wordt o.a. aandacht besteed aan een modern pakket voor lineaire algebra op een Personal Computer (MATLAB).	Numerieke lineaire algebra
151018	Orientatie op methoden uit de moderne analyse ten behoeve van de P- en D-studie. Contractiestelling van Banach in R. Convergentie in C[a,b]. Existentie en uniciteit van de oplossing van een eenvoudig beginwaardenprobleem. Methoden van Euler en Picard. Homogene en inhomogene lineaire differentiaalvergelijkingen. Laplacetransformaties.	Analyse A
151019	Algemene lineaire structuren: lineaire ruimten, basis, dimensie, lineaire afbeeldingen, inwendig produkt, eigenwaarden en eigenvectoren, diagonaliseren, complexe lineaire ruimten, Gramm-Schmidt, complexe matrices (Hermitisch, unitair), spectraal-stelling.	Analyse B
151020	Het doel van het college is een inleiding te geven in de theorie van de Banach- en Hilbertruimten. Hierbij staan begrippen en formuleringen zoals die voorkomen in natuurwetenschappelijke en technische literatuur centraal.	Functionaalanalyse I
151024	Lineaire ruimte: Reële en complexe ruimten, basis, dimensie. Lineaire afbeeldingen: Eigenwaarden en eigenvectoren, het diagonaliseren van matrices, voorbeeld van een niet diagonaliseerbare matrix (Jordan normaalvorm). Inproducten: Orthogonaliseringsmethode van Gram-Schmidt, otrhogonale projectie. Hermitische en unitaire operatoren: Eigenwaarden, spectraalstelling, geadjungeerde operator, exp (A)-matrix. Hilbertruimte: Norm, volledigheid, orthonormaal stelsel, Hilbertuimte, Hermitische en unitaire operatoren in deze ruimte, spectrum.	Lineaire analyse
151045	Het doel van het college is om de spectraaltheorie van onbegrensde operatoren te behandelen. De inhoud van het college vormt tevens een inleiding tot een stuk functionaalanalyse dat wiskundig ten grondslag ligt aan sommige delen van de theoretische natuurkunde, met name de quantummechanica.	Functionaalanalyse III
151052	Metriek, open en gesloten verzamelingen, verdichtingspunt, afsluiting, geinduceerde metriek, Cauchy rij, volledige ruimten, isometrie, completering, continuiteit van afbeeldingen, overdekkingen, compactheid, stelling van Bolzano-Weierstrass, Cantor verzameling, Stelling van	Fundamentele analyse II
151070	Het college stelt zich ten doel de studenten vertrouwd te maken met de wiskunde die gebruikt wordt in kernvakken uit de Bestuurskunde. 	Kwantitatieve methoden
151072	IIa:Elementaire Lineaire Algebra ten behoeve van de B- en M-studie. Stelsels van (in-)homogene lineaire vergelijkingen. Euclidische ruimte van dimensie n (Rn), in- en uitwendig product, (on-)afhankelijk stelsel van vectoren, basis. Matrix, determinant. Lineaire deelruimten (van Rn); meetkundige interpretaties. Lineaire afbeeldingen, alsmede hun matrix representatie.	Wiskunde II
151073	Meervoudige en herhaalde integratie, coordinatentransformaties; lijn-en oppervlakte-integralen.	Calculus III
151080	n.n.b.	Bijscholing wiskunde B2
151081	Inhoud: Functies van een reele variabele: standaardfuncties, limieten, continuïteit, differentiëren, Taylorontwikkeling, integraal. Inhoud eerste orde differentiaalvergelijkingen: richtingsveld, beginwaarde, Eulerbenadering.	Wiskunde I
151082	Lineaire algebra: Lineaire ruimte, norm, inproduct, correlatiecoefficient, matrixvermenigvuldiging, stelsel lineaire vergelijkingen, inverse matrix, basis, dimensie lineaire ruimte, coordinaten, Gauss-Jordanreductie, dimensiestelling, determinant, eigenwaarden- en vectoren, factoranalyse. Een Maplepracticum (150532) wordt gelijktijdig met dit vak gegeven.	Wiskunde II
151083	Functies van meer variabelen: limiet, continu?teit, Jacobimatrix, gradient, kettingregel, Inverse en Impliciete Functiestelling, Taylorformule, vrije extrema en extrema onder nevenvoorwaarden, impliciet gedefinieerde functies, meervoudige integralen, massamiddelpunt, traagheidsmoment, coordinatentransformatie.	Wiskunde III
151084	Gewone differentiaalvergelijkingen: complexe getallen, reeksen, functieruimten, lineaire stelsels, evenwicht, stabiliteit, niet-lineaire stelsels, locale lineairiseerbaarheid. Een Maplepracticum (150432) wordt gelijktijdig met dit vak gegeven.	Wiskunde IV
151085	Inhoud:	Wiskunde I
151086	Differentiaal- en integraalrekening in de driedimensionale ruimte. 	Vectoranalyse voor BMT
151088	Introductie in het gebruik van het symbolische rekenprogramma Maple bij het oplossen van wiskundeproblemen. Gebruik Maple bij limietberekening, differentiëren, integreren, grafieken tekenen, (stelsels) vergelijkingen oplossen. 	Practicum Wiskundig modelleren
151091	Door het in groepsverband uitwerken van (meestal kleine) opdrachten, gebaseerd op onderwerpen van een specifiek werktuigbouwkunde vak in een trimester, wordt de student geoefend in de eerste principes van het vertalen van een praktijk probleem in wiskundige termen en het interpreteren van resultaten. De student krijgt inzicht in de wijze waarop de wiskunde wordt toegepast en vergroot tevens zijn kennis en vaardigheden van het specifieke wertuigbouwkunde vak en wiskundevak. 	Modelvorming I
151092	Doel:  De vakken Modelvorming (I-IV) beogen een beeld te geven van de wijze waarop de wiskunde wordt gebruikt in de dagelijkse praktijk van de werktuigbouwkunde.	Modelvorming II
151093	Doel:	Modelvorming III
151120	Basis eigenschappen van functies in een variabele o.a. limiten, continuiteit, differtentiaal- en integraalrekening, extrema, Taylorontwikkelingen.	Wiskunde I
151130	Lineaire Algebra: Stelsels lineaire vergelijkingen, Vectoren, Matrices, Lineaire ruimten, Lineaire afbeeldingen, Determinanten, Eigenwaarden, Eigenvectoren, Symmmetrische matrices.	Wiskunde II
151140	Functies van meer variabelen: continuiteit, partiele afgeleiden, differentieerbaarheid, kettingregel, inverse- en impliciete functiestelling, Taylorontwikkeling, extrema, meervoudige integratie. 	Wiskunde III
151150	Inhoud in trefwoorden: differentievergelijkingen, differentiaalvergelijkingen, stabiliteit en evenwicht. getalreeksen, machtreeksen. Fourierreeksen van periodieke functies. Uniciteit 	Wiskunde IV
151160	Funkties van meerdere variabelen:  vectorfuncties, grafiek, continuiteit, partielle afgeleiden,differentierbaarheid, kettingregel, gradient, complexe getallen, introductie gradient	Wiskunde C
151200	Functie, limiet, afgeleide, integraal, differentiaalvergelijking, Taylorreeks, R3, Vectorwaardige functies, Partiele afgeleiden, lineaire benadering, gradient, kettingregel, Lagrangemultiplicatoren. 	Calculus A
151202	Oneigenlijke integraal, Covergentiecriteria voor reeksen, machtreeks, convergentiestraal. 	Calculus B
151204	In dit vak worden Laplace transformatie en Fourier reeeksen. behandeld. Deze transformatie worden onder andere gebruikt om gewone differentiaal vergelijkingen op te lossen en om signaalanalyse uit te voeren. Onderwerpen die aan de orde komen zijn: Laplace transformatie met z'n eigenschappen, waaronder lineariteit, eindwaarde stelling en convlulutie eigenschap. Inverse Laplace transformatie d.m.v. breuksplitsen en tabel. Convolutie en gewone differentiaalvergelijkingen. Stap-en impulse-respontie. Complexe en reele Fourtierreeeks met eigenschappen.	Calculus C
151206	Stelsels lineaire vergelijkingen ( Ax=b ) en toepassingen. Lineaire afbeelding, lineair onafhankelijk stelsel, Matrixrekening en toepassingen. Determinanten.	Lineaire Algebra A
151208	Vectorruimten, dimensie, Eigenwaarden , eigenvectoren en toepassingen, Orthogonale stelsels , Gramm-Schmidt, toepassingen van inproduktruimten, symmetrische matrices en kwadratische vormen. Complexe getallen en enkele eerste en tweede orde differentiaalvergelijkingen.	Lineaire Algebra B
151210	Functies van een reele variabele: standaard-functies, limieten, continuiteit, differentieren, Taylor-ontwikkeling, bepaalde integraal, systematisch integreren. Introductie tot complexe getallen. Rijen en differentiaalvergelijkingen.	Wiskunde A
151215	Inhoud in trefwoorden: lineaire algebra: lineaire (on)afhankelijkheid, stelsels lineaire vergelijkingen, bewerkingen met matrices, inverse matrix, vectoren, lineaire ruimte, basis, dimensie, inwendig produkt, orthogonale matrices, determinant, eigenwaarden, toepassingen.	Wiskunde B
151220	Reeksen: getalreeksen, convergentietesten. Functies van meer variabelen: patiele afgeleiden, lineaire benadering, extrema, meervoudige integralen. Differentiaalvergelijkingen: inleiding; lineaire DV's van 2e orde met constante coefficienten.	Wiskunde C
151250	Differentiëren en integreren van functies van een variabele:functiebegrip, limiet, continuïteit, afgeleide, extrema, Taylorpolynoom, integraal (hoofdstelling, substitutieregel, partiële integratie).Stelsels lineaire vergelijkingen: matrixnotatie, oplosbaarheid.	Modellen en systemen
151520	In dit college wordt de theoretische basis behandeld voor het modelleren van financiele producten. De nadruk wordt gelegd op stochastische modellen met discrete tijdsparameter, met een of meerdere tijdsperioden. Onderwerpen die aan bod komen zijn onder andere: factor analyse en regressie voor financiele modellen; dynamisch modelleren van aandeelkoersen, prijstheorie voor futures en opties, rentederivaten; binomiale bomen voor Europese en Amerikaanse opties, leidend tot het Black-Scholes model met continue tijdsparameter.	Mathematical Finance
151530	De theorie van financiele derivaten met continue tijdsparameter wordt behandeld. Aan bod komen onder meer: financiele calculus en martingaaltheorie; Black-Scholes analyse van optieprijzen, exotische opties, arbitrage modellen en de market price of risk; factormodellen voor yield curves en het Heath-Jarrow-Merton rentemodel.	Continuous Time Finance
151540	The goal of the course is to derive algorithms for pricing European, American and exotic options. These derivations are based on tree methods, Monte Carlo methods and methods based on partial differential equations. Besides deriving and implementing algorithms, attention will be paid to theoretical issues such as convergence, stability and efficiency.	Computational Methods in Finance
151550	Het college is een inleiding in de levensverzekeringswiskunde gebaseerd op een stochastisch model voor de toekomstige levensduur van een verzekerde. 	Life Insurance
151560	In dit vak wordt een breed overzicht gegeven van de theorie van investeringen en beleggingen, en de wiskundige technieken die daarbij een rol spelen. Behandeld worden zowel deterministische als eenmalige stochastische (d.w.z. aan toeval onderhevige) cash flows. De nadruk wordt gelegd op de fundamentele economische en wiskundige principes achter de financiele theorie, zoals de netto contante waarde, optimalisering van beleggingsportefeuilles, risicospreiding en arbitrage modellen. Kernwoorden zijn onder meer: discounting, termijnstructuur van rente, yield curves, Markowitz portefeuillebeheer, Capital Asset Pricing, nutsfuncties, prijsmodellen.	Introduction to Investment Theory
151565	Dit vak bestaat uit een realistische en relevant probleem in finance waarvoor een kwantitatieve oplossing gevraagd wordt. Instrumenten uit de theorie, kennis van de praktijk en implementatie en communicatie issues spelen allen een belangrijke rol. Het vak wordt bij voorkeur aangeboden aan een groep studenten die zelfstandig aan het probleem werken, onder begeleiding van een tutor waarmee regelmatig voortgangsgesprekken plaatshebben. Bij de uiteindelijke beoordeling spelen naast de kwaliteit van de oplossing ook de verslaglegging, de samenwerking in de groep, en verantwoording van de resultaten een belangrijke rol.	Praktische opdracht Financial Engineering
151570	Dit vak bestaat uit een realistische en relevant probleem in fiance waarvoor een kwantitatieve oplossing gevraagd wordt. Instrumenten uit de theorie, kennis van de pratkijk en implementatie en communicatie isseus spelen allen een belangrijke rol. Het vak wordt bij voorkeur aangeboden aan een groep studenten die zelfstandig aan het probleem werken, onder begeleiding van een tuto waarmee regelmatig voortgangsgesprekken plaatshebben. Bij de uiteindelijke beoordeling spelen naast de kwaliteit van de oplossing ook de verslaglegging, de samenwerking in de groep en verantwoording van de resultaten een belangrijke rol.	Financial Engineering
151600	Wiskundig Modelleren, Lineair Programmeren, Wachttijdproblemen, Dynamische Modellen, logisch redeneren.	Modelleren en redeneren
152006	Elementaire Lineaire Algebra ten behoeve van de P- en D-studie. De kernbegrippen per hoofdstuk zijn als volgt. 	Lineaire structuren
152024	Dit vak bestaat uit twee onderdelen:	Lineaire analyse
152025	Het college beoogt een algemene inleiding tot dit onderdeel van de wiskunde. Aan de orde komen: Complexe getallen, exp z, log z, sin z, za, sinh z, cosh z, enige topologische begrippen, complex analytische functies, relaties van Cauchy Riemann, harmonische functies, vergelijking van Laplace, conforme afbeeldingen, contourintegratie, stelling van Darboux, stellingen van Cauchy en Morera, integraalformules van Cauchy en Poisson, lemma van Jordan, uniforme en puntsgewijze convergentie, M-test van Weierstrass, machtreeksen, stellingen van Taylor en Laurent, ge?soleerde singulariteiten, stelling van Casorati Weierstrass, residuenstelling, toepassingen van de residuenstelling bij het berekenen van integralen. Inverse Laplace getransformeerde, Z-transformatie, Cauchy Hoofdwaarde, principe van het argument, analytische voortzetting, maximum modulusstelling, stelling van Liouville, z=_, meerwaardige functie, snede, vertakkingspunt.	Complexe functietheorie
152026	Differentiaal- en integraalrekening voor functies van een reele variabele: standaard-functies, limieten, continuiteit, differentieren, Taylor-ontwikkeling, bepaalde integraal, systematisch integreren. Complexe getallen. Lineaire differentiaalvergelijkingen: 2e orde, constante coefficienten.	Calculus I
152027	Differentiaal- en integraalrekening voor functies van meerdere (reele) variabelen alsmede een orientatie op de mathematische fysica ten behoeve van de P- en D-studie. Partieel differentieren, richtingsafgeleide, (Frechet) differentieerbaarheid, Taylorontwikkeling, extrema. Meervoudige en herhaalde integratie; lijn- en oppervlakte-integralen. Gradient, rotatie en divergentie. Integraalstelling van Green, Stokes en Gauss.	Calculus II
152028	Voor CT: Existentie en uniciteit van de oplossing van een eenvoudig beginwaardenprobleem. Methoden van Euler en Picard. Homogene en inhomogene lineaire differentiaalvergelijkingen. Oneigenlijke integralen. Laplace transformaties. Reeksen.	Analyse A
152030	Invoering van een (p,q)-tensor als multilineaire funktionaal. Tensorvelden t.a.v. kromlijnige coordinatenstelsels. Rekenregels voor tensoren, tensoralgebra. Fundamentaal tensorveld, Riemannse metriek. Eerste fundamentaalvorm van een oppervlak. Absolute en kovariante differentiaalrekening. Divergentie. Rotatie. Variatierekening en Geodeten. Kromtetensor van Riemann-Christoffel. Euclidische metriek.	Tensoranalyse
152033	Aan de orde komen de begrippen: Differentieerbare (deel-)varieteit (zonder rand en met rand), raakruimte, immersie, submersie, inbedding, transversaliteit, orientatie, de stelling van Sard. Verder: uitwendige algebra, differentiaalvormen, uitwendige afgeleide, integratie over varieteiten, algemene stelling van Stokes. Indien daartoe nog tijd beschikbaar is, zal enige aandacht worden besteed aan stelsels van autonome differentiaalvergelijkingen beschreven als vectorvelden op differentieerbare varieteiten.	Globale analyse
152038	Doel: Inzicht verkrijgen in basisresultaten uit de grafentheorie.	Grafentheorie
152051	Doel: het verkrijgen van inzicht in grafentheoretische basisresultaten (andere dan in 152038/151038).	Voortgezette grafentheorie
152056	Inhoud: Basisbegrippen en elementaire resultaten met betrekking tot de onderwerpen tellen, logica, verzamelingen, inductie/recursie, relaties.	Combinatoriek
152061	Inhoud: inductie, algoritme van Euclides; eigenschappen van functies; functie van Euler, tellen, partities, permutaties; modulorekenen, algoritmen en complexiteit; grafen: paden, cykels, bomen, kleuringen; problemen van kortste pad en min. opspannende boom	Discrete wiskunde
152066	Inhoud en vorm in overleg met docent.	Capita selecta analyse
152080	Speltheorie analyseert interactieve conflictsituaties met behulp van wiskundige modellen. Deze cursus beoogt een eerste kennismaking te geven met zowel de niet-coöperatieve, de coöperatieve als de stochastische speltheorie. In niet-coöperatieve spelen zijn de spelers egoïstisch en alleen geïnteresseerd in hun eigen welzijn. Zij zullen geen onderlinge afspraken maken. In coöperatieve spelen zijn de spelers wel degelijk in mogelijke samenwerking geïnteresseerd en hier mogen ze bindende afspraken (lees: contracten) maken. Stochastische spelen kunnen ruwweg worden omschreven als een reeks niet-coöperatieve spelen waarbij het huidige spel en de acties van de spelers bepalen welk spel er in de volgende periode wordt gespeeld. De theorie wordt, waar mogelijk, toegelicht aan de hand van voorbeelden en toepassingen.	Deterministische en stochastische speltheorie
152100	Functies van een reele variabele: standaard-functies, limieten, continuiteit, differentieren, Taylor-ontwikkeling, bepaalde integraal, systematisch integreren. Introductie tot complexe getallen. Rijen en differentiaalvergelijkingen.	Calculus I
152110	Differentiaal- en integraalrekening voor functies van meerdere (reele) variabelen alsmede een orientatie op de mathematische fysica ten behoeve van de P- en D-studie. Partieel differentieren, richtingsafgeleide, (Frechet) differentieerbaarheid, Taylorontwikkeling, extrema. Meervoudige en herhaalde integratie; lijn- en oppervlakte-integralen. Gradient, rotatie en divergentie. Integraalstelling van Green, Stokes en Gauss.	Calculus II
152120	Elementaire Lineaire Algebra ten behoeve van de P- en D-studie. De kernbegrippen per hoofdstuk zijn als volgt. 	Lineaire algebra
152130	Reele getallen, verzamelingen en functies, Cardinaliteit, Bewijsmethoden, Convergentie, Limietstellingen, Cauchy rijen, Supremum en infimum, Bolzano-Weierstrass Stelling, Continuiteit, Continue functies op gesloten intervallen, Riemannintegraal, Discontinuiteiten, Oneigenlijke integralen.	Fundamentele analyse
152150	n.n.b	Wiskundig modelleren I
153002	Inhoud: Experiment, discrete kansruimte, steekproeftheorie, voorwaardelijke kans, onafhankelijkheid, stochastische variabelen en discrete verdelingen, simultane en voorwaardelijke verdelingen, verwachting, voorwaardelijke verwachting, variantie, covariantie, correlatiecoëfficiënt, 	Discrete kansrekening
153003	Het college is een voortzetting van Discrete Kansrekening (153002) en behandelt de algemene theorie van de kansrekening, met nadruk op continue kansverdelingen. Het vak legt een theoretische basis voor de analyse van 	Kansrekening
153004	Grondbegrippen uit de beschrijvende statistiek, zoals maten voor centrum en spreiding en lineaire regressie. Elementaire kansrekening. Schatten, betrouwbaarheidsintervallen en toetsen van hypothesen.	Statistiek I
153006	Korte inhoud: toevalsexperiment, uitkomstenruimte, gebeurtenissen, kans, voorwaardelijke kans, onafhankelijkheid, stochastische variabelen, discrete en continue verdelingen, simultane verdeling, voorwaardelijke verdeling, centrale limietstelling.	Kansrekening
153008	Korte inhoud: toevalsexperiment, uitkomstenruimte, gebeurtenissen, kans, voorwaardelijke kans, onafhankelijkheid, stochastische variabelen, discrete en continue verdelingen, simultane verdeling, voorwaardelijke verdeling, wachttijdverdelingen, centrale limietstelling, schatten, betrouwbaarheidsintervallen, toetsingstheorie, éénsteekproefproblemen.	Kansrekening en statistiek
153016	Inhoud: Algemene begrippen uit de beslissingstheorie; uniform meest onderscheidende toetsen; fundamentele lemma van Neyman en Pearson; monotoon 'aannemelijkheidsquotiënt'; uniform meest onderscheidende zuivere toetsen; 'similarity' van toetsen, Neymanstructuur van een toets; uniform meest onderscheidend zuiver; toetsen voor families van multiparameter exponentiële verdelingen; permutatietoetsen; invariante toetsen; rangtoetsen.	Voortgezette wiskundige statistiek
153021	Korte inhoud: basisbegrippen, waaronder eigenschappen van kansen, voorwaardelijke kans, onafhankelijkheid; discrete kansverdelingen, zoals binomiale, hypergeometrische en Poisson-verdeling; continue kansverdelingen, o.a. normale uniforme, exponentiele, gamma, Erlang, lognormale, Weibull verdeling; simultane kansverdeling, verwachting, variantie, correlatie-coefficient, centrale limietstelling, normale benaderingen; veel gebruikte schattingsmethoden; vergelijkingen van schatters, zuiverheid; betrouwbaarheidsintervallen, interpretatie en constructie; toetsingstheorie, ideeen en constructie van toetsen, p-waarde.	Statistiek I voor TBK
153022	zie VIST 2002	Statistiek
153023	Korte inhoud: samenvatten van data, box-plots, Q-Q-plots, goodness-of-fit, transformaties, enkelvoudige lineaire regressie, voorspellingsintervallen, multipele lineaire regressie, variantie-analyse, residuen, verdelingsvrije toetsen, kruistabellen, tijdreeksen, compound Poisson proces.	Statistiek II voor TBK
153026	Doel: Onderbouwing en uitbreiding van in andere colleges gebruikte limietstellingen op het gebied van de mathematische statistiek, inclusief bewijsmethoden en toepassingstechnieken. Om deze statistische stellingen te verkrijgen wordt een beroep gedaan op stellingen uit de kansrekening. Enkele onderwerpen zijn: Basissteekproefgrootheden, Transformaties van statistische grootheden, waaronder kwadratische vormen, Asymptotische optimaliteit in schattings- en toetsingstheorie, U-statistics, Von Mises afgeleide, Statistische functionalen, M-schatters, L-schatters, Asymptotische Relatieve Efficiency.	Asymptotische technieken in de statistiek
153028	Inhoud: Experiment, uitkomstenruimte, kans, voorwaardelijke kans, onafhankelijkheid, stochastische variabelen, discrete verdelingen, continue verdelingen, simultane verdeling, voorwaardelijke verdeling, verwachting, variantie, covariantie, correlatiecoëfficiënt, zwakke wet van de grote aantallen, schatters, zuiverheid van schatters, verwachte kwadratische fout, betrouwbaarheidsintervallen, voorspellingsinterval, basisbegrippen van de statistische toetsingstheorie, 1-steekproef en 2-steekproeven theorie.	Statistiek I
153029	Inhoud: Samenvatten van data, box-plot, stem-and-leaf plot, Q-Q plot, goodness of fit, data transformeren, enkelvoudige lineaire regressie (schatten, betrouwbaarheidsintervallen, voorspellingsinterval, toetsingstheorie, robuust schatten), meervoudige lineaire regressie (schatten, betrouwbaarheidsintervallen, toetsingstheorie), variantie-analyse, tekentoets, toets van Mann-Whitney, kruistabellen (toets op homogeniteit, toets op onafhankelijkheid).	Statistiek II
153031	Korte inhoud: basisbegrippen, waaronder eigenschappen van kansen, voorwaardelijke kans, onafhankelijkheid; discrete kansverdelingen, zoals binomiale, hypergeometrische en Poisson-verdeling; continue kansverdelingen, o.a. normale uniforme, exponentiele verdeling; simultane kansverdeling, verwachting, variantie, correlatie-coefficient, centrale limietstelling, normale benaderingen; veel gebruikte schattingsmethoden; vergelijkingen van schatters, zuiverheid; betrouwbaarheidsintervallen, interpretatie en constructie; toetsingstheorie, ideeen en constructie van toetsen, een- en twee-steekproeven problemen, p-waarde.	Statistiek
153032	Inhoud: (voorwaardelijke) kans en eigenschappen van kansen; onafhankelijkheid; stochastische variabele; (simultane) kansverdeling; verwachting en (co)variantie; centrale limietstelling. Markov ketens met discrete en continue tijdparameter; Poissonproces; vernieuwingsprocesssen; Brownse beweging; stationaire processsen; zwak-stationaire processen.	Kansrekening en stochastische processen
153033	Inhoud: Schatters, zuiverheid van schatters, verwachte kwadratische fout, betrouwbaarheidsintervallen, voorspellingsinterval, basisbegrippen van de statistische toetsingstheorie, 1-steekproef en 2-steekproeven theorie, 	Statistiek
153034	Korte inhoud: toevalsexperiment, uitkomstenruimte, gebeurtenissen, kans, voorwaardelijke kans, onafhankelijkheid, stochastische variabelen, discrete en continue verdelingen, simultane verdeling, voorwaardelijke verdeling, centrale limietstelling, schatten, betrouwbaarheidsintervallen, toetsingstheorie, éénsteekproefproblemen.	Kansrekening en statistiek
153036	Statistiek II sluit inhoudelijk gezien vooral aan bij de eerstejaarsvakken Statistiek I en Methoden en Technieken I. Verondersteld wordt dat deze onderdelen gevolgd zijn en met een voldoende zijn afgesloten. Het vak Statistiek II vormt een belangrijke basis voor het Methoden en technieken practicum in blok 5. Het vak wordt verzorgd vanuit de faculteiten TW en BSK en bestaat feitelijk uit een twee onderdelen (blok 3 en blok 4): - blok 3 wordt verzorgd door TW, basistheorie inferentiële statistiek (1 SP) - blok 4 wordt verzorgd door BSK, toepassing inferentiële statistiek plus practicum analyse van statistische gegevens (2 SP). In blok 3 wordt de theorie betreffende de uitgangspunten die ten grondslag liggen aan de inferentiële statistiek behandeld. Dit onderdeel van één studiepunt wordt verzorgd door docenten van de faculteit Toegepaste Wiskunde. Dit onderdeel vormt samen met Statistiek I de basis voor de inferentiële statistiek. In blok 4 worden een aantal elementaire toepassingen binnen de inferentiële statistiek nader uitgewerkt, waaronder het toetsen op verschillen tussen groepen, het bepalen van betrouwbaarheidsintervallen, kruistabellen (contingentie-analyse), regressie-analyse en variantie-analyse. In het bijbehorende practicum in blok 4 wordt aan de hand van concrete opgaven geoefend in het uitvoeren en interpreteren van deze statistische analyses. Daarbij wordt gebruik gemaakt van de programma's SPSS en Excel.	Statistiek II
153038	Inhoud: Populatie, aselecte steekproef, histogram, schattingstheorie, meest aannemelijke schatters, toetsingstheorie van Neyman en Pearson, toets van Student, F-toets, chi-kwadraat-toets, betrouwbaarheidsintervallen.	Wiskundige statistiek
153039	Beschrijvende statistiek: samenvatten van data; mediaan, gemiddelde, spreiding, correlatie.	Kansrekening en statistiek
153041	Een inleiding wordt gegeven in de statistiek en de daartoe benodigde kansrekening. Aan de orde komen onder meer de volgende begrippen: populatie, steekproef, stamdiagram, frequentietabel, histogram, mediaan, kwartiel, uitschieter, boxdiagram, gemiddelde, steekproefvariantie, steekproefcorrelatie, regressie, kruistabel, kans, voorwaardelijke kans, toevalsvariabele, kansverdeling, verwachting, variantie, aselecte trekking, binomiale verdeling, normale verdeling, normale benadering.	Inleiding statistiek
153045	Doel: De klassieke regressiemodellen uitbreiden tot een (nog) groter toepassingsgebied.	Lineaire statistische modellen
153055	Inhoud: Motivatie, geordende steekproeven en rangnummers, lineaire rangtoetsen, hypothesen van isomorfie, symmetrie en onafhankelijkheid, toetsen van Wilcoxon en van der Waerden, tekentoets, mediaantoets, knopen, locatiealternatieven, Monte-Carlo-methoden, limietverdelingen, efficiency, verdelingsvrije schatters.	Parametervrije statistische methoden
153065	Dit college is een inleiding in de theorie van de Markov ketens. De nadruk ligt op die processen en eigenschappen welke van belang zijn voor toepassingen in de operationele research. Met name worden diverse eenvoudige wachtrijmodellen geanalyseerd.	Markov ketens
153080	In dit college komen aan de orde vernieuwingstheorie, regeneratieve processen en Markovbeslissingtheorie. Een belangrijk deel van het college zal zijn gewijd aan de toepassing van de theorie voor de analyse van voorraadmodellen in productie en logistiek. Naast het hoorcollege wordt de stof geoefend via opgaven in een werkcollege.	Stochastische modellen in de operationele research
153081	Inhoud: het vak bestaat uit twee delen die logisch samenhangen. 	Stochastische modellen v. telecommunicatie syst.
153082	Students are introduced to stochastic simulation as a tool for modeling (complex) stochastic systems; in particular, those arising in the fields of computer/communication, production systems, and operations research. The main objective is for students to understand the statistics used to analyze simulation output. Another objective is for students to acquire the basics and techniques required to plan and perform simulation studies. The course is intended mainly for students of electrical engineering, computer sciences, industrial engineering, and mathematical sciences, but may be taken by other students interested in simulation.  	Stochastische simulatie
153083	In dit vak zullen modellen en analysetechnieken worden ontwikkeld voor het ontwerp, de analyse en de besturing van complexe productie- en logistieke systemen. De modellen laten zich kenschetsen als een combinatie van modellen uit de wachttijdtheorie (inclusief netwerken van wachtrijen) en modellen uit de voorraadtheorie (met beperkte capaciteit). Aan de orde komen o.a.: wachtrijmodellen voor bewerkingsstations met meerdere machines, machines met set-up tijden, relaties tussen seriegrootte en doorlooptijden, invloed van machinebetrouwbaarheid op productie, modellering van job shop productienetwerken met meerdere jobtypen, modellen voor werklastbeheersing, semi-open productienetwerken, modellering van gegeneraliseerde Kanban systemen, scheduling van productiesystemen.	Stochastische modellen in productie en logistiek
153084	Doel: Het leren ontwikkelen van geavanceerde methoden voor capaciteitsplanning, werklastbeheersing en shop floor besturing. Aan de orde komen: CONWIP (Constant Work in Process) besturingssystemen, relaties tussen kwaliteit en logistiek, een raamwerk voor productiebesturing. Aggregaat planning, capaciteits management en workforce planning, geavanceerde methoden voor voorraadbeheer, case study met betrekking tot herontwerp productiesysteem. Bij dit vak behoorde een werkcollege (opgaven).	Analyse en besturing van productie systemen
156016	Reeksen: Convergentie en divergentie bij getalreeksen, meetkundige reeks, vergelijkingsstelling, integraalkenmerk, kenmerken van Cauchy, d'Alembert en Leibniz. Functiereeksen: Taylorreeksen, uniforme convergentie, stelling van Abel, differentiatie en integratie van machtreeksen. Fourierreeksen, gelijkheid van Parseval, Gibbs-fenomeen, Fouriercosinus- en Fouriersinusreeksen, toepassing op randwaardeproblemen, complexe vorm van Fourierreeksen, Fouriertransformatie en -terugtransformatie.	Analyse B
156029	Basisbegrippen en locale theorie van differentiaalvergelijkingen. Fasevlak analyse, gedeeltelijk met de computer. Linearisatie rond evenwichten. Lineaire autonome vergelijkingen, classificatie van lineaire stelsels in het vlak. Variatie van constanten formule. Lyapunov (in)-stabiliteit.	Analyse C
156033	In dit college komen discrete en continue dynamische systemen aan de orde die afhangen van een externe parameter. Na invoering van het begrip topologische equivalentie worden bifurcaties behandeld, en wel van evenwichten, periodieke banan, invariante tori en invariante cirkels. Dit gebeurt allereerst in de laagst mogelijke dimensie van de toestandsruimte. Vervolgens worden reductiemethoden behandeld, met name Lyapunov Schmidt en de centrum variëteit reductie.	Bifurcatie theorie
156037	Introductie van variatie-methode: eerste en tweede variatie met en zonder nevenvoorwaarden, natuurlijke randvoorwaarden, mini-max karakterizeringen van eigenwaarden van symmetrische differentiaal operatoren.	Applied Analytical Methods
153086	Dit vak betreft een toepassing van technieken uit de deterministische operations research, grafentheorie en stochastische operations research. In het bijzonder is het doel van het vak het inzichtelijk maken van de toepassingsmogelijkheden van operations research technieken voor actuele (onderzoek)vragen. Dimensioneren van (mobiele) communicatiesystemen is een belangrijk probleem voor huidige telecomoperators. In het bijzonder is afstemming van vraag en capaciteit belangrijk voor de winstgevendheid van een operator (capaciteit is schaars en dus duur), maar ook voor de klant (kwaliteit wordt onder andere gevoeld middels vol zijn van het netwerk: als het netwerk vol is kun je niet meer bellen). Voor dimensionering zijn twee vragen van belang: wat is de benodigde capaciteit op iedere locatie in het netwerk, en gegeven de capaciteitsvraag, hoe verdeel ik de beschikbare resources zo efficient mogelijk over het netwerk.In de context van GSM worden beide vragen behandeld. De capaciteitsvraag betreft het modelleren van het GSM netwerk als stochastisch netwerk.Hiermee is het aantal benodigde frequenties op ieder basisstation te bepalen. De tweede vraag betreft graafkleuringsproblemen waarbij meerdere kleuren (die model staan voor frequenties) per punt van de graaf (basisstation in het netwerk) kunnen worden gebruikt. In deze problemen zijn de voorwaarden voor de kleuring in het algemeen ingewikkelder dan de voorwaarde dat buurpunten verschillende kleuren moeten krijgen.	Telecommunicatiesystemen
153087	Introductie. Stationariteit, Concepten globaal, partieel en detailed balance (reversibiliteit), quasi reversibiliteit. 	Wachttijdtheorie
153088	Doel: Dit college geeft een inleiding in stochastische methoden en modellen en is gericht op het herkennen en oplossen van eenvoudige problemen. 	Stochastische modellen voor Operations Management
153100	Beschrijvende statistiek, kansrekening, inferentiële statistiek en gebruik van SPSS. In enkele trefwoorden: EDA-technieken, regel van Bayes, één- en twee-steekproevenproblemen, betrouwbaarheidsintervallen, parametervrije en parametrische toetsen, kruistabellen, lineaire regressie en rangsomtoetsen.	Statistiek
153110	Inhoud: Experiment, uitkomstenruimte, kans, voorwaardelijke kans, onafhankelijkheid, stochastische variabelen, discrete verdelingen, continue verdelingen, voorwaardelijke verdeling, verwachting, variantie, covariantie, correlatiecoëfficiënt, zistogram, normatle Q-Q plot, betrouwbaarheidsintervallen, voorspellingsinterval, basisbegrippen van de statistische toetsingstheorie, 1-steekproef en 2-steekproeven theorie (normale verdelingen) tekentoets, toets van Mann-Whitney.	Inleiding statistiek
153120	Beschrijvende statistiek: samenvatten van data, plaatjes, maten; Kansrekening: (rekenregels voor) kansen, onafhankelijkheid, voorwaardelijke kans, regel van Bayes, stochastische variabelen. Discrete en continue kansverdelingen; verwachting en variantie; simultane verdelingen, Simpson's paradox, covariantie en correlatiecoëfficient. Elementaire statistiek: (punt)schatters, betrouwbaarheidsintervallen, toetsingstheorie, één- en tweesteekproefproblemen, t-toets, 2x2-tabel, P-waarde.	Statistiek
153135	Contents: Simple Linear regression, multiple linear regression and analysis of variance. Regression (including analysis of variance) is one of the most frequently used statistical techniques. It is studied on an adequate mathematical level and is applied in a practical.	Statistical techniques
154021	Doel: oplossen van wiskundig geformuleerde problemen die analytisch niet of moeilijk oplosbaar zijn.	Numerieke wiskunde en programmeermethoden
154023	Doel: Oplossen van wiskundig geformuleerde problemen die analytisch niet of moeilijk oplosbaar zijn.	Numerieke wiskunde en programmeermethoden
155009	Het vak behandelt de belangrijkste aspecten van de wiskundige theorie van moderne numerieke methoden voor het oplossen van partiele differentiaalvergelijkingen en i.h.b. de methode der eindige elementen. Inhoud: Sobolev-ruimten, zwakke formulering, spoor-stellingen , stelling van Lax-Milgram, Galerkinmethode, fout-afschattingen, "variational crimes".	Fundamenten van de methode der eindige elementen
155010	Dit vak introduceert studenten in de klassieke onderwerpen uit de mathematische fysica met een moderne inslag. Dit behelst het formuleren van modellen waarin partiële differentiaalvergelijkingen centraal staan, en het bestuderen van methoden voor het oplossen van diverse typen vergelijking. Als kenmerkende voorbeelden dienen de golfvergelijking, de Laplace-vergelijking en de warmte-vergelijking. Specifieke onderwerpen zijn: de methode van karakteristieken voor eerste orde partiële differentiaalvergelijkingen; de classificatie van tweede orde partiële differentiaalvergelijkingen; de methode der scheiding van variabelen; het gebruik van Fourierreeksen; het gebruik van integraaltransformaties; het principe van superpositie; de begrippen zwakke en fundamentaal-oplossingen; en Greense functies.	Part. differentiaalverg. uit de math. fysica
155015	Hyperbolische en parabolische vergelijkingen (golven en diffusieverschijnselen). Nauwkeurigheid, stabiliteit en convergentie van differentiemethoden. Randbehandeling. Schokrelaties.	Part.diff.verg.: Numerieke oplossingsmethoden I
155016	Elliptische differentiaalvergelijkingen, stabiliteit, consistentie en convergentie, praktische eindige elementen dicretizatie, basisfuncties, residuen, oplossen van bijbehorende lineaire stelsels.	Part.diff.verg.: Numerieke oplossingsmethoden II
155019	Voor het numeriek oplossen van mathematisch gemodelleerde fysische/technische problemen zijn tegenwoordig allerlei softwarepakketten beschikbaar. Het doel van dit practicum is, dat de student enige initiële ervaring verwerft in het gebruik van een dergelijk pakket, alsmede een kritische houding ten aanzien van de resultaten die hiermee bereikt worden. Werkwijze: enkele zittingen voor instructie en demonstratie; verder: zelfstandig uitvoeren van practicumopdrachten, individueel of in groepjes.	Practicum softwarepakketten PDV
156012	Basisbegrippen en locale theorie van differentiaalvergelijkingen. Linearisatie rond evenwichtspunten en periodieke oplossingen. Lineaire vergelijkingen, homogeen en inhomogeen, structuur oplossingsverzameling. Vergelijkingen met constante coëfficiënten. Het begrip (asymptotische) (in)stabiliteit in de zin van Lyapunov en Lyaponov functies worden geïntroduceerd. Fase-vlak analyse, stelling van Poincaré-Bendixson. Reguliere storingsberekeningen. Gedurende twee werkcolleges wordt er met behulp van computers symbolisch gerekend en gesimuleerd.	Gewone differentiaalvergelijkingen
156014	Reeksen: Convergentie en divergentie bij getalreeksen, meetkundige reeks, vergelijkingsstelling, integraalkenmerk, kenmerken van Cauchy, d'Alembert en Leibniz. Functiereeksen: Taylorreeksen, uniforme convergentie, stelling van Abel, differentiatie en integratie van machtreeksen. Fourierreeksen, gelijkheid van Parseval, Gibbs-fenomeen, Fouriercosinus- en Fouriersinusreeksen, toepassing op randwaardeproblemen, complexe vorm van Fourierreeksen, Fouriertransformatie en -terugtransformatie. Inleiding voor Laplace-transformaties (defenitie belangrijkste eigenschappen, toepassingen op differentiaalvergelijkingen.	Analyse B
211123	In dit college worden modelleer- en programmeertechnieken behandeld voor het	Component- en aspect georienteerd progammeren
156056	Doel van het college is om een wiskundige uiteenzetting te geven van enkele fundamentele begrippen en resultaten uit de systeem- en  regeltheorie, met toepassingen uit (vooral) de regeltechniek,  mechanica, elektrotechniek en economie.  Inhoud: dynamische  systemen, externe variabelen, ingangen en uitgangen, lineaire  systemen, toestandsrepresentaties in zowel discrete- als  continue-tijd, stabiliteit, impulsresponsie, en de frequentiedomeinbegrippen overdrachtsfunctie en  frequentieresponsie. Het vak vervolgt met een analyse van  regelbaarheid en waarneembaarheid van lineaire systemen. Dit mondt  uit in een fundamenteel resultaat over stabiliseerbaarheid van   mogelijk instabiele systemen. Hierbij spelen de begrippen	Inleiding wiskundige systeemtheorie
156057	Dit vak beoogt een inleiding te zijn op enkele belangrijke onderwerpen uit de wiskundige systeemtheorie, en het functioneren hiervan in voorbeelden uit uiteenlopende wetenschapsgebieden zoals de elektrotechniek, mechanica, economie, regeltechniek en de informatica. Inhoud: Ingangs-toestands-uitgangssystemen in continue en discrete tijd. Systemen als operatoren van ingangs- naar uitgangssignalen. Systemen zonder opgelegde ingangs- uitgangsstructuur. Interconnectie van systemen. Terugkoppeling. Regelbaarheid en waarneembaarheid. Sampling en quantisatie van systemen. Hybride systemen.	Inleiding wiskundige systeemtheorie
156062	Het vak heeft tot doel de student vertrouwd te maken met de principes van het optimaal regelen en van stabiliteit. 	Systeem- en besturingstheorie
156066	Het doel van dit college is om fundamentele toepassingen van de (optimale) besturingstheorie voor economische systemen te beschrijven.	Besturingstheorie van economische systemen
156067	Het vak behandelt "klassieke" en "post-moderne" regelontwerpmethoden voor lineaire systemen. Als eerste worden de grondbeginselen, mogelijkheden, voordelen, valkuilen en beperkingen van terugkoppeling gepresenteerd. Er wordt stilgestaan bij de fundamentele regelaspecten van stabiliteit en robuustheid. Vervolgens worden enkele klassieke regelontwerpmethoden gepresenteerd, waaronder "Quantitative Feedback Theory (QFT)", en hun mogelijkheden en beperkingen worden bekeken.  Daarna wordt in twee hoofstukken de H-oneindig-regeltheorie en uitbreidingen daarvan uitgelegd. Na een gedetailleerde beschrijving van gestructureerde en ongestructureerde onzekerheidsmodellering, worden de post-moderne methoden van H-oneindig en mu-synthese gepresenteerd. In het bijzonder wordt gekeken naar gemengde gevoeligheidsproblemen.	Robust Control
156068	Het college beoogt een inleiding te zijn op de geometrische theorie van lineaire en niet-lineaire regelsystemen. Nadruk ligt op de oplossing van synthese-vraagstukken als storingsontkoppeling, ingangs - uitgangsontkoppeling en bestuurbaarheid, en toepassingen op asymptotische tracking van referentiebanen en padplanning.	Niet-lineaire besturingstheorie
156069	Het vak is een inleiding in signaalanalyse, signaalverwerking en systeemtheorie.	Systemen en Signalen
156080	Het vak is een inleiding in de signaalanalyse en systeemtheorie. Aan de orde komen: complexe getallen en signalen, periodieke signalen en hun Fourierontwikkeling, transformatietechnieken (Fourier en Laplace),	Signalen en transformaties
157004	In dit vak wordt een inleiding gegeven tot de dynamica van onzekere processen vanuit het perspectief van financiële toepassingen, op een niveau dat alleen een elementair kansrekeningsvak als voorkennis veronderstelt.	Stochastische processen in financien
157008	Doel: De student wordt vertrouwd gemaakt met verschillende manieren om de stochastische verschijnselen in fysisch-technische en financieel-economische systemen te modelleren. De wisselwerking tussen de theoretische opbouw en de praktische relevantie speelt een centrale rol bij dit vak. 	Stochastische processen in dynamische systemen
157009	Tijdreeksenanalyse houdt zich bezig met het analyseren van waarnemingen en verschijnselen die zich in de tijd afspelen. Aan de hand van de geregistreerde tijdreeks wordt een wiskundig model gemaakt van het onderliggende mechanisme. Dit model dient voor de verklaring van de tijdreeks en de voorspelling ervan. Bij systeemidentificatie gaat het erom een model van het systeem te vinden aan de hand van waarnemingen van in- en uitgangssignaal. Het vak maakt gebruik van methoden uit de theorie van stochastische processen, de statistiek en de systeemtheorie.	Tijdreeksenanalyse en identificatietheorie
157016	Doel van het vak is het ontwerpen van optimale regelaars en waarnemers (filters) voor systemen met toestands- en waarnemingsruis. Het belangrijkste resultaat is de oplossing van het zogeheten LQG (Linear Quadratic Gaussian) probleem: een regelaar die een kwadratisch kostencriterium minimaliseert in het geval van Gaussische ruis. Onderdeel van deze regelaar is het Kalman filter voor het recursief schatten van de toestand. Optimale regelaars en het Kalman filter zijn tegenwoordig onmisbare hulpmiddelen in veel praktische besturingsproblemen zoals bijvoorbeeld het in een geostationaire baan houden van een communicatie satelliet, luchtverkeergeleidingsystemen, het voorspellen van rivierwatervervuiling, het voorspellen van waterhoogtes en dergelijke.	Stochastische filter- en besturingstheorie
157020	In de bechrijving van veel complexe systemen (technologisch, technisch-procedureel, ..) hebben we te maken met een combinatie van continue-tijd dynamica en het optreden van gebeurtenissen ("events") die bijv. veroorzaakt kunnen worden doordat één of meerdere continue variabelen een bepaalde waarde dreigen te overschrijden, of door communicatie met andere deelsystemen. Een typische voorbeeld is een temperatuurregelingssysteem; en in het algemeen zijn alle "embedded" regelsystemen van deze aard (een combinatie van software en fysische dynamica). Ook complexe technologische systemen zoals luchtverkeersgeleidingssystemen hebben dezelfde karakteristieken. Deze systemen worden "hybride systemen" genoemd, en de bestudering van deze systemen heeft recentelijk een sterke impuls gekregen door ontwikkelingen binnen de informatica gericht op het uitbreiden van specificatie- en verificatieformalismen voor discrete processen naar deelklassen van hybride systemen (in het bijzonder processen waarin de tijd een rol speelt).	Dynamische discrete gebeurtenissen
213500	In dit vak maken de studenten kennis met de basisprincipes van het objectgeoriënteerd programmeren, waarbij gebruik gemaakt wordt van de programmeertaal Java. Zowel theoretische kennis als ook praktische vaardigheden komen hierbij aan de orde. De nadruk ligt op de volgende onderwerpen: klassenontwerp, specificatie, correctheid, testen, gestructureerd programmeren en abstractiemechanismen.	Programmeren 1
157021	Het vak is een inleiding in signaalanalyse en signaalverwerking. Aan de orde komen: periodieke signalen en hun Fourierontwikkeling, transformatietechnieken (Fourier, Laplace, Z), continue-tijdsignalen en discrete-tijdsignalen en hun spectra, en de deltafunctie. Het vak vervolgt met signaalverwerking beschouwd vanuit een systeemtheoretische invalshoek. Aan bod komen: convoluties, impulsresponsie, staprespontie, frequentieresponsie, overdrachtsfunctie, initieel-in-rustsystemen, systemen beschreven door differentiaalvergelijkingen en differentievergelijkingen, causaliteit, stabiliteit, lineariteit en tijdsinvariantie. De behandelde toepassingen zijn: Amplitudemodulatie (AM), Shannon's bemonsteringstelling, ideale filters en het ontwerp van laagdoorlaatfilters zoals Butterworthfilters.	Analyse van signaaloverdracht in communicatienetw.
157030	A structured product is a combination of positions in one or more underlying assets and in several derivatives on the assets. Structured products are engineered to deliver customized return/risk profiles to answer the specific needs of a given investor. Some structured products are built to lower the holder¿s tax liability (tax arbitrage) or to side-step regulatory constraints (regulatory arbitrage) but most respond to more fundamental economic needs. Users of structured products range from institutions to retail investors. The course will first focus on the financial architecture of such products and the needs they are meant to answer. Then, we will turn to the issue of pricing and hedging such products. Finally, we will introduce new and exciting products, credit derivatives, which are default risk-based contracts increasingly used in structured products.	Structured Products
157035	The course gives students the specific skills needed to work with financial time series. The course first introduces the concepts of volatility and correlation, either computed from actual returns or implied from option prices. Students will be introduced to GARCH techniques to model the behavior of stock returns across time and to factor models to manage multidimensional risk, prevalent for example in portfolio management. Students will also use advanced econometric techniques to evaluate the long-term relationship between some economic variable (co-integration) and to work with non-normal, fat-tailed returns.	Financial Econometrics
158006	Doel: Dit college geeft een inleiding in stochastische methoden en modellen en is gericht op het herkennen en oplossen van eenvoudige problemen.	Operationele research II
158017	Doel: De twee hoofddoelstellingen voor het vak Operationele Research 1 zijn:	Operationele research I
158018	Doel: Ervaring opdoen met modelleren van problemen uit de praktijk als lineair model en het oplossen van deze modellen met behulp van een software pakket (LINGO/LINDO).	Operationele research I, practicum
158022		Operationele research III
158025	Doel: Inleiding in fundamentele methoden van de mathematische programmering. Inhoud: lineaire vergelijkingen en ongelijkheden, Fourier-Motzkin eliminatie, alternatiefstellingen, dualiteit; convexe verzamelingen, convexe functies; methoden voor de optimalisatie zonder nevenvoorwaarden: zoekmethoden, geconjugeerde richtingen, Newton- en Quasi-Newton-methoden.	Mathematische programmering I
158038	Kortste paden en minimale opspannende boomen, network flow algorithmen (klassiek en modern), complexiteit, approximatie methoden, online algorithmes, gerandomiseerde algorithmen.	Discrete optimalisering
158042	Modelbouw. Aan de hand van voorbeelden zullen zowel kleine als grote optimalisatie modellen geconstrueerd worden met behulp van het modelleersysteem Aimms. Modellen van het type linear programming (LP), integer programming (IP), network programming (NP) en nonlinear programming (NLP) passeren de revue. Extra aandacht is er voor een toepassing uit de financiele sector met betrekking tot portfolio selectie. Naast het specificeren van de vereiste vergelijkingen worden ook algorithmische aspecten gemodelleerd zoals kolom generatie gebaseerd op shadow prices en constraint generatie gebaseerd op Benders' decompositie. De daarvoor vereiste theorie wordt in het lesmateriaal uitvoerig toegelicht.	Modelbouw in de optimalisatie
158061	Dit vak geeft een inleiding op enkele modellen uit de micro-economie. Dit betreft het producenten- en consumentengedrag, het algemeen evenwicht en marktvormen. De behandeling is mathematisch, met een belnagrijke rol voor optimalisatie met en zonder nevenvoorwaarden.	Inleiding wiskundige economie
158070	De twee hoofddoelstellingen voor het vak zijn:	Grafentheorie en operationele research
158075	Doelstelling van het vak is om studenten vertrouwd te maken met het modelleren van bedrijfssituaties, het oplossen van deze modellen (in het bijzonder met gebruikmaking van een computerpakket) en het kritisch evalueren van de uitkomsten. Aan de orde komen: LP(Lineaire Programmering), ILP (geheeltallige lineaire programmering), netwerkproblemen en DP (Dynamische Programmering), een eenvoudige versie van de simplexmethode en oplossen van I(LP) problemen met de computer, duale problemen en gevoeligheidsanalyse.	Deterministische modellen in de OR
159918	  Doel van het vak is het systematisch kunnen vinden van literatuur m.b.v. de internetbronnen en de in de bibliotheek aanwezige hulpmiddelen (zoals b.v. de online publiekscatalogus (OPC), PiCarta,  MathSciNet, Web of Science, Science@Direct etc ). Verder het kritisch kunnen lezen van de gevonden literatuur. Schriftelijke rapportage van het bibliografische en inhoudelijke gedeelte en soms mondelinge rapportage. Het bibliografische verslag dient uiterlijk twee weken voor de examenvergadering ingeleverd	Bibliotheekgebruik en literatuuropdracht
159922	Oefenen in het opstellen en toepassen van een complex wiskundig probleem. Aandacht voor modelimplementatie, verificatie en toepassing naast modelopzet. Opdoen van ervaring met het werken in teamverband. Verslaggeving (mondeling en schriftelijk) van resultaten (op een wijze die voor buitenstaanders begrijpelijk is.	Bacheloropdracht
159927	Gedurende ongeveer 3 maanden een bijdrage leveren aan een bedrijf of instelling buiten de Universiteit Twente op beginnend ingenieursniveau. Binnen- of buitenland. Begeleiding door de afdelingen. Schriftelijke verslaggeving verplicht, ook de meer sociale aspecten. De doctoraalstage en de doctoraalopdracht kunnen worden gecombineerd.	Doctoraalstage
159928	Gedurende ongeveer 3 maanden een bijdrage leveren aan een bedrijf of instelling buiten de Universiteit Twente op beginnend ingenieursniveau. Binnen- of buitenland. Begeleiding door de afdelingen en bedrijfsmentor. Schriftelijke verslaggeving verplicht, ook de meer sociale aspecten. De doctoraalstage en de doctoraalopdracht kunnen worden gecombineerd.	Doctoraalstage
159940	niet aanwezig	Doctoraalopdracht
159945	niet aanwezig	Doctoraalopdracht
213505	Dit vak bouwt voort op de kennis en vaardigheden opgedaan bij Programmeren 1 (vakcode). De nadruk ligt nu op het ontwerpen, implementeren en documenteren van grotere objectgeoriënteerde applicaties en het gebruik van geavanceerdere mogelijkheden van Java, uitmondend in een opdracht waarin een client/server-systeem opgeleverd moet worden.	Programmeren 2
159950	Als onderdeel van het keuzepakket kan men het vak Buitenlandse Excursie opnemen. Dit omvat een meerdaagse studiereis naar buitenlandse bedrijven, voorafgegaan door een voorstudie en het schrijven van een voorverslag over een relevant wiskundig onderwerp en afgesloten door een eindverslag. De Buitenlandse Excursie wordt georganiseerd door ABACUS, die tevens docenten zal benaderen om als beoordelend excursie-docent te fungeren. Een van de excursie-docenten treedt op als coördinator. Hij draagt onder meer zorg voor de onderlinge afstemming van de diverse beoordelingen.	Buitenlandse excursie
213540	This course Advanced Design of Software Architecture Part I (ADSA Part I) aims at evolvable software architectures. It covers recent developments in the design of software architectures that cope with changing business requirements and application technologies. The following topics will be treated: 	Advanced Design of Software Architectures
159960	Dit is een project waarin studenten van verschillende faculteiten samenwerken. De opdracht is bij voorkeur extern geformuleerd (industrie, ingenieursbureaus, rijksdiensten, provinciaal waterbeheer, etc.) en de uitwerking moet leiden tot een concreet ontworpen en zo mogelijk ook gerealiseerde en geteste technische oplossing: dit kan zijn een instrument c.q. een proces, een stuk software, of een beleidsmaatregel, al naar gelang de opdracht. Het projectbeheer (planning, bewaking van de voortgang, tijdsbesteding, resultaten, coördinatie, rapportage) berust bij de studenten zelf. Het resultaat wordt aan de opdrachtgever gepresenteerd. De docenten stellen zich slechts als begeleider op; zij zijn betrokken bij het geregeld overleg, en zijn voorts desgevraagd beschikbaar voor advies, maar laten het initiatief aan de studenten. Het project wordt binnen 1 trimester uitgevoerd, en wel trim. 4.2 of 4.3. Inschrijven verplicht; let op aankondigingen.	Multidisciplinaire ontwerpopdracht
159970	afhankelijk van de begeleider	Opdracht Minor
159999	Het MRI (Mathematical Research Institute) heeft een boekje samengesteld waarin nuttige informatie over het door het MRI aangeboden Master Classprogramma staat, alsmede de samenvattingen van de afzonderlijke cursussen. Vele van deze cursussen zijn ook voor TW-studenten interessant en kunnen, in overleg met de afstudeerdocent, in het keuzegedeelte van het studieprogramma worden opgenomen.	MRI-cursus
211017	In dit vak maken de studenten kennis met een moderne, visuele ontwikkel- en programmeer-omgeving, gebaseerd op de programmeertaal Java. Tevens leren ze algoritmisch te denken door analyse van niet-triviale problemen. Aan de orde komen elementaire objectgeoriënteerde concepten als klasse, instantie, methode en attribuut.	Inleiding programmeren met JAVA
211022	Dit vak (voor EL en TW) komt met ingang van studiejaar 2003 te vervallen. Zie vervangend vak 211024.	Programmeren in C++
211024	Het ontwerpen van betrouwbare object-georiënteerde programma's van grote omvang in teamverband. De voorkennis is programmeren in Pascal, Modula of JAVA. De gebruikte programmeertaal is C++. De volgende onderwerpen komen aan de orde: Object-georiënteerd ontwerpen met UML; programmeren in teamverband; basistaalelementen van C++; class, object, classdiagram, volgordediagram; generalisatie, aggregatie, associatie. Bij de opdracht leert de groep een groot programmeerprobleem op te delen in klassen met interfaces, die vervolgens door elke student afzonderlijk uitgewerkt worden.	Programmeren in C++
211026	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. Er zal nog één tentamenmogelijkheid worden aangeboden.	Theoretische informatica
211027	During this course you will learn how to use MATLAB, to design, and to perform mathematical computations. You will also get acquainted with basic programming. 	Inleiding programmeren met MATLAB
211032	Het seminarium TKI in het tweede trimester is dit jaar gewijd aan het onderzoek naar en de ontwikkeling van virtuele mensen. In het Virtuele Muziekcentrum (http://parlevink.cs.utwente.nl/) is Karin een voorbeeld van een zogeheten "Embodied Conversational Agent". Het is een software agent met een grafische representatie waarmee je een dialoog kan voeren in natuurlijke taal.	Seminarium Taal, Kennis & Interactie
211033	Het college geeft een inleiding in de theorie en praktijk van neurale netwerken, waarbij de nadruk ligt op het onderliggende berekeningsmodel en het lerend vermogen.	Neurale netwerken en neuro-computing
211034	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. Zie vervangend vak 211038 Spraak- en taaltechnologie.	Spraaktechnologie
211035	Doel: het kunnen vertalen van structuren die veel voorkomen in de informatica, met name in hogere programmeertalen.	Vertalerbouw
211037	Het vak geeft een algemene inleiding in computer graphics met het accent op 3D modellering, en de toepassing van deze technieken in rendering, visualisatie, animatie en virtual reality. Een belangrijk gedeelte van de tijd wordt besteed aan het bouwen van virtuele omgevingen, het creeren van avatars, en de koppeling met agent-georienteerde systemen. Onderwerpen die de revue zullen passeren:	Graphics & Virtual Reality
211038	In dit vak nemen we het fenomeen taal onder de loep als een soort fysisch verschijnsel. Door te observeren, te tellen en te modelleren hopen we allerlei taalwetmatigheden vast te kunnen leggen, met als doel te begrijpen hoe taal en de taalgebruiker in elkaar zitten. 	Spraak- en taaltechnologie
211045	Het vak beoogt inzicht en ervaring te verschaffen t.a.v.: functionaliteit en structurering van besturingssystemen (operating systems); synchronisatie en scheduling van parallelle processen; het UNIX systeem.	Besturingssystemen
211047	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. Zie vervangend vak 211045.	Besturingssystemen voor Telematica
211050	Dit vak is bedoeld als verdieping van de in het inleidend programmeeronderwijs opgedane kennis. Er wordt een systematisch inzicht verschaft in de concepten die ten grondslag liggen aan het ontwerp van programmeertalen (zoals waarden, geheugen, bindingen, abstractie, type systemen, concurrency, etc.) Voorts wordt aandacht besteed aan de wijze waarop programmeertalen zijn gebaseerd op deze concepten, en aan de programmeerstijlen die deze talen ondersteunen (zoals imperatief programmeren, logisch programmeren, object-georiënteerd programmeren, functioneel programmeren), hun overeenkomsten en hun verschillen.	Structuur van programmeertalen
211054	Doel: De student weet uit welke deelsystemen een computersysteem is opgebouwd, wat het gedrag is van deze deelsystemen en hoe deze deelsystemen tezamen het gedrag van het computersysteem bepalen. Ook weet de student hoe een computersysteem middels een operating systeem wordt aangestuurd, en welke basistechnieken de OS ontwerper hiertoe ter beschikking staan.	Computersystemen
211074	Dit vak brengt de student begrip en vaardigheid bij in het opzetten, gebruiken en beheren van gegevensbanken, met het oog op het bouwen van toepassingen die op gegevensbanken gebaseerd zijn. Aan de orde komen: SQL, relationele algebra en het relationele datamodel; het Entity-Relation model en normalisatie; triggers en actieve gegevensbanken; inbedding van SQL in toepassingsprogrammatuur, en transacties.	Gegevensbanken
211077	Het doel van het college is het leren ontwerpen, het implementeren en het gebruiken van databases. Uitgangspunt bij het ontwerpen is de Database Development Life Cycle (DDLC). Deze projectmatige aanpak omvat het gehele ontwikkeltraject. Er is daarbij niet alleen aandacht voor de technische aspecten maar ook voor de organisatie die met de database moet gaan werken.De implementatie is gebaseerd op het relationele model. Op dit model zijn vrijwel alle commerciële databasepakketten gebaseerd (Access, Informix, Ingres, Oracle, Paradox, Sybase etc.). Een belangrijk aspect van het gebruik van een database is het invoeren, wijzigen en opvragen van gegevens. Daarvoor gebruiken we vooral SQL. Tot de gebruikskant behoort ook het beheer van een database. Zaken die dan spelen zijn bijvoorbeeld autorisatie (wie mag wat) en recovery (het weer op orde brengen van de database na een computercrash). Na afloop is men in staat een eenvoudige praktijksituatie om te zetten in een informatiesysteem waarin de gegevens op efficiënte wijze in een computer zijn opgeslagen. Ook is men in staat de gegevens op te vragen en te onderhouden.	Database-ontwerp
211078	Het college is identiek aan 211077. Daarnaast is er een practicum. Dit omvat acht dagdelen. Het doel van het practicum is tweeledig: je oefent het maken van en werken met een database. Bij het maken van een database wordt uitgegaan van een praktijksituatie. Je doorloopt de stappen analyse, ontwerp en implementatie. Bij het werken met een database leer je omgaan met een geavanceerd database pakket. Daarbij ligt de nadruk op het gebruik van de relationele (vraag)taal SQL.	Database-ontwerp
211081	The Distributed E-Business Techniques (DEBT) course is primarily intended for 4th/5th year undergraduates with good Java programming skills, and good knowledge of distributed programming and some knowledge of discrete mathematics. The course would be appropriate also for first year doctoral students (AiO's and TwAiO's).	Distributed E-business Techniques
211090	Het doel van het vak is inzicht te verschaffen in de eisen die niet-standaard toepassingen (zoals toepassingen die betrekking hebben op beslissingsondersteuning, e-commerce, en geografie) aan databasesystemen stellen. Bovendien wordt op implementatie-aspecten ingegaan. Genoemde toepassingen gaan behalve met gestructureerde gegevens, ook met teksten, graphics en plaatjes om. concepten voor een adequate beschrijving van de toepassingen komen aan bod. Naast de architectuur van database systemen zullen complexe data typen, vraagverwerking, gelijktijdigheids- en herstelbeheer, alsmede toegangs- en opslagstructuren worden behandeld. Er is een practicum waarin een internet toepassing moet worden uitgewerkt.	Databasetoepassingen
211095	Aan de hand van de architectuur van een gedistribueerd databasesysteem zullen zaken zoals queryverwerking, data allocatie, transactiemanagement en multidatabasesystemen behandeld worden. Verder zal in het college worden ingegaan op het realiseren van gedistribueerde databases met behulp van de zogenaamde CORBA Common Object Services, te weten de Persistent Object Service, de Object Transaction Service en de Object Query Service. Naast een behandeling individuele services zal ook worden ingegaan op het implementeren van verschillende gedistribueerde database architecturen met behulp van deze services.	Gedistribueerde databases & middleware technologie
211096	Het college is bedoeld om de kennis van gegevensbanken te verdiepen en toe te passen op het terrein van XML databases, met name het gebruik van databasetechnologie voor de opslag en verwerking van XML tekstcollecties. XML begint meer en meer *de* standaard te worden voor het uitwisselen van gegevens, en voor het opmaken van gegevens op het world wide web. XML voorziet in een aantal zaken die we ook in gegevensbanken tegen komen: schema's (DTDs en XML schema) en vraagtalen (XPath en XQuery), maar andere zaken ontbreken zoals efficiente opslag, efficiente query processing en indexering. In het college wordt ingaan op deze laatste zaken, bijvoorbeeld door middel van het afbeelden van XML op relationele systemen, en de efficiente verwerking van structuurqueries (XPath) en tekstqueries (zoals ondersteund door bijv. zoekmachines op het web).	XML & Databases
211097	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen.	Bijzondere onderwerpen gegevensbanken
211098	Dit vak beoogt studenten bewust te maken van de architectuur van transactieverwerkende systemen, opdat ze de eigenschappen van commerciële systemen goed kunnen beoordelen. Ook worden de kosten beschreven voor het implementeren van de ACID-eigenschappen van transacties, en hoe deze kosten verminderd kunnen worden.	Databasetransacties en -processen
211108	Bij diverse afstudeeropdrachten is het wenselijk dat een student zich nader verdiept in een onderwerp uit de logica. Een onderwerp moet worden gekozen in overleg met één van de docenten. Mogelijkheden zijn er vele, bijv.:	Bijzondere onderwerpen uit de logica
211109	De rol van de logica in de informatica is de laatste jaren bijzonder groot geworden. Niet alleen komen vele aspecten van de informatica in een zuivere vorm in de logica aan de orde (bijv. semantiek, berekenbaarheid), maar bovendien wordt de logica rechtstreeks toegepast (denk aan logisch programmeren, specificatietalen). Het vak Voortgezette logica bestaat uit twee delen. Het eerste deel bouwt voort op Discrete wiskunde & logica en behandelt de volledigheids- en onvolledigheidsstellingen van de propositie- en predicaatlogica. Het tweede deel behandelt enkele aspecten van getypeerde en ongetypeerde lambda calculus (o.a. Church-Rosser eigenschap, recursie, terminatie, polymorfisme, propositions-as-types). De lambda calculus is een abstracte vorm van een programmeertaal.	Voortgezette logica
211111	Gedegen kennis van parallelle en gedistribueerde systemen is voor informatici onmisbaar geworden. Denk aan toepassingen zoals computernetwerken, gedistribueerde operating systems, gedistribueerde databases, fout-tolerante systemen, formele modellen van hardware, parallelle object-georiënteerde systemen, neurocomputing en parallelle algoritmen voor taaltechnologie. Het college geeft een inleiding in een aantal begrippen, modellen en technieken voor het ontwerpen en analyseren van parallelle systemen. Er vindt kennismaking plaats met een aantal op zich belangrijke algoritmen en protocollen.	Parallelle processen
211112	Logica is het wetenschapsgebied dat de principes van correct redeneren onderzoekt. In de colleges zal zowel worden ingegaan op de klassieke logica, als op de moderne logica. De klassieke logica (grondlegger: Aristoteles) gaat over het denken van het "gezonde verstand"; behandeld worden o.a. het begrip, het oordeel, syllogismen, drogredeneringen. In de moderne logica (grondleggers: Boole, Frege) worden logische begrippen op een wiskundige manier onderzocht. Behandeld wordt de vraag wat het eigene is van die wiskundige benadering, en wat de gevolgen ervan zijn voor begrippen als syntax, semantiek, bewijzen, waarheid. Daarnaast worden een aantal specifieke logische theorieen behandeld, zoals propositielogica, predicaatlogica, constructieve logica, modale logica, verzamelingenleer. Indien de tijd het toelaat zullen enkele toepassingen van de logica worden behandeld, zoals declaratieve programmeertalen die gebaseerd zijn op logische talen.	Inleiding Logica
211113	Het vak logisch programmeren is - sinds 2001 - deels vernieuwd.	Constraint Logic Programming
211127	In dit vak is het centrale thema talige interaktie en met name dialogen in natuurlijke taal. Een dialoog zullen we opvatten als een reeks van taalhandelingen (speech acts of dialogue acts) die met een bepaalde intentie door de dialoogdeelnemers worden uitgevoerd. Taalhandelingen komen in erg veel verschillende soorten voor, waarvan de bekendste wel zijn: informeren, vragen en bevelen. We nemen de diverse aspecten die aan taalhandelingen zitten onder de loep en zullen een aantal criteria en technieken geven voor classificatie van taalhandelingen. De pragmatiek van de taal geeft regels onder welke voorwaarden welke taalhandeling op welke wijze door middel van een taaluitdrukking door een spreker gerealiseerd kan worden. Op basis van die regels kan de hoorder in de context van een dialoog conclusies trekken omtrent de bedoeling die de spreker met de uiting heeft. En dat is van belang voor een zinvolle reaktie op zo'n taalhandeling. 	Formele analyse van natuurlijke taal
211128	Het vak geeft een introductie tot het fenomeen 'natuurlijke taal', benaderd vanuit de vraag naar de mogelijkheden en beperkingen van natuurlijke-taalverwerking met behulp van machines. 	Informatica en taal
211129	Dit vak levert, als vervolg op het vak Informatica en taal (211128) en/of Spraak- en taaltechnologie (211038), een nadere kennismaking met de automatische verwerking van natuurlijke taal en de toepassing ervan binnen de informatietechnologie en de telematica. Enkele methodes van taal- en spraakverwerking worden beoordeeld op hun geschiktheid voor bepaalde applicaties, zoals mens-machine communicatie en information retrieval. Daarnaast zal er worden ingegaan op enkele voorbeelden van werkende systemen die via het practicum beschikbaar zijn. Zowel systemen die gebaseerd zijn op expliciete taalkundige kennis, als systemen die gebruik maken van statistische modellen en/of modules zijn daarin vertegenwoordigd.	Taaltechnologie
211130	De term ubiquitous computing werd als eerste gebruikt door Marc Weiser van Xerox PARC in 1993 ("ubiquituos computing", IEEE Computer). Hij duidt ubiquituos computing aan als de derde generatie van computers (Weiser: ... "our highest ideal is to make a computer so embedded, so fitting, so natural, that we use it without even thinking about it" ...). De eerste generatie waren main-frame computers, die door hun hoge kostprijs door veel mensen 'geshared' moesten worden. De tweede generatie wordt als personal computer aangeduid: iedere persoon heeft zijn eigen PC. De volgende generatie is ubiquituos computing, waarin computers meer naar de achtergrond zullen verdwijnen. De mensen zijn omgeven door een verzameling kleine en grote computers die veelal draadloos met elkaar kunnen communiceren en die in dienst staan van degenen die van hun diensten gebruik willen maken.	Ubiquitous Computing
211131	Een van de belangrijkste verworvenheden van de Informatica is de typetheorie. Deze heeft geleid tot een duidelijk verhoogde kwaliteit en orthogonaliteit van programmeertalen, met als betrekkelijk recent voorbeeld Java dat tot op grote hoogte beveiligd is tegen typeringsfouten, ook bijvoorbeeld bij overerving. 	Statische Objectanalyse en Typering
211133	Software architecturen hebben de laatste decennia een breder draagvlak gekregen en het is algemeen erkend dat software architecturen een belangrijke rol zullen spelen bij het omgaan met de inherente problemen bij het ontwikkelen van grote en complexe software systemen. Een algemene aanname is dat software architecturen de software kwaliteitseisen zoals robuustheid, aanpasbaarheid, herbruikbaarheid en onderhoudbaarheid ondersteunen. Een belangrijk onderdeel bij het ontwerpen van software architecturen is het afleiden van de fundamentele abstracties vanuit de business context en de requirement specificaties. Dit vak zal ten eerste de architectuur concepten introduceren, en daarna een vergelijkende analyse geven van de huidige software architectuur ontwerpmethoden. De problemen van deze methoden zullen worden toegelicht, en architectuur ontwerp technieken zullen worden aangeboden teneinde deze problemen te kunnen oplossen. Zo zullen er verscheidene processen worden geïntroduceerd voor het afleiden van de architectuur concepten vanuit de business context en de requirement specification, waarbij vanuit een systematische toepassing van het oplossings-domeinkennis een 'synthese' volgt van deze concepten in een uiteindelijk software architectuur ontwerp.	Ontwerpen van Software Architecturen
211180	Dit college beoogt de studenten kennis te laten maken met een aantal basismodellen uit de informatica met name met eindige automaten, transistiesystemen, sequentiële machines, stapelautomaten, Turing machines, formele talen en (context-vrije en reguliere) grammatica's alsmede met een aantal belangrijke toepassingen. De nadruk ligt op het bereiken van een zekere modelleringsvaardigheid in het gebruik van formele modellen (precieze definities en bewijzen). Na succesvolle afronding dient de student in staat te zijn modificaties van behandelde modellen voor nieuwe situaties te ontwikkelen, hun bruikbaarheid te toetsen alsmede na te gaan onder welke omstandigheden deze modellen hun geldigheid verliezen.	Basismodellen in de informatica
211185	Dit college beoogt de studenten kennis te laten maken met een aantal basisbegrippen uit de informatica, in het bizonder met (1) berekenbaarheid en beslisbaarheid in termen van een machinemodel (Turing-machine), oplosbaarheid, onbeslisbaarheid en probleemreductie; (2) complexiteitsaspecten (de klassen P en NP, NP-volledigheid, voorbeelden van NP-volledige problemen); (3) modellen voor natuurlijke-taalverwerking (grammatica, de Chomsky-hiërarchie, unificatie-grammatica's en andere grammaticaformalismen).	Taal- en rekenmodellen
211205	In een functionele programmeertaal kunnen algoritmes gespecificeerd worden door middel van vergelijkingen, zoals je een wiskundige functie definieert: f (x) =  · · ·  (vandaar het woord functioneel). In dergelijke definities kunnen andere zelf gedefinieerde functies worden gebruikt, prodgramma's in een functionele taal zijn modulair opgebouwd. Een functionele taal kent geen assignment statement, de basisvorm van herhaling is recursie. Alles wat in een imperatieve of object-georiënteerde programmeertaal kan worden geprogrammeerd, kan ook in een functionele taal worden geprogrammeerd. In een functionele taal komt de essentie van een programma direct naar voren, waardoor programma's kort kunnen zijn, de programmeur hoeft zich niet tot nauwelijks te bekommeren om de volgorde waarin een programma wordt geëvalueerd, functionele programma's zijn toegankelijk voor correctheidsbewijzen. Enkele begrippen die verder aan de orde komen: lazy evaluation, lijstcomprehensie, hogere orde functies, recursieve types (boomstructuren).	Functioneel programmeren
212010	De cursus is bedoeld om studenten kennis en vaardigheid bij te brengen in technieken voor de analyse van informatiesystemen in organisaties.	Informatiesystemen
212018	Kennistechnologie voor bedrijfskundige toepassingen sluit aan op Kennistechnologie (212016). Het concept van een rationele actor die autonoom in een wereld kan handelen wordt verder uitgebouwd. De student leert technieken voor plannen, redeneren onder onzekerheid en het nemen van beslissingen. Deze technieken zijn belangrijk zowel binnen de informatica als voor bedrijfstoepassingen van kennissystemen. De nadruk ligt op het begrijpen van de voorgestelde methoden en het toepassen ervan.	Kennistechnologie voor bedrijfskundige toep.
213001	Dit vak behandelt de elementaire kennis en vaardigheden uit de digitale techniek. Er wordt een theoretische basis aangeboden, maar ook praktische kennis komt aan bod. Centraal staan de analyse van combinatorische en sequentiële standaardschakelingen en de synthese van combinatorische en synchrone sequentiële schakelingen op grond van informele specificaties. Daarbij wordt grotendeels geabstraheerd van aspecten op transistorniveau en lager, met uitzondering van het ontwerp van CMOS-schakelingen. Basisvaardigheden kunnen en moeten worden geoefend met Computer Ondersteund Onderwijs (COO). Het ontwerpproces voor grotere digitale schakelingen komt in het practicum aan de orde.	Basisbegrippen digitale techniek
213002	Doelstelling van dit vak is het gestructureerd ontwerpen van de logische structuur van digitale systemen met behulp van de hardwarebeschrijvingstaal VHDL. De ontwerpmethode wordt gedemonstreerd en geoefend aan de hand van de systeemcomponenten van een computer (o.a. optellers, vermenigvuldigers en ALU's).	Ontwerpen van digitale systemen
213005	Doel van dit vak is dat de student weet uit welke deelsystemen een computersysteem is opgebouwd, wat het gedrag is van deze deelsystemen en hoe deze deelsystemen tezamen het gedrag van het computersysteem bepalen. De student is in staat delen van computersystemen te ontwerpen en programmeerbare bouwstenen te programmeren.	Computerarchitectuur
213009	Het doel van het college is de student inzicht te geven in de methoden en architecturen die gebruikt worden om de betrouwbaarheid van digitale systemen te verbeteren. Daartoe wordt o.a. aandacht besteed aan de verschillende manieren waarmee de betrouwbaarheid van een systeem kan worden uitgedrukt en berekend, worden fouten geclassificeerd en worden verschillende methoden behandeld om, ter verbetering van de betrouwbaarheid, redunantie aan een systeem toe te voegen. Verder wordt aandacht besteed aan fouten corrigerende en detecterende codes en aan algoritmen om data consistentie te verkrijgen en te behouden.	Fouten tolererende digitale systemen
213011	Doel van het vak is studenten inzicht te geven in de functie en werking van gedistribueerde systemen, hoe onafhankelijk van elkaar falende processoren zodanig kunnen samenwerken dat het systeem als geheel veel betrouwbaarder is dan de individuele componenten. Ingegaan wordt op de methoden en technieken die aan gedistribueerde systemen ten grondslag liggen: de organisatie van communicatie, file systemen, en operating system kernels. Hiernaast geeft het college een theoretische basis voor communicatie, synchronisatie, replicatie en fout tolerantie.	Gedistribueerde systemen
213012	Hardware/Software codesign is het tegelijkertijd en afhankelijk van elkaar ontwerpen van zowel de hardware als de software van ingebedde computersystemen ('embedded systems'), waarbij uitgaande van een gemeenschappelijke specificatie een optimale verdeling van functies over software voor standaard microprocessors en signaalprocessors, software voor applicatie-specifieke processors en 'special-purpose' hardware wordt gezocht. Hierbij moet een afweging worden gemaakt tussen onder andere prestaties (snelheid), vermogen, afmetingen, prijs, ontwerptijd, betrouwbaarheid en oplage. HWSW co-design is een relatief nieuw vakgebied waarin nog geen standaard oplossingen en methodes beschikbaar zijn. Dit vak probeert dan ook vooral inzicht in de problematiek te geven en de diverse invalshoeken te laten zien van waaruit deze problematiek kan worden benaderd. Diverse vakgebieden uit de informatica komen hierbij aan de orde, zoals: specificatie, prestatieanalyse, simulatie, computerarchitectuur, hardware-synthese, software-synthese, compilers (codegeneratie) en 'operating systems'.	Hardware/software co-design
213013	Het college beoogt kennismaking met methoden en technieken die toegepast worden voor ingebedde Real-Time (RT) systemen waarbij garanties voor het tijdig afhandelen van taken een belangrijke rol spelen. Hard RT eisen spelen een cruciale rol bij toepassingen zoals het besturen van robots, vliegtuigen, raketten, chemische en nucleaire fabrieken en voor de besturing van industriële automatisering. Soft RT eisen moeten Quality of Service garantie bieden voor toepassingen uit multimedia, virtual reality en interactieve spelen. Hierbij is het van belang om video- en audiofragmenten op het juiste tijdstip af te spelen om zodoende voldoende Kwaliteit van Service (Quality of Service) te bieden.   Het vak wordt gegeven in een context van (a) operating systemen, (b) netwerken en (c) gedistribueerde architecturen. De volgende onderwerpen uit de RT-basistheorie komen aan de orde: (1) een theoretische basis voor het voorspellen van het gedrag van scheduling algorithmes, (2) verschillende schedulingstechnieken zoals Rate Monotonic, Deadline Monotonic en Earliest Deadline First, (3) verschillende statische en dynamische a-periodieke servers en (4) protocollen ter voorkoming van ongewenst wachten zoals het CeilingProtocol,het Stack Resource Protocol en varianten hiervan op basis van RT transacties. Verder komen bekende RT systemen en hun kenmerkende eigenschappen ter sprake zoals (a) kernels voor embedded applicaties (VRTX, pSOS, OS9, VxWorks, RT-Linux), (b) RT-extensies van operating systemen (Unix, Solaris, NT) en (c) experimentele RT systemen (Spring, Mars, ARTS, Tumult). Typische RT multimedia toepassingen zullen als voorbeeld worden aangehaald. Tot slot worden succesvolle embedded systemen (zoals bijv. die in een Boeing 747) of minder succesvolle (zoals bijv. van de Ariane 5 en van de Mars Surveyor) besproken.	Real-time embedded systemen
213014	Dit college behandelt de principes en toepassingen van procesbesturing en robotica. Aandacht wordt besteed aan embedded systemen voor het plannen en besturen van industriële processen en (mobiele) robots. Hierbij komen aan de orde:	Procesbesturing en robotica
213016	Het doel van het vak is een aantal onderwerpen op het gebied van computerarchitectuur en computerorganisatie verder uit te diepen. Speciale aandacht wordt besteed aan de relatie tussen een algoritme en zijn optimale architectuur. Daartoe wordt aangetoond dat een algoritme uitgedrukt in een sequentiële taal, via single assignment code en een dependency graph getransformeerd kan worden in een signal flow graph. Deze laatste suggereert de hardware realisatie van het algoritme in de vorm van een array processor of een systolic arrays. Of, in het geval de dependency graph onregelmatig is, in de vorm van een von Neumann architectuur met een aangepaste instructie set. Inbegrepen onderwerpen zijn lineaire (statische) scheduling, data afhankelijke scheduling, pipe-lining, re-timing en ontwerp transformaties.	Bijzondere onderwerpen computerarchitectuur
213110	Computerorganisatie is het vakgebied waarin de basisprincipes van de componenten waaruit een computer is opgebouwd en hun onderlinge samenhang worden bestudeerd. Er wordt een opdeling in data-pad en controle-pad met hun interactie besproken.	Computerorganisatie
213120	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. Er zal nog één tentamen worden aangeboden.	Inleiding informatie- en communicatietechnologie
213125	Dit vak komt te vervallen met ingang van studiejaar 2003-2004. Zie vervangend vak 213005.	Computersystemen
213130	Computerorganiatie is het vakgebied waarin de basisprincipes van de componenten waaruit een computer is opgebouwd en hun onderlinge samenhang worden bestudeerd.	Computer Organisatie INF/TEL
213510	In het vak worden op systematische wijze modellen en hun onderlinge relaties behandeld per softwareontwikkelfase, in het bijzonder modellen uit objectgeoriënteerde ontwikkelmethoden. Het gaat hierbij om de fasen requirementsanalyse, specificatie, architectuur- en detailontwerp, implementatie en testen. De (voor)kennis van de vakken Programmeren en Informatiesystemen wordt hierbij geïntegreerd en uitgebreid met o.a. domeinanalyse, architectuurontwerp en (modellen voor) implementatie en testen. Aan de orde komen onder meer functionele- en niet-functionele eisen, architectuurstijlen (layers, model-view-controller, pipe & filters), ontwerppatronen (observer, composite, singleton), testen (whitebox en blackbox) en roundtrip engineering. Hierbij worden modellen en diagrammen in UML (Unified Modeling Language) behandeld zoals het use-casediagram, klassendiagram, packagediagram, sequentiediagram, collaboratiediagram en het toestandsdiagram. De relatie van deze modellen met implementaties in Java wordt aangegeven.	Software Engineering Modellen
213520	Dit vak behandelt het gebruik van wiskundige technieken en bijbehorende software-gereeedschappen voor de modellering en analyse van softwaresystemen. 	Formele Methoden voor Software Engineering
213530	The aim of Concurrent and Distributed Programming course is to study the theory and practice of concurrent and distributed programming. the student will acquire the skills necessary to succeed in a world where almost every aspect of computing is concurrent and/or distributed. 	Concurrent and distributed programming
213545	This course Advanced Design of Software Architecture Part II (ADSA Part II) aims at technologies for the MDA approach (model driven architecture). In MDA, models are used at several levels with various degrees of platform dependability. The models are Platform Independent Models (PIM), Platform Specific Models (PSM) and Platform Specific Implementation (PSI). The models are transformed in refinements and software evolution. Intra-level and inter-level model transformations should retain the relations between the models. This course covers techniques for model transformations. Provisional list of topics: Meta-modeling, UML profiles, Action semantics, Transformations of PIM to PIM, PIM to PSM, and PSM to PSM, Transformations patterns, Transformation techniques (e.g. graph transformation), Transformation languages, Transformation alternatives.	Advanced Design of Software Architectures 2
214010	Het doel van dit college is het geven van kennis en inzicht in de theoretische aspecten van de complexiteit van computerberekeningen. Tevens wordt beoogd de deelnemers enige vaardigheid aan te leren om theoretische begrippen in praktische situaties toe te passen, met name bij het ontwerpen van programmatuur (analyse van algoritmen). De volgende onderwerpen zullen aan de orde komen: berekeningsmodellen, rekentijd, geheugenruimte, complexiteits-klassen, relaties tussen complexiteitsklassen (o.a. stelling van Savitch, hiërarchiestellingen) de klassen P en NP, het begrip NP-volledigheid, voorbeelden van NP-volledige problemen uit de informatica en de combinatorische optimalisatie en parallelle berekeningsmodellen.	Complexiteit van berekeningen
214011	Het doel van het vak is de ontwikkeling van software gereedschappen (uit een ontwikkelingomgeving), die ter ondersteuning van het ontwerpproces van informatieverwerkende systemen dienen. Aan de orde komen diverse gereedschappen ter ondersteuning van de verschillende stappen in het ontwerpproces. De nadruk zal hierbij liggen op de structuur van de tools (hoe zijn dergelijke gereedschappen opgebouwd) en de onderliggende algorithmen en datastructuren. Aandacht zal worden geschonken aan simulatoren (ter ondersteuning van controles van initiële ontwerpfasen), validatie-tools (om eigenschappenv an ontwerpen op een systematische wijze vast te stellen), en test-tools (om concrete implementaties op een systematische wijze te testen). Uiteindelijke zullen een aantal tool-architecturen worden behandeld waarin dergelijke functionaliteiten op een geïntegreerde wijze worden aangeboden.  De deelnemers aan het vak doen praktische ervaring op door het ontwikkelen van (een deel van) een software gereedschap, en verdiepen zich in een toolarchitectuur en geven daarover een korte presentatie.	Tool Architectuur
214012	De complexiteit van software en hardwaresystemen neemt toe en daarmee de foutgevoeligheid. Het vak Systeemvalidatie richt zich op validatietechnieken, methoden en bijbehorende softwaretools om de correctheid en betrouwbaarheid van software-- en hardwaresystemen te kunnen analyseren. De nadruk ligt op model checking, een veelbelovende en succesvolle validatietechniek waarbij uitgaande van een specificatie die alle toestanden beschrijft waarin het systeem zich kan bevinden, systematisch alle relevante toestanden afloopt om te controleren of ze de gewenste eigenschap bezitten. Bijzondere aandacht wordt geschoken aan de rol van softwaretools (model checkers) zoals SPIN (Bell Labs) en Uppaal bij het oplossen van realistische problemen. Voorbeelden worden ontleend aan diverse industriële validatiestudies.	Systeemvalidatie
214020	Het doel van dit vak is drieledig. Ten eerste zullen elementaire algoritmen en datastrukturen worden behandeld die worden gebruikt voor het oplossen van problemen die veelvuldig voorkomen in informatica-toepassingen.  Daarnaast worden de basisprincipes en technieken voor het analyseren van de complexiteit van algoritmen (en operaties op datastrukturen) behandeld.  Hierbij gaat het met name om tijdscomplexiteit (worst-case en average-case) en ruimtecomplexiteit. Tenslotte worden complexiteitsklassen (P en NP) geintroduceerd.  Het vak behelst belangrijke algoritme-ontwerptechnieken zoals verdeel-en-heers, greedy methoden, depth-first en breadth-first zoeken, en dynamisch programmeren.  Inhoud: graafalgoritmen, sorteren, lijsten, bomen, stacks, (priority) queues, gebalanceerde bomen, hashing.	Algoritmen,datastructuren en complexiteit
214025	Het doel van dit vak is drieledig. Ten eerste zullen elementaire algoritmen en datastrukturen worden behandeld die worden gebruikt voor het oplossen van problemen die veelvuldig voorkomen in informatica-toepassingen.  Daarnaast worden de basisprincipes en technieken voor het analyseren van de complexiteit van algoritmen (en operaties op datastrukturen) behandeld.  Hierbij gaat het met name om tijdscomplexiteit (worst-case en average-case) en ruimtecomplexiteit. Tenslotte worden complexiteitsklassen (P en NP) geintroduceerd.  Het vak behelst belangrijke algoritme-ontwerptechnieken zoals verdeel-en-heers, greedy methoden, depth-first en breadth-first zoeken, en dynamisch programmeren.  Inhoud: graafalgoritmen, sorteren, lijsten, bomen, stacks, (priority) queues, gebalanceerde bomen, hashing.	Algoritmen,datastructuren en complexiteit plus
214030	Het college is een brede inleiding in het vakgebied van de Kunstmatige Intelligentie (AI).	Artificial Intelligence
214500	In dit vak krijg je een kennismaking met de beroepspraktijk. Het vak Communicatie en ontwerpen in ICT-projecten is dan ook een breed vak waarin verschillende leerdoelen worden nagestreefd. We noemen er een paar. Als eerste is dat het verwerven van vaardigheden op communicatief gebied. Het gaat hier in het bijzonder over schriftelijke rapportage volgens een gestructureerde opzet. Ten tweede wordt aandacht besteed aan het op professionele wijze samenwerken in een projectorganisatie. Het derde aspect is de ontwerpaanpak. In het project ervaar je hoe en door welke fasen een systeem vanaf de opdracht ontworpen en gerealiseerd wordt. Hierbij wordt tevens geoefend met het op doelmatige wijze toepassen van ICT.	Communicatie en ontwerpen in ICT-projecten 1
214501	Zie beschrijving Communicatie en Ontwerpen in ICT-projecten 1 (214500). Het vak is in twee delen opgesplitst omdat het twee trimesters overspant. COIP1 kan niet zonder COIP2 gedaan worden en andersom en beide zullen aaneengesloten gevolgd moeten worden. Bij dit vak is aanwezigheid bij de verroosterde hoor-en werkcolleges verplicht, maar overige verroosterde onderdelen zijn facultatief. Daarnaast wordt zelfwerkzaamheid buiten de verroosterde onderdelen om verwacht.	Communicatie & ontwerpen in ICT-projecten 2
217001	Testen is onderdeel van bijna elk software-ontwikkelproject. Systematisch en effectief testen is een belangrijke techniek om de kwaliteit van software te controleren en te beheersen. Echter, testen is vaak een onderbelicht aspect van software ontwikkeling. In het vak Testtechnieken worden een aantal technieken, methoden en gereedschappen besproken die kunnen bijdragen tot het systematisch, gestructureerd en efficiënt testen van softwaresystemen. Hierbij wordt ingegaan op zowel bestaande technieken, als op nieuwe ontwikkelingen. De nadruk ligt op technieken voor het testen van technische software zoals communicatieprotocollen en embedded systemen. Onderwerpen die aan de orde komen zijn: soorten, aspecten en fasen van software testen, testautomatisering en -gereedschappen, het ontwikkelen van testcases, coverage maten, testorganisatie, teststandaarden, en testgeneratie op basis van (formele) specificaties. Bovendien zullen enkele gastcolleges verzorgd worden door software-testers uit het bedrijfsleven.    	Testtechnieken
214510	Met de explosieve groei van het aantal eindgebruikers van interactieve systemen, is het belang toegenomen om bij het ontwerpen van dergelijke systemen de eindgebruiker centraal te stellen. Mens-machine-interactie is het relatief nieuwe vakgebied dat zich hiermee bezighoudt. Het vak heeft een ontwerpgerichte en multidisciplinaire benadering. Bijdragen vanuit diverse disciplines (zoals cognitieve psychologie, ergonomie, grafisch ontwerpen, sociologie) worden geïntegreerd tot een inhoudelijk samenhangend traject, dat uit verschillende fasen en activiteiten bestaat. Het beginpunt zijn de gebruikers en de taken die zij uitvoeren in de huidige situatie, dus de situatie waar het te ontwerpen interactieve systeem moet gaan functioneren. Het eindpunt is een volledige specificatie van de interface van het te ontwikkelen systeem. In de verschillende fasen is er voortdurend behoefte aan evaluatie: het beantworoden van vragen die open blijven en het valideren van beslissingen. In het kader van evaluatie worden prototypes gemaakt. Ook communicatieve vaardigheden (o.a. presenteren, communicatie met opdrachtgevers) vormen onderdeel van het vak. Centraal in het vak staat een realistische casus die groepen van studenten uitwerken. Daarnaast schrijven de studenten individueel een paper over één van de onderwerpen uit de theorie en geven daar een presentatie over. Iedere student reviewt ook het verslag en de presentatie van een medestudent (over een ander onderwerp uit de theorie).	MMI-project
214511	In dit project wordt voor een zelf-gekozen databasetoepassing geoefend in het leveren van de specificatie, het ontwerp en de bouw ervan.	Database Project
214512	Dit project  bestaat uit twee delen, een computerorganisatie- en een computerarchitectuur deel.	Computerarchitectuur Project
214513	Dit vak wordt in de vorm van een project uitgevoerd en maakt gebruik van de kennis die is opgedaan in het vak "Telematicasystemen en -toepassingen" (vroeger: "Inleiding telematicasystemen"). Het idee is een aantal groepen te vormen die ieder voor een fictieve opdrachtgever een offerte uitbrengen van een Internet en web-systeem. De teams kunnen beschouwd worden als ingenieursburo's en zijn elkaars concurrenten. Een team bestaat uit ongeveer 12 studenten en wordt door de studenten zelf samengesteld.	Internet & Web Architecturen
214515	The Codesign project is on designing a system in which the various parts operate in a cooperative, distributed way. Cooperation and distribution between the various parts is essential to achieve the required functionality	Codesign project
216000	Zie voor informatie http://www.inf-eng.org/	Applied information representation
216010	Zie voor informatie http://www.inf-eng.org/	Organizational aspects of the information chain
216020	Zie voor informatie http://www.inf-eng.org/	Knowledge representation
216030	Zie voor informatie http://www.inf-eng.org/	Methodology
216040	Zie voor informatie http://www.inf-eng.org/	Information retrieval for Osnabruck
216050	Zie voor informatie http://www.inf-eng.org/	Programmeerproject
216060	Zie voor informatie http://www.inf-eng.org/	Applications and tools in cryptography and coding
216070	Zie voor informatie http://www.inf-eng.org/	Mathematical foundation of Cryptography and Coding
216080	Zie voor informatie http://www.inf-eng.org/	Methods and theory of Clustering
216090	Zie voor informatie http://www.inf-eng.org/	Formal methods of information representation
216095	Zie voor informatie http://www.inf-eng.org/	Neural Networks
216099	Zie voor informatie http://www.inf-eng.org/	Afstudeerproject
216500	In de opdrachtenreeks van het onderdeel Mediakunst staat het werken vanuit verschillende media (dia, video, digitale media) centraal. Het uitgangspunt bij het werken met de media is het verkennen van de eigenschappen van de media en hun gebruiksmogelijkheden. Het onderzoek naar het materiaal vormt de basis, niet het realiseren van een voorbedacht concept. Het idee, het werk, ontstaat tijdens het werken. Deze methode wordt geoefend in een aantal opdrachten die verschillende media als basis nemen.	KMT Medialab
216510	In het onderdeel visuele communicatie krijgen studenten een reeks kleine opdrachten om samen met studenten Visuele Communicatie van de AKI affiches, collages, voorwerpen, boeken of andere zaken vorm te geven. Daarnaast wordt gereflecteerd op aspecten van digitale media, vormgeving, communicatie en cultuur. Wat zijn de culturele dimensies van ICT systemen? Via lezingen en opdrachten wordt de reflectie op digitale cultuur en de vormgeving daarvan uitgewerkt.	KMT Visuele Communicatie
216520	In het onderdeel Mediatechnologie komen een aantal onderwerpen uit de informatica en kunstmatige intelligentie aan bod die relevant zijn voor kunst en communicatie. 	KMT Mediatechnologie
216530	Vanuit verschillende disciplines wordt gereflecteerd op thema's zoals beeldtaal, simulatie & kunstmatig leven, virtualiteit, interactie. Ter verduidelijking, bij het thema beeldtaal wordt vanuit kunsthistorisch en semiotisch perspectief gekeken naar de ontwikkeling van de filmtaal tijdens de eerste decennia van de film. Vanuit de informatica wordt in dit verband gekeken naar vormen van computer-gegenereerde kunst en hoe de beeldtaal hiervan nauw aansluit bij het materiaal (software, programmeertalen) dat de beelden voortbrengt. Vanuit mediafilosofisch perspectief komen beschouwingen over de invoering van verschillende perspectiefstelsels in de beeldende kunst en de relatie tot macht en manipulatiestrategieën: de manieren waarop de kijker geconditioneerd en tot een nieuw soort toeschouwer gevormd wordt.	KMT Mediabeschouwingen
216540	Opdracht in het kader van Kunst, media en technologie.	Project kunst, Media en Technologie
216600	In wiskunde voor Human Media Interaction worden onderwerpen uit de wiskunde behandeld die belangrijk zijn voor specifieke HMI vakken (zoals Spraak- en taaltechnologie, Kunstmatige Intelligentie, Interaction design en Graphics & Virtual Reality). Het betreft onder andere de volgende onderwerpen: kansrekening en statistiek (met aandacht voor Bayesiaanse netwerken, stochastische modellen), formele talen en automatentheorie, en logica (propositielogica, predikatenlogica). Studenten orden in hun zelfstudie begeleid door het uitwerken van een aantal opdrachten in werkcolleges.	Wiskunde voor HMI
216610	Het project bestaat uit het ontwerpen en implementeren van een interactief systeem. Naast het leren van vaardigheden in het ontwerpen en implementeren en het toepassen van software engineering inzichten, ligt de nadruk op de verschillende HMI thema's.	Human Media Interaction Project
216615	Hierin komen zaken als gebruikersonderzoek voorafgaand aan het opzetten van een interactief systeem, het ontwerpen van de interactie, en door een evaluatie achteraf aan de orde. Een ander belangrijk doel van het aanhet HMI project gekopelde vak Interaction Design is het verwerven van inzicht en vaardigheden in methoden van onderzoek.	Interaction Design
216620	In de Capita Selecta bestuderen studenten de literatuur op een specifiek onderwerp binnen Human Media Interaction. Gekoppeld aan de probleemstelling van het HMI-project doen ze eigen onderzoek uitmondend in een artikel, college, of voordracht. Het is mogelijk om meerdere Capita Selecta af te leggen, mits ze over verschillende onderwerpen handelen.	Capita Selecta HMI
219910	Elk trimester kan een groep van 4 tot 6 (voorkeur 5) studenten, die dan voldoen aan de voorkenniseisen, kiezen uit een openstaande opdracht, die in overleg met de indiener van die opdracht binnen dat trimester moet worden uitgewerkt. De docent en begeleider is degene die de opdracht heeft ingediend. De groep geeft een presentatie in de tentamenperiode van het trimester waarin met de opdracht is begonnen. De docent beoordeelt de groepsleden.	Ontwerpproject
219915	Wat zijn de ontwikkelingen in het vakgebied? Wat is de bijdrage van onderzoekers aan deze ontwikkelingen en hoe doe je onderzoek? Karakteristiek voor een wetenschappelijke opleiding is de relatie tussen onderwijs en onderzoek. In de studieonderdelen Caput en Referaat van de opleidingen Technische Informatica en BIT is deze relatie expliciet aanwezig. Deze studie onderdelen richten zich op een actieve kennismaking met wetenschappelijk onderzoek:	Caput
219920	In dit studieonderdeel wordt kennis en ervaring opgedaan met moderne ontwikkelingen in het vakgebied en het daarop aansluitende wetenschappelijke onderzoek. Individueel wordt een onderzoek van beperkte omvang uitgevoerd.Hierbij wordt voortgebouwd op de kennis en ervaring uit het bijbehorende caput. In dit bijbehorende caput is tevens de basis gelegd vor het individuele onderzoek. Het resultaat wordt zowel schriftelijk als mondeling gepresenteerd. De mondelinge presentaties worden gegevens tijdens een (mini) conferentie.	Referaat
219985	Voor verschillende soorten taken en opdrachten kunnen studenten studiepunten verwerven tot een maximum van 8 SP. Een student kan maximaal 4 vrije projecten doen. Een project omvat maximaal 4 SP.	Vrije projecten
219993	In het vierjarig curriculum (gen. 1992 t/m 1994) van de opleiding Informatica bestaat de mogelijkheid voor studenten om maximaal één doctoraalkeuzevak te vervangen door een vakgroepopdracht. Vooral voor studenten die geen stage opnemen in hun doctoraalpakket kan dit een zinvolle praktische aanvulling zijn.	Vakgroepopdracht
219997	niet beschikbaar	Doctoraalopdracht
219999	niet beschikbaar	Doctoraalopdracht
232011	Informatiesystemen in grote organisaties worden steeds complexer. Dit wordt enerzijds veroorzaakt door het feit dat steeds meer taken aan informatieystemen worden toegewezen en de functionaliteit dus toeneemt, anderzijds doordat bestaande systemen meer en meer geïntegreerd worden tot grote samengestelde systemen. Beide ontwikkelingen leiden tot een grotere vervlechting van informatiesystemen met hun omgeving. Om met deze complexiteit om te kunnen gaan, moet de architectuur van informatiesystemen expliciet benaderd worden. In dit college komt zowel de modellering alsook de implementatie van architecturen van complexe informatiesystemen aan de orde. De rol van de informatiesysteem-architect staat hierbij centraal.	Architectuur van informatiesystemen
232012	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen.	Information retrieval en kennisbeheer
232016	Het vak levert elementaire kennis en voorbeelden die nodig zijn om inzicht te krijgen in prestatie-aspecten van bedrijfsinformatiesystemen, en hoe prestatieproblemen kunnen worden aangepakt. 	Prestatie-analyse van informatiesystemen
232020	Ten gevolge van de digitale revolutie beschikken bedrijfsorganisaties en wetenschappelijke instituten heden ten dage over grote hoeveelheden data, opgeslagen in omvangrijke, meestal gedistribueerde, databases.	Data warehousing & data mining
232050	Het vak e-Commerce biedt een brede inleiding plus enkele selected topics. Er wordt aandacht besteed aan begrippen zoals e-Business, e-Commerce, B2B, B2Cm business model, verschillende toepassingsgebieden van e-Business en e-Commerce worden behandeld, alsmede strategievorming rondom e-Business en e-Commerce.	Electronic Commerce
232055	An important factor in the evolution of the World Wide Web is electronic commerce: the ability to buy, sell, and advertise goods and services to customers and consumers. The potential for global electronic commerce is immense; much of this potential is and will be realized by the continued development of Web technologies, in particular the Extensible Markup Language (XML) and related developments. XML will play an increasingly important role in the exchange of a wide variety of services on the Web, especially in Business-to-Business (B2B) electronic commerce and Electronic Data Interchange (EDI).	XML-technologie in E-Commerce
232060	Een agent is een software- of hardwaremodule voorzien van één of meerdere doelen die deze module autonoom en rationeel zal nastreven. Bij de cursus multi-agentsystemen bestuderen we computersystemen die zijn opgebouwd uit dergelijke agenten. In een dergelijk multi-agentsystemen zijn de individuele doelen van de agenten vaak met elkaar in conflict. Agenten zullen dus moeten samenwerken om deze conflicten op te lossen. Ook kan samenwerking nodig zijn omdat één individuele agent niet in staat is zijn eigen doelen zonder hulp te realiseren. Dergelijke samenwerking is echter nooit 'van tevoren' door een centrale ontwerper ingebouwd, maar moet door de agenten zelf bewerkstelligd worden, waarbij de agenten voortdurend hun eigen belang als uitgangspunt nemen. Onderwerpen die aan bod komen zijn: Architecturen, Interactie, Onderhandelen en Communicatie.	Multi-agent systemen
232080	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. Zie vervangend vak 232081.	Requirements Engineering
232081	In dit vak wordt ingegaan op technieken om gebruikersbehoeften om te zetten in oplossingsspecificaties. Aan de orde komen technieken voor probleemstructurering, functionele specificatiestijlen, kwaliteitseisen en elicitatietechnieken. In praktijkoefeningen moet de student de theorie toepassen op casussen.	Requirements Engineering
232085	Dit vak bestaat uit een kerndeel van 3.5 SP en, naar keuze, een aantal specialisatiedelen van elk 3.5 SP. De student doet minimaal het kerndeel maar kan kiezen dit uit te breiden met 1 of meer specialisatiedelen tot een vak van 7, 10.5 of meer studiepunten.	Voortgezette Requirements Engineering
233030	Dit vak (voorheen OIS, 233026) beoogt de student kennis en vaardigheden bij te brengen op het gebied van conceptuele gegevensmodellering en functionele specificatie op een methoden-onafhankelijke manier. Aan de orde komen technieken uit gegevensmodellering, dataflow-modellering en gedragsmodellering. Speciale aandacht wordt besteed aan de manier waarop deze technieken in gestructureerde en object-georiënteerde methodes gebruikt worden.	Specificeren van informatiesystemen
233035	Dit practicum sluit aan bij het college SIS (233030) dat in jaar 2, trimester 3, blok 1, gegeven wordt en op het college Gegevensbanken dat in jaar 2, trimester 1 gegeven wordt De student specificeert de eisen aan een informatiesysteem met behulp van de technieken uit SIS en transformeert deze specificatie in een database-ontwerp met behulp van technieken uit DB.	Practicum Databases in Informatiesystemen
234001	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen.	Productie-informatietechnologie
234004	Het doel van het vak is het verkrijgen van kennis over en het leren toepassen van technieken voor de beheersing van de kwaliteit van softwareproducten en het softwareontwikkelproces. Belangrijke kwaliteitsaspecten van software zijn de aanpasbaarheid, onderhoudbaarheid en herbruikbaarheid. Aan de orde komen kwaliteitsmodellen, procesmodellen, kostenmodellen, configuratiemanagement, review- en inspectietechnieken, beoordeling in het kader van het Capability Maturity Model, de Goal-Question-Metric methode voor het opzetten van een kwaliteitsprogramma met bijbehorend keuze en toepassing van software-metrieken, de ISO9000-3 standaard voor kwaliteitsmanagement in de software-industrie, softwaremetrieken en het gebruik van softwarepakketten ter ondersteuning van de kwaliteitsbeheersing.	Softwaremanagement
234007	Systemen voor coöperatief werk zijn systemen die mensen helpen om werkzaamheden uit te voeren in onderlinge samenwerking. Globaal kan er een indeling gemaakt worden in twee soorten. Workflow management systems (werkstroombesturingssystemen) helpen specifiek bij het inrichten en ondersteunen van herhaalbare werkprocessen. Groupware realiseert een infrastructuur waarmee samenwerken - al dan niet op afstand - ondersteund wordt, zonder dat sprake hoeft te zijn van een gestructureerd werkproces.	Systemen voor cooperatief werk
234010	Tijdens de invoering van informatiesystemen in organisaties vindt de interactie plaats tussen technische mogelijkheden en organisatorische aanpassingsvermogens. Deze interacties verlopen veelal problematisch, resulterend in hoge kosten en lage opbrengsten van projecten. Dit vak presenteert benaderingen die men kan hanteren voor de aanpak van invoeringsproblemen, laat studenten inzicht verkrijgen in de organisatieveranderingen als gevolg van IT-invoering, en laat studenten inzicht verwerven in mogelijkheden om veranderingsproblemen te reduceren door een verstandige aanpak van de systeemontwikkeling en IT-veranderingen. In de werkcolleges wordt de literatuur hierbij besproken en gerelateerd met praktische situaties. Hierbij worden ERP, Electronic commerce en kennismanagement systemen cases gebruikt als rode draad door de stof. Het vak is daarom een combinatie van hoor- en werkcolleges, met intensief gebruik van case-materiaal.	Invoering van IT in organisaties
234020	Met de explosieve groei van het aantal eindgebruikers van interactieve systemen, is het belang toegenomen om bij het ontwerpen van dergelijke systemen de eindgebruiker centraal te stellen. Mens-machine-interactie is het relatief nieuwe vakgebied dat zich hiermee bezighoudt.  	Ontwerpen van mens-machine interactie
234026	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. 	Voortgezette informatiesysteemmodellering
235005	De overkoepelende doelstelling van dit vak is studenten in aanraking te laten komen met de rol die informatiesystemen spelen in organisaties en met de implicates van het gebruik en de invoering van IS voor organisaties. Dit vindt plaats op een inleidend niveau, waarbij de verschillende aspecten van IS in organisaties worden behandeld, zonder dat de grondslagen worden bestudeerd. De grondslagen en verdere verdieping van de verschillende aspecten komen nader aan de orde in andere BIK-vakken. Gedurende de cursus zullen studenten leren hoe organisaties IS kunnen toepassen ter verbetering van de bedrijfsvoering en welke uitdagingen het toepassen van IS met zich meebrengt.    	Inleiding bedrijfsinformatiesystemen
235022	Dit vak komt komt met ingang van studiejaar 2003-2004 te vervallen. Zie vervangend vak 237600.	Investeringen in informatietechnologie
236001	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen.	Kwaliteit van de informatievoorziening
236002	Beheer van ICT voorzieningen houdt in het update to data houden van infrastructuren en toepassingen op het terrein van de informatietechnologie in organisatie. De infrastructuren zijn hierbij onder meer de servers, de netwerken en de werkplekken. De applicaties ondersteunen de bedrijfsprocessen, zijn personal productivity tools en exploreren de wereld van electronic commerce en e-business.  	Beheer van ICT voorzieningen
236050	Het vak E-health Strategies beoogt inzicht te geven in de informatievoorziening van gezondheidszorgorganisaties en hoe die op korte en middellange termijn moet gaan veranderen.	E-health Strategies
237201	Het verwerven van kennis en vaardigheden die van belang zijn bij het ontwerpen van IT toepassingen in hun organisatorische context is de hoofddoelstelling van dit vak. Het vak OICT-BIT is dan ook een breed vak waarin verschillen leerdoelen worden nagestreefd. In de diverse onderdelen van het vak staat zowel het ontwerpproces van IT-toepassingen centraal, als het opstellen van documenten die in dat ontwerpproces een belangrijke rol spelen. Hierbij spelen naast kennis van IT, het bepalen van de doelstelling, het afstemmen op doelgroepen en planning en samenwerking een belangrijke rol. Dit vak is tevens bedoeld als verkenning van het vakgebied en een oriëntatie op de beroepspraktijk. 	Oriëntatie ICT
237400	In dit vak wordt ingegaan op de rol die informatie en informatietechnologie spelen bij de operationele uitvoering van bedrijfsprocessen in organisaties en bij de besturing hiervan. Met name de samenhang tussen de verschillende informatiestromen en de afhankelijkheid van de gekozen organisatie- en besturingsvorm staat hier centraal. De beschikbare informatietechnologie is vaak bepalend voor de wijze waarop processen en besturing kunnen worden ingericht. Het vak vormt een basis voor het analyseren en ontwerpen van processen en de hierbij benodigde informatievoorziening. Afwegingen met betrekking tot kwaliteit en risicobeheersing spelen hierin een belangrijke rol.	BedrijfsProces Ondersteuning
237450	In het vak BFS wordt ingegaan op de rol die informatie en informatietechnologie spelen bij de operationele uitvoering van de verschillende bedrijfsfuncties in organisaties (zowel profit als non-profit). 	Bedrijfsfunctie ondersteuning
237500	In BP lab wordt een combinatie geboden van het werken met software (enterprise resource planning, bedrijfsmodellering), gastcolleges door praktijkdeskundigen op het gebied van modellering, ERP-software en integratie-software, en wetenschappelijke artikelen om zowel op academisch en praktisch niveau beter verbanden te kunnen leggen tussen het ontwerpen van bedrijfssoftware en de invoering en werking daarvan in de dagelijkse praktijk.	BP lab
237600	Het bepalen van de bijdrage van het invoeren van informatietechnologie in organisaties is verre van triviaal. Hierdoor is het moeilijk een projectvoorstel te maken met een solide investeringsanalyse en een inschatting van te verwachten opbrengsten. Het maken van een business case helpt de kosten en baten van een IT-invoeringstraject inzichtelijk te maken rekening houdend met de impact van het systeem op de organisatie. Studenten moeten verschillende stappen in het maken van een business case begrijpen en delen ervan toepassen op een case.	Business Case Development for IT-projects
238100	Vak is uitsluitend voor BIT-studenten bestemd.	Vrije projecten BIT
239800	Dit vak wordt met ingang van studiejaar 2003-2004 niet meer aangeboden. Zie vervangend vak 239805 BIT-BV.	BIT-BV 1
239801	Dit vak wordt met ingang van studiejaar 2003-2004 niet meer aangeboden. Zie vervangend vak 237600 Business case Development for IT projects.	BIT-BV 2
239805	In de cursus vergroten de studenten hun vermogen om de in de studie aangeboden kennis toe te passen en de vaardigheden die vereist zijn om in teams gestructureerd samen te werken. Tijdens de cursus competeren BIT BV's voor opdrachten van klanten met een projectteam per klant. De klaten worden gespeeld door bestaande IT-ondernemingen. Ieder team wordt gevraagd een offerte uit te brengen, en voor die offerte achtereenvolgens een probleemspecificatie, een conceptuele oplossing van het probleem en een projectdefinitie voor de oplossingsrealisatie te maken. De teams presenteren aan het einde van de cursus hun offerte aan de klant. De klant beoordeelt de tussenresultaten en de offerte. De teams worden tijdens het traject begeleid door een senior projectmanager en krijgen feedback van een Quality Review Board alvorens hun resultaten aan de klant te presenteren.	BIT-BV
239970	Wat zijn de ontwikkelingen in het vakgebied? Wat is de bijdrage van onderzoekers aan deze ontwikkelingen en hoe doe je onderzoek? Karakteristiek voor een wetenschappelijke opleiding is de relatie tussen onderwijs en onderzoek. In de studieonderdelen Caput en Referaat van de opleidingen Technische Informatica en BIT is deze relatie expliciet aanwezig. Deze studie onderdelen richten zich op een actieve kennismaking met wetenschappelijk onderzoek:	CAPUT
239975	In dit studieonderdeel wordt kennis en ervaring opgedaan met moderne ontwikkelingen in het vakgebied en het daarop aansluitende wetenschappelijke onderzoek. Individueel wordt een onderzoek van beperkte omvang uitgevoerd.Hierbij wordt voortgebouwd op de kennis en ervaring uit het bijbehorende caput. In dit bijbehorende caput is tevens de basis gelegd vor het individuele onderzoek. Het resultaat wordt zowel schriftelijk als mondeling gepresenteerd. De mondelinge presentaties worden gegevens tijdens een (mini) conferentie.	REFERAAT
239981	Het integratieproject BIT bestaat uit twee gedeelten. 	Integratieproject
239995	niet beschikbaar	Doctoraalstage
239998	niet beschikbaar	Doctoraalopdracht
261000	Het vak Telematica Systemen en Toepassingen (TST) is een inleiding in de Telematica. Telematica is een vakgebied dat is ontstaan door de gezamenlijke ontwikkeling van de "klassieke" Telecommunicatiesystemen en Computernetwerken, waarin aanvankelijk alleen computers met elkaar op afstand informatie uitwisselden. Computernetwerken worden Telematicanetwerken, waarin behalve datacommunicatie ook diensten voor telefoon, audio en video communicatie worden ondergebracht en geintegreerd tot multimedia Communicatiesystemen. 	Telematicasystemen en toepassingen
261010	Dit vak komt met ingang van studiejaar 2003-2004 te vervallen. Zie vervangend vak 261000.	Computer netwerken
262000	Het vak richt zich op de fundamentele concepten in netwerkprotocollen, die worden geillustreerd met echte protocollen uit het internet en andere netwerken.	Telematicanetwerken
262001	This subject concentrates on networking aspects of wireless and mobile technologies. Althougth the focus is on the network layer, and particularly on mobility support in the context of IP, the relevant physical aspects are briefly reviewed, medium access issues are described, and the effect of mobility on end-to-end transport protocols such as TCP is included. Part of this subject is devoted tot the description of different existing and future technologies, like GPRS, UMTS, Wireless LANs, or Bluetooth, but this is done to support general concepts. Some lectures are dedicated to new subjects, such as ad hoc networking or mobile applications.	Mobile and wireless networking
262020	De doelstelling van het college Bijzondere+ Onderwerpen Telematica is, uit recent onderzoek interessante onderwerpen door studenten te laten bestuderen. De onderwerpen worden jaarlijks opnieuw vastgesteld. (B.O. Telematica vult bestaande vakken aan, zodat een student na het volgen van dit vak van de meeste aspecten, op het gebied van telematica, kennis heeft genomen.)	Bijzondere onderwerpen Telematica
263000	Gebruikerstoepassingen bestaan tegenwoordig vaak uit geografisch gespreide componenten die onderling samenwerken om aan gebruikers de gewenste functionaliteit te bieden. Telematicadiensten maken deze gedistribueerde samenwerking mogelijk. Zij worden gerealiseerd middels enkelvoudige of samengestelde applicatieprotocollen. Dit vak behandelt een aantal basis applicatieprotocollen en samenstellingen van deze protocollen die de benodigde diensten leveren aan de benodigde toepassingen. Generieke protocollen, incl. de bijbehorende formaten en encoderingen, die gebaseerd zijn op OSI, ITU of Internet standaarden hebben een belangrijke plaats in dit vak. Dit vak behandelt protocollen voor bijvoorbeeld dialoogbesturing, electronic mail, informatieuitwisseling over o.a. het Internet, multimedia conferentie en gedistribueerde transactieverwerking.	Telematicadiensten
263100	Dit vak behandelt telematicadiensten en toepassingen op het gebied van mobiele en telemedische zorg (M-health) gebaseerd op Body Area Networks (BAN). Technologieen die geschikt zijn voor ambulante monitoring van (bio)medische signalen door middel van een BAN zullen besproken worden. Tijdens deze cursus moeten intra-BAN communicatie technologieen, extra-BAN communicatie technologieen en medische sensoren die nodig zijn voor de realisatie van een BAN bestudeerd worden. De student wordt gevraagd om in een klein project team M-health diensten en toepassingen verder te ontwikkelen, te verbeteren en te evalueren. Het project team richt zich daarbij op de beveiliging, schaalbaarheid en robustheid aspekten van M-health applicatie protocollen. 	Mobile E-health application and services
263200	Breedbank netwerktechnologie opent de weg naar gedistribueerde toepassingen, die omgaan met grote hoeveelheden multimedia data (audio, video en plaatjes). Gedistribueerde multimedia database technologie speelt hierin een centrale rol. In dit vak beschouwen we architecturen voor gedistribueerde multimedia databases, toegangs- en opslagstructuren voor multimedia data in gedistribueerde omgevingen met autonome en heterogene bronnen. Er wordt aandacht besteed aan methoden en technieken voor man-machine interaction waarbij iteratie, terugkoppeling met betrekking tot relevantie en visualisatie kernzaken zijn.	Gedistribueerde multimedia database systemen
264000	Telematica toepassingen hebben een grote invloed op ons dagelijks leven. Werk, studie en ontspanning worden steeds meer beinvloed door Internet toepassingen. Deze cursus biedt een grondige introductie in Telematica Toepassingen (eng.: Networked Applications). Na deze cursus is de student in staat om de maatschappelijke, organisatorische en technische voordelen van telematica toepassingen te beoordelen. Daarnaast is de student in staat om geschikte concepten te hanteren om telematica toepassingen te analyseren.	Telematicatoepassingen
264001	Dit vak biedt theorie, concepten en methodieken aan waarmee strategische keuzes van aanbieders van ICT infrastructuren, diensten en toepassingen in de snel veranderende Internet economie kunnen worden onderbouwd. Het vak onderzoekt de technologische en strategische factoren die de structuur en dynamiek van de informatie- en communicatiesector beïnvloeden en beschrijft in het bijzonder belangrijke kenmerken (zoals lock-in en netwerkeffecten) die begrepen moeten worden om de effecten van keuzes in te kunnen schatten. Belangrijke keuzes liggen bijvoorbeeld in het omgaan met interoperabiliteit, compatibiliteit en standaarden, timing van opeenvolgende generaties netwerkinfrastructuren en diensten, en het structureren van verticale en horizontale samenwerkingsrelaties. Het vak biedt een systematisch raamwerk aan waarmee verschillende soorten keuzes in de netwerkeconomie vanuit de optiek van aanbieders in de informatie- en communicatiesector kunnen worden beschreven en via scenario's inzichtelijk kunnen worden gemaakt. Het vak wordt gegeven als combinatie van hoor- en werkcollege en wordt afgesloten met een groepsopdracht.	Telematics and business strategies
264002	Het vak gaat in op een gestructureerde methode voor het ontwerpen, analyseren en verbeteren van bedrijfsprocessen en ondersteunende ICT systemen. Er wordt een grafische modelleertaal geïntroduceerd waarmee bedrijfsprocessen inzichtelijk in kaart kunnen worden gebracht en geanalyseerd en verbeterd. Hiervoor wordt tevens de nieuwste versie van het software pakket Testbed Studio ingezet. Dit softwarepakket met bijbehorende methodiek wordt momenteel binnen veel grote organisaties in Nederland gebruikt voor business process engineering projecten.	Business process engineering
264010	De verbreiding van het Internet leidt tot de ontwikkeling van tal van nieuwe typen toepassingen. De centrale vraag in dit college is: hoe ontwerpen we de architectuur van zulke netwerkapplicaties?	Reference models for networked applications
265000	In verband met een aantal wijzigingen in het curriculum zal het vak Ontwerp en Beheer dit jaar op een zelfde manier worden gegeven als het vak Internet en Web Architecturen. Het vak wordt in de vorm van een project uitgevoerd en maakt gebruik van de kennis die is opgedaan in het vak "Telematicasystemen en -toepassingen". Het idee is een aantal groepen te vormen die ieder voor een fictieve opdrachtgever een offerte uitbrengen van een Internet en web-systeem. De teams kunnen beschouwd worden als ingenieursburo's en zijn elkaars concurrenten. Een team bestaat uit 10 studenten en wordt door de studenten zelf samengesteld.	Ontwerp en beheer
265100	Het vak Ontwerpen van telematicasystemen richt zich op het ontwerpen van complexe gedistribueerde systemen, uitgaande van de interacties van de functionele entiteiten (systeemdelen of modules) binnen die systemen. In de praktijk kunnen hiermee de services, protocollen en interfaces, die een zo belangrijke rol spelen in gedistribueerde systemen, worden ontworpen. De relevantie van dit vak wordt bepaald door haar toepassingen in de vele vormen van communicatienetwerken en telematicasystemen die van zulke netwerken gebruik maken.	Ontwerpen van telematicasystemen
265110	Het vak Procotol engineering behandelt engineering technieken voor het ontwerpen, specificeren en implementeren van protocolsystemen, met als doel het dekken van het hele ontwikkelingstraject van deze systemen volgens een systematische aanpak. Dit vak geeft een technische invulling aan de ontwerpmethodiek en concepten gepresenteerd in het vak Ontwerpen van telematicasystemen (265100). Onderwerpen die in dit vak aan de orde komen zijn o.a. protocol concepten, protocol specificatietechnieken (i.h.b. LOTOS en SDL), correctheid en verfijning, structurering op specificatie- en implementatieniveau, implementatie omgevingen (Unix/Windows), en implementatievrijheid en -overwegingen.	Protocol Engineering
265200	Dit vak heeft tot doel het leren van en opdoen van ervaring met (i) methoden en technieken waarmee een telematicasysteem op systematische wijze kan worden ontwikkeld en (ii) implementatie omgevingen die bouwstenen en gereedschappen leveren voor het construeren van telematicasystemen.	Implementatie van telematicasystemen
265201	Dit vak heeft twee hoofddoelstellingen: (i) het overdragen van kennis over middleware voor gedistribueerde objecten, namelijk de concepten, modellen en technologieën die daarmee gepaard gaan, en (ii) ontwikkelen van ontwerpvaardigheden, door praktische ervaring op te bouwen met het gebruik van middleware platformen. Na het succesvol afronden van dit vak is de student in staat om te opereren in onderzoeks- of ontwikkelingsprojecten waarin middleware technologie een rol speelt. Dit vak benadrukt het gebruik van middleware technologie in telematicadiensten- en toepassingen. Middleware technologie is geïntroduceerd om de ontwikkeling van gedistribueerde applicaties te vereenvoudigen, door de ontwikkelaar in staat te stellen om applicaties te ontwerpen en op te bouwen met gebruik van standaard objecten en/of component technologieën. Dit vak concentreert zich op de Common Object Request Broker Architecture (CORBA). Dit vak behandelt andere gerelateerde onderwerpen zoals onder andere: integratie met Web technologie, het gebruik van componenten technologie en de ondersteuning van QoS en multimedia streaming.	Middleware for distributed objects
265300	Operationeel Management van Telematica Systemen en Diensten zorgt voor de beheersing en  integratie van de componenten van informatie-uitwisseling tussen mensen of systemen, met het doel te komen tot gebruikers-relevante, consistente diensten in een concurrerende markt. Dit college geeft uitleg over het beheersen van telematica diensten op basis van dienst-decompositie. De methode volgt het architecturele kader: "open service component architecture". Management architecturen worden gedecomponeerd tot een oplossingsruimte van een hanteerbaar formaat. Drie assen worden geintroduceerd: operationele lagen, functionele gebieden en levensfasen. Er wordt een top-down analyse gegeven van de rol die deze management architecturen spelen in toekomstig, geintegreerd telematica management. Elementen van het decompositie-gereedschap worden in detail behandeld met voorbeelden en case-studies. De kern van "Operationeel Management" is de toepassing in de praktijk, de operatie. Drie management architecturen die een rol spelen in operationele telematica worden behandeld: De bekende "Telecommunications Management Network"-architectuur, de wat fundamentele "OSI-Management architectuur" en tenslotte het "Management van Internet". Ter illustratie worden enkele voorbeelden uit het Intelligente Netwerk gegeven. De link met moderne ontwikkelingen zoals real-time services over het Internet en Policy-based networking komt aan de orde. Management van systemen en diensten reikt steeds meer over domein-grenzen heen. Voor het doorzien van "open management"en "multi-domain management" worden recente voorbeelden behandeld.	Operationeel management van telematicasystemen
265310	Een Internet Service Provider stelt zich tot doel om diensten te leveren aan haar klanten met een kwaliteit die de klanten verwachten. Teneinde dit te bereiken moet een provider de status van de infrastructuur kunnen monitoren, controleren en zonodig veranderen. Generieke begrippen die een cruciale rol spelen bij het technisch faciliteren hiervan zijn: management modellen, informatie modellen, communicatie modellen en functionele modellen. In dit vak worden de fundamenten van Internet Management geleerd, de management protocollen SNMP versie 1, 2 en 3; diverse Management Information Bases (o.a. MIB-II en RMON-MIB ). Verder wordt dieper ingegaan op management gereedschappen en systemen, alsmede algorithmische fundamenten toegepast in management applications (bijvoorbeeld t.b.v. auto-topologie-discovery en event correlatie). 	Internet management architecturen
265400	Telematicasystemen zijn gedistribueerde systemen waarin communicatienetwerken een belangrijke rol spelen. Om misbruik te voorkomen dienen de processen en de informatie binnen deze telematicasystemen op adequate wijze beveiligd te zijn. Om dit te kunnen realiseren is zowel inzicht nodig in de problematiek van informatiebeveiliging als kennis van de voorhanden zijnde beveiligingstechnieken.	Beveiliging van telematicasystemen
266100	Het vak biedt, geconcentreerd rondom het concept van patterns, een scala aan ontwerpkennis, variërend van programmeerniveau tot architectuurniveau: dit bouwt voort op de kennis uit de programmeervakken en vult de (doorgaans meer conceptuele) kennis uit de ontwerpvakken aan.	Patterns of software development
269000	OICT is een breed vak waarin verschillende leerdoelen worden nagestreefd. In Oriëntatie ICT leer je een eenvoudige applicatie te ontwerpen. In een realistische opdracht ontwerp en implementeer je een oplossing voor een praktisch probleem. Het betreft het ontwerpen van een webapplicatie met nadruk op zowel technische vaardigheden als communicatie en samenwerkingsaspecten. Door deze eenvoudige maar realistische situatie krijg je in een kort tijdsbestek een aardig beeld van een mogelijke beroepsuitoefening van onze afgestudeerden. Naast het ervaring opdoen met ontwerpen behoort tot de leerdoelen van het vak het verwerven van managementvaardigheden, in het bijzonder het interviewen, schriftelijk rapporteren, presenteren en samenwerken aan een project.	Orientatie ICT
269001	In this course you are taught how to design your own professional portfolio. You will learn how to present yourself by means of a portfolio. A well-designed portfolio will be very useful for finding a final project and later for finding a job. So we will treat which aspects are good to stress in a portfolio, your capacities in study as well in real life!	Portfolio ontwerp
269002	Dit vak komt te vervallen met ingang van studiejaar 2003-2004.	Bedrijfsorientatie voor telematici
269004	This is a refreshers course for topics about logics, probability and database. This course also facilitates to improve skills in JAVA programming.	Refresher Logics, Probability,Databases and JAVA
269100	In het P-project moeten studenten kennis van voorgaande vakken toepassen op een telematicaprobleem dat als case voor het project wordt gebruikt. Deze case is zo opgezet dat onderdelen uit de digitale techniek, telematica en OO-programmering expliciet aan de orde komen. Aan het eind van het project moet een demonstratie gegeven worden van een werkend systeem. Gedurende het project moeten studenten presentaties verzorgen en deelverslagen maken. 	P-project TEL
269400	nog niet beschikbaar	Vrij project
269950	A BSc project addresses relatively simple research topics in the area of Telematics, like: Telematics Networks, Telematics Services and Telematics Applications. The BSc project has a relatively simple scientific character. A BSc project normally concerns research, design (development) or a combination of both. Research in a BSc project has to be carried out according to a systematic approach and the results should be interpreted and verifiable. Design (development) has to be carried out according to systematic methods and techniques and should serve a scientific purpose. The project lasts for 14 weeks and is concluded by delivering a written report and a oral presentation.	Bacheloropdracht
269999	nog niet beschikbaar	Doctoraalopdracht
\.


--
-- Name: grades_pkey; Type: CONSTRAINT; Schema: srs; Owner: db00; Tablespace: 
--

ALTER TABLE ONLY grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (student_id, course_code, year, quarter);


--
-- Name: education_pkey; Type: CONSTRAINT; Schema: srs; Owner: db00; Tablespace: 
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_pkey PRIMARY KEY (course_code, year, quarter);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: srs; Owner: db00; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_code);


--
-- PostgreSQL database dump complete
--

