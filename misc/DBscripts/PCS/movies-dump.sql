--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: acts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE acts (
    mid integer,
    pid integer,
    role text
);


--
-- Name: certification; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE certification (
    mid integer,
    country text,
    certificate text
);


--
-- Name: directs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE directs (
    mid integer,
    pid integer
);


--
-- Name: genre; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE genre (
    mid integer,
    genre text
);


--
-- Name: language; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE language (
    mid integer,
    language text
);


--
-- Name: movie; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE movie (
    mid integer NOT NULL,
    name text,
    year numeric(4,0),
    plot_outline text,
    rating numeric(2,1)
);


--
-- Name: person; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person (
    pid integer NOT NULL,
    name text
);


--
-- Name: runtime; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE runtime (
    mid integer,
    country text,
    runtime numeric(3,0)
);


--
-- Name: writes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE writes (
    mid integer,
    pid integer
);


--
-- Data for Name: acts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY acts (mid, pid, role) FROM stdin;
533	6526	Don Vito Corleone
533	6527	Michael Corleone
533	6528	Kay Adams Corleone
533	6529	Tom Hagen
533	6530	Peter Clemenza
533	6531	Santino "Sonny" Corleone
533	6532	Constanzia "Connie" Corleone Rizzi
533	6533	Police Captain McCluskey
533	6534	Jack Woltz
533	6535	Don Emilio Barzini
533	6536	Sollozzo "The Turk"
533	6537	Sal Tessio
533	6538	Carlo Rizzi
533	6539	Frederico "Fredo" Corleone
533	6540	Ottilio Cuneo
534	6542	Andy Dufresne
534	6543	Ellis Boyd "Red" Redding
534	6544	Warden Samuel Norton
534	6545	Heywood
534	6546	Captain Byron Hadley
534	6547	Tommy Williams
534	6548	Bogs Diamond
534	6549	Brooks Hatlen
534	6550	1946 D.A.
534	6551	Skeet
534	6552	Jigger
534	6553	Floyd
534	6554	Snooze
534	6555	Ernie
534	6556	Guard Mert
535	6559	Oskar Schindler
535	6560	Itzhak Stern
535	6561	Amon Goeth
535	6562	Emilie Schindler
535	6563	Poldek Pfefferberg
535	6564	Helen Hirsch
535	6565	Victoria Klonowska
535	6566	Wilek Chilowicz
535	6567	Marcel Goldberg
535	6568	Ingrid
535	6569	Julian Scherner
535	6570	Rolf Czurda
535	6571	Herman Toffel
535	6572	Leo John
535	6573	Albert Hujar
536	6577	Richard "Rick" Blaine
536	6578	Ilsa Lund Laszlo
536	6579	Victor Laszlo
536	6580	Captain Louis Renault
536	6581	Major Heinrich Strasser
536	6582	Senor Ferrari
536	6583	Ugarte
536	6584	Carl, the Headwaiter
536	6585	Yvonne
536	6586	Sam
536	6587	Annina Brandel
536	6588	Berger
536	6589	Sascha
536	6590	Pickpocket
537	6594	Charles Foster Kane
537	6595	Jedediah Leland/Newsreel Reporter
537	6596	Susan Alexander
537	6597	Mrs. Mary Kane
537	6598	Emily Norton Kane
537	6599	Boss James 'Jim' W. Gettys
537	6600	Herbert Carter/Newsreel Reporter
537	6601	Bernstein
537	6602	Jerry Thompson/"News on the March" Narrator
537	6603	Raymond
537	6604	Walter Parks Thatcher
537	6605	Matiste
537	6606	Headwaiter
537	6607	Rawlston
537	6608	Reporter
538	6610	Lester Burnham
538	6611	Carolyn Burnham
538	6612	Jane Burnham
538	6613	Ricky Fitts
538	6614	Angela Hayes
538	6615	Buddy Kane
538	6616	Barbara Fitts
538	6617	Colonel Frank Fitts
538	6618	Jim Olmeyer
538	6619	Jim "JB" Berkley
538	6620	Brad Dupree
538	6621	Sale House Woman #1
538	6622	Sale House Man #1
538	6623	Sale House Man #2
538	6624	Sale House Woman #2
539	6527	Michael Corleone
539	6529	Tom Hagen
539	6528	Kay Corleone
539	6627	Vito Corleone
539	6539	Frederico "Fredo" Corleone
539	6532	Constanzia "Connie" Corleone
539	6628	Hyman Roth
539	6629	Frankie Pentangeli
539	6630	Senator Pat Geary
539	6631	Al Neri
539	6632	Fanucci
539	6633	Rocco Lampone
539	6634	Young Clemenza
539	6635	Genco
539	6636	Young Mama Corleone
540	6637	Luke Skywalker
540	6638	Han Solo
540	6639	Princess Leia Organa
540	6640	Grand Moff Wilhuff Tarkin
540	6641	Ben Kenobi
540	6642	C-3PO
540	6643	R2-D2
540	6644	Chewbacca
540	6645	Darth Vader
540	6646	Uncle Owen Lars
540	6647	Aunt Beru Lars
540	6648	Nebit, Kitik Keed'kak
540	6649	General Jan Dodonna
540	6650	Commander Vanden Willard
540	6651	Garven 'Dave' Dreis
541	6653	Kambei Shimada
541	6654	Kikuchiyo
541	6655	Gorobei Katayama
541	6656	Kyuzo
541	6657	Heihachi Hayashida
541	6658	Shichiroji
541	6659	Katsushiro
541	6660	Manzo, father of Shino
541	6661	Gisaku, the Old Man
541	6662	Yohei
541	6663	Mosuke
541	6664	Rikichi
541	6665	Gasaku
541	6666	Peasant
541	6667	Peasant
542	6670	Randle Patrick McMurphy
542	6671	Nurse Mildred Ratched
542	6672	Harding
542	6673	Ellis
542	6674	Col. Matterson
542	6675	Dr. John Spivey
542	6676	Miller
542	6677	Orderly Turkle
542	6678	Warren
542	6679	Martini
542	6680	Jim Sefelt
542	6681	Bancini
542	6682	Nurse Itsu
542	6683	Attendant Washington
542	6684	Beans Garfield
543	6688	Group Capt. Lionel Mandrake/President Merkin Muffley/Dr. Strangelove
543	6689	General "Buck" Turgidson
543	6533	General Jack D. Ripper
543	6690	Colonel "Bat" Guano
543	6691	Major T. J. "King" Kong
543	6692	Ambassador de Sadesky
543	6693	Lieutenant Lothar Zogg
543	6694	Miss Scott
543	6695	Mr. Staines
543	6696	Lieutenant H. R. Dietrich
543	6697	Admiral Randolph
543	6698	Lieutenant W. D. Kivel
543	6699	Frank
543	6700	Captain G. A. "Ace" Owens
543	6701	Burpelson Defense Team Member
544	6704	L.B. "Jeff" Jefferies
544	6705	Lisa Carol Fremont
544	6706	Lieutenant Thomas J. Doyle
544	6707	Stella
544	6708	Mr. Lars Thorwald
544	6709	Miss Lonelyheart
544	6710	Songwriter
544	6711	Miss Torso, the Ballet Dancer
544	6712	Woman on Fire Escape
544	6713	Man on Fire Escape
544	6714	Miss Hearing Aid
544	6715	Newlywed Man
544	6716	Mrs. Anna Thorwald
544	6717	Newlywed Woman
545	6638	Dr. Henry 'Indiana' Jones, Jr.
545	6720	Marion Ravenwood
545	6721	Rene Belloq
545	6722	Toht
545	6723	Sallah
545	6724	Sapito
545	6725	Marcus Brody
545	6726	Dietrich
545	6727	Gobler
545	6728	Barranca/Monkey Man
545	6729	Colonel Musgrove
545	6730	Major Eaton
545	6731	Bureaucrat
545	6732	Jock
545	6733	Australian Climber
546	6735	Michael McManus
546	6736	Dean Keaton
546	6737	Fred Fenster
546	6738	Todd Hockney
546	6610	Verbal Kint
546	6739	Dave Kujan
546	6740	Kobayashi
546	6741	Edie Finneran
546	6742	Jack Baer
546	6743	Jeff Rabin
546	6744	Smuggler
546	6745	Saul Berg
546	6746	Fortier
546	6747	Renault
546	6748	Dr. Plummer
547	6751	Norman Bates
547	6752	Lila Crane
547	6753	Sam Loomis
547	6754	Milton Arbogast
547	6755	Sheriff Chambers
547	6756	Dr. Richmond
547	6757	George Lowery
547	6758	Tom Cassidy
547	6759	Mrs. Chambers
547	6760	Caroline
547	6761	California Charlie, car salesman
547	6762	Highway Patrolman
547	6763	Marion Crane
548	6637	Luke Skywalker
548	6638	Han Solo
548	6639	Princess Leia Organa
548	6766	Lando Calrissian
548	6642	C-3PO
548	6645	Darth Vader
548	6644	Chewbacca
548	6643	R2-D2
548	6767	Yoda
548	6641	Ben Kenobi
548	6768	Boba Fett/Lieutenant Sheckil
548	6769	Lobot
548	6648	Ugloste
548	6770	Wampa Snow Creature
548	6771	Yoda Puppeteer
549	6774	Vincent Vega
549	6775	Jules Winnfield
549	6776	Mia Wallace
549	6777	Winston Wolf
549	6778	Pumpkin
549	6779	Honey Bunny
549	6780	Fabienne
549	6781	Marsellus Wallace
549	6782	Lance
549	6783	Jody
549	6784	Captain Koons
549	6785	Butch Coolidge
549	6786	Paul
549	6787	Trudy
549	6788	Zed
550	6791	Roger O. Thornhill/George Kaplan
550	6792	Eve Kendall
550	6793	Phillip Vandamm
550	6794	Clara Thornhill
550	6795	The Professor
550	6796	Handsome Woman
550	6797	Lester Townsend
550	6798	Leonard
550	6799	Valerian
550	6800	Victor Larrabee, Thornhill's Attorney
550	6801	Licht
550	6802	Auctioneer
550	6803	Dr. Cross
550	6804	Chicago Policeman
550	6805	Captain Junket, Nassau County Detectives
551	6807	Dr. Hannibal Lecter
551	6808	Clarice Starling
551	6809	Jame "Buffalo Bill" Gumb
551	6810	Agent Burroughs
551	6811	F.B.I. Instructor
551	6812	Ardelia Mapp
551	6813	Jack Crawford
551	6814	Dr. Frederick Chilton
551	6815	Barney
551	6816	Friendly Psychopath
551	6817	Brooding Psychopath
551	6818	Miggs
551	6819	Young Clarice
551	6820	Clarice's Father
551	6821	Mr. Lang
552	6825	Captain John H. Miller
552	6826	Sergeant Michael Horvath
552	6827	Private Richard Reiben
552	6828	Private Jackson
552	6829	Private Mellish
552	6830	Private Adrian Caparzo
552	6831	T/4 Medic Irwin Wade
552	6832	Corporal Timothy E. Upham
552	6833	Private James Francis Ryan
552	6834	Captain Fred Hamill
552	6835	Sergeant Hill
552	6836	Lieutenant Colonel Anderson
552	6837	Steamboat Willie
552	6838	Corporal Henderson
552	6839	Toynbe
553	6704	George Bailey
553	6841	Mary Hatch Bailey
553	6842	Mr. Henry F. Potter
553	6843	William 'Uncle Billy' Bailey
553	6844	Clarence Oddbody
553	6845	Mrs. Bailey
553	6846	Ernie Bishop, Taxi Driver
553	6847	Bert, the Cop
553	6848	Violet Bick
553	6849	Mr. Gower, Drugstore Owner
553	6850	Harry Bailey
553	6851	Peter 'Pa' Bailey
553	6852	Cousin Tilly
553	6758	Sam Wainwright
553	6853	Ruth Dakin Bailey
554	6627	James "Jimmy" Conway
554	6857	Henry Hill
554	6858	Tommy DeVito
554	6859	Karen Hill
554	6860	Paul "Paulie" Cicero
554	6635	Frankie Carbone
554	6861	Sonny Bunz
554	6862	Frenchy
554	6863	Billy Batts
554	6864	Morris Kessler
554	6865	Tuddy Cicero
554	6866	Himself
554	6867	Janice Rossi
554	6868	Mrs. DeVito
554	6869	Vinnie
555	6872	T.E. Lawrence
555	6641	Prince Feisal
555	6873	Auda abu Tayi
555	6874	General Allenby
555	6875	Sherif Ali
555	6876	Turkish Bey
555	6877	Colonel Brighton
555	6580	Mr. Dryden
555	6878	Jackson Bentley
555	6879	General Murray
555	6880	Gasim
555	6881	Majid
555	6882	Farraj
555	6883	Daud
555	6884	Tafas
556	6888	Juror #8
556	6889	Juror #3
556	6890	Juror #10
556	6891	Juror #4
556	6892	Juror #7
556	6754	Juror #1
556	6893	Juror #2
556	6894	Juror #5
556	6805	Juror #6
556	6895	Juror #9
556	6896	Juror #11
556	6897	Juror #12
557	6900	Guido Orefice
557	6901	Dora
557	6902	Guido's uncle
557	6903	School principal
557	6904	Ferruccio Papini
557	6905	Rodolfo
557	6906	Bartolomeo
557	6907	Vittorino
557	6908	Elena
557	6909	Giosue Orefice
557	6910	Madre di Dora
557	6911	Dr. Lessing
557	6912	Amico Rodolfo
557	6913	Prefect
557	6914	Man with Key
558	6916	Colonel Dax
558	6917	Corporal Paris
558	6918	General Broulard
558	6919	General Mireau
558	6920	Lieutenant Roget / Singing Man
558	6921	Major Saint-Auban
558	6922	Private Arnaud
558	6923	German Singer
558	6924	Proprietor
558	6925	Colonel Judge
558	6926	Priest
558	6927	Sergeant Boulanger
558	6928	Private Lejeune
558	6929	Private Ferol
558	6930	Shell Shock Victim
559	6932	Atticus Finch
559	6933	Dill Harris
559	6934	Sheriff Heck Tate
559	6935	Miss Maudie Atkinson
559	6936	Mrs. Dubose
559	6937	Tom Robinson
559	6938	Calpurnia
559	6939	Judge Taylor
559	6940	Mayella Violet Ewell
559	6941	Bob Ewell
559	6942	Stephanie Crawford
559	6529	Arthur "Boo" Radley
559	6943	Gilmer
559	6944	Walter Cunningham
559	6945	Mr. Nathan Radley
560	6704	John 'Scottie' Ferguson
560	6949	Madeleine Elster/Judy Barton
560	6950	Marjorie 'Midge' Wood
560	6951	Gavin Elster
560	6952	Coroner
560	6953	Scottie's Doctor
560	6954	Manageress of McKittrick Hotel
560	6955	Pop Leibel
560	6956	Older Mistaken Identification
561	6785	Dr. Malcolm Crowe
561	6959	Cole Sear
561	6960	Lynn Sear
561	6961	Anna Crowe
561	6962	Kyra Collins
561	6963	Tommy Tammisimo
561	6964	Vincent Grey
561	6965	Darren
561	6966	Bobby
561	6967	Stanley Cunningham
561	6968	Sean
561	6969	Mr. Collins
561	6970	Mrs. Collins
561	6971	Bridesmaid
561	6972	Young Man Buying Ring
562	6825	Woody
562	6974	Buzz Lightyear
562	6975	Jessie
562	6976	Stinky Pete the Prospector
562	6977	Mr. Potato Head
562	6978	Slinky Dog
562	6979	Rex
562	6980	Hamm
562	6981	Bo Peep
562	6982	Al McWhiggin
562	6983	Andy
562	6984	Mrs. Davis
562	6985	Mrs. Potato Head
562	6986	Sarge
562	6987	Barbie
563	6991	Thomas A. Anderson/Neo
563	6992	Morpheus
563	6993	Trinity
563	6994	Agent Smith
563	6995	Oracle
563	6996	Cypher/Mr. Reagan
563	6997	Tank
563	6998	Apoc
563	6999	Mouse
563	7000	Switch
563	7001	Dozer
563	7002	Agent Brown
563	7003	Agent Jones
563	7004	Rhineheart
563	7005	Choi
564	6627	Travis Bickle
564	6808	Iris
564	7008	Tom
564	6777	Sport
564	7009	Charles Palantine
564	7010	Wizard
564	7011	Betsy
564	7012	Charlie T
564	7013	Concession Girl
564	7014	Angry Black Man
564	7015	Deli Owner Melio
564	7016	Policeman at Rally
564	7017	Iris' Friend
564	7018	Cabbie in Bellmore
564	7019	Hooker in Cab
565	6610	Jack Vincennes
565	7021	Bud White
565	7022	Ed Exley
565	7023	Dudley Liam Smith
565	7024	Lynn Bracken
565	6679	Sid Hudgens
565	7025	Pierce Morehouse Patchett
565	7026	D.A. Ellis Loew
565	7027	'Badge of Honor' star Brett Chase
565	7028	Mickey Cohen
565	7029	Johnny Stompanato
565	7030	Mickey Cohen's Mambo Partner
565	7031	Mickey Cohen's Mambo Partner
565	7032	Officer Arresting Mickey Cohen
565	7033	Dick Stensland
566	6577	Sam Spade
566	7037	Brigid O'Shaughnessy/Miss Wonderly/Miss LaBlanc
566	7038	Iva Archer
566	6583	Joel Cairo
566	7039	Detective Lieutenant Dundy
566	6956	Effie Perine
566	6582	Kasper Gutman
566	6847	Detective Sergeant Tom Polhaus
566	7040	Miles Archer
566	7041	Wilmer Cook
566	7042	Luke, House Detective Hotel Belvedere
566	7043	Frank Richman, Driver
566	7044	District Attorney Bryan
567	6583	Hans Beckert
567	7047	Schraenker
567	7048	Madaem Becker
567	7049	Elsie
567	7050	Inspector Karl Lohmann
567	7051	Minister
567	7052	Police Commissioner Groeber
567	7053	Burglar
567	7054	Dynamiter
567	7055	Pickpocket
567	7056	Bauernfaenger
567	7057	Blind Beggar
567	7058	Nightwatch
567	7059	Secretary
567	7060	Landlady
568	6595	Holly Martins
568	7064	Anna Schmidt
568	6594	The Third Man
568	7065	Major Calloway
568	7066	Porter
568	7067	"Baron" Kurtz
568	7068	Dr. Winkel
568	7069	Popescu
568	7070	Old Woman
568	7071	Sergeant Paine
568	7072	Crabbin
569	7076	Narrator
569	7077	Tyler Durden
569	7078	Robert Paulsen
569	7079	Richard Chesler - Regional Manager
569	7080	Intern at Hospital
569	7081	Thomas at Remaining Men Together
569	7082	Group Leader - Remaining Men Together
569	7083	Weeping Woman
569	7084	Leader - Partners in Passivity
569	7085	Marla Singer
569	7086	Speaker - Free and Clear
569	7087	Chloe
569	7088	Airline Check-In Attendant
569	7089	Federated Motor Co. Inspector Bird
569	7090	Federated Motor Co. Inspector Dent
570	7094	Wallace
571	7097	Captain
571	7098	Lieutenant Werner/Correspondent
571	7099	Chief Engineer
571	7100	1st Lieutenant/Number One
571	7101	2nd Lieutenant
571	7102	Chief Quartermaster/Navigator
571	7103	Johann
571	7104	Ullman
571	7105	Hinrich
571	7106	Chief Bosun
571	7107	Ario
571	7108	Pilgrim
571	7109	Frenssen
571	7110	Preacher
571	7111	Schwalle
572	7114	Dorothy Gale
572	7115	Hunk Andrews/Scarecrow
572	7116	Hickory Twicker/Tin Woodman
572	7117	Zeke/Cowardly Lion
572	7118	Professor Marvel/Guardian of the Gates/Cabbie/Soldier/The 'Wizard of Oz'
572	7119	Glinda, the Good Witch of the North
572	7120	Miss Almira Gulch/The Wicked Witch of the West
572	7121	Uncle Henry Gale
572	7122	Nikko, the Wicked Witch's Winged Monkey Familiar
572	7123	Aunt Emily 'Auntie Em' Gale
573	7127	Joe Gillis
573	7128	Norma Desmond
573	7129	Max Von Mayerling
573	7130	Betty Schaefer
573	7131	Sheldrake
573	7132	Morino
573	7133	Artie Green
573	7134	Undertaker
573	7135	First Finance Man
573	7136	Second Finance Man
573	7137	Himself
573	7138	Herself
573	7139	Himself
573	7140	Herself
573	6849	Himself
574	6627	Jake La Motta
574	7144	Vickie La Motta
574	6858	Joey La Motta
574	6863	Salvy
574	7145	Tommy Como
574	7146	Lenore
574	7147	Mario
574	7148	Patsy
574	7149	Guido
574	7150	Toppy
574	7151	Irma
574	6869	Charlie - Man with Como
574	7152	Himself/Radio Announcer
574	7153	Eddie Eagan
574	7154	Emma - Miss 48's
575	7157	The Man With No Name
575	7158	Angel Eyes Sentenza
575	7159	Northern officer
575	7160	Tuco Benedito Pacifico Juan Maria Ramirez
575	7161	Padre Ramirez
575	7162	Maria, the prostitute
575	7163	Storekeeper robbed by Tuco
576	6670	J. J. Gittes
576	7167	Evelyn Cross Mulwray
576	7046	Noah Cross
576	7168	Lieutenant Lou Escobar LAPD
576	7169	Russ Yelburton, Deputy Chief of Water Department
576	7170	Hollis Mulwray
576	7171	Ida Sessions/Evelyn Mulwray Imposter
576	7172	Claude Mulvihill
576	7173	Man with Knife
576	7174	Detective Loach LAPD
576	7175	Lawrence Walsh, Gittes' Operative
576	7176	Duffy, Gittes' Operative
576	7177	Sophie, Gittes' Secretary
576	7178	Lawyer
576	7179	Kahn, Evelyn's Butler
577	7181	Don Lockwood
577	7182	Cosmo Brown
577	7183	Kathy Selden
577	7184	Lina Lamont
577	7185	R. F. Simpson
577	7186	Dancer
577	7187	Roscoe Dexter
577	7188	Zelda Zanders
578	6526	Colonel Walter E. Kurtz
578	6529	Lieutenant Colonel Kilgore
578	7192	Captain Benjamin L. Willard
578	7193	Chef
578	7194	Chief Phillips
578	7195	Lance Johnson
578	6992	Mr. Clean
578	7196	The Photojournalist
578	6630	General Corman
578	6638	Colonel Lucas
578	7197	Civilian
578	6813	Colby
578	7198	Sergeant MP #1
578	7199	Kilgore's Gunner
578	7200	Mike from San Diego
579	7202	Margo Channing
579	7203	Eve Harrington
579	7204	Addison De Witt
579	7205	Karen Richards
579	7206	Bill Simpson
579	7207	Lloyd Richards
579	7208	Max Fabian
579	7209	Phoebe
579	7210	Claudia Caswell
579	6707	Birdie
579	7211	Aged Actor
579	7212	Girl
579	7213	Leading Man
579	7214	Doorman
579	7215	Autograph Seeker
580	7210	Sugar Kane
580	7217	Joe/Josephine
580	7218	Jerry/Daphne
580	7219	Spats Colombo
580	7220	Mulligan
580	7221	Osgood Fielding III
580	7222	Bonaparte
580	7223	Sweet Sue
580	7224	Sig Poliakoff
580	7225	Toothpick Charlie
580	7226	Beinstock
580	7227	Spats' Henchman
580	7228	Spats' Henchman
580	7229	Dolores
580	7230	Nellie
581	7232	Craig Schwartz
581	7233	Lotte Schwartz
581	7234	Derek Mantini
581	7235	Father at Puppet Show
581	7236	Daughter at Puppet Show
581	7237	Woman in Elevator
581	7238	Floris
581	7239	Dr. Lester
581	7240	Maxine
581	7241	Wendy
581	7242	Don
581	7243	Captain Mertin
581	7244	Tiny Woman
581	7245	John Horatio Malkovich
581	7246	Cab Driver
582	7127	Commander/Major Shears
582	6641	Colonel Nicholson
582	6874	Major Warden, Demolition Expert Force 316
582	7249	Colonel Saito
582	7250	Major Clipton, Medical Officer
582	7251	Lieutenant Joyce
582	7252	Colonel Green, Commander Force 316
582	7253	Major Reeves
582	7254	Major Hughes
582	7255	Grogan
582	7256	Baker
582	7257	Nurse Dating Shears at Mount Lavinia Hospital, Ceylon
582	7258	Captain Kanematsu
582	7259	Lieutenant Miura
582	7260	Yai
583	7262	Narrator/The Grinch
584	6654	Tajomaru
584	7265	Masago
584	7266	Takehiro
584	6653	Woodcutter
584	6657	Priest
584	7267	Commoner
584	7268	Medium
584	6658	Policeman
585	7270	Russell Hammond
585	7271	Elaine Miller
585	7272	Penny Lane
585	7273	Jeff Bebe
585	7274	William Miller
585	7275	Anita Miller
585	7276	Young William
585	7277	Dick Roswell
585	7278	Ed Vallencourt
585	7279	Larry Fellows
585	7280	Sapphire
585	7281	Polexia Aphrodesia
585	7282	Beth from Denver
585	7283	Dennis Hope
585	7284	Lester Bangs
586	7286	Dr. David "Dave" Bowman
586	7287	Dr. Frank Poole
586	7288	Dr. Heywood R. Floyd
586	7289	Moonwatcher
586	7290	Smyslov
586	7291	Elena
586	7292	Dr. Halvorsen
586	7293	Michaels
586	7294	HAL 9000
586	7295	Mission Controller
587	7297	Walter Neff
587	7298	Phyllis Dietrichson
587	7299	Barton Keyes
587	7300	Mr. Jackson
587	7301	Lola Dietrichson
587	7302	Mr. Dietrichson
587	7303	Nino Zachetti
587	7304	Edward S. Norton
587	6605	Sam Garlopis
587	7305	Joe Peters
588	6825	Paul Edgecomb
588	7307	Brutus "Brutal" Howell
588	7308	Janice Edgecomb
588	7309	John Coffey
588	7023	Warden Hal Moores
588	7310	Eduard "Del" Delacroix
588	7073	Arlen Bitterbuck
588	7311	Percy Wetmore
588	7312	William "Wild Bill" Wharton
588	6828	Dean Stanton
588	6550	Harry Terwilliger
588	7313	Melinda Moores
588	7314	Toot-Toot
588	7315	Old Paul Edgecomb
588	7316	Elaine Connelly
589	7076	Derek Vinyard
589	7317	Daniel "Danny" Vinyard
589	7318	Doris Vinyard
589	7319	Davina Vinyard
589	7320	Seth
589	7280	Stacey
589	7321	Bob Sweeney
589	7322	Murray
589	7323	Cameron Alexander
589	7324	Dennis Vinyard
589	7325	Lamont
589	7326	Rasmussen
589	7327	Little Henry
589	7328	Lawrence
589	7329	Mitch McCormick
590	7332	King Arthur/God/Middle Head/Guard #2
590	7333	Soldier #2/Customer/Black Knight/Villager #3/Sir Launcelot/French Guard/Knight/Tim the Enchanter
590	7334	Cart-Master/Villager #1/Sir Robin/Guard #1/Concorde/Roger the Shrubber/Brother Maynard
590	7335	Patsy/Green Knight/ Old Man from Scene 24/Bors/Animator
590	7336	Woman/Sir Bedevere/Left Head/Cartoon Scribe/Prince Herbert
590	7337	Soldier #1/Dennis/Villager #2/Narrator/Sir Galahad/Right Head/Head Knight of Ni/Father/Guest #1/Guest #2/Second Brother
590	7338	The Witch
590	7339	Zoot and Dingo
590	7340	Minstrel, + minor role
590	7341	Old Crone
590	7342	Dead person, Historian
590	7343	Historian's Wife
590	7344	Piglet
590	7345	Winston
590	7346	Prisoner
591	7347	Captain/Major Bennett Marco
591	7348	Raymond Shaw/Sgt. Raymond Shaw
591	6763	Rosie Chaney
591	7349	Mrs. Iselin
591	7350	Chunjin (Interpretor/Guide/Raymond Shaw's Valet
591	7351	Senator John Iselin
591	7352	Jocie Jordon
591	7353	Senator Thomas Jordon
591	7354	Dr. Yen Lo
591	7355	Corporal Alvin Melvin
591	7356	Colonel
591	7357	Zilkov
591	7358	Secretary of Defense
591	7359	Holborn Gaines
591	7360	Female Berezovo
592	7363	Annabelle Lee
592	7364	Mr. Lee
592	7365	His Son
592	7366	Captain Anderson
592	7367	General Thatcher
592	7368	Southern General
592	7369	Union General
592	7370	Union General
592	7371	Union General
592	7139	Johnnie Gray
593	7374	Alex DeLarge/Narrator/Prisoner 655321
593	7375	Frank Alexander
593	7376	Chief Guard Barnes
593	7377	Dim/Officer Corby
593	7378	Stage Actor
593	7379	Mrs. Alexander
593	7380	Dr. Brodsky
593	7381	Tramp
593	7382	Joe the Lodger
593	7383	Prison Governor
593	7384	Cat Lady
593	7385	Georgie
593	7386	P.R. Deltoid
593	7387	Prison Chaplain
593	7388	Mrs. DeLarge
594	7390	Lola
594	7391	Manni
594	7392	Lolas Vater
594	7393	Jutta Hansen
594	7394	Herr Schuster
594	7395	Norbert von Au
594	7396	Herr Meier
594	7397	Frau Jager
594	7398	Mike
594	7399	Doris
594	7400	Kassierer Kruse
594	7401	Sanitater
594	7402	Croupier
594	7403	Casino-Manager
594	7404	Casino-Kassiererin
595	6577	Fred C. Dobbs
595	7406	Howard
595	7407	Bob Curtin
595	7408	James Cody
595	7039	Pat McCormick
595	7409	Gold Hat
595	7410	El Presidente
595	7411	El Jefe
595	7412	Pablo
595	7413	Pancho
596	6594	Capt. Hank Quinlan
596	7415	Ramon Miguel 'Mike' Vargas
596	6763	Susan Vargas
596	7416	Sgt. Pete Menzies
596	7417	"Uncle Joe" Grandi
596	7418	Marcia Linnekar
596	7419	Tanya
596	6599	District Attorney Adair
596	7420	Motel Night Manager
596	7421	Manelo Sanchez
596	7422	Risto, Acid Thrower
596	7423	Pancho
596	6762	Al Schwartz, District Attorney's Office
596	7424	Leader of the Gang
596	7425	Gang Member
597	6777	Mr. White/Larry
597	6778	Mr. Orange/Freddy
597	7427	Mr. Blonde/Vic
597	7428	Nice Guy Eddie
597	7429	Mr. Pink
597	7430	Joe Cabot
597	7431	Holdaway
597	7432	Marvin Nash
597	7433	Mr. Blue
597	6790	Mr. Brown
597	7434	Sheriff #1
597	7435	Sheriff #2
597	7436	Sheriff #3
597	7437	Sheriff #4
597	7438	Teddy
598	7439	Clarissa Saunders
598	6704	Jefferson Smith
598	6580	Senator Joseph Harrison Paine
598	7440	Jim Taylor
598	7441	Governor Hubert "Happy" Hopper
598	6843	Diz Moore
598	7442	Chick McGann
598	6845	Ma Smith
598	6849	Senate Majority Leader
598	7443	President of Senate
598	7444	Susan Paine
598	7445	Emma Hopper
598	7446	Senator MacPherson
598	7300	Senator Monroe
598	7447	Senate Minority Leader
599	7450	Lord Hidetora Ichimonji
599	7451	Taro Takatora Ichimonji
599	7452	Jiro Masatora Ichimonji
599	7453	Saburo Naotora Ichimonji
599	7454	Lady Kaede
599	7455	Lady Sue
599	7456	Tango Hirayama
599	7457	Kageyu Ikoma
599	7458	Kyoami
599	7459	Nobuhiro Fujimaki
599	7460	Seiji Ayabe
599	7461	Shumenosuke Ogura
599	7462	Shuri Kurogane
599	7463	Samon Shirane
599	7464	Mondo Naganuma
600	7466	Young William
600	7467	Malcolm Wallace
600	7468	John Wallace
600	7469	Campbell
600	7470	MacClannough
600	7471	Elder Stewart
600	7472	Young Hamish
600	7473	Mother MacClannough
600	7474	Priest No. 1
600	7475	Young Murron
600	7476	Argyle Wallace
600	7477	Longshanks - King Edward I
600	7478	Prince Edward
600	7479	Princess Isabelle
600	7480	Phillip
601	7483	Captain A.J. Dallas
601	7484	Warrant Officer Lieutenant Ellen L. Ripley
601	7485	Navigator J.M. Lambert
601	7314	Engineering Technician S.E. Brett
601	7486	Engineer G.W. Kane
601	7487	Science Officer Ash
601	7488	Chief Engineer J.T. Parker
601	7489	'Alien'
601	7490	Voice of Mother
602	7494	Sir Edmund William Godfrey/Young Pharmacy Kid
602	7495	Mrs. Godfrey
602	7496	Joseph Green
602	7497	Stanley Berry
602	7498	Daniel Hill
602	7499	Firefighter
602	7500	Delmer Darion
602	7501	Reno Security Guard
602	7502	Craig Hansen
602	7503	Forensic scientist
602	7504	Sydney Barringer
602	7505	Arthur Barringer
602	7506	1958 Detective
602	7507	1958 Policeman
602	7508	Young Boy
603	7510	A factory worker
603	7511	A gamin
603	7512	Cafe Proprietor
603	7513	Big Bull
603	7514	Mechanic
603	7515	Burglar
603	7516	Sheriff Couler
603	7517	President of the Electro Steel Corporation
603	7518	Cellmate
603	7519	Minister
603	7520	Minister's Wife
603	7521	J. Widdecombe Billows
603	7522	Juvenile Officer
603	7523	Sheriff Conlon
603	7524	Waiter
604	7525	A Blind Girl
604	7526	Blind Girl's Grandmother
604	7527	An Eccentric Millionaire
604	7517	Eccentric Millionaire's Butler
604	7515	A Prizefighter
604	7510	A Tramp
605	7021	Maximus Decimus Meridius
605	7528	Commodus
605	7529	Lucilla
605	7530	Proximo
605	7531	Marcus Aurelius
605	7532	Gracchus
605	7533	Juba
605	7534	Falco
605	7535	Gaius
605	7536	Quintus
605	7537	Hagen
605	7538	Lucius
605	7539	Cassius
605	7540	Cicero
605	7541	Tigris of Gaul
606	7543	Jerry Lundegaard
606	7429	Carl Showalter
606	7271	Marge Gunderson
606	7544	Gaear Grimsrud
606	7545	Jean Lundegaard
606	7546	Wade Gustafson
606	7547	Scotty Lundegaard
606	7548	Irate Customer
606	7549	Irate Customer's Wife
606	7550	Car Salesman
606	7551	Hooker #1
606	7552	Hooker #2
606	7553	Shep Proudfoot
606	7554	Reilly Diefenbach
606	7555	Morning Show Host
607	7558	Antonio Salieri
607	7559	Wolfgang Amadeus Mozart
607	7560	Constanze Mozart
607	7561	Emanuel Schikaneder
607	7562	Leopold Mozart
607	7563	Katerina Cavalieri
607	7564	Emperor Joseph II
607	7565	Count Orsini-Rosenberg
607	6643	Parody Commendatore
607	7566	Papagena
607	7567	Frau Weber
607	7568	Young Salieri
607	7569	Count Von Struck
607	7570	Karl Mozart
607	7571	Francesco Salieri
608	6638	Rick Deckard
608	7573	Roy Batty
608	7574	Rachael
608	7575	Gaff
608	7576	Bryant
608	7577	Pris
608	7578	J.F. Sebastian
608	7579	Leon
608	6922	Eldon Tyrell
608	7580	Zhora
608	7179	Hannibal Chew, Eyemaker
608	7581	Holden
608	7582	Bear
608	7583	Kaiser
608	7584	Taffey Lewis
609	7587	Christian
609	7588	Faderen/Father
609	7589	Michael
609	7590	Helene
609	7591	Moderen/Mother
609	7592	Pia
609	7593	Mette
609	7594	Kokken/Cook
609	7595	Gbatokai
609	7596	Michelle
609	7597	Toastmasteren/Master of Ceremony
609	7598	Onklen/Uncle
609	7599	Receptionisten/Receptionist
609	7600	Sosteren/Sister
609	7601	Birthe
610	7604	Chief Martin Brody
610	7605	Quint
610	7606	Matt Hooper
610	7607	Ellen Brody
610	7608	Mayor Larry Vaughn
610	7609	Meadows
610	7610	Hendricks
610	7611	Chrissie Watkins
610	7612	Cassidy
610	7613	Estuary Victim
610	7614	Michael Brody
610	7615	Sean Brody
610	7616	Mrs. Kintner
610	7617	Alex M. Kintner
610	7618	Ben Gardner
611	7620	Henry Gondorff
611	7621	Johnny Hooker
611	7605	Doyle Lonnegan
611	7622	Lieutenant William Snyder
611	7623	J.J. Singleton
611	7624	Billie
611	7625	Kid Twist
611	7626	Eddie Niles
611	7627	F.B.I. Agent Polk
611	7628	Erie Kid
611	7629	Loretta Salino
611	7630	Luther Coleman
611	7631	Mottola
611	7632	Floyd
611	7633	Bodyguard
612	7637	Antonio Ricci, the father
612	7638	Bruno Ricci, the son
612	7639	Maria Ricci, the mother
612	7640	Baiocco
612	7641	The Thief
612	7642	The Beggar
612	7643	The charitable Lady
613	7647	Leon
613	7648	Norman Stansfield
613	7649	Mathilda
613	7650	Tony
613	7651	Malky
613	7652	Stansfield's Men
613	7653	Stansfield's Men
613	7654	Stansfield's Men
613	7655	Stansfield's Man
613	7656	Mathilda's Father
613	7657	Mathilda's Mother
613	7658	Mathilda's Sister
613	7659	Mathilda's Brother
613	7660	Fatman
613	7661	Tonto
614	6527	Lowell Bergman
614	7021	Jeffrey Wigand
614	7663	Mike Wallace
614	7664	Liane Wigand
614	7665	Don Hewitt
614	7666	Sharon Tiller
614	7667	Debbie De Luca
614	7668	Eric Kluster
614	7669	Richard Scruggs
614	7670	Ron Motley
614	7671	Helen Caperelli
614	7672	Thomas Sandefur
614	7673	John Scanlon
614	7674	Mrs. Williams
614	7675	Barbara Wigand
615	7679	Rufus T. Firefly
615	7680	Pinky
615	7681	Chicolini
615	7682	Bob Rolland
615	7683	Mrs. Teasdale
615	7684	Vera Marcal
615	7685	Trentino
615	7686	Zander
615	6589	Agitator
615	7687	Prosecutor
615	7688	Street Vendor
616	7692	Jill McBain
616	6888	Frank
616	7693	Cheyenne
616	7694	The Man
616	7695	Morton
616	7696	Sam
616	7697	Stony
616	7698	Knuckles
616	6690	Sheriff
616	7699	Brett McBain
616	7700	Barman
617	7703	Alvin Straight
617	7704	Rose Straight
617	7705	Tom the John Deere Dealer
617	7706	Thorvald Olsen
617	7707	Harold Olsen
617	7314	Lyle Straight
617	7708	Dorothy
617	7709	Bud
617	7710	Sig
617	7711	Nurse
617	7712	Doctor Gibbons
617	7713	Brenda
617	7714	Pete
617	7715	Apple
617	7716	Bus Driver
618	7720	Alvy Singer
618	6528	Annie Hall
618	7721	Rob
618	7722	Allison
618	7723	Tony Lacey
618	7724	Pam
618	7725	Robin
618	7726	Mom Hall
618	6784	Duane Hall
618	7727	Dad Hall
618	7728	Grammy Hall
618	7729	Alvy's Dad
618	7730	Alvy's Mom
618	7731	Alvy at 9
618	7732	Alvy's Aunt
619	6526	Terry Malloy
619	7734	Father Barry
619	6889	Johnny Friendly
619	7735	Charley Malloy/Charley The Gent
619	7736	K. O. Dugan
619	7737	Glover
619	7738	Big Mac
619	7739	Truck
619	7740	Tullio
619	7044	'Pop' Doyle
619	7741	Mutt
619	6540	Moose
619	7742	Luke
619	7743	Jimmy
619	7744	Barney
620	7484	Lieutenant Ellen Ripley
620	7747	Rebecca "Newt" Jorden
620	7748	Corporal Dwayne Hicks
620	7749	Weyland-Yutani Corporation Advisor Carter J. Burke
620	7750	Science Officer L. Bishop
620	7751	Communications Technician Private W. Hudson
620	7752	Squadron Commander Lieutenant S. Gorman
620	7753	Smart Gunner Private J. Vasquez
620	7754	Ground Troup Commander Sergeant A. Apone
620	6548	Smart Gunner Private M. Drake
620	7755	Private R. Frost
620	7756	Drop Ship Pilot Corporal C. Ferro
620	7757	Drop Ship Co-Pilot/Weapons Officer Private D. Spunkmeyer
620	7758	Medical Officer Corporal C. Dietrich
620	7759	Private T. Crowe
621	6654	Sanjuro Kuwabatake
621	7761	Gonji the Sake Seller
621	6660	Tazaemon
621	6653	Tokuemon
621	7762	Seibei
621	7763	Orin
621	7764	Yoichiro
621	7765	Ushitora
621	7450	Unosuke
621	6658	Inokichi
621	7766	Hansuke
621	7767	Kuma
621	6664	Kohei
621	7768	Nui
621	7769	Homma
622	7771	Captain Virgil Hilts "The Cooler King"
622	7772	Flight Lieutenant Bob Hendley "The Scrounger"
622	7773	Squadron Leader Roger Bartlett "Big X"
622	7250	Group Captain Rupert Ramsey "The SBO"
622	7694	Flight Lieutenant Danny Willinski "The Tunnel King"
622	7774	Flight Lieutenant Colin Blythe "The Forger"
622	7775	Flying Officer Louis Sedgwick "The Manufacturer"
622	7776	Von Luger "The Kommandant"
622	7777	Lieutenant-Commander Eric Ashley-Pitt "Dispersal"
622	7778	Flight Lieutenant MacDonald "Intelligence"
622	7779	Flight Lieutenant William Dickes "The Tunneller"
622	7780	Flying Officer Ives "The Mole"
622	7781	Flight Lieutenant Cavendish "The Surveyor"
622	7782	Werner "The Ferret"
622	7783	Goff
623	6577	Charlie Allnut
623	7787	Rose Sayer
623	7788	Reverend Samuel Sayer
623	6692	Captain of Louisa
623	7789	First Officer
623	7790	Second Officer
623	7791	First Officer of Shona
623	7792	Second Officer of Shona
624	6543	Detective William Somerset
624	7795	Dead Man
624	7077	Detective David Mills
624	7796	Detective Taylor
624	7797	Tracy Mills
624	7798	Officer Davis
624	7799	Gluttony Victim
624	7800	Dr. O'Neill
624	7801	Coroner
624	6986	Police Captain
624	7802	Workman
624	7803	Cab Driver
624	7804	George, Library Night Guard
624	7805	Library Guard
624	7806	Library Guard
625	7807	Westley, aka "The Dread Pirate Roberts"
625	7808	Inigo Montoya
625	7809	Prince Humperdinck
625	7810	Count Rugen
625	6979	Vizzini
625	7811	Fezzik
625	7812	The Grandson
625	7813	Buttercup, The Princess Bride
625	7814	Grandpa
625	7815	The Impressive Clergyman
625	7816	The Albino
625	7722	Valerie
625	7817	Miracle Max
625	7818	The Queen
625	7819	The Ancient Booer
626	7822	Manuela
626	6910	Huma Rojo
626	7823	Nina
626	7824	Agrado
626	7825	Sister Rosa
626	7826	Rosa's Mother
626	7827	Rosa's Father
626	7828	Lola
626	7829	Esteban
626	7830	Mario
626	7831	Doctor in "Streetcar Named Desire"
627	7833	Annie Hughes
627	7834	Dean McCoppin
627	6830	The Iron Giant
627	7835	Marv Loach/Floyd Turbeaux
627	7836	Mrs. Tensedge
627	7837	Kent Mansley
627	7838	General Rogard
627	7839	Hogarth Hughes
627	7576	Earl Stutz
627	7840	Various
627	7841	Train Engineer #1
627	7842	Additional voices
627	7843	Additional voices
627	7844	Additional voices
627	7845	Additional voices
628	7848	Jons
628	7849	Death
628	7850	Jof
628	7851	Antonius Block
628	7852	Mia
628	7853	Lisa
628	7854	Tyan the Witch
628	7855	Block's Wife
628	7856	Girl
628	7857	Raval
628	7858	The Monk
628	7859	Blacksmith Plog
628	7860	Church Painter
628	7861	Jonas Skat
629	7863	Guy Haines
629	7864	Anne Morton
629	7865	Bruno Antony
629	6795	Senator Morton
629	6760	Barbara Morton
629	7866	Miriam Haines
629	7867	Mrs. Antony
629	7868	Mr. Antony
629	7869	Captain Turley
629	7870	Professor Collins
629	7871	Mrs. Cunningham
629	7872	Hennessy
630	7875	Karl Childers
630	7876	Doyle Hargraves
630	7877	Charles Bushman
630	7878	Vaughan Cunningham
630	7879	Frank Wheatley
630	7880	Linda Wheatley
630	7881	Jerry Woolridge
630	6529	Mr. Childers
630	7882	Bill Cox
630	7883	Scooter Hodges
630	7884	Melinda
630	7885	Marsha Dwiggins
630	7886	Theresa Evans
630	7887	Melvin
630	7888	Morris
631	7889	Colonel Robert Gould Shaw
631	7890	Trip
631	7807	Major Cabot Forbes
631	6543	Sergeant Major John Rawlins
631	7891	Jupiter Sharts
631	7892	Thomas Searles
631	7893	Sergeant Major Mulcahy
631	7894	Charles Fessenden Morse
631	7895	Henry Sturgis Russell
631	7896	Governor John Albion Andrew
631	6544	General Harker
631	7897	Colonel James M. Montgomery
631	7898	Edward L. Pierce
631	7899	Mute Drummer Boy
631	7900	General George Crockett Strong
632	7904	Ashitaka
632	7905	San
632	7906	Lady Eboshi
632	7907	Jiko Bou
632	7908	Moro
632	7909	Koroku
632	7910	Gonza
632	7911	Toki
632	7912	Oracle
632	7913	Okkoto
633	7510	Hynkel, Dictator of Tomania/A Jewish Barber
633	7916	Napaloni, Dictator of Bacteria
633	7917	Schultz
633	7918	Garbitsch
633	7919	Herring
633	7920	Madame Napaloni
633	7921	Bacterian Ambassador
633	7511	Hannah
633	7922	Mr. Jaeckel
633	7923	Mrs. Jaeckel
633	7924	Mr. Mann
633	7925	Mr. Agar
633	7514	Barber's Customer
634	7926	Will Kane
634	6843	Jonas Henderson
634	7927	Harvey Pell
634	7928	Helen Ramirez
634	6705	Amy Kane
634	7929	Percy Mettrick
634	7930	Martin Howe
634	7931	Sam Fuller
634	7932	Frank Miller
634	7933	Mildred Fuller
634	7934	Minister
634	7935	Cooper
634	7158	Jack Colby
634	7936	James Pierce
634	7937	Ben Miller
635	7941	Ethan Edwards
635	7942	Martin Pawley
635	6752	Laurie Jorgensen
635	6847	Reverend Captain Samuel Johnson Clayton
635	7943	Debbie Edwards
635	6588	Lars Jorgensen
635	7944	Mrs. Jorgensen
635	7945	Chief Cicatrice
635	7946	Charlie McCorry
635	7947	Brad Jorgensen
635	7948	Emilio Figueroa
635	7949	Mose Harper
635	7950	Wild Goose Flying in the Night Sky
635	7951	Aaron Edwards
635	7952	Martha Edwards
636	7956	Milly Stephenson
636	7957	Al Stephenson
636	7958	Fred Derry
636	7959	Peggy Stephenson
636	7960	Marie Derry
636	7961	Wilma Cameron
636	7962	Butch Engle
636	7963	Homer Parrish
636	7038	Hortense Derry
636	7964	Pat Derry
636	6599	Mr. Milton
636	7965	Mrs. Parrish
636	7966	Mr. Parrish
636	7967	Cliff Scully
636	7968	Mrs. Cameron
637	6791	C. K. Dexter Haven
637	7787	Tracy Lord
637	6704	Macaulay Connor
637	7972	Elizabeth Imbrie
637	7973	George Kittredge
637	7974	Uncle Willie
637	7975	Seth Lord
637	7976	Margaret Lord
637	7977	Dinah Lord
637	7918	Sidney Kidd
637	7978	Edward
637	7979	Thomas
638	7983	Private Joker /Narrator
638	7984	Animal Mother
638	7985	Private Gomer Pyle
638	6986	Gunnery Sergeant Hartman, Drill Instructor
638	7986	Private Eightball
638	7987	Private Cowboy
638	7988	Private Rafterman
638	7989	Lieutenant Walter J. "Touchdown" Tinoshky
638	7990	Lieutenant Lockhart
638	7991	Crazy Earl
638	7992	Pogue Colonel
638	7993	Private Payback
638	7994	Doc Jay
638	7995	Door Gunner
638	7996	Lieutenant Cleves
639	7999	Mrs. Robinson
639	8000	Benjamin Braddock
639	8001	Elaine Robinson
639	8002	Mr. Braddock
639	7608	Mr. Robinson
639	8003	Mrs. Braddock
639	8004	Carl Smith
639	8005	Mr. McGuire
639	8006	Mr. McCleery
639	6942	Mrs. Singleman
639	8007	Hotel Desk Clerk
639	7867	Miss De Witt
639	8008	Woman on Bus
640	8012	George Fortescu Maximillian 'Maxim' de Winter
640	8013	The Second Mrs. de Winter
640	7204	Jack Favell
640	8014	Mrs. Danvers
640	8015	Beatrice Lacy
640	8016	Major Giles Lacy
640	8017	Frank Crawley
640	8018	Colonel Julyan
640	8019	Coroner
640	8020	Mrs. Edythe Van Hopper
640	8021	Ben
640	6795	Dr. Baker
640	8022	Frith
640	8023	Tabbs
640	8024	Chalcroft
641	6627	Michael
641	6539	Stan
641	8027	Steven
641	6784	Nick Chevoteravich
641	8028	Linda
641	8029	John Welsh
641	8030	Axel
641	8031	Steven's Mother
641	8032	Angela
641	8033	Julien
641	8034	Axel's Girl
641	8035	Bridesmaid
641	8036	Stan's Girl
641	8037	Linda's Father
641	8038	Bandleader
642	7094	Wallace
642	8040	Wendolene Ramsbottom
643	8041	Peter Warne
643	8042	Ellie Andrews
643	8043	Alexander Andrews
643	8044	Oscar Shapeley
643	8045	King Westley
643	8046	Danker
643	8047	Zeke
643	8048	Zeke's Wife
643	8049	Joe Gordon
644	6670	Jack Torrance
644	7724	Winifred "Wendy" Torrance
644	8052	Danny Torrance
644	6677	Dick Hallorann
644	8053	Stuart Ullman
644	8054	Delbert Grady
644	6922	Lloyd
644	8055	Doctor
644	8056	Larry Durkin
644	8057	Young Woman in Bath
644	8058	Old Woman in Bath
644	8059	Bill Watson
644	8060	Forest Ranger 1
644	8061	Forest Ranger 2
644	8062	Grady Daughter
645	7787	Susan Vance
645	6791	Dr. David Huxley
645	8064	Major Horace Applegate
645	8065	Constable Slocum
645	8066	Mr. Gogarty
645	8067	Mrs. Elizabeth Carlton Random
645	8068	Dr. Fritz Lehman
645	8069	Mrs. Hannah Gogarty
645	8070	Alexander Peabody
645	8071	Mrs. Lehman
645	8072	Alice Swallow
645	8073	Elmer
646	6791	T.R. Devlin
646	6578	Alicia Huberman
646	6580	Alexander Sebastian
646	7685	Capt. Paul Prescott
646	8077	Madame Sebastian
646	8078	Dr. Anderson
646	8079	Walter Beardsley
646	8080	Eric Mathis
646	8081	Joseph
646	8082	Mr. Hopkins
646	8083	Commodore
646	8084	Dr. Barbosa
646	8085	Emil Hupka
646	8086	Ethel
647	8088	Antoine Doinel
647	8089	Gilberte Doinel, the Mother
647	8090	Julien Doinel
647	8091	'Petite Feuille', the French teacher
647	8092	Mr. Bigey
647	8093	Rene
647	8094	Boy
647	8095	Boy
647	8096	Abbou
647	8097	Boy
647	8098	Boy
647	8099	Boy
647	8100	Boy
647	8101	Boy
647	8102	Boy
648	8104	Lieutenant Marechal
648	8105	Else, the farm woman
648	8106	Captain de Boieldieu
648	7129	Captain von Rauffenstein
648	8107	The Showoff
648	8108	An Officer
648	8109	Sergeant Arthur
648	8110	The Teacher
648	8111	Lieutenant Demolder
648	8112	The engineer
648	8113	Lieutenant Rosenthal
649	6888	Tom Joad
649	8116	Ma Joad
649	8117	Reverend Jim Casey
649	7121	Grampa Joad
649	8118	Rosasharn Joad Rivers
649	8119	Old Tom 'Pa' Joad
649	8120	Al
649	6588	Muley Graves
649	8121	Connie Rivers
649	8122	Gramma
649	8123	Noah
649	8124	Uncle John
649	8125	Winfield Joad
649	8126	Ruth Joad
649	8127	Thomas
650	7218	C. C. Baxter
650	8130	Fran Kubelik
650	7297	Jeff D. Sheldrake
650	7623	Joe Dobisch
650	8131	Doctor Dreyfuss
650	8132	Al Kirkeby
650	8133	Margie MacDougall
650	7223	Sylvia
650	8134	Mrs. Mildred Dreyfuss
650	8135	Karl Matuschka
650	8136	The Blonde
650	8137	Mr. Vanderhof
650	8138	Mr. Eichelberger
650	8139	Miss Olsen
651	7620	Butch Cassidy
651	7621	The Sundance Kid
651	8001	Etta Place
651	8140	Percy Garris
651	6952	Bike Salesman
651	8141	Sheriff Steve Bledsoe
651	8142	Woodcock
651	7836	Agnes
651	8143	Harvey Logan
651	8144	Marshal
651	8145	Macon
651	8146	Large Woman
651	8147	News Carver
651	8148	Fireman
651	7632	Flat Nose Curry
652	7415	Judah Ben-Hur
652	6874	Quintus Arrius
652	8149	Esther
652	8150	Messala
652	8151	Sheik Ilderim
652	8152	Miriam
652	7961	Tirzah
652	8153	Simonides
652	8154	Balthasar
652	8155	Pontius Pilate
652	8156	Drusus
652	8157	Tiberius
652	7252	Sextus
653	8041	Rhett Butler
653	8160	Scarlett O'Hara
653	8161	Ashley Wilkes
653	8162	Melanie Hamilton Wilkes
653	8163	Mammy
653	6843	Gerald O'Hara
653	8164	Ellen O'Hara
653	8165	Suellen O'Hara
653	8166	Carreen O'Hara
653	8167	Stuart Tarleton
653	8168	Brent Tarleton
653	8169	Pork
653	8170	Prissy
653	8171	Jonas Wilkerson, the overseer
653	8172	Big Sam, the foreman
654	6577	Philip Marlowe
654	8175	Vivian Sternwood Rutledge
654	8176	Eddie Mars
654	8177	Carmen Sternwood
654	8178	Book Seller Acme Book Shop
654	8179	Mona Mars
654	8180	Bernie Ohls, Chief Inspector District Attorney's Office
654	8181	General Sternwood
654	8182	Norris, the Butler
654	8183	Canino
654	7041	Harry Jones
654	8184	Joe Brody
655	8186	John Fredersen
655	8187	Freder
655	8188	Maria/The Robot
655	8189	Rotwang
655	8190	Slim
655	7052	Josaphat
655	8191	Grot
656	7510	The Lone Prospector
656	8192	Big Jim McKay
656	8193	Black Larson
656	8194	Georgia
656	7512	Hank Curtis
657	8195	Valentine
657	8196	The Judge
657	8197	Karin
657	8198	Auguste
657	8199	Photographer
657	8200	Veterinary surgeon
657	8201	Barman
657	8202	Record Dealer
657	8203	Neighbour
657	8204	Woman
657	8205	Karin's Friend
657	8206	Theatre Manager
657	8207	Drug Dealer
658	7720	Isaac Davis
658	6528	Mary Wilke
658	8210	Yale
658	8211	Tracy
658	8028	Jill
658	8212	Emily
658	8213	Connie
658	8214	Dennis
658	8215	Party Guest
658	8216	Party Guest
658	8217	Party Guest
658	8218	Guest of Honor
658	8219	Television Director
658	8220	Television Producer
658	8221	TV Actor No. 1
659	8222	Rev. Harry Powell
659	8223	Willa Harper
659	8224	Rachel Cooper
659	8225	Birdie Steptoe
659	8226	Icey Spoon
659	8227	Ben Harper
659	8228	Walt Spoon
659	8229	John Harper
659	8230	Pearl Harper
659	8231	Ruby
660	6637	Luke Skywalker
660	6638	Han Solo
660	6639	Princess Leia Organa
660	6766	Lando Calrissian
660	6642	C-3PO
660	6644	Chewbacca
660	8233	Anakin Skywalker
660	8234	Emperor Palpatine
660	6767	Yoda
660	6693	Darth Vader
660	6645	Darth Vader
660	6641	Ben Kenobi
660	6643	R2-D2/Paploo
660	8235	Moff Jerjerrod
660	8236	Admiral Piett
661	8239	Mrs. Parker
661	8240	Mr. Parker
661	8241	Ralph 'Ralphie' Parker
661	8242	Randy Parker
661	8243	Flick
661	8244	Schwartz
661	8245	Miss Shields
661	8246	Grover Dill
661	8247	Scott Farcus
661	8248	Santa Claus
661	8249	Ming the Merciless
661	8250	Flash Gordon
661	8251	Tree Man
661	8252	Freight Man
661	8253	Head Elf
662	8256	Maria
662	8257	Spaccafico
662	8258	Anna
662	8259	Usher
662	8260	Salvatore
662	8261	Maria
662	8262	Elena
662	8263	Father Adelfio
662	8264	Salvatore
662	8265	Blacksmith
662	8266	Village Idiot
662	8267	Lia
662	8268	Peppino's Father
662	8269	Salvatore
662	8270	Elena
663	8273	Paul Baumer
663	8274	Katczinsky
663	8275	Himmelstoss, Postman/Sergeant
663	8276	Tjaden
663	8277	Kantorek
663	8278	Albert
663	8279	Franz Kemmerick
663	8280	Leer
663	8281	Peter
663	8282	Behm
663	8283	Muller
663	7518	Westhus
663	7256	Detering
663	8284	Lieutenant Bertinck
663	8285	Mrs. Baumer
664	8160	Blanche DuBois
664	6526	Stanley Kowalski
664	8289	Stella Kowalski
664	7734	Mitch
664	6540	Steve
664	8290	Pablo
664	8291	Eunice
664	8292	A Collector
664	8293	A Doctor
664	8294	The Matron
664	8295	Mexican Woman
664	8296	A Sailor
665	8298	Salior
665	8299	Woman With Baby Carriage
665	8300	Woman With Pince-nez
665	8301	Odessa Citizen
666	6689	Gen. George S. Patton Jr.
666	7734	General Omar N. Bradley
666	7376	Field Marshal Sir Bernard Law Montgomery
666	6805	Major General Walter Bedell Smith
666	8305	Captain Chester B. Hansen
666	8306	Colonel Gaston Bell
666	8307	Major General Lucian K. Truscott
666	7355	Sergeant William G. Meeks
666	8308	Lieutenant Colonel Henry Davenport
666	8309	Colonel General Alfred Jodl
666	7581	Captain Richard N. Jenson
666	8310	Captain Oskar Steiger
666	8311	Lieutenant Colonel Charles R. Codman
666	8312	Brigadier General Hobart Carver
666	8313	Field Marshal Erwin Rommel
667	6791	Mortimer Brewster
667	8317	Elaine Harper/Elaine Brewster
667	8318	Jonathan Brewster
667	8319	Officer Patrick 'Pat' O'Hara
667	8320	Mr. Witherspoon
667	6583	Dr. Einstein
667	8225	Lt. Rooney
667	8321	Aunt Abby Brewster
667	8322	Aunt Martha Brewster
667	8323	Theodore 'Teddy Roosevelt' Brewster
667	7446	Reverend Harper
667	8324	Officer Brophy
667	8325	Taxi Cab Driver
667	8176	Officer Saunders
667	8326	Judge Cullman
668	7620	Lucas Jackson
668	8329	Dragline
668	8330	Society Red
668	8331	Koko
668	8332	Loudmouth Steve
668	8140	Captain
668	8333	Arletta
668	8334	Carr
668	8335	Boss Godfrey
668	8336	Boss Paul
668	8337	Rabbitt
668	8338	Blind Dick
668	8339	Boss Shorty
668	8340	Tattoo
668	7196	Babalugats
669	6791	Walter Burns
669	8343	Hildy Johnson
669	8344	Bruce Baldwin
669	8345	Sheriff Hartwell
669	7300	Murphy
669	8346	Bensinger
669	8347	Endicott
669	8348	Mayor
669	8044	McCue
669	8349	Wilson
669	8180	Sanders
669	8350	Louis
669	8351	Duffy
669	6588	Earl Williams
669	8352	Molly Malloy
670	6825	Woody
670	6974	Buzz Lightyear
670	6977	Mr. Potato Head
670	6978	Slinky Dog
670	6979	Rex
670	6980	Hamm
670	6981	Bo Peep
670	6983	Andy Davis
670	8354	Sid Phillips
670	6984	Mrs. Davis
670	6986	Sergeant
670	8355	Hannah Phillips
670	8356	T.V. Announcer
670	7842	Additional Voice
670	8357	Additional Voice
671	7157	Bill Munny
671	8359	Little Bill Daggett
671	6543	Ned Logan
671	7531	English Bob
671	8360	The "Schofield Kid"
671	8361	W.W. Beauchamp
671	8362	Strawberry Alice
671	8363	Delilah Fitzgerald
671	8364	Quick Mike
671	8365	Davey Bunting
671	8366	Skinny Dubois
671	8367	Little Sue
671	8368	Silky
671	8369	Faith
671	8370	Cross Creek Kate
672	8372	Martha
672	8373	George
672	8374	Nick
672	8375	Honey
673	6785	Detective John McClane
673	8377	Holly M. Gennero McClane
673	8378	Sergeant Al Powell
673	8379	Dwayne T. Robinson
673	8380	Argyle
673	8381	Richard Thornburg
673	8382	Harry Ellis
673	8383	Joseph Takagi
673	8384	Hans Gruber
673	8385	Karl
673	8386	Franco
673	8387	Tony
673	8388	Theo
673	8389	Alexander
673	8390	Marco
674	8394	Dr. Friedrich von Frankenstein
674	7010	The Monster
674	8395	Igor
674	8396	Elizabeth
674	7836	Frau Blucher
674	8397	Inga
674	8144	Inspector Kemp
674	8398	Herr Falkstein
674	8399	Mr. Hilltop
674	8400	Medical Student
674	8401	Sadistic Jailor
674	8402	Second Village Elder
674	8403	Insp. Kemp's Aide
674	8404	Gravedigger
674	8405	Gravedigger
675	7127	Pike Bishop
675	8408	Dutch Engstrom
675	8409	Deke Thornton
675	8410	Sykes
675	8411	Lyle Gorch
675	8412	Angel
675	8413	Tector Gorch
675	8414	Mapache
675	8140	Coffer
675	8415	T.C
675	8416	Pat Harrigan
675	8417	Crazy Lee
675	8418	Mayor Wainscoat
675	8419	Ross
675	8420	Lieutenant Zamorra
676	7620	'Fast' Eddie Felson
676	8423	Minnesota Fats
676	8424	Sarah Packard
676	6689	Bert Gordon
676	8425	Charlie Burns
676	7608	Oames Findley
676	8426	Big John
676	8427	Preacher
676	8428	Bartender
676	8429	Turk
676	8430	Cashier at Bennington's
676	8431	Score Keeper
676	8432	Waitress
676	8433	Young Hustler
676	7155	Bartender
677	8436	The Terminator
677	8437	Sarah Connor
677	7317	John Connor
677	8438	T-1000
677	8439	Dr. Peter Silberman
677	8440	Miles Bennett Dyson
677	8441	Tarissa Dyson
677	8442	Enrique Salceda
677	8443	Tim
677	7753	Janelle Voight
677	8444	Todd Voight
677	8445	Sarah Connor Double
677	8446	Douglas
677	8447	Cigar-Smoking Biker
677	8448	Trucker
678	8359	Harry Caul
678	6539	Stan
678	8450	William P. "Bernie" Moran
678	7193	Mark
678	8451	Ann
678	8452	Paul
678	8453	Meredith
678	8397	Amy
678	6638	Martin Stett
678	8454	Receptionist
678	8455	The Mime
678	8456	Lurleen
679	8457	Professor Isak Borg
679	7852	Sara
679	8458	Marianne Borg
679	7848	Evald Borg
679	8459	Agda
679	8460	Anders
679	8461	Viktor
679	8462	Isak's Mother
679	8463	Mrs. Alman
679	8464	Karin, Isak's wife
679	8465	Aunt Olga
679	8466	Sten Alman
679	7851	Henrik akerman
679	7859	Karin's lover
679	8467	Uncle Aron
680	7127	Sefton
680	8468	Lieutenant Dunbar
680	8469	Oberst Von Scherbach
680	8470	'Animal' Stosh
680	8471	Harry Shapiro
680	8472	Hoffy
680	8227	Price
680	8473	Duke
680	8474	Schulz
680	8475	Manfredi
680	8476	Jonson
680	8477	Joey
680	8478	Blondie
680	8479	Marko
680	8480	Cookie
681	7679	Otis B. Driftwood
681	7681	Fiorello
681	7680	Tomasso
681	8483	Rosa Castaldi
681	8484	Ricardo Baroni
681	8485	Rudolpho Lassparri
681	8474	Herman Gottlieb
681	7683	Mrs. Claypool
681	8486	Captain
681	8487	Detective Henderson
682	8491	Staff Sergeant Bob Barnes
682	8492	Sergeant Elias
682	8493	Private Chris Taylor/Narrator
682	8494	Big Harold
682	8495	Private Rhah
682	8496	Sergeant Red O'Neill
682	8497	Sal
682	8498	Bunny
682	8499	Junior
682	8500	Private King
682	8501	Private Lerner
682	8502	Tex, Machine Gunner
682	8503	Lieutenant Wolfe
682	8504	Private Crawford
682	8505	Private Warren
683	8507	Sean Maguire
683	6833	Will Hunting
683	8508	Chuckie
683	8509	Gerald Lambeau
683	8510	Skylar
683	8511	Morgan
683	8512	Billy
683	8513	Tom
683	8514	Krystyn
683	8515	Cathy
683	8516	Barbershop Quartet #1
683	8517	Barbershop Quartet #2
683	8518	Barbershop Quartet #3
683	8519	Barbershop Quartet #4
683	8520	MIT Student
684	8522	Tom
684	8523	Soap
684	8524	Eddie
684	8525	Bacon
684	8526	Winston
684	8527	J
684	8528	Charles
684	8529	Willie
684	8530	Big Chris
684	8531	Barry the Baptist
684	8532	Little Chris
684	8533	Hatchet Harry
684	8534	Dog
684	8535	Plank
684	8536	Paul
685	6807	Dr. Frederick Treves
685	7486	John Merrick
685	7999	Mrs. Kendal
685	8538	Carr Gomm
685	8539	Mothershead
685	8540	Bytes
685	8541	Night Porter
685	8542	Mrs. Treves
685	8543	Princess Alex
685	8544	Fox
685	8523	Bytes's Boy
685	8545	Nora
685	8546	Merrick's Mother
685	8547	Fairground Bobby
685	8548	Fat Lady
686	8551	Philip Henslowe
686	8552	William Shakespeare
686	8553	Hugh Fennyman
686	7797	Viola De Lesseps/Thomas Kent
686	8554	Lambert
686	8555	Frees
686	8556	Makepeace, the Preacher
686	8557	Dr. Moth
686	8558	Will Kempe
686	8559	Richard Burbage
686	8560	Rosaline
686	7561	Tilney, Master of the Revels
686	8561	Queen Elizabeth
686	8562	Lady in Waiting
686	8563	Lady in Waiting
687	6916	Spartacus
687	8012	Marcus Licinius Crassus
687	8567	Varinia
687	8232	Sempronius Gracchus
687	8568	Lentulus Batiatus
687	6753	Caius Julius Caesar
687	8569	Helena Glabrus
687	8570	Crixus
687	8571	Tigranes Levantus
687	8572	Marcus Publius Glabrus
687	8573	Marcellus
687	8574	Claudia Marius
687	8575	David
687	7697	Draba
687	6674	Ramon
688	8578	Selma
688	8579	Kathy
688	7307	Bill
688	7544	Jeff
688	8580	Dr. Porkorny
688	8581	Oldrich Novy
688	8582	Samuel
688	8583	Linda
688	8584	Norman
688	8585	Gene
688	8586	District Attorney
688	8587	Brenda
688	8588	Morty
688	8589	Judge
688	8590	Receptionist
689	8592	Sam Lowry
689	6627	Harry Tuttle
689	8593	Mrs. Ida Lowry
689	7487	Mr. Kurtzmann
689	8594	Spoor
689	7337	Jack Lint
689	8595	Mr. Warrenn
689	8596	Mr. Helpmann
689	8597	Jill Layton
689	8598	Dr. Jaffe
689	8599	Mrs. Terrain
689	8600	Lime
689	8601	Dowser
689	8602	Shirley
689	8603	Spiro
690	8604	Brandon Teena
690	8605	Lana Tisdel
690	8606	John Lotter
690	8607	Marvin Thomas "Tom" Nissen
690	8608	Candace
690	8520	Kate
690	8609	Lana's Mom
690	8365	Brian
690	8610	Lonny
690	8611	Nicole
690	8612	Trucker
690	8613	Kwik Stop Cashier
690	8614	Trucker in Kwik Stop
690	8615	April
690	8616	Judge
691	6627	Noodles
691	8619	Max
691	8620	Deborah
691	8621	Jimmy O'Donnell
691	8622	Carol
691	8623	Joe
691	6858	Frankie Monaldi
691	7650	Police Chief Aiello
691	8624	Cockeye
691	8625	Patsy
691	8626	Eve
691	8627	Fat Moe
691	8628	Van Linden
691	8629	Sharkey
691	6631	Chicken Joe
692	6638	Dr. Henry 'Indiana' Jones, Jr.
692	8632	Professor Henry Jones, Sr.
692	6725	Marcus Brody
692	8633	Dr. Elsa Schneider
692	6723	Sallah
692	8634	Walter Donovan
692	8635	Young Indiana Jones
692	8636	Vogel
692	8637	Kazim
692	8638	Grail Knight
692	8639	Fedora
692	8640	Sultan
692	8641	Young Henry
692	8642	Panama Hat
692	8643	Mrs. Donovan
693	7487	Mitchell Stephens
693	8645	Wendell Walker
693	8646	Dolores Driscoll
693	8647	Schwartz
693	8648	Billy Ansel
693	8649	Abbott Driscoll
693	8650	Mary Burnell
693	8651	Wanda Otto
693	8652	Sam Burnell
693	8653	Allison
693	8654	Hartley Otto
693	8655	Nicole Burnell
693	8656	Risa Walker
693	8657	Zoe Stephens
693	8658	Stewardess
694	8661	Fetcher the Rat
694	8662	Mac
694	7482	Rocky Rhodes the Rhode Island Red Rooster
694	8663	Mr. Tweedy
694	8664	Babs
694	8665	Mrs. Tweedy
694	8666	Ginger
694	8667	Nick the Rat
694	8668	Bunty
694	8669	Fowler
694	8670	Circus Man
694	8671	Chicken
694	8672	Chicken
694	8673	Chicken
695	6533	Johnny Clay
695	8675	Fay
695	8676	Val Cannon
695	8677	Marvin Unger
695	8678	Randy Kennan
695	8679	Sherry Peatty
695	7041	George Peatty
695	8680	Mike O'Reilly
695	7355	Parking Attendant
695	6929	Nikki Arane
695	8681	Maurice Oboukhoff
695	8682	Leo
695	8683	Joe
695	7968	Ruthie O'Reilly
696	8684	Dr. Sievers, Gemeindearzt/Town Doctor
696	8685	Matrose/Sailor
696	8686	Professor Bulwer
696	8687	Makler Knock/Broker Knock
696	8688	Maat/First mate
696	8689	Wirt/Innkeeper
696	8690	Lucy Westrenka
696	8691	Kapitan/Captain
696	8692	Westrenka
696	8693	Graf Orlok /Count Orlok
696	8694	Ellen Hutter
696	8695	Matrose/Sailor
696	8696	Matrose/Sailor
696	8697	Arzt im Hospital/Doctor in Hospital
696	8698	Thomas Hutter
697	8701	Himself
697	8702	Himself
698	6825	Forrest Gump
698	7813	Jenny Curran
698	8707	Lieutenant Daniel Taylor
698	8708	Benjamin "Bubba" Bufford-Blue
698	8709	Mrs. Gump
698	8710	Nurse at Park Bench
698	8711	Young Forrest
698	8712	Doctor
698	8713	Barber
698	8714	Crony
698	8715	Cronie
698	8716	Principal
698	8717	Louise
698	8718	Elderly Woman
698	8719	Elderly Woman's Daughter
699	8722	Chuck Yeager
699	6813	Alan Shepard
699	8723	John Glenn
699	8724	Gordon Cooper
699	8725	Gus Grissom
699	8726	Glennis Yeager
699	8727	Pancho Barnes
699	7485	Betty Grissom
699	8728	Trudy Cooper
699	8729	Deke Slayton
699	8730	Scott Carpenter
699	7750	Walter Schirra
699	8731	Lyndon Johnson
699	8732	Jack Ridley/Narrator
699	8733	Annie Glenn
700	8734	Homer Hickam
700	6617	John Hickam
700	8735	Miss Frieda Riley
700	8736	Quentin Wilson
700	8737	Roy Lee Cook
700	8738	Sherman O'Dell
700	7880	Elsie Hickam
700	8739	Jim Hickam
700	8740	Leon Bolden
700	8741	Principal Turner
700	8742	Ike Bykovsky
700	8743	Dorothy Platt
700	8744	Jake Mosby
700	8745	Mr. Dantzler
700	8746	Valentina Carmina
701	6873	Zampano
701	8750	Gelsomina
701	8751	Il "Matto"-The "Fool"
701	8752	Il Signor Giraffa-Mr Giraffe
701	8753	La Vedova-The Widow
701	8754	La Suorina-The Sister
702	8757	John Chow
702	8758	Inspector Li
702	8759	Jennie
702	8760	Sydney
702	8761	Sergeant Randy Chang
702	8762	Johnny Weng
702	8763	Tony Weng
702	8764	Frank
702	8765	Chief Inspector Tu
702	8766	Inspector Chan
702	8767	A Killer
702	8768	Bodyguard A
702	8769	Bodyguard B
702	8770	Wong Tong/Eddie Wong
703	8436	The Terminator
703	7748	Kyle Reese
703	8437	Sarah Connor
703	8772	Lieutenant Traxler
703	7750	Detective Vukovich
703	8773	Matt
703	8774	Ginger
703	8439	Dr. Peter Silberman
703	8775	Alamo Guns Clerk
703	8776	Nancy
703	8777	Desk Sergeant
703	8778	Future Terminator
703	7751	Punk Leader
703	8779	Punk
703	8780	Punk
704	8782	Truman Burbank
704	8783	Meryl/Hanna Gill
704	8784	Marlon/Louis Coltrane
704	8785	Lauren Garland/Sylvia
704	8786	Angela Burbank, Truman's Mother
704	8787	Kirk Burbank, Truman's Father
704	8788	Young Truman
704	8789	Lawrence
704	8790	Vivien
704	8791	Ron
704	8468	Don
704	8792	Spencer, a Neighbor
704	8793	Travel Agent
704	8794	Truman's Neighbor
704	8795	Truman's Neighbor
705	8798	Chris MacNeil
705	7851	Father Merrin
705	6889	Lieutenant Kinderman
705	8799	Sharon Spencer
705	8800	Burke Dennings
705	8801	Father Damien Karras
705	8802	Regan MacNeil
705	8803	Father Dyer
705	8804	Dr. Klein
705	8805	Barringer, clinic director
705	8806	Karl
705	8807	Willi
705	8808	Dr. Taney
705	8809	Psychiatrist
705	8810	President of University
706	8813	Songlian
706	8814	The Third Concubine
706	8815	The Master
706	8816	The Second Concubine
706	8817	Housekeeper
706	8818	Yuru
706	8819	Songlian's mother
706	8820	Old servant
706	8821	Dr. Gao
706	8822	Feipu
707	8826	Dora
707	8827	Irene
707	8828	Josue
707	8829	Ana
707	8830	Cesar
707	8831	Pedrao
707	8832	Yolanda
707	8833	Isaias
707	8834	Moises
707	8835	Dora's Client
707	8836	Dora's Client
707	8837	Dora's Client
707	8838	Dora's Client
707	8839	Dora's Client
707	8840	Dora's Client
708	8000	Raymond Babbitt
708	8844	Charlie Babbitt
708	8845	Susanna
708	8846	Dr. Bruner
708	8847	John Mooney
708	8848	Vern
708	8849	Lenny
708	8850	Iris
708	7308	Sally Dibbs
708	8851	Small Town Doctor
708	8852	Mother at Farm House
708	8853	Farm House Kid
708	8854	Farm House Kid
708	8855	Farm House Kid
708	8856	Farm House Kid
709	8859	Marty McFly
709	8860	Dr. Emmett L. "Doc" Brown
709	8861	Lorraine Baines
709	8862	George Douglas McFly
709	8863	Biff Tannen
709	8864	Jennifer Parker
709	8865	Dave McFly
709	8866	Linda McFly
709	8867	Sam Baines
709	8868	Stella Baines
709	8869	S.S. Strickland
709	8870	Skinhead
709	8871	3-D
709	8872	Match
709	8873	Marvin Berry
710	6653	Kanji Watanabe
710	8875	Mitsuo Watanabe, Kanji's son
710	8876	Kazue Watanabe, Mitsuo's wife
710	8877	Kiichi Watanabe, Kanji's Brother
710	8878	Tatsu Watanabe, Kiichi's Wife
710	8879	The Maid
710	8880	Toyo Odagiri, employee
710	6660	Ono, Office under-chief
710	8881	Saito, employee
710	8882	Sakai
710	6662	Ohara
710	8883	Kimura
710	6657	Noguchi
710	8884	Deputy Mayor
710	8885	City Assemblyman
711	7532	Chorus
711	8886	Henry V
711	8887	Gloucester
711	8888	Bedford
711	8889	Exeter
711	8890	York
711	7565	Canterbury
711	8891	Ely
711	8892	Cambridge
711	8893	Scroop
711	8894	Grey
711	8895	Erpingham
711	7487	Fluellen
711	8896	Gower
711	8897	Jamy
712	8898	Leonard Vole
712	7419	Christine Vole
712	8232	Sir Wilfrid Robarts
712	8899	Miss Plimsoll
712	8900	Brogan-Moore
712	7918	Mayhew
712	8901	Carter
712	8902	Mr. Myers
712	7871	Mrs. French
712	8903	Janet McKenzie
712	8904	Judge
712	8905	Inspector Hearne
712	8906	Diana
713	8909	Gordie Lachance
713	8635	Chris Chambers
713	8910	Teddy Duchamp
713	8911	Vern Tessio
713	8912	Ace Merrill
713	8871	Billy Tessio
713	8913	Charlie Hogan
713	8914	Eyeball Chambers
713	8915	Vince Desjardins
713	8916	Mr. Lachance
713	8868	Mrs. Lachance
713	8917	Mr. Quidacioluo
713	8918	Milo Pressman
713	8919	Mayor Grundy
713	7606	Gordon Lachance
714	6638	Dr. Richard Kimble
714	8921	Samuel Gerard
714	8922	Helen Kimble
714	8923	Dr. Anne Eastman
714	6996	Cosmo Renfro
714	8924	Sykes
714	8925	Dr. Charles Nichols
714	8926	Biggs
714	8927	Poole
714	8928	Noah Newman
714	8929	Detective Kelly
714	8930	Detective Rosetti
714	8931	Chicago Cop #1
714	8932	Newscaster
714	8933	Chicago Cop #2
715	8937	Mark "Rent-boy" Renton
715	8938	Daniel "Spud" Murphy
715	8939	Simon David "Sick Boy" Williamson
715	8940	Tommy MacKenzie
715	8941	Francis Begbie
715	8942	Diane
715	8943	Swanney
715	7469	Mr. Renton
715	8944	Mrs. Renton
715	8945	Allison
715	8946	Lizzy
715	8947	Gail
715	8948	Gavin/US Tourist
715	8949	Mikey Forrester
715	8950	Game Show Host
716	8953	Eliot Ness
716	8632	Jim Malone
716	8954	Oscar Wallace
716	8955	Giuseppe Petri, alias George Stone
716	6627	Al Capone
716	8956	Mike
716	7628	Payne
716	8957	George
716	8958	Frank Nitti
716	7313	Ness' Wife
716	8959	Bowtie Driver
716	8960	Scoop
716	8961	Lt. Anderson
716	8962	Preseuski
716	8963	Mountie Captain
717	8967	Garance
717	8968	Baptiste Debureau
717	8969	Frederick LeMaitre
717	8970	Jericho
717	8971	Nathalie
717	8112	Fil de Soie
717	8972	Avril
717	8973	Director
717	8974	Stage master
717	8975	Anselme Debureau
717	8976	Madame Hermine
717	8977	Marie
717	8978	Policeman
717	8979	Arab Attendant
717	8980	Director, "Grand Theatre"
718	7941	Sean Thornton
718	8983	Mary Kate Danaher
718	8066	Michaleen Flynn
718	6847	Father Peter Lonergan, Narrator
718	8984	Red Will Danaher/Squire Danaher
718	8985	The Widow Sarah Tillane
718	8986	Dan Tobin
718	8987	Mrs. Elizabeth Playfair
718	8988	The Woman at railway station
718	8989	Reverend Cyril 'Snuffy' Playfair
718	8990	Forbes
718	8991	Father Paul
718	8992	Owen Glynn
718	8800	Feeney
718	8993	Maloney, Guard
719	8994	Robin Hood
719	8162	Maid Marian
719	8995	Sir Guy of Gisbourne
719	6580	Prince John
719	8996	Will Scarlett
719	7442	Friar Tuck
719	8046	Little John
719	8019	High Sheriff of Nottingham
719	8997	King Richard the Lion Heart
719	8903	Bess
719	8998	Much the Miller's Son
719	8999	Bishop of Black Canons
719	9000	Essex
719	9001	Sir Ralfe
719	9002	Sir Mortimer
720	7332	Wise Man #2/Brian/Biggus Dickus
720	7333	Wise Man #1/Reg/Jewish Official/Centurion/Deadly Dirk/Arthur
720	7335	Man #2/Jailer/Blood & Thunder Prophet/Frank
720	7334	Mr. Cheeky/Stan/Loretta/Harry the Haggler/Culprit Woman/Warris/Youth/Jailer's Assistant/Otto/Mr. Frisbee III
720	7336	Mandy/Colin/Simon the Holy Man/Bob Hoskins/Saintly Passer-by
720	7337	Wise Man #3/Mr. Big Nose/Francis/Mrs. A/Ex-Leper/Announcer/Ben/Pontius Pilate/Boring Prophet/Eddie/Shoe Follower/Nisus Wettus
720	9006	Gregory
720	7339	Mrs. Gregory
720	8236	Jesus
720	7340	A weedy Samaritan
720	8600	False Prophet/Blind Man/Giggling Guard/Stig
720	7342	Matthias
720	9007	Mrs. Big Nose
720	9008	Judith
721	6704	Ransom Stoddard Attorney-At-Law
721	7941	Tom Doniphon
721	6752	Hallie Stoddard
721	9009	Liberty Valance
721	8410	Dutton Peabody
721	9010	Marshal Link Appleyard
721	9011	Doc Willoughby
721	8117	Major Cassius Starbuckle
721	9012	Nora Ericson
721	6588	Peter Ericson
721	9013	Jason Tully
721	9014	Maxwell Scott
721	7697	Pompey
721	9015	Amos Carruthers
721	8140	Floyd
722	7232	Rob
722	9018	Laura
722	9019	Dick
722	9020	Barry
722	9021	Marie DeSalle
722	9022	Charlie
722	6975	Liz
722	6542	Ian
722	9023	Vince
722	9024	Justin
722	9025	Sarah
722	9026	Penny
722	9027	Caroline
722	9028	Alison Jr. High
722	9029	Rob Jr. High
723	7821	Marty DiBergi
723	9033	Heavy Metal Fan
723	9034	Heavy Metal Fan
723	9035	Heavy Metal Fan
723	9036	Mick Shrimpton
723	9037	Viv Savage
723	9038	Ian Faith
723	9039	David St. Hubbins
723	7810	Nigel Tufnel
723	9040	Derek Smalls
723	6634	Tommy Pischedda
723	9041	Ethereal Fan
723	9042	New York M.C.
723	9043	John "Stumpy" Pepys
723	9044	Ronnie Pudding
724	6670	Melvin Udall
724	9045	Carol Connelly
724	9046	Simon Bishop
724	9047	Frank Sachs
724	9048	Vincent
724	9049	Beverly
724	9050	Jackie
724	9051	Nora
724	9052	Neighbor Woman
724	9053	Carl
724	9054	Caterer
724	9055	Partygoer
724	9056	Partygoer
724	9057	Partygoer
724	9058	Handyman
725	8000	Rico "Ratso" Rizzo
725	9061	Joe Buck
725	9062	Cass
725	7353	Mr. O'Daniel
725	9063	Shirley Gardner
725	9064	Towny
725	6936	Sally Buck
725	9065	Crazy Annie
725	9066	Woodsey Niles
725	9067	Little Joe
725	9068	Little Joe
725	9069	Ralph, the Dishwasher at Miller's Restaurant
725	9070	Cafeteria Manager
725	9071	Mother on Bus
725	9072	Old Cowhand
726	9076	Laura Hunt
726	7958	Detective Lieutenant Mark McPherson
726	9077	Waldo Lydecker
726	9078	Shelby Carpenter
726	8014	Mrs. Ann Treadwell
727	9081	Young Cole
727	6785	James Cole
727	9082	Jose
727	9083	Scarface
727	9084	Tiny
727	9085	Botanist
727	9086	Geologist
727	9087	Zoololgist
727	9088	Astrophysicist
727	9089	Microbiologist
727	9090	Engineer
727	9091	Poet
727	9092	Dr. Kathryn Railly
727	9093	Detective Franki
727	9094	Policeman#1
728	9096	Belle
728	9097	Beast
728	9098	Gaston
728	9099	Lumiere
728	9100	Cogsworth/Narrator
728	7349	Mrs. Potts
728	9101	Chip
728	9102	Maurice
728	9103	LeFou
728	9104	Philippe
728	9105	Wardrobe
728	7840	Bimbette
728	9106	Stove
728	9107	Bookseller
728	9108	Monsieur D'Arque
729	9113	Clyde Barrow
729	7167	Bonnie Parker
729	9114	C.W. Moss
729	8359	Buck Barrow
729	9115	Blanche
729	9015	Frank Hamer
729	8418	Ivan Moss
729	9116	Velma Davis
729	8394	Eugene Grizzard
730	9120	Dante Hicks
730	9121	Randal Graves
730	9122	Veronica Loughran
730	9123	Caitlin Bree
730	9124	Jay Phat Buds
730	9125	Silent Bob
730	9126	Willam the Idiot Manchild/Angry Hockey-Playing Customer/Angry Mourner
730	9127	Chewlie's Rep
730	9128	Old Man
730	9129	Woolen Cap Smoker/Egg Man/Offended Customer/Cat Admiring Bitter Customer
730	9130	Sanford/Angry Mourner
730	9131	#812 Wynarski
730	9132	Hunting Cap Smoking Boy/Low I.Q. Video Customer/Hubcap Searching Customer/Angry Mourner/Angry Crowd at Door
730	9133	Coroner
730	9134	Administer of Fine/Orderly
731	7959	Young Charlie Newton
731	6595	Charlie Oakley
731	9135	Jack Graham
731	6844	Joseph Newton
731	9136	Emma Newton
731	9137	Herbie Hawkins
731	9138	Fred Saunders
731	9139	Ann Newton
731	9140	Roger Newton
731	9141	Station Master
731	9142	Railroad Porter
731	9143	Louise
731	9144	Girlfriend
732	9147	Archie Gates
732	9148	Troy Barlow
732	9149	Chief Elgin
732	7248	Conrad Vig
732	9150	Amir Abdullah
732	9151	Adriana Cruz
732	9152	Walter Wogaman
732	9153	Captain Said
732	8708	Colonel Horn
732	9154	Captain Van Meter
732	9155	Cathy Daitch
732	9156	Teebaux
732	9157	Paco
732	9158	Debbie Barlow
732	9159	Amir's wife
733	6560	Mahatma Gandhi
733	9162	Margaret Bourke-White
733	9163	General Dyer
733	8538	Lord Irwin
733	7065	Judge Broomfield
733	9164	Lord Chelmsford
733	7192	Walker
733	9165	Charlie Andrews
733	9166	General Smuts
733	9167	Herman Kallenbach
733	9168	Sardar Patel
733	9169	Mirabehn
733	9170	Mohammed Ali Jinnah
733	9171	Kahn
733	9172	Pandit Nehru
734	9174	Mary
734	9175	Elliot
734	9176	Keys
734	9177	Michael
734	9178	Gertie
734	9179	Greg
734	9180	Steve
734	9181	Tyler
734	9182	Pretty Girl
734	9183	Schoolboy
734	9184	Science Teacher
734	9185	Policeman
734	9186	Ultra Sound Man
734	9187	Van Man
734	9188	Medic
735	9190	Siri
735	9191	Carl Ekdahl
735	9192	Fanny Ekdahl
735	9193	Putte
735	9194	Justina
735	9195	Maj
735	9196	Hanna Schwartz
735	9197	Aron
735	7848	Filip Landahl
735	9198	Oscar Ekdahl
735	9199	Ismael
735	9200	Alida
735	9201	Emilie Ekdahl
735	9202	Miss Vega
735	9203	Petra
735	9204	Alexander Ekdahl
736	7606	Roy Neary
736	9205	Claude Lacombe
736	8397	Ronnie Neary
736	8239	Jillian Guiler
736	9206	David Laughlin
736	9207	Project Leader
736	9208	Wild Bill
736	9209	Farmer
736	9210	Barry Guiler
736	9211	Brad Neary
736	9212	Sylvia Neary
736	9213	Toby Neary
736	7750	Robert
736	9214	Team Leader
736	8867	Major Benchley
737	9215	Ebenezer Scrooge
737	9216	Mrs. Dilber
737	9217	Bob Cratchit
737	9218	Mrs. Cratchit
737	9219	Jacob Marley/ Marley's Ghost
737	9220	Scrooge
737	9221	Peter Cratchit
737	9222	Spirit of Christmas Present
737	9223	Alice
737	9224	Fan
737	9225	Fred
737	9226	Old Joe
737	9227	Mr. Stretch, The Undertaker
737	9228	Tiny Tim
737	9229	Spirit of Christmas Past
738	8000	Carl Bernstein
738	7621	Bob Woodward
738	6892	Harry M. Rosenfeld
738	6754	Howard Simons
738	9232	Deep Throat
738	7693	Ben Bradlee
738	9233	Bookkeeper
738	9234	Debbie Sloan
738	9235	Dardis
738	9236	Hugh W. Sloan Jr.
738	9237	Sally Aiken
738	9238	Foreign Editor
738	9239	Donald Segretti
738	9240	Frank Wills
738	7558	Sergeant Leeper, arresting Officer #1
739	9244	Elin
739	9245	Agnes
739	9246	Jessica
739	9247	Johan Hulth
739	9248	Markus
739	9249	Father Olof
739	9250	Mother Karin
739	9251	Little Brother Oskar
739	9252	Mother Birgitta
739	9253	Camilla
739	9254	Viktoria
739	9255	Malin
739	9256	Sara
739	9257	Jenny
739	9258	Sabina
740	6704	Elwood P. Dowd
740	8321	Veta Louise Simmons
740	9260	Miss Kelly, Chumley Rest Nurse
740	9261	Dr. Lyman Sanderson
740	9262	Dr. Willie Chumley
740	9263	Myrtle Mae Simmons
740	9264	Marvin Wilson
740	9265	Judge Omar Gaffney
740	9138	P.J. Lofgren, Taxi Driver
740	9266	Mrs. Ethel Chumley
740	9267	Mrs. Ethel Chauvenet
740	9268	Herman Schimmelplusser
741	8798	Sara Goldfarb
741	9271	Harry Goldfarb
741	9272	Marion Silver
741	9273	Tyrone C. Love
741	7837	Tappy Tibbons
741	9274	Ada
741	8500	Big Tim
741	9275	Arnold the Shrink
742	9278	Dallas
742	7941	The Ringo Kid
742	9010	Buck
742	8117	Hatfield
742	6843	Dr. Josiah Boone
742	9279	Lucy Mallory
742	9280	Sheriff Curly Wilcox
742	9281	Samuel Peacock
742	9282	Henry Gatewood
742	7407	Lieutenant Blanchard
742	9283	Luke Plummer
743	6542	Griffin Mill
743	9285	June Gudmundsdottir
743	8725	Walter Stuckel
743	9286	Detective Susan Avery
743	6615	Larry Levy
743	7579	Joel Levison
743	9287	Bonnie Sherow
743	7985	David Kahane
743	9288	Andy Civella
743	9289	Tom Oakley
743	9290	Dick Mellon
743	9291	Detective DeLongpre
743	9292	Celia
743	9293	Jan
743	9294	Sandy
744	9297	Charlie Brown
744	9298	Lucy Van Pelt
744	9299	Linus Van Pelt
744	9300	Schroeder and Shermy
744	9301	Pig-Pen
744	9302	Patty
744	9303	Sally Brown
744	9304	Freida
744	9305	Violet
744	9306	Snoopy
745	6932	Joe Bradley
745	9308	Princess Ann
745	9309	Irving Radovich
745	9310	Mr. Hennessy
745	9311	Ambassador
745	9312	Countess Vereberg
745	9313	General Provno
745	9314	Mario Delani
745	9315	Giovanni
745	9316	Charwoman
745	9317	Cab driver
745	9318	Secretary
745	9319	Shoe seller
746	9321	Ann Darrow
746	9322	Carl Denham
746	9323	Jack Driscoll
746	9324	Captain Englehorn
746	9325	Weston
746	9326	Native Chief
746	9327	Witch King
746	9328	Briggs, the Second Mate
747	6736	Tom Reagan
747	9332	Verna
747	9333	Bernie
747	9334	Johnny Caspar
747	9335	Eddie Dane
747	9336	Leo O'Bannion
747	6862	Frankie
747	9337	Tic-Tac
747	9338	Mayor Dale Levander
747	9339	O'Doole
747	7429	Mink
747	9340	Clarence "Drop" Johnson
747	9341	Tad
747	7310	Adolph
747	9342	Terry
748	9061	Ed Gentry
748	9343	Lewis Medlock
748	9235	Bobby Trippe,a.k.a. Chubby
748	9344	Drew Ballinger
748	9345	Old Man
748	9346	Lonny
748	9347	First Griner
748	9348	Second Griner
748	9349	Mountain Man
748	9350	Toothless Man
748	9351	First Deputy
748	9352	Second Deputy
748	9353	Ambulance Driver
748	9354	Doctor
748	9355	Nurse Lilley
749	6688	Chance the Gardener
749	8130	Eve Rand
749	9358	Benjamin Rand
749	6892	President "Bobby"
749	9359	Doctor Robert Allenby
749	8751	Vladimir Skrapinov
749	9360	Louise
749	9361	Thomas Franklin
749	9362	Sally Hayes
749	9363	Johanna Franklin
749	9364	Lolo
749	9365	Abraz
749	9366	Policeman by White House
749	9367	Old Woman
749	9368	David
750	8261	Titta's Mother
750	9371	Titta's Father
750	9372	Gradisca
750	9373	Uncle Teo
750	9374	Pataca
750	9375	Lawyer
750	9376	Titta
750	9377	Don Baravelli
750	9378	Volpina
750	9379	Tobbaconist
750	9380	Titta's Grandfather
750	9381	Fascist Leader
751	9383	Mitch Brenner
751	9384	Lydia Brenner
751	9385	Annie Hayworth
751	9386	Melanie Daniels
751	7485	Cathy Brenner
751	9387	Mrs. Bundy
751	8573	Sebastian Sholes
751	9388	Mrs. MacGruder
751	9389	Deke Carter
751	7175	Traveling Salesman
751	9390	Fisherman
751	9391	Deputy Al Malone
751	9392	Postal Clerk
751	9393	Doomsayer in Diner
751	9394	Mitch's City Neighbor
752	9396	Cesar Soubeyran/"Le Papet"
752	9397	Jean Cadoret
752	9398	Ugolin
752	9399	Aimee Cadoret
752	9400	Baptistine
752	9401	Manon Cadoret
752	9402	Philoxene
752	9403	Pamphile
752	9404	Casimir
752	9405	Anglade
752	9406	Ange
752	9407	Eliacin
752	9408	Pascal
752	9409	Martial
752	9410	Mederic
753	9413	Sydney Schanberg
753	9414	Dith Pran
753	7245	Al Rockoff
753	9415	Jon Swain
753	9416	Military attache
753	9417	United States consul
753	9418	Dr. MacEntire
753	9166	Dr. Sundesval
753	9419	Dougal
753	9420	Ser Moeum
753	9421	Titony
753	9422	Sarun
753	9423	US Military Advisor
753	9424	Phat
753	9425	Phat's son
754	7941	John T. Chance
754	9428	Dude
754	9429	Colorado Ryan
754	9430	Feathers
754	9431	Stumpy
754	6847	Pat Wheeler
754	9432	Nathan Burdette
754	9433	Carlos Remonte
754	9434	Consuela Remonte
754	9435	Joe Burdette
754	9391	Jake
754	7947	Harold
755	7751	Hank Mitchell
755	7875	Jacob Mitchell
755	9437	Sarah Mitchell
755	9438	Neil Baxter
755	7883	Lou Chambers
755	9439	Nancy Chambers
755	9440	Sheriff Carl Jenkins
755	7715	Tom Butler
755	9441	FBI Agent Renkins
755	9442	FBI Agent Freemont
755	9443	Farmer Dwight Stephanson
755	9444	Mr. Schmitt
755	9445	News Reporter
755	9446	Paul, Anchorman
755	9447	Anchorwoman
756	9450	Captain Benjamin Franklin "Hawkeye" Pierce, M.D.
756	7322	Captain John Francis Xavier "Trapper John" McIntyre, M.D.
756	7483	Captain Augustus Bedford "Duke" Forrest
756	9451	Major Margaret "Hot Lips" O'Houlihan
756	6529	Major Frank Burns
756	9452	Lieutenant Colonel Henry Braymore Blake
756	9453	Father John Patrick "Dago Red" Mulcahy
756	9454	Staff Sergeant Vollmer
756	9455	Lieutenant Maria Schneider, "Lieutenant Dish"
756	9456	Corporal Walter "Radar" O'Reilly
756	9457	Captain Oliver Harmon "Spearchucker" Jones, M.D.
756	8210	Captain Ezekiel Bradbury "Me Lay" Marston, IV
756	9458	Lieutenant Leslie
756	9459	Private First Class Seidman
756	9460	Sergeant Gorman
757	9463	Richard Hannay
757	9464	Pamela
757	9465	Annabella Smith
757	9466	Professor Jordan
757	9467	Margaret Crofter
757	9468	John Crofter
757	9469	Mrs. Jordan
757	9470	Sheriff
757	9471	Mr. Memory
757	9472	Commercial Traveler
757	9473	Commercial Traveler
757	9474	Maid
758	9477	Mrs. Wilkinson
758	9478	Billy Elliot
758	9479	Tony Elliot
758	9480	Dad
758	9481	Grandma
758	9482	Michael
758	9483	George Watson
758	9484	Billy's Mum
758	9485	Debbie Wilkinson
758	9486	Mr. Braithwaite
758	9487	Mr. Wilkinson
758	9488	Gary Poulson
758	9489	PC Jeff Peverly
758	9490	Librarian
758	9491	Sheila Briggs
759	9494	Snow White
759	9495	Prince
759	9496	The Queen/Witch
759	8079	Magic Mirror
759	7919	Sneezy
759	9497	Sleepy/Grumpy
759	9498	Happy
759	9499	Bashful
759	9500	Doc
759	9501	Huntsman
760	6791	Peter Joshua/Alexander Dyle/Adam Canfield/Brian Cruikshank
760	9308	Regina Lampert
760	9505	Hamilton Bartholomew/Carson Dyle
760	7775	Tex Panthollow
760	8329	Herman Scobie
760	9506	Sylvie Gaudel
760	9507	Leopold Gideon
760	9508	Inspector Grandpierre
760	9509	Felix
760	9510	Jean-Louis Gaudel
761	9513	Guido Anselmi
761	7692	Claudia
761	9514	Luisa Anselmi
761	9515	Carla
761	9516	Rossella
761	9517	Gloria Morin
761	9518	Mezzabotta
761	9519	Producer
761	6585	French Actress
761	9520	Writer
761	9521	Fashionable Woman
761	9522	Anselmi's Father
761	9523	Anselmi's Mother
761	9524	Mindreader
761	8008	La Saraghina
762	8501	Edward D. Wood, Jr.
762	6798	Bela Lugosi
762	9526	Dolores Fuller
762	9527	Kathy O'Hara
762	7564	Criswell
762	6630	Reverend Lemon
762	7985	Orson Welles
762	9528	Bunny Breckenridge
762	6862	Georgie Weiss
762	9529	Paul Marco
762	9530	Conrad Brooks
762	9531	Vampira
762	9532	Tor Johnson
762	9533	Loretta King
762	9534	Ed Reynolds
763	9538	Klaatu
763	9539	Helen Benson
763	7207	Tom Stevens
763	8153	Professor Jacob Barnhardt
763	7224	Bobby Benson
763	9540	Mrs. Barley
763	9541	Gort
764	9545	Nick Charles
764	7956	Nora Charles
764	9546	Dorothy Wynant
764	9547	Lt. John Guild
764	7965	Mimi Jorgenson, the former Mrs. Wynant
764	7300	MacCauley, Wynant's lawyer
764	9548	Tommy
764	9549	Gilbert Wynant
764	9550	Nunheim
764	9551	Chris Jorgenson
764	9552	Julia Wolf, Wynant's mistress
764	9553	Joe Morelli
764	9554	Clyde Wynant, the thin man
764	9555	Tanner, Wynant's bookkeeper
765	8632	Daniel Dravot
765	9558	Peachy Carnehan
765	7663	Rudyard Kipling
765	9168	Billy Fish
765	9559	Ootah
765	9560	District Commissioner
765	9561	Kafu-Selim
765	9562	Babu
765	9563	Ghulam
765	9564	Mulvaney
765	9565	Officer
765	9566	Roxanne
766	9568	Sylvia
766	6527	Sonny Wortzik
766	9569	Mulvaney
766	6539	Sal
766	9570	Margaret
766	7722	Jenny
766	9571	Deborah
766	9572	Miriam
766	9573	Maria
766	9574	Howard
766	9575	Edna
766	9576	Stevie
766	9577	Sheldon
766	7622	Moretti
766	9578	Carmine
767	9581	Claire Montgomery
767	8655	Ronna Martin
767	9582	Stringy Haired Woman
767	9583	Simon Baines
767	9584	Mannie
767	9585	Switterman
767	9586	Adam
767	9587	Zack
767	9588	Todd Gaines
767	9589	Ballerina Girl
767	9590	Burke
767	9591	Dancing Register Woman
767	7547	Fila Guy
767	9592	Nike Hat
767	9593	Anorexic Girl
768	6872	Henry II, King of England
768	7787	Eleanor of Aquitaine
768	6807	Prince Richard
768	9596	Prince Geoffrey
768	9597	Prince John
768	9598	Philip II, King of France
768	9599	Princess Alais
768	7781	William Marshall
768	9600	Queen Eleanor's Guard
768	8120	Bishop of Durham
768	9601	Lady in Waiting
768	9602	Lady in Waiting
768	9603	Strolling Player
768	9604	Strolling Player
768	9605	Strolling Player
769	9608	James 'Mr. Jimmy' Whale
769	9609	Clayton 'Clay' Boone
769	9610	Hanna
769	9611	Betty
769	9612	David Lewis
769	9613	Harry
769	9614	Dwight
769	9615	Mr. Edmund Kay
769	9616	Elsa Lanchester
769	9617	Boris Karloff
769	9618	Colin Clive
769	9619	Leonard Barnett
769	9620	Princess Margaret
769	9621	Young 'Jimmy' Whale
769	9622	Sarah Whale
770	9625	Logan/Wolverine
770	9626	Prof. Charles Francis Xavier/Professor X
770	9608	Erik Magnus Lehnsherr/Magneto
770	9627	Dr. Jean Grey
770	9628	Scott Summers/Cyclops
770	9629	Ororo Munroe/Storm
770	7281	Marie/Rogue
770	9630	Victor Creed/Sabretooth
770	9631	Mortimer Toynbee/Toad
770	9632	Raven Darkholme/Mystique
770	9633	Senator Robert Jefferson Kelly
770	9634	NSC Agent Henry Peter Gyrich
770	9635	Young Erik
770	9636	Mrs. Lehnsherr
770	9637	Mr. Lehnsherr
771	9639	Testimonial Speaker
771	6798	Judah Rosenthal
771	9640	Miriam Rosenthal
771	9641	Sharon Rosenthal
771	9642	Chris
771	9643	Photographer
771	9644	Dolores Paley
771	7720	Cliff Stern
771	9645	Jenny
771	9646	Wendy Stern
771	9647	Lester
771	9413	Ben
771	9648	Carol
771	9649	Judah's Secretary
771	9650	T.V. Producer
772	9651	Stan Marsh/Eric Cartman/Satan, the Dark Prince/Mr. Garrison/Ned Gerblanski/Various others
772	9652	Kyle Broflovski/Kenny McCormick /Saddam Hussein /Jimbo Kearn/Bill Gates/Various others
772	7840	Mrs. Cartman/Sheila Broflovski/Wendy Testaburger/Various others
772	9653	Chef
772	9654	Ike Broflovski
772	9655	Ike Broflovski
772	9656	Ike Broflovski
772	9657	Man in Theatre
772	9658	Woman in Theatre
772	9659	Bebe
772	9147	Dr. Gouache
772	9660	Conan O'Brien
772	8510	Brooke Shields
772	9661	The Baldwin Brothers
772	7334	Dr. Vosknocker
773	9662	Auctioneer
773	9663	Lewis
773	6807	Stevens
773	9664	Miss Kenton
773	9665	Landlady
773	9666	Lord Darlington
773	8596	Mr. Stevens, Sr.
773	9667	Mrs. Mortimer, the cook
773	9668	Charlie, Head Footman
773	9669	George, Second Footman
773	9670	Housemaid
773	9671	Spencer
773	9672	Sir Leonard Bax
773	9673	Canon Tufnell
773	9674	Cardinal
774	9678	Jim Stark
774	7943	Judy
774	9679	Plato
774	9680	Jim's father
774	9681	Jim's Mother
774	9682	Buzz Gunderson
774	9683	Judy's Father
774	9684	Judy's Mother
774	7196	Goon
774	6800	Juvenile Officer Ray
774	9685	Mil
774	9686	Plato's Nurse
774	9687	Jim's Grandmother
774	9688	Helen
774	8901	Lecturer
775	9691	First Sergeant Milton Warden
775	9692	Pvt. Robert E. Lee "Prew" Prewitt
775	9693	Karen Holmes
775	6841	Alma Burke
775	7347	Pvt. Angelo Maggio
775	6797	Captain Dana Holmes, Company Commander/Dynamite Holmes
775	9694	Cpl. Leva, Supply
775	9695	Pvt. Mazzioli
775	8408	Staff Sergeant "Fatso" Judson, Stockade Sgt. of the Guard
775	6892	Corporal Buckley
775	9696	Sergeant Ike Galovitch
775	9697	Sal Anderson
775	9698	Staff Sergeant Pete Karelsen
775	7743	Treadwell
775	9699	Mrs. Kipfer, Owner New Congress Club
776	9528	Phil Connors
776	9702	Rita
776	9703	Larry
776	7668	Ned Ryerson
776	9058	Buster
776	9704	Nancy
776	9705	Mrs. Lancaster
776	9706	Gus
776	9707	Ralph
776	9708	Doris the Waitress
776	9709	Anchorwoman
776	9710	Kenny, Phil's Assistant
776	9711	Man in Hallway
776	9712	Old Man
776	9713	Groundhog Official
777	7333	Archibald 'Archie' Leech
777	9716	Wanda Gershwitz
777	9717	Otto West
777	7337	Ken
777	9718	Wendy
777	9719	George
777	9720	Mrs. Coady
777	9721	Judge
777	9722	Portia Leech
777	9723	Customer in Jeweller's Shop
777	9724	Manager of Jeweler's Shop
777	9725	Inspector Marvin
777	9726	Bartlett
777	9727	Warder
777	9728	Locksmith
778	9730	Anna Bussotti
778	9731	Nicolo Bussotti
778	9732	Cesca
778	9733	Apprentice
778	9734	Boy
778	9735	Assistant
778	9736	Georges Poussin
778	9737	Kaspar Weiss
778	9738	Antoinette Pussin
778	9739	Anton von Spielmann
778	9740	Father Richter
778	9741	Brother Gustav
778	9742	Brother Christophe
778	9743	Brother Franz
778	9744	Brother Michael
779	9746	Julien
779	9747	Bonnet
779	9748	Mme. Quentin
779	9749	Francois Quentin
779	9750	Pere Jean
779	9751	Pere Michel
779	9752	Joseph
779	9753	Muller
779	9754	Boulanger
779	9755	Ciron
779	9756	Sagard
779	9757	Babinot
779	9758	Negus
779	9759	Laviron
779	9760	Moreau
780	8667	Maurice Purley
780	9762	Monica Purley
780	9763	Cynthia Rose Purley
780	9764	Roxanne Purley
780	9765	Hortense Cumberbatch
780	9766	Jane
780	9767	Dionne
780	9768	Paul
780	9769	Social Worker
780	9770	Stuart
780	9771	Girl with Scar
780	9772	Hortense's Brother
780	9773	Hortense's Brother
780	9774	Hortense's Sister-in-Law
780	9775	Hortense's Nephew
781	9777	Homer Wells
781	9778	Candy Kendall
781	9779	Mr. Rose
781	9780	Wally Worthington
781	9558	Dr. Wilbur Larch
781	9233	Nurse Edna
781	9781	Nurse Angela
781	9782	Buster
781	9783	Olive Worthington
781	9784	Peaches
781	9785	Muddy
781	9786	Curly
781	9787	Mary Agnes
781	9788	Rose Rose
781	9789	Ray Kendall
782	7167	Diana Christensen
782	7127	Max Schumacher
782	9792	Howard Beale
782	6529	Frank Hackett
782	9793	Nelson Chaney
782	9235	Arthur Jensen
782	9794	Great Ahmed Kahn
782	9795	TV Director
782	9796	George Bosch
782	9797	Harry Hunter
782	9798	Mary Ann Gifford
782	9799	Joe Donnelly
782	9800	Walter C. Amundsen
782	9801	Barbara Schlesinger
782	9802	Milton K. Steinman
783	7587	Christoffer
\.


--
-- Data for Name: certification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY certification (mid, country, certificate) FROM stdin;
533	Argentina	18
533	Australia	R
533	Austria	16
533	Finland	K-18
533	Mexico	C
533	Netherlands	16
533	Norway	18
533	Spain	13
533	Sweden	15
533	UK	18
533	USA	R
534	Australia	MA
534	Brazil	14
534	Finland	K-16
534	Germany	12
534	Hong Kong	IIB
534	Netherlands	12
534	Norway	15
534	Portugal	M
535	Argentina	13
535	Australia	M
535	Finland	K-13
535	France	U
535	Germany	12
535	Hong Kong	IIB
535	Iceland	16
535	Italy	T
535	Malaysia	
535	Netherlands	12
535	Portugal	M
536	Argentina	Atp
536	Australia	PG
536	Finland	S
536	Sweden	15
536	Sweden	7
536	USA	PG
537	Australia	G
537	Finland	K-16
537	Germany	12
537	Portugal	M
538	Argentina	18
538	Australia	MA
538	Finland	K-14
538	France	U
538	Germany	16
538	Hong Kong	III
538	Italy	VM14
538	Netherlands	16
538	New Zealand	R16
538	Norway	15
538	Portugal	M
539	Argentina	18
539	Australia	M
539	Finland	K-18
539	Netherlands	12
539	Norway	18
539	Spain	18
539	Sweden	15
539	UK	18
539	USA	R
540	Argentina	Atp
540	Australia	PG
540	Finland	K-12
540	Finland	K-8
540	France	U
540	Germany	12
540	Germany	6
540	Netherlands	AL
540	Norway	11
540	Portugal	M
541	Finland	K-16
541	Sweden	15
541	Switzerland	14
541	UK	PG
542	Australia	M
542	Austria	12
542	Finland	K-16
542	Germany	16
542	Italy	VM14
542	Netherlands	18
542	Norway	15
542	Sweden	15
542	UK	18
542	USA	R
543	Australia	PG
543	Finland	K-16
543	Germany	16
543	Iceland	Unrated
543	Netherlands	AL
543	Norway	11
543	Sweden	11
543	USA	PG
544	Australia	PG
544	Finland	K-8
544	France	U
544	Germany	16
544	Netherlands	AL
544	UK	PG
544	USA	PG
545	Australia	PG
545	Finland	K-16
545	France	U
545	Germany	16
545	Norway	15
545	Sweden	15
545	UK	PG
545	USA	PG
546	Argentina	16
546	Australia	MA
546	Denmark	16
546	Finland	K-16
546	Germany	16
546	Italy	T
546	Netherlands	16
546	Norway	15
546	Portugal	M
547	Australia	M
547	Finland	K-16
547	France	-12
547	France	-16
547	Germany	18
547	Norway	15
547	Sweden	15
547	Switzerland	16
547	UK	15
547	USA	R
548	Argentina	Atp
548	Australia	PG
548	Finland	K-10
548	Finland	K-12
548	Germany	12
548	Germany	6
548	Netherlands	AL
548	Norway	11
548	Norway	12
548	Portugal	M
549	Argentina	18
549	Australia	R
549	Finland	K-18
549	France	-12
549	Germany	16
549	Iceland	16
549	Italy	VM14
549	Italy	VM18
549	Netherlands	16
549	Norway	18
549	Portugal	M
550	Australia	G
550	Australia	PG
550	Finland	K-16
550	France	U
550	Germany	16
550	UK	PG
551	Argentina	16
551	Australia	M
551	Finland	K-18
551	France	-16
551	Germany	16
551	Netherlands	16
551	Norway	15
551	Spain	18
551	Sweden	15
551	UK	18
551	USA	R
552	Australia	MA
552	Finland	K-14
552	France	U
552	Germany	16
552	Hong Kong	IIB
552	Iceland	16
552	Italy	VM14
552	Malaysia	
552	Mexico	B
552	Netherlands	16
552	New Zealand	R15
552	Norway	18
552	Portugal	M
553	Argentina	Atp
553	Australia	PG
553	Finland	K-16
553	UK	U
553	USA	PCA #11656
553	USA	Unrated
554	Argentina	18
554	Australia	R
554	Finland	K-16
554	France	-16
554	Germany	16
554	Italy	VM14
554	Netherlands	16
554	Norway	18
554	Portugal	M
555	Australia	PG
555	Finland	K-16
555	France	U
555	Germany	16
555	Spain	18
555	Sweden	15
555	UK	PG
555	USA	PG
556	Australia	G
556	Finland	K-8
556	Germany	12
556	Sweden	15
556	UK	U
556	USA	Unrated
557	Argentina	13
557	Australia	M
557	Belgium	KT
557	Finland	K-12
557	France	U
557	Germany	6
557	Hong Kong	IIA
557	Italy	T
557	Netherlands	AL
557	New Zealand	M
557	Portugal	M
558	Finland	K-16
558	Sweden	15
559	Finland	K-16
559	Sweden	15
560	Finland	K-12
561	Argentina	13
561	Australia	M
561	Finland	K-16
561	France	-12
561	Germany	16
561	Hong Kong	IIB
561	Iceland	16
561	Italy	VM14
561	Netherlands	16
561	New Zealand	M
561	Norway	15
561	Portugal	M
562	Argentina	Atp
562	Australia	G
562	Belgium	KT
562	Finland	K-6
563	Argentina	13
563	Australia	M
563	Belgium	KT
563	Finland	K-16
563	France	U
563	Germany	16
563	Hong Kong	IIB
563	Italy	T
563	Netherlands	16
563	New Zealand	M
563	Norway	15
563	Portugal	M
564	Argentina	18
564	Australia	R
564	Finland	K-16
564	France	-16
564	Germany	16
564	Netherlands	16
564	Norway	18
564	Sweden	15
564	UK	18
564	USA	R
565	Argentina	16
565	Australia	MA
565	Belgium	KT
565	Brazil	14
565	Finland	K-16
565	France	U
565	Germany	16
565	Hong Kong	IIB
565	Netherlands	16
565	New Zealand	R18
565	Norway	15
565	Portugal	M
566	Finland	K-16
566	Germany	12
566	Netherlands	AL
566	Sweden	15
566	UK	PG
567	Finland	K-16
567	Germany	16
567	Sweden	15
567	USA	Unrated
568	Finland	K-16
568	Germany	12
568	Norway	11
568	Sweden	15
568	UK	PG
568	USA	Unrated
569	Argentina	18
569	Australia	R
569	Belgium	KNT
569	Finland	K-18
569	France	-16
569	Germany	18
569	Hong Kong	IIB
569	Iceland	16
569	Israel	18
569	Netherlands	16
569	New Zealand	R18
569	Norway	18
569	Portugal	M
570	Portugal	M
571	Finland	K-16
571	France	U
571	Germany	12
571	Ireland	15
571	Netherlands	12
571	Netherlands	16
571	Spain	13
571	Sweden	15
571	UK	12
571	UK	15
571	USA	R
572	Argentina	Atp
572	Australia	G
572	Finland	S
572	France	U
572	Germany	U
572	Netherlands	AL
572	USA	G
573	Finland	K-16
573	Germany	16
573	USA	Unrated
574	Australia	MA
574	Finland	K-16
574	Italy	VM14
574	Netherlands	16
574	Norway	18
574	Sweden	15
574	UK	18
574	USA	R
575	Finland	K-16
575	Germany	16
575	Norway	16
575	Sweden	15
575	UK	15
575	UK	18
575	USA	R
576	Australia	M
576	Finland	K-16
576	Germany	16
576	Netherlands	16
576	Norway	15
576	Sweden	15
576	UK	15
576	USA	R
577	Argentina	Atp
577	Finland	S
577	Netherlands	AL
577	Portugal	M
578	Australia	R
578	Finland	K-16
578	France	-12
578	Germany	16
578	Netherlands	16
578	Norway	18
578	Sweden	15
578	UK	18
578	USA	R
579	Finland	S
579	Germany	12
579	USA	Unrated
580	Australia	MA
580	Australia	PG
580	Finland	K-16
580	France	-12
580	Sweden	11
580	Sweden	15
580	UK	15
580	UK	PG
580	USA	PG
581	Argentina	13
581	Australia	MA
581	Belgium	KT
581	Finland	K-12
581	France	U
581	Germany	12
581	Hong Kong	IIB
581	Italy	T
581	Netherlands	12
581	New Zealand	M
581	Singapore	R
581	Sweden	11
581	Switzerland	16
581	Switzerland	16
581	UK	15
581	USA	R
582	Finland	K-16
582	Germany	12
582	UK	PG
582	USA	PG
584	Finland	K-16
584	Sweden	15
584	Switzerland	14
585	Australia	MA
585	Norway	11
585	USA	R
586	Finland	K-8
586	Germany	12
586	Netherlands	12
586	Norway	11
586	Portugal	M
587	Finland	K-16
587	Sweden	15
587	USA	Unrated
588	Argentina	16
588	Australia	MA
588	Belgium	KT
588	Finland	K-14
588	France	-12
588	Germany	12
588	Netherlands	16
588	New Zealand	R16
588	Norway	15
588	Portugal	M
589	Argentina	16
589	Australia	MA
589	Belgium	KNT
589	Finland	K-16
589	France	-12
589	Germany	16
589	Hong Kong	IIB
589	Iceland	16
589	Netherlands	16
589	New Zealand	R16
589	Norway	15
589	Portugal	M
590	Australia	PG
590	Finland	K-16
590	Germany	12
590	Sweden	15
590	UK	15
590	USA	PG
591	Finland	K-16
591	Germany	16
591	Norway	15
591	Norway	16
591	Sweden	15
591	UK	15
591	USA	Unrated
592	Sweden	Btl
592	USA	Unrated
593	Australia	R
593	Chile	18
593	Finland	K-18
593	France	-16
593	Germany	18
593	Ireland	18
593	Italy	VM14
593	Italy	VM18
593	Mexico	C
593	Netherlands	16
593	Norway	18
593	Sweden	15
593	UK	18
593	USA	R
593	USA	X
594	Argentina	13
594	Australia	M
594	Belgium	KT
594	Finland	K-12
594	France	U
594	Germany	12
594	Netherlands	16
594	New Zealand	M
594	Portugal	M
595	Finland	K-16
595	UK	PG
596	Argentina	13
596	Australia	M
596	Finland	K-12
596	Finland	K-16
596	Sweden	15
596	USA	PG-13
597	Australia	R
597	Belgium	KNT
597	Finland	K-18
597	France	-16
597	Germany	18
597	Iceland	16
597	Italy	VM18
597	Netherlands	16
597	New Zealand	R18
597	Norway	18
597	Portugal	M
598	Finland	S
599	Finland	K-16
599	France	U
599	Germany	12
599	Sweden	15
599	USA	R
600	Argentina	16
600	Australia	MA
600	Belgium	KT
600	Finland	K-16
600	France	U
600	Germany	16
600	Iceland	16
600	Netherlands	16
600	Portugal	M
601	Australia	M
601	Finland	K-16
601	France	-12
601	Germany	16
601	Ireland	15
601	Netherlands	12
601	Norway	16
601	Norway	18
601	Sweden	15
601	UK	18
601	USA	R
602	Argentina	18
602	Finland	K-12
602	Germany	12
602	Hong Kong	IIB
602	Mexico	B
602	Netherlands	16
602	New Zealand	R16
602	Portugal	M
603	Sweden	Btl
603	USA	Unrated
604	Sweden	Btl
604	USA	Unrated
605	Argentina	13
605	Australia	M
605	Finland	K-16
605	France	U
605	Germany	16
605	Hong Kong	IIB
605	Netherlands	16
605	New Zealand	M
605	Norway	15
605	Portugal	M
606	Argentina	16
606	Australia	MA
606	Belgium	KT
606	Finland	K-16
606	Germany	16
606	Hong Kong	III
606	Iceland	16
606	Italy	VM14
606	Netherlands	16
606	Norway	15
606	Portugal	M
607	Argentina	13
607	Finland	S
607	France	U
607	Sweden	11
607	UK	PG
607	USA	PG
608	Argentina	16
608	Australia	M
608	Finland	K-16
608	France	-12
608	Germany	16
608	Netherlands	16
608	Norway	15
608	Sweden	15
608	UK	15
608	USA	R
609	Argentina	13
609	Australia	MA
609	Finland	K-14
609	France	-12
609	Germany	12
609	Hong Kong	IIB
609	Italy	VM14
609	Netherlands	12
609	Norway	15
609	Portugal	M
610	Australia	M
610	Finland	K-16
610	France	-12
610	Germany	16
610	Netherlands	16
610	Norway	15
610	Norway	16
610	Sweden	15
610	UK	PG
610	USA	PG-13
611	Argentina	13
611	Finland	K-16
611	Germany	12
611	Netherlands	12
611	Norway	15
611	Sweden	15
611	UK	PG
611	USA	PG
612	Finland	S
612	UK	U
613	Argentina	16
613	Australia	R
613	Finland	K-16
613	Finland	K-18
613	Germany	16
613	Hong Kong	IIB
613	Netherlands	16
613	Norway	18
613	Portugal	M
614	Argentina	Atp
614	Czech Republic	12
614	Finland	K-10
614	France	U
614	Germany	6
614	Hong Kong	IIB
614	Mexico	B
614	New Zealand	M
614	Portugal	M
615	Germany	6
615	Sweden	Btl
616	Finland	K-16
616	Germany	16
616	Portugal	M
617	Argentina	Atp
617	Australia	G
617	Finland	S
617	France	U
617	Germany	U
617	New Zealand	G
617	Norway	A
617	Portugal	M
618	Finland	S
618	France	U
618	Netherlands	AL
618	Sweden	11
618	UK	15
618	USA	PG
619	Finland	K-16
619	Sweden	15
619	UK	PG
620	Australia	M
620	Finland	K-16
620	France	-12
620	Germany	16
620	Ireland	18
620	Netherlands	16
620	Norway	18
620	Sweden	15
620	UK	18
620	USA	R
621	Finland	K-16
621	Sweden	15
621	USA	Unrated
622	Finland	K-16
622	Germany	12
622	Sweden	15
622	UK	PG
623	Finland	S
623	Netherlands	AL
623	Sweden	15
623	UK	U
623	USA	Unrated
624	Argentina	16
624	Australia	R
624	Belgium	KNT
624	Denmark	16
624	Finland	K-16
624	France	-12
624	Germany	16
624	Hong Kong	IIB
624	Iceland	16
624	Italy	VM14
624	Norway	18
624	Portugal	M
625	Australia	PG
625	Finland	K-10
625	France	U
625	Netherlands	AL
625	Sweden	11
625	UK	PG
625	USA	PG
626	Argentina	16
626	Finland	K-12
626	France	U
626	Germany	12
626	Hong Kong	IIB
626	Italy	VM14
626	Netherlands	16
626	Portugal	M
627	Argentina	Atp
627	Australia	PG
627	Finland	K-8
627	France	U
627	Germany	6
627	Netherlands	AL
627	New Zealand	PG
627	Norway	7
627	Singapore	PG
627	Sweden	7
627	Switzerland	7
627	Switzerland	7
627	UK	U
627	USA	PG
628	Finland	K-16
628	Sweden	15
628	UK	PG
629	Finland	K-16
629	France	U
629	Germany	16
629	UK	PG
629	USA	PG
630	Argentina	16
630	Australia	M
630	Finland	K-12
630	Hong Kong	IIB
630	Netherlands	16
630	Norway	11
630	Portugal	M
631	Finland	K-16
631	France	U
631	Germany	16
631	Sweden	15
631	UK	15
631	USA	R
632	Australia	M
632	France	U
632	Hong Kong	IIA
632	USA	PG-13
633	Finland	K-12
633	Sweden	Btl
633	UK	U
633	USA	Unrated
634	Finland	K-16
634	Germany	12
634	Sweden	11
634	Sweden	15
634	UK	U
635	Finland	K-12
635	Germany	16
636	Finland	S
637	Finland	S
637	Portugal	M
638	Australia	R
638	Finland	K-16
638	France	-12
638	Germany	16
638	Italy	VM14
638	Netherlands	16
638	Norway	18
638	Sweden	15
638	UK	18
638	USA	R
639	Finland	K-16
639	Netherlands	AL
639	Norway	15
639	Sweden	15
639	UK	15
639	USA	PG
640	Finland	K-12
640	Sweden	15
640	UK	PG
640	USA	Unrated
641	Australia	R
641	Finland	K-16
641	Finland	K-18
641	France	-12
641	Germany	16
641	Netherlands	16
641	New Zealand	R
641	Norway	18
641	Sweden	15
641	UK	18
641	USA	R
642	Sweden	7
643	Sweden	15
644	Australia	M
644	Finland	K-18
644	Germany	16
644	Italy	VM14
644	Netherlands	16
644	Norway	18
644	Sweden	15
644	UK	18
644	USA	R
645	Finland	S
645	Germany	12
645	Sweden	Btl
645	UK	PG
645	USA	Unrated
646	Finland	S
646	Germany	16
646	Sweden	15
646	UK	U
646	USA	Unrated
647	Finland	K-12
647	Finland	K-8
647	Singapore	PG
647	Sweden	15
648	Australia	G
648	Finland	K-16
648	Sweden	15
649	Finland	K-16
649	Sweden	15
650	Finland	K-16
650	Sweden	15
651	Finland	K-16
651	Sweden	11
651	USA	PG
652	Argentina	Atp
652	Finland	K-12
652	France	U
652	Netherlands	AL
652	Norway	11
652	Sweden	15
652	UK	PG
652	USA	G
653	Argentina	Atp
653	Australia	PG
653	Belgium	KT
653	Finland	K-16
653	Germany	12
653	Netherlands	AL
653	New Zealand	PG
653	Sweden	11
653	Sweden	15
653	UK	PG
653	USA	G
654	Finland	K-16
654	Germany	16
654	UK	15
655	Australia	G
655	Germany	16
655	Sweden	11
655	Sweden	15
657	Argentina	16
657	Finland	K-12
657	Germany	6
657	Hong Kong	IIA
657	Netherlands	AL
657	Spain	T
657	Sweden	11
657	UK	15
657	USA	R
658	Finland	K-12
658	France	U
658	Germany	12
658	Sweden	11
658	UK	15
658	USA	R
659	Australia	M
659	Finland	K-16
659	Portugal	M
660	Argentina	Atp
660	Australia	PG
660	Finland	K-12
660	Finland	K-8
660	Germany	12
660	Germany	6
660	Netherlands	AL
660	Norway	11
660	Portugal	M
661	Finland	S
661	Sweden	7
661	USA	PG
662	Argentina	Atp
662	Finland	S
662	Sweden	11
662	UK	PG
662	USA	PG
663	Germany	12
663	Sweden	15
664	Australia	M
664	Finland	K-16
664	Portugal	M
665	Finland	K-16
665	Netherlands	AL
665	Sweden	15
665	UK	U
665	USA	Unrated
666	Finland	K-16
666	Sweden	15
666	UK	PG
666	USA	PG
667	Finland	K-16
668	Finland	K-16
668	Norway	15
668	Sweden	15
669	Finland	K-16
669	USA	Unrated
670	Argentina	Atp
670	Australia	G
670	Belgium	KT
670	Denmark	7
670	Finland	S
670	France	U
670	Germany	U
670	Netherlands	AL
670	Portugal	M
671	Argentina	16
671	Australia	M
671	Finland	K-16
671	Germany	16
671	Iceland	16
671	Netherlands	12
671	Norway	15
671	Spain	13
671	UK	15
671	USA	R
672	Finland	K-16
672	Sweden	15
672	USA	Unrated
673	Australia	M
673	Finland	K-18
673	Germany	16
673	Germany	18
673	Netherlands	16
673	Norway	15
673	Sweden	15
673	UK	18
673	USA	R
674	Finland	K-16
674	Sweden	15
674	USA	PG
675	Australia	MA
675	Finland	K-16
675	Finland	K-18
675	Germany	18
675	Netherlands	12
675	Norway	18
675	Sweden	15
675	USA	R
676	Finland	K-16
676	Sweden	15
676	USA	Unrated
677	Australia	M
677	Finland	K-16
677	France	-12
677	Germany	16
677	Netherlands	16
677	Norway	18
677	Spain	18
677	Sweden	15
677	UK	15
677	USA	R
678	Finland	K-16
678	Sweden	15
678	USA	PG
679	Finland	K-16
679	Netherlands	12
679	Sweden	15
680	Finland	K-16
681	Finland	S
681	UK	PG
682	Australia	M
682	Finland	K-16
682	France	-12
682	Germany	16
682	Ireland	15
682	New Zealand	R
682	Norway	18
682	Sweden	15
682	UK	15
682	USA	R
683	Argentina	13
683	Australia	M
683	Belgium	KT
683	Brazil	14
683	Czech Republic	12
683	Finland	K-12
683	France	U
683	Germany	12
683	Mexico	B
683	Netherlands	12
683	Norway	15
683	Portugal	M
684	Argentina	13
684	Australia	MA
684	Finland	K-16
684	France	U
684	Germany	16
684	Iceland	16
684	Netherlands	16
684	New Zealand	R18
684	Norway	15
684	Portugal	M
685	Australia	M
685	Finland	K-16
685	Germany	12
685	Sweden	15
685	UK	AA
685	USA	PG
686	Argentina	13
686	Australia	M
686	Denmark	7
686	Finland	K-12
687	Finland	K-16
687	France	U
687	Germany	16
687	Netherlands	12
687	Norway	16
687	Sweden	15
687	UK	PG
687	USA	PG-13
688	Denmark	15
688	Finland	K-14
688	France	U
688	Germany	12
688	Switzerland	14
688	Switzerland	14
688	UK	15
688	USA	R
689	Australia	M
689	Finland	K-16
689	New Zealand	R13
689	Sweden	15
689	UK	15
689	USA	R
690	Argentina	18
690	Australia	R
690	Finland	K-16
690	France	-16
690	Hong Kong	IIB
690	Italy	VM18
690	Netherlands	16
690	New Zealand	R18
690	Norway	15
690	Portugal	M
691	Australia	R
691	Finland	K-18
691	Germany	18
691	Netherlands	12
691	Norway	18
691	Sweden	15
691	UK	18
691	USA	R
692	Australia	PG
692	Finland	K-14
692	France	U
692	Germany	12
692	Norway	15
692	Sweden	15
692	UK	PG
692	USA	PG-13
693	Argentina	16
693	Brazil	16
693	Germany	12
693	Netherlands	16
693	Norway	15
693	Portugal	M
694	Finland	K-8
695	Finland	K-16
696	Australia	PG
696	Germany	16
696	USA	Unrated
697	Argentina	Atp
697	Finland	K-10
697	Sweden	11
697	Sweden	15
697	USA	G
698	Australia	PG
698	Brazil	Livre
698	Finland	K-12
698	Germany	12
698	Netherlands	12
698	Norway	11
698	Spain	T
698	Sweden	11
698	UK	12
698	USA	PG-13
699	Finland	S
699	France	U
699	Germany	12
699	Norway	11
699	Sweden	11
699	USA	PG
700	Australia	PG
700	France	U
700	Germany	6
700	New Zealand	PG
700	Portugal	M
701	Finland	K-10
701	Finland	K-16
701	Germany	16
701	Sweden	15
702	Argentina	16
702	Australia	R
702	Finland	K-18
702	Germany	18
702	Netherlands	16
702	New Zealand	R
702	Norway	18
702	UK	18
702	USA	R
702	USA	Unrated
703	Australia	M
703	Finland	K-18
703	Germany	16
703	Germany	18
703	Norway	18
703	Sweden	15
703	UK	18
703	USA	R
704	Argentina	13
704	Australia	PG
704	Belgium	KT
704	Brazil	12
704	Finland	K-12
705	Australia	R
705	Finland	K-18
705	France	-16
705	Germany	16
705	Germany	18
705	Hong Kong	IIB
705	Ireland	18
705	Netherlands	18
705	Norway	15
705	Norway	18
705	Sweden	15
705	UK	18
705	USA	R
706	Argentina	13
706	Finland	K-10
706	Germany	12
706	Netherlands	16
706	Spain	13
706	Sweden	11
706	USA	PG
707	Argentina	13
707	Australia	M
707	Brazil	Livre
707	Finland	K-12
708	Argentina	13
708	Finland	K-12
708	Norway	11
708	Sweden	11
708	UK	15
708	USA	R
709	Australia	PG
709	Finland	K-10
709	Germany	12
709	Italy	T
709	Netherlands	AL
709	Norway	11
709	Sweden	11
709	UK	PG
709	USA	PG
710	Finland	S
711	Sweden	11
711	UK	PG
711	USA	PG-13
712	Finland	K-16
713	Finland	K-12
713	Germany	6
713	Netherlands	AL
713	Sweden	11
713	UK	15
713	USA	R
714	Argentina	13
714	Finland	K-16
714	Germany	12
714	Netherlands	16
714	Norway	15
714	Spain	13
714	Sweden	15
714	UK	15
714	USA	PG-13
715	Australia	R
715	Brazil	18
715	Finland	K-16
715	France	-12
715	Germany	16
715	Hong Kong	III
715	Italy	VM14
715	Japan	R
715	Netherlands	16
715	New Zealand	R18
715	Norway	15
715	Portugal	M
716	Finland	K-16
716	France	U
716	Germany	16
716	Netherlands	16
716	Norway	16
716	Norway	18
716	Sweden	15
716	UK	15
716	USA	R
717	Finland	K-16
717	Sweden	15
717	UK	PG
718	Finland	K-8
718	Germany	12
719	Argentina	Atp
719	Finland	K-16
719	Sweden	Btl
719	UK	U
720	Australia	M
720	Finland	K-16
720	Germany	16
720	Norway	18
720	Sweden	15
720	UK	15
720	USA	R
721	Finland	K-16
721	Germany	12
721	USA	Unrated
722	Argentina	13
722	Finland	K-8
722	France	U
722	Germany	12
722	Netherlands	AL
722	New Zealand	M
722	Switzerland	12
722	Switzerland	12
722	UK	15
722	USA	R
723	Australia	M
723	Finland	K-8
723	France	U
723	USA	R
724	Argentina	13
724	Australia	M
724	Austria	6
724	Belgium	KT
724	Brazil	Livre
724	Finland	K-12
724	France	U
724	Germany	6
724	Hong Kong	IIA
724	Italy	T
724	Mexico	B
724	Netherlands	12
724	Portugal	M
725	Finland	K-16
725	France	-12
725	Germany	18
725	Norway	18
725	Sweden	15
725	USA	R
725	USA	X
726	Finland	S
726	USA	PCA #10088
727	Australia	M
727	Chile	14
727	Finland	K-16
727	Germany	16
727	Norway	15
727	Portugal	M
728	Argentina	Atp
728	Finland	K-8
729	Finland	K-16
729	Norway	15
729	Sweden	15
729	UK	18
729	USA	R
730	Australia	R
730	Finland	K-12
730	Hong Kong	III
730	Spain	18
730	Sweden	Btl
730	UK	18
730	USA	R
731	Finland	K-16
731	France	U
731	Sweden	15
731	USA	PG
732	Argentina	16
732	Australia	MA
732	Finland	K-16
732	France	U
732	Germany	16
732	Hong Kong	IIA
732	Norway	15
732	Portugal	M
733	Argentina	13
733	Finland	K-12
733	Germany	12
733	Norway	11
733	Sweden	11
733	UK	PG
733	USA	PG
734	Argentina	Atp
734	Australia	G
734	Finland	K-8
734	France	U
734	Germany	6
734	Norway	11
734	Norway	12
734	Sweden	11
734	UK	U
734	USA	PG
735	Argentina	16
735	Finland	K-16
735	Sweden	11
735	UK	15
735	USA	R
736	Australia	PG
736	Finland	K-12
736	France	U
736	Germany	12
736	Norway	12
736	Sweden	11
736	UK	PG
736	USA	PG
737	Finland	K-8
737	UK	U
738	Finland	S
738	Norway	12
738	USA	PG
739	Australia	MA
739	Finland	K-12
739	France	U
739	Hong Kong	IIB
739	Norway	11
739	Singapore	R
739	Sweden	11
739	Switzerland	14
739	Switzerland	14
739	UK	15
740	Finland	S
740	Sweden	15
740	USA	PCA #4694
741	USA	Unrated
742	Finland	S
742	Sweden	15
742	USA	Unrated
743	Finland	K-14
743	Germany	12
743	Netherlands	AL
743	Spain	13
743	Sweden	15
743	USA	R
745	Finland	S
745	Sweden	Btl
745	USA	Unrated
746	Australia	PG
746	Finland	K-16
746	Norway	11
746	Sweden	15
746	UK	PG
746	USA	Unrated
747	Finland	K-16
747	Netherlands	16
747	Portugal	M
748	Australia	R
748	Finland	K-18
748	France	-12
748	Netherlands	12
748	Sweden	15
748	UK	18
748	USA	R
749	Finland	K-12
749	Norway	12
749	Sweden	11
749	USA	PG
750	Argentina	18
750	Finland	K-16
750	Sweden	11
750	USA	R
751	Australia	PG
751	Finland	K-16
751	France	-12
751	Germany	16
751	Norway	18
751	Sweden	15
751	UK	15
751	USA	PG-13
752	Australia	PG
752	Finland	S
752	Sweden	Btl
752	UK	PG
752	USA	PG
753	Finland	K-16
753	Norway	15
753	Sweden	15
753	USA	R
754	Finland	K-16
754	France	U
754	Sweden	15
755	Argentina	13
755	Australia	M
755	Belgium	KNT
755	Finland	K-16
755	France	U
755	Germany	16
755	Hong Kong	IIB
755	Netherlands	16
755	New Zealand	M
755	Portugal	M
756	Finland	K-16
756	Iceland	Unrated
756	USA	R
757	Sweden	15
757	UK	U
757	USA	Unrated
758	Australia	M
758	Germany	6
758	Norway	11
758	Switzerland	10
758	Switzerland	10
758	UK	15
758	USA	R
759	Argentina	Atp
759	Finland	S
759	Spain	T
759	Sweden	Btl
759	UK	U
759	USA	G
760	Finland	K-16
760	Sweden	15
761	Finland	S
761	Sweden	15
762	Argentina	13
762	Finland	K-12
762	France	U
762	Germany	12
762	Portugal	M
763	Finland	K-12
763	USA	G
764	Finland	K-16
765	Finland	K-16
765	Netherlands	12
765	Norway	15
765	Sweden	15
765	UK	PG
765	USA	PG
766	Finland	K-16
766	Norway	15
766	Sweden	15
766	USA	R
767	Argentina	18
767	Australia	MA
767	Belgium	KNT
767	Finland	K-16
767	France	-16
767	Germany	16
767	Ireland	18
767	Israel	16
767	Netherlands	16
767	New Zealand	R18
767	Norway	15
767	Portugal	M
768	Finland	K-12
768	Sweden	11
768	USA	PG
769	Argentina	16
769	Australia	M
769	Germany	12
769	Norway	11
769	Portugal	M
770	Argentina	13
770	Australia	M
770	Denmark	11
770	Finland	K-14
770	France	U
770	Germany	12
770	Hong Kong	IIA
770	Netherlands	16
770	New Zealand	M
770	Norway	15
770	Portugal	M
771	Finland	K-12
771	France	U
771	Sweden	11
771	USA	PG-13
772	Argentina	16
772	Australia	MA
772	Belgium	KT
772	Finland	K-12
772	France	-12
772	Germany	16
772	Iceland	12
772	Ireland	18
772	Italy	VM14
772	Netherlands	16
772	New Zealand	R16
772	Norway	11
772	Sweden	7
772	Switzerland	16
772	Switzerland	16
772	UK	15
772	USA	R
773	Argentina	Atp
773	Finland	S
773	France	U
773	Netherlands	AL
773	Norway	A
773	Spain	T
773	Sweden	Btl
773	UK	U
773	USA	PG
774	Finland	K-16
774	Germany	16
774	Sweden	15
774	USA	Unrated
775	Finland	K-16
775	Sweden	15
776	Finland	K-10
776	Germany	6
776	Ireland	15
776	Spain	T
776	Sweden	7
776	UK	PG
776	USA	PG
777	Australia	M
777	Finland	K-14
777	Germany	16
777	Ireland	15
777	Norway	15
777	Sweden	15
777	UK	15
777	USA	R
778	Australia	M
778	France	U
778	Germany	6
778	Hong Kong	IIB
778	Portugal	M
779	Finland	K-12
779	Germany	6
779	Sweden	11
779	USA	PG
780	Australia	MA
780	Belgium	KT
780	Chile	14
780	Finland	K-8
780	Hong Kong	IIA
780	Netherlands	AL
780	Portugal	M
781	Argentina	16
781	Australia	M
781	Finland	K-12
781	France	U
781	Germany	12
781	Hong Kong	IIA
781	Ireland	18
781	Netherlands	16
781	New Zealand	M
781	Norway	11
781	Portugal	M
782	Finland	K-16
782	Germany	16
782	Sweden	15
782	USA	R
783	USA	R
\.


--
-- Data for Name: directs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY directs (mid, pid) FROM stdin;
533	6541
534	6558
535	6576
536	6593
537	6594
538	6626
539	6541
540	6652
541	6669
542	6687
543	6703
544	6719
545	6576
546	6750
547	6719
548	6773
549	6790
550	6719
551	6824
552	6576
553	6856
554	6871
555	6887
556	6899
557	6900
558	6703
559	6948
560	6719
561	6973
562	6990
562	6988
563	7006
563	7007
564	6871
565	7036
566	7046
567	7063
568	7075
569	7093
570	7095
571	7113
572	7126
573	7143
574	6871
575	7166
576	7173
577	7191
577	7181
578	6541
579	7216
580	7143
581	7248
582	6887
583	7264
584	6669
585	7285
586	6703
587	7143
588	6558
589	7331
590	7335
590	7336
591	7362
592	7373
592	7139
593	6703
594	7405
595	7046
596	6594
597	6790
598	6856
599	6669
600	7482
601	7493
602	7509
603	7510
604	7510
605	7493
606	7556
607	6687
608	7493
610	6576
611	7636
612	7646
613	7662
614	7678
615	7691
616	7166
617	7719
618	7720
619	7746
620	7760
621	6669
622	7786
623	7046
624	7093
625	7821
626	7832
627	7847
628	7862
629	6719
630	7875
631	7903
632	7915
633	7510
634	7940
635	7955
636	7971
637	7982
638	6703
639	8011
640	6719
641	8039
642	7095
643	6856
644	6703
645	8076
646	6719
647	8103
648	8114
649	7955
650	7143
651	7636
652	7971
653	7126
654	8076
655	7063
656	7510
657	8208
658	7720
659	8232
660	8238
661	8255
662	8272
663	8288
664	7746
665	8304
665	8303
666	8316
667	6856
668	8342
669	8076
670	6988
671	7157
672	8011
673	8393
674	8407
675	8422
676	8435
677	7760
678	6541
679	7862
680	7143
681	8490
682	8506
683	8521
684	8537
685	7719
686	8566
687	6703
688	8591
689	7335
690	8617
691	7166
692	6576
693	8660
694	8674
694	7095
695	6703
696	8700
697	8705
697	8706
698	8721
699	6734
700	8749
701	8755
702	8771
703	7760
704	8797
705	8812
706	8825
707	8843
708	8858
709	8721
710	6669
711	8886
712	7143
713	7821
714	8936
715	8952
716	8966
717	8982
718	7955
719	6593
719	9005
720	7336
721	7955
722	9032
723	7821
724	9060
725	9075
726	8469
727	7335
728	9111
728	9112
729	9119
730	9125
731	6719
732	9161
733	7773
734	6576
735	7862
736	6576
737	9231
738	9243
739	9259
740	9270
741	9277
742	7955
743	9296
744	9306
745	7971
746	9329
746	9331
747	7556
748	9357
749	9370
750	8755
751	6719
752	9411
753	9427
754	8076
755	9449
756	9296
757	6719
758	9493
759	9504
760	7191
761	8755
762	9537
763	9544
764	9557
765	7046
766	6899
767	9595
768	9607
769	9624
770	6750
771	7720
772	9651
773	9677
774	9689
775	7940
776	9715
777	9729
778	8103
779	9761
780	9776
781	9791
782	6899
783	9804
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: -
--

COPY genre (mid, genre) FROM stdin;
533	Crime
533	Drama
534	Drama
535	Drama
535	War
536	Drama
536	Romance
537	Drama
538	Drama
539	Crime
539	Drama
540	Sci-Fi
540	Action
540	Adventure
540	Fantasy
541	Action
541	Drama
542	Drama
543	Comedy
543	Sci-Fi
543	War
544	Thriller
544	Mystery
545	Fantasy
545	Action
545	Adventure
546	Crime
546	Film-Noir
546	Thriller
547	Horror
547	Thriller
548	Sci-Fi
548	Action
548	Adventure
549	Crime
549	Thriller
549	Action
549	Drama
550	Thriller
550	Comedy
551	Thriller
551	Crime
552	Action
552	Drama
552	War
553	Fantasy
553	Family
553	Drama
554	Crime
554	Drama
555	Adventure
555	War
556	Drama
557	Comedy
557	Drama
558	Drama
558	War
559	Drama
560	Drama
560	Thriller
561	Thriller
561	Drama
561	Horror
562	Animation
562	Family
562	Comedy
562	Fantasy
563	Action
563	Thriller
563	Sci-Fi
564	Film-Noir
564	Drama
564	Crime
565	Crime
565	Drama
565	Film-Noir
565	Mystery
565	Thriller
566	Film-Noir
566	Mystery
567	Crime
567	Thriller
568	Film-Noir
568	Mystery
568	Thriller
569	Drama
569	Thriller
570	Short
570	Animation
570	Family
570	Comedy
571	Action
571	Drama
571	War
572	Family
572	Fantasy
572	Adventure
572	Musical
573	Drama
573	Film-Noir
574	Drama
575	Action
575	Western
576	Crime
576	Film-Noir
576	Mystery
576	Thriller
577	Musical
577	Romance
578	Action
578	Drama
578	War
579	Drama
580	Comedy
580	Romance
581	Comedy
581	Fantasy
582	Drama
582	War
583	Musical
583	Family
583	Animation
584	Drama
584	Mystery
585	Romance
585	Drama
585	Comedy
586	Sci-Fi
587	Mystery
587	Crime
587	Film-Noir
588	Drama
589	Drama
590	Comedy
591	Film-Noir
591	Thriller
592	Comedy
593	Sci-Fi
594	Drama
594	Action
595	Adventure
595	Drama
596	Crime
596	Film-Noir
596	Thriller
597	Crime
597	Thriller
598	Drama
599	Drama
599	War
600	Action
600	Adventure
600	Drama
600	War
600	Romance
601	Horror
601	Sci-Fi
601	Thriller
602	Drama
603	Comedy
604	Comedy
604	Drama
604	Romance
605	Drama
605	Action
606	Crime
606	Thriller
606	Drama
607	Drama
608	Action
608	Sci-Fi
608	Drama
609	Drama
610	Horror
610	Thriller
611	Crime
611	Drama
612	Drama
613	Action
613	Crime
613	Drama
613	Thriller
614	Thriller
614	Drama
615	Comedy
615	Musical
616	Western
617	Drama
618	Comedy
618	Romance
619	Crime
619	Drama
620	Action
620	Horror
620	Sci-Fi
621	Action
621	Drama
622	Adventure
622	War
623	Adventure
623	Romance
623	War
624	Crime
624	Thriller
624	Drama
624	Mystery
625	Fantasy
625	Family
625	Adventure
625	Comedy
625	Romance
626	Comedy
626	Drama
627	Family
627	Animation
627	Sci-Fi
628	Drama
629	Thriller
629	Film-Noir
630	Drama
631	Drama
631	War
632	Action
632	Fantasy
632	Adventure
632	Animation
633	Comedy
634	Thriller
634	Western
635	Western
636	Drama
636	War
637	Comedy
637	Romance
638	Action
638	Drama
638	War
639	Drama
639	Romance
640	Romance
640	Thriller
641	Drama
641	War
642	Short
642	Family
642	Animation
642	Comedy
643	Romance
643	Comedy
644	Horror
645	Romance
645	Comedy
646	Film-Noir
646	Romance
646	Thriller
647	Crime
647	Drama
648	Drama
648	War
649	Drama
650	Romance
650	Comedy
650	Drama
651	Western
652	Action
652	Drama
653	Drama
653	Romance
654	Film-Noir
654	Mystery
655	Sci-Fi
655	Drama
656	Comedy
657	Drama
658	Comedy
658	Drama
658	Romance
659	Drama
659	Film-Noir
659	Thriller
660	Sci-Fi
660	Action
660	Adventure
661	Comedy
662	Drama
662	Romance
663	War
664	Drama
665	Drama
665	War
666	Drama
666	War
667	Comedy
668	Drama
669	Comedy
670	Animation
670	Family
670	Comedy
670	Fantasy
671	Thriller
671	Drama
671	Western
672	Drama
673	Action
673	Thriller
674	Comedy
675	Action
675	Drama
675	Western
676	Drama
677	Action
677	Sci-Fi
678	Crime
678	Horror
678	Thriller
678	Drama
678	Mystery
679	Drama
680	Drama
680	War
681	Comedy
682	Action
682	Drama
682	War
683	Drama
684	Crime
684	Thriller
685	Drama
686	Romance
686	Comedy
687	Drama
688	Musical
688	Drama
689	Comedy
689	Sci-Fi
689	Fantasy
690	Drama
691	Crime
691	Drama
691	Thriller
692	Fantasy
692	Action
692	Adventure
693	Drama
694	Animation
694	Family
694	Comedy
695	Crime
695	Film-Noir
696	Horror
697	Family
697	Animation
697	Musical
697	Fantasy
698	Adventure
698	Drama
698	Comedy
699	Drama
700	Drama
701	Drama
702	Action
702	Crime
702	Thriller
703	Action
703	Sci-Fi
704	Fantasy
704	Comedy
704	Drama
704	Sci-Fi
705	Drama
705	Horror
706	Drama
707	Drama
708	Drama
709	Family
709	Adventure
709	Comedy
709	Sci-Fi
710	Drama
711	Drama
711	War
712	Drama
712	Mystery
713	Adventure
713	Drama
714	Action
714	Thriller
715	Drama
716	Action
716	Crime
716	Drama
717	Drama
717	Romance
718	Drama
718	Romance
719	Action
719	Adventure
720	Comedy
721	Western
722	Comedy
723	Comedy
724	Comedy
724	Drama
724	Romance
725	Drama
726	Film-Noir
726	Mystery
727	Drama
727	Sci-Fi
728	Animation
728	Family
728	Musical
729	Crime
729	Drama
730	Comedy
731	Film-Noir
731	Thriller
732	Drama
732	Comedy
732	Action
732	War
733	Drama
734	Family
734	Sci-Fi
734	Adventure
734	Fantasy
735	Drama
736	Drama
736	Sci-Fi
737	Fantasy
737	Drama
738	Drama
738	Thriller
739	Drama
739	Romance
740	Fantasy
740	Comedy
741	Drama
742	Western
743	Comedy
743	Drama
743	Thriller
744	Short
744	Family
744	Animation
745	Comedy
745	Romance
746	Fantasy
746	Adventure
746	Thriller
747	Drama
748	Adventure
748	Thriller
749	Drama
749	Comedy
750	Comedy
751	Horror
752	Drama
753	Drama
753	War
754	Western
755	Crime
755	Thriller
755	Drama
756	Comedy
756	War
757	Mystery
757	Thriller
758	Drama
759	Animation
759	Family
759	Musical
760	Comedy
760	Mystery
760	Romance
760	Thriller
761	Drama
762	Comedy
762	Drama
763	Drama
763	Sci-Fi
764	Comedy
764	Mystery
765	Adventure
766	Crime
766	Drama
767	Crime
767	Comedy
768	Drama
769	Drama
770	Action
770	Drama
770	Sci-Fi
771	Comedy
771	Drama
772	Animation
772	Musical
772	Comedy
773	Drama
773	Romance
774	Drama
775	Drama
775	Romance
775	War
776	Fantasy
776	Comedy
776	Romance
777	Comedy
778	Drama
778	Romance
778	Mystery
779	Drama
780	Drama
781	Drama
782	Comedy
782	Drama
783	Drama
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: -
--

COPY language (mid, language) FROM stdin;
533	English
533	Italian
534	English
535	English
535	Hebrew
536	English
536	French
536	German
537	English
538	English
539	English
539	Sicilian
539	Italian
540	English
541	Japanese
542	English
543	English
544	English
545	English
546	English
547	English
548	English
549	English
550	English
551	English
552	Czech
552	English
552	French
552	German
553	English
554	English
555	English
556	English
557	English
557	Italian
557	German
557	English
558	English
559	English
560	English
561	English
561	Spanish
561	Latin
562	English
563	English
564	English
565	English
566	English
567	German
568	English
568	German
569	English
570	English
571	German
572	English
573	English
574	English
575	Italian
576	English
577	English
578	English
579	English
580	English
581	English
582	English
583	English
584	Japanese
585	English
586	English
587	English
588	English
589	English
590	English
591	English
593	English
594	German
595	English
596	English
597	English
598	English
599	Japanese
600	English
600	French
601	English
602	English
603	English
605	English
606	English
607	English
608	English
608	Hungarian
609	Danish
609	German
609	English
610	English
611	English
612	Italian
613	English
614	English
615	English
616	Italian
617	English
618	English
619	English
620	English
621	Japanese
622	English
623	English
624	English
625	English
626	Spanish
627	English
628	Swedish
629	English
630	English
631	English
632	Japanese
633	English
633	Esperanto
634	English
635	English
636	English
637	English
638	English
639	English
640	English
641	English
642	English
643	English
644	English
645	English
646	English
647	French
648	French
648	German
648	English
649	English
650	English
651	English
652	English
653	English
654	English
657	French
658	English
659	English
660	English
661	English
662	English
662	Italian
663	English
663	French
664	English
666	English
666	German
667	English
667	German
668	English
669	English
670	English
671	English
672	English
673	English
673	German
673	Italian
674	English
675	English
676	English
677	English
678	English
679	Swedish
680	English
680	German
681	English
682	English
683	English
684	English
685	English
686	English
687	English
688	English
689	English
690	English
691	English
692	English
693	English
694	English
695	English
697	English
698	English
699	English
700	English
701	Italian
702	Cantonese
703	English
704	English
705	English
706	Mandarin
707	Portuguese
708	English
709	English
710	Japanese
711	English
711	French
712	English
713	English
714	English
715	English
716	English
717	French
718	English
718	Gaelic
719	English
720	English
721	English
722	English
723	English
724	English
725	English
726	English
727	English
728	English
729	English
730	English
731	English
732	English
732	Arabic
733	English
734	English
735	Swedish
735	German
735	Yiddish
735	English
736	English
737	English
738	English
739	Swedish
740	English
741	English
742	English
743	English
744	English
745	English
745	German
746	English
747	English
748	English
749	English
750	Italian
751	English
752	French
753	English
754	English
755	English
756	English
757	English
758	English
759	English
760	English
761	Italian
762	English
763	English
764	English
765	English
766	English
767	English
768	English
769	English
770	English
771	English
772	English
773	English
774	English
775	English
776	English
777	English
778	English
778	French
778	German
778	Italian
778	Mandarin
779	French
780	English
781	English
782	English
783	English
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: -
--

COPY movie (mid, name, year, plot_outline, rating) FROM stdin;
533	Godfather, The	1972	A Mafia boss' son, previously uninvolved in the business, takes over when his father is critically wounded in a mob hit.	9.0
534	Shawshank Redemption, The	1994	The life of Andy Dufresne changes when he is convicted and jailed for the murder of his wife.	9.0
535	Schindler's List	1993	Oskar Schindler uses Jews to start a factory in Poland during the war. He witnesses the horrors endured by the Jews, and starts to save them.	8.8
536	Casablanca	1942	Rick Blaine, a callous nightclub owner in a wartime waystation, has his world turned upside down when his lost love, Ilsa, returns.	8.9
537	Citizen Kane	1941	Powerful newspaper owner Charles Foster Kane was many things to many people, both in life and, as seen in retrospective here, in death.	8.8
538	American Beauty	1999	A man tells his tale of how he turned his miserable life around and turned everyone else's upside down as a result.	8.8
539	Godfather: Part II, The	1974	The early life & career of Vito Corleone is portrayed while his son, expands and tightens his grip on his crime syndicate in the 1950's.	8.8
540	Star Wars	1977	Luke Skywalker leaves his home planet, teams up with other rebels, and tries to save Princess Leia from the evil clutches of Darth Vader.	8.8
541	Shichinin no samurai	1954	A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.	9.0
542	One Flew Over the Cuckoo's Nest	1975	A man sent to a mental hospital finds the head nurse a lot more dangerous than the other patients.	8.7
543	Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb	1964	An insane general starts a process to nuclear holocaust that a war room of politicians and generals frantically try to stop.	8.8
544	Rear Window	1954	A wheelchair bound photographer spies on his neighbours from his apartment window and becomes convinced one of them has committed murder.	8.7
545	Raiders of the Lost Ark	1981	Archeologist and adventurer, Indiana Jones, is hired by the US government to find the Ark of the Covenant, before the Nazis...	8.6
546	Usual Suspects, The	1995	Five villains in New York are rounded up by police in an unconventional manner that worries them. After release, they get together for a spot of revenge, but someone else is controling events.	8.7
547	Psycho	1960	A young female embezzeler arrives at the Bates Motel which has terrible secrets of its own.	8.6
548	Star Wars: Episode V - The Empire Strikes Back	1980	While Luke takes advanced Jedi training from Yoda, his friends are relentlessly pursued by Darth Vader as part of his plan to capture Luke.	8.6
549	Pulp Fiction	1994	The stories of two mob hit men, a boxer and a pair of diner bandits intertwine in four tales of violence and redemption.	8.6
550	North by Northwest	1959	An advertising executive is mistaken for a spy and is pursued across the country while he looks for a way to survive.	8.6
551	Silence of the Lambs, The	1991	Clarice Starling, a young FBI agent, is assigned to help find a missing woman, and save her from a psychopathic killer.	8.5
552	Saving Private Ryan	1998	Based on a World War II drama. US soldiers try to save their comrade, paratrooper Private Ryan, who's stationed behind enemy lines.	8.5
553	It's a Wonderful Life	1946	An angel helps a despairingly frustrated man by showing the profoundly positive impact he had on his community.	8.6
554	Goodfellas	1990	Henry Hill and his friends work their way up through the mob hierarchy.	8.5
555	Lawrence of Arabia	1962	British lieutenant T.E. Lawrence rewrites the political history of Saudi Arabia.	8.6
556	12 Angry Men	1957	A dissenting juror in a murder trial slowly manages to convince the others that the case is not as obviously clear as it seemed in court.	8.6
557	Vita e bella, La	1997	A Jewish man has a wonderful romance with the help of his humour, but must use that same quality to protect his son in a Nazi death camp.	8.6
558	Paths of Glory	1957	When soldiers in WW1 refuse to continue with an impossible attack, their superiors decide to make an example of them.	8.8
559	To Kill a Mockingbird	1962	Atticus Finch, a lawyer in the Depression-era South, defends a black man against an undeserved rape charge and his kids against prejudice.	8.5
560	Vertigo	1958	Complex story about a San Francisco detective and his psychological troubles with fear of heights and with a woman.	8.5
561	Sixth Sense, The	1999	A boy who communicates with spirits that don't know they're dead seeks the help of a disheartened child psychologist.	8.5
562	Toy Story 2	1999	When Woody is stolen by a toy collector, Buzz and his friends vow to rescue him, but Woody finds the idea of immortality in a museum tempting.	8.5
563	Matrix, The	1999	A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against the controllers of it.	8.5
564	Taxi Driver	1976	A mentally unstable Vietnam war veteran works as nighttime taxi driver in a city whose perceived decadence and sleaze feeds his urge to violently lash out.	8.4
565	L.A. Confidential	1997	A shooting at an all night diner is investigated by three LA policemen in their own uinque ways.	8.4
566	Maltese Falcon, The	1941	Sam Spade, a private detective, gets involved in a murderous hunt for a valuable statuette.	8.5
567	M	1931	When the police in a German city are unable to catch a child-murderer, other criminals join in the manhunt.	8.7
568	Third Man, The	1949	Arriving in Vienna, Holly Martins learns that his friend Harry Lime, who has invited him, recently died in a car accident.	8.6
569	Fight Club	1999	A man disillusioned by what his life has become encounters an exciting stranger who introduces him to a new way of life.	8.5
570	Wallace & Gromit: The Wrong Trousers	1993	Wallace is used by a criminal penguin in a robbery involving mechanical trousers.	8.5
571	Boot, Das	1981	The claustrophobic world of a WWII German U-boat; boredom, filth, and sheer terror.	8.5
572	Wizard of Oz, The	1939	Dorothy Gale is swept away to a magical land in a tornado and embarks on a quest to see the Wizard who can help her return home.	8.4
573	Sunset Blvd.	1950	Recently deceased hack writer Joe Gillis tells of his excursions with delusional silent movie star Norma Desmond.	8.6
574	Raging Bull	1980	A biographical film about the middleweight champ, the physically tough, but emotionally self-destructive Jake LaMotta.	8.4
575	Buono, il brutto, il cattivo, Il	1966	\N	8.5
576	Chinatown	1974	A private detective investigating an adultery case stumbles on to a scheme of murder that has something to do with water.	8.4
577	Singin' in the Rain	1952	A silent film production company and cast make a difficult transition to sound.	8.4
578	Apocalypse Now	1979	Captain Willard	8.3
579	All About Eve	1950	\N	8.6
580	Some Like It Hot	1959	When two musicians witness a mob hit, they flee the state in an all female band disguised as women, but further complications set in.	8.4
581	Being John Malkovich	1999	A puppeteer discovers a portal that leads literally into the head of the movie star, John Malkovich.	8.4
582	Bridge on the River Kwai, The	1957	British soldiers are forced to build a railway bridge for their WWII Japanese captors, unaware of an allied mission to it blow up.	8.4
583	\N	\N	A grumpy hermit hatches a plan to steal Christmas from the Whos of Whoville.	8.5
584	Rashomon	1950	A heinous crime and its aftermath are recalled from differing points of view.	8.6
585	Almost Famous	2000	A high-school boy is given the chance to write a story about an up-and-coming rock band.	8.7
586	2001: A Space Odyssey	1968	Mankind finds a mysterious, obviously artificial, artifact buried on the moon and, with the intelligent computer HAL, sets off on a quest.	8.3
587	Double Indemnity	1944	An insurance rep lets himself be talked into a murder/insurance fraud scheme that arouses an insurance investigator's suspicions.	8.5
588	Green Mile, The	1999	Drama about the lives of guards on death row leading up to the execution of a wrongly accused man.	8.4
589	American History X	1998	A former neo-nazi skinhead	8.4
590	Monty Python and the Holy Grail	1975	King Arthur and his knights embark on a low-budget search for the Grail, encountering many very silly obstacles.	8.3
591	Manchurian Candidate, The	1962	A group of American soldiers are captured and brainwashed into becoming sleeper agents.	8.4
592	General, The	1927	When Union spies steal an engineer's beloved locomotive, he pursues it single handedly and straight through enemy lines.	8.8
593	Clockwork Orange, A	1971	The adventures of a young man who loved a bit of the old ultra-violence, went to jail, was brainwashed and came out cured, or was he?	8.3
594	Lola rennt	1998	Lola runs. To save her boyfriend's life.	8.4
595	Treasure of the Sierra Madre, The	1948	\N	8.5
596	Touch of Evil	1958	\N	8.5
597	Reservoir Dogs	1992	After a bloody diamond heist, the crooks recall their previous actions and argue about what went wrong.	8.2
598	Mr. Smith Goes to Washington	1939	A naive man is appointed to fill a vacancy in the US Senate. His plans promptly collide with political corruption, but he doesn't back down.	8.4
599	Ran	1985	An elderly lord abdicates to his three sons, and the two corrupt ones turn against him.	8.5
600	Braveheart	1995	William Wallace, a commoner, unites the 13th Century Scots in their battle to overthrow English rule.	8.3
601	Alien	1979	A mining ship, investigating an SOS, lands on a distant planet. The crew discovers some strange creatures and investigates.	8.2
602	Magnolia	1999	A mixing and matching of friends in the San Fernando Valley.	8.3
603	Modern Times	1936	The Tramp struggles to live in modern industrial society with the help of a young homeless woman.	8.5
604	City Lights	1931	The Tramp struggles to help a blind flower girl he has fallen in love with.	8.6
605	Gladiator	2000	When a Roman general is betrayed and his family murdered by a corrupt prince, he comes to Rome as a gladiator to seek revenge.	8.3
606	Fargo	1996	Jerry Lundegaard's inept crime falls apart due to his and his henchmen's bungling and the persistent police work of pregnant Marge Gunderson.	8.2
607	Amadeus	1984	The incredible story of Wolfgang Amadeus Mozart, told in flashback mode by Antonio Salieri - now confined to an insane asylum.	8.2
608	Blade Runner	1982	Deckard, a blade runner, has to track down and terminate 5 replicants who hijacked a ship in space and have returned to earth seeking their maker...	8.3
609	Dogme 1 - Festen	1998	\N	8.5
610	Jaws	1975	A police chief, a scientist, and a grizzled sailor set out to kill a shark that is menacing the seaside community of Amity Island.	8.2
611	Sting, The	1973	In 1930s Chicago, a young con man seeking revenge for his murdered partner teams up with a master of the big con to win a fortune from a criminal banker.	8.2
612	Ladri di biciclette	1948	A painter and his son search for a stolen bicycle vital for his job.	8.7
613	Leon	1994	Professional assassin Leon reluctantly takes care of 12-year-old Mathilda, a neighbor whose parents are killed, and teaches her his trade.	8.3
614	Insider, The	1999	True story of tobacco executive-turned-whistleblower Jeffrey Wigand and his relationship with "60 Minutes" producer Lowell Bergman.	8.3
615	Duck Soup	1933	Rufus T. Firefly is named president/dictator of bankrupt Freedonia and declares war on neighboring Sylvania over the love of wealthy Mrs. Teasdale.	8.4
616	C'era una volta il West	1969	\N	8.5
617	Straight Story, The	1999	73-year-old man takes a six week trip to mend his relationship with his older brother, who is ill.	8.4
618	Annie Hall	1977	Neurotic New York comedian Alvy Singer falls in love with the ditsy Annie Hall.	8.2
619	On the Waterfront	1954	\N	8.3
620	Aliens	1986	The planet from _Alien	8.2
621	Yojimbo	1961	A crafty ronin comes to a town divided by two criminal gangs and decides to play them against each other to free the town.	8.6
622	Great Escape, The	1963	Several hundred Allied POWs plan a mass escape from a German POW camp.	8.2
623	African Queen, The	1951	In Africa during WW1, a gin-swilling riverboat owner/captain is persuaded by a strait-laced missionary to use his boat to attack an enemy warship.	8.2
624	Se7en	1995	Police drama about two cops, one new and one about to retire, after a serial killer using the seven deadly sins as his MO.	8.1
625	Princess Bride, The	1987	A classic fairy tale, with swordplay, giants, an evil king, a beautiful princess, and yes, some kissing	8.2
626	Todo sobre mi madre	1999	Young Esteban want to become a writer and also to discover the identity of his father, carefully concealed by the mother Manuela.	8.4
627	Iron Giant, The	1999	A boy makes friends with an innocent alien giant robot that a paranoid government agent wants to destroy.	8.4
628	Sjunde inseglet, Det	1957	\N	8.4
629	Strangers on a Train	1951	You'd like your wife killed, wouldn't you? I'll do it for you if you'll kill someone for me, and since we're strangers we'll be free of suspicion.	8.3
630	Sling Blade	1996	Karl Childers, a simple man hospitalized since his childhood murder of his mother and her lover, is released to start a new life in a small town.	8.1
631	Glory	1989	Robert Shaw leads the US Civil War's first all-black volunteer company, fighting prejudices of both his own Union army and the Confederates.	8.1
632	Mononoke Hime	1997	On a journey to find the cure for a Tatarigami's curse, Ashitaka finds himself in the middle of a war between the forest and Tataraba, a mining colony. In this quest he also meets San, the Mononoke Hime.	8.6
633	Great Dictator, The	1940	In Chaplin's satire on Nazi Germany, dictator Adenoid Hynkel has a double... a poor Jewish barber... who one day is mistaken for Hynkel.	8.3
634	High Noon	1952	A sheriff, personally compelled to face a returning deadly enemy, finds that his own town refuses to help him.	8.2
635	Searchers, The	1956	As a Civil War veteran spends years searching for a young niece captured by Indians, his motivation becomes increasingly questionable.	8.3
636	Best Years of Our Lives, The	1946	Three WWII veterans return home to small-town America to discover that they and their families have been irreparably changed.	8.5
637	Philadelphia Story, The	1940	When a rich woman's ex-husband and a tabloid-type reporter turn up just before her planned remarriage, she begins to learn the truth about herself.	8.2
638	Full Metal Jacket	1987	A group of soldiers develop dehumanized personalities in their training and it shows in their tour of duty in Vietnam.	8.1
639	Graduate, The	1967	A young man just out of college doesn't know what to do with his life. But being involved with a young woman AND her mother probably wasn't it.	8.1
640	Rebecca	1940	\N	8.2
641	Deer Hunter, The	1978	An in-depth examination of the way that the Vietnam war affects the lives of people in a small industrial town in the USA.	8.1
642	Wallace & Gromit: A Close Shave	1995	Wallace falls for Wendolene, a wool shop owner, while Gromit is framed for the sheep rustling.	8.2
643	It Happened One Night	1934	A spoiled heiress, running away from her family, is helped by a man who's actually a reporter looking for a story. But then he falls for her...	8.4
644	Shining, The	1980	A young boy and his parents become caretakers of a isolated and haunted hotel over the winter.	8.1
645	Bringing Up Baby	1938	\N	8.3
646	Notorious	1946	A woman is asked to spy on a group of Nazi friends in South America. How far will she have to go to ingratiate herself with them?	8.3
647	Quatre cents coups, Les	1959	\N	8.6
648	Grande illusion, La	1937	\N	8.6
649	Grapes of Wrath, The	1940	\N	8.3
650	Apartment, The	1960	A man tries to rise in his company by letting its executives use his apartment for trysts, but complications and a romance of his own ensue.	8.3
651	Butch Cassidy and the Sundance Kid	1969	Two Western bank/train robbers flee to Bolivia when the law gets too close.	8.1
652	Ben-Hur	1959	When a Jewish prince is betrayed and sent into slavery by a Roman friend, he regains his freedom and comes back for revenge.	8.1
653	Gone with the Wind	1939	Epic story of a woman that can cope with everything in the US Civil War except losing the love of the man she wants to another.	8.0
654	Big Sleep, The	1946	Private detective Philip Marlowe is hired by a rich family. Before the complex case is over, he's seen murder, blackmail, and what might be love.	8.2
655	Metropolis	1927	The Workers, led by the beautiful Maria, plan a revolt against the aloof Thinkers that dominate them in this future dystopia.	8.2
656	Gold Rush, The	1925	The Tramp goes the Klondike in search of gold and finds it and more.	8.4
657	Trois couleurs: Rouge	1994	Final entry in a trilogy of films dealing with contemporary French society concerns a model who discovers her neighbour is keen on invading people's privacy.	8.2
658	Manhattan	1979	\N	8.2
659	Night of the Hunter, The	1955	\N	8.4
660	Star Wars: Episode VI - Return of the Jedi	1983	Han Solo is imprisoned by Jabba the Hutt, the Empire is building a new Death Star, and Luke hasn't finished his Jedi training.	8.0
661	Christmas Story, A	1983	Ralphie has to convince his parents, teachers, and Santa that a Red Ryder BB gun really is the perfect gift for the 1940's.	8.1
662	Nuovo cinema Paradiso	1988	\N	8.2
663	All Quiet on the Western Front	1930	\N	8.4
664	Streetcar Named Desire, A	1951	\N	8.2
665	Bronenosets Potyomkin	1925	\N	8.4
666	Patton	1970	The World War II phase of the controversial American general's career is depicted.	8.1
667	Arsenic and Old Lace	1944	A man learns that his kindly old aunts and his sinister brother are all serial killers, and tries to sort it out fast so he can go on his honeymoon.	8.1
668	Cool Hand Luke	1967	A man refuses to conform to life in a rural prison.	8.1
669	His Girl Friday	1940	\N	8.3
670	Toy Story	1995	A cowboy toy is profoundly threatened and jealous when a fancy spaceman toy supplants him as top toy in a boy's room.	7.9
671	Unforgiven	1992	Retired Old West gunslinger William Munny reluctantly takes on one last job, with the help of his old partner and a young man.	7.9
672	Who's Afraid of Virginia Woolf?	1966	\N	8.2
673	Die Hard	1988	New York cop John McClane gives terrorists a dose of their own medicine as they hold hostages in an LA office building.	7.9
674	Young Frankenstein	1974	Dr. Frankenstein's grandson, after years of living down the family reputation, inherits granddad's castle and repeats the experiments.	8.0
675	Wild Bunch, The	1969	\N	8.1
676	Hustler, The	1961	An up-and-coming pool player plays a long-time champion in a single high-stakes match.	8.2
677	Terminator 2: Judgment Day	1991	A shape-shifting cyborg is sent back from the future to kill John Connor before he can grow up to lead the resistance; a protector is sent, too.	7.9
678	Conversation, The	1974	\N	8.1
679	Smultronstallet	1957	After living a life marked by coldness, an aging professor is forced to confront the emptiness of his existence.	8.5
680	Stalag 17	1953	Intrigue among Allied prisoners at a World War 2 German POW camp.	8.3
681	Night at the Opera, A	1935	A sly business manager and two wacky friends of two opera singers help them achieve success while humiliating their stuffy and snobbish enemies.	8.2
682	Platoon	1986	A young recruit in Vietnam faces a moral crisis when a sergeant orders a massacre of villagers.	7.9
683	Good Will Hunting	1997	Will Hunting, a janitor at MIT, has a gift for mathematics which is discovered, and a psychiatrist tries to help him with his gift and the rest of his life.	7.9
684	Lock, Stock and Two Smoking Barrels	1998	Four London working class stiffs pool their money to put one in a high stakes card game, but things go wrong and they end up owing half a million pounds and having one week to come up with the cash.	8.1
685	Elephant Man, The	1980	A Victorian doctor comes to care for a man catastrophically deformed with Proteous Syndrome.	8.0
686	Shakespeare in Love	1998	A young Shakespeare, out of ideas and short of cash, meets his ideal woman and is inspired to write one of his most famous plays.	7.9
687	Spartacus	1960	The slave Spartacus leads a violent revolt against the decadent Roman empire.	8.0
688	Dancer in the Dark	2000	An east European girl goes to America with her young son, expecting it to be like a Hollywood film.	8.4
689	Brazil	1985	A bureaucrat in a retro-future world tries to correct an administrative error and himself becomes an enemy of the state.	8.0
690	Boys Don't Cry	1999	The story of the life of Teena Brandon, a transgender youth who preferred life in her male identity as Brandon Teena.	8.0
691	Once Upon a Time in America	1984	\N	8.0
692	Indiana Jones and the Last Crusade	1989	The daring archaeologist and his father search for the Holy Grail and fight the Nazis.	7.8
693	Sweet Hereafter, The	1997	This film documents the effects of a tragic bus accident on the population of a small town.	8.1
694	Chicken Run	2000	Chicken Run is a comedy escape drama with a touch of passion set on a sinister Yorks chicken farm in 1950's England	8.0
695	Killing, The	1956	\N	8.2
696	Nosferatu, eine Symphonie des Grauens	1922	\N	8.2
697	Fantasia	1940	A collection of animated interpretations of great works of classical music.	7.9
698	Forrest Gump	1994	Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny, eludes him.	7.8
699	Right Stuff, The	1983	The original US Mercury 7 astronauts and their macho, seat-of-the-pants approach to the space program.	7.9
700	October Sky	1999	The true story of Homer Hickam, a coal miner's son who was inspired by the first Sputnik launch to take up rocketry against his father's wishes.	8.0
701	Strada, La	1954	\N	8.3
702	Die xue shuang xiong	1989	A disillusioned assassin accepts one last hit in hopes of using his earnings to restore vision to a singer he accidentally blinded, only to be double-crossed by his boss.	8.2
703	Terminator, The	1984	A human-looking, apparently unstoppable cyborg is sent from the future to kill Sarah Connor; Kyle Reese is sent to stop it.	7.8
704	Truman Show, The	1998	An insurance salesman/adjuster	7.8
705	Exorcist, The	1973	A 12 year old girl is possessed by the devil and her only hope is an exorcism.	7.9
706	Da hong deng long gao gao gua	1991	\N	8.4
707	Central do Brasil	1998	An emotive journey of a former school teacher, who write letters for illiterate people, and a young boy, whose mother has just died, in search for the father he never knew.	8.1
708	Rain Man	1988	Selfish yuppie Charlie Babbitt's father left a fortune to his savant brother Raymond and a pittance to Charlie; they travel cross-country.	7.8
709	Back to the Future	1985	Eccentric Doc Brown invents time travel; young Marty McFly goes back in time, stops his parents from meeting; they must, or he won't be born.	7.8
710	Ikiru	1952	\N	8.9
711	Henry V	1989	The gritty adaption of William Shakespeare's play about the English King's bloody conquest of France.	8.0
712	Witness for the Prosecution	1957	Agatha Christie tale of a man on trial for murder: a trial featuring surprise after surprise.	8.3
713	Stand by Me	1986	After the death of a friend, a writer recounts a boyhood journey to find a body of a missing boy	7.8
714	Fugitive, The	1993	Dr. Richard Kimble, unjustly accused of killing his wife, must find the real one-armed killer while avoiding Marshal Sam Gerard.	7.8
715	Trainspotting	1996	Renton, deeply immersed in the Edinburgh drug scene, tries to clean up and get out, despite the allure of the drugs and influence of friends.	7.8
716	Untouchables, The	1987	Federal Agent Elliot Ness sets out to take out Al Capone; because of rampant corruption, he assembles a small, hand-picked team.	7.8
717	Enfants du paradis, Les	1945	\N	8.5
718	Quiet Man, The	1952	\N	8.1
719	Adventures of Robin Hood, The	1938	When Prince John and the Norman Lords begin oppressing the Saxon masses in King Richard's absence, a Saxon lord fights back as the outlaw leader of a rebel guerrilla army.	8.1
720	Life of Brian	1979	Brian is born on the original Christmas, in the stable next door. He spends his life being mistaken for a messiah.	7.8
721	Man Who Shot Liberty Valance, The	1962	A senator, who became famous for killing a notorious outlaw, returns to a funeral of a homeless man and tells the truth about his deed.	8.1
722	High Fidelity	2000	Rob, a record store owner and compulsive list maker, recounts his top five breakups, including the one in progress.	7.9
723	This Is Spinal Tap	1984	Spinal Tap, the world's loudest band, is chronicled by hack documentarian Marti DeBergi on what proves to be a fateful tour.	7.9
724	As Good As It Gets	1997	A single mother/waitress	7.8
725	Midnight Cowboy	1969	A naive male prostitute and his sickly friend struggle to survive on the streets of New York City.	7.9
726	Laura	1944	\N	8.2
727	Twelve Monkeys	1995	A convict, sent back in time to stop a devastating plague, is sent too far back and is hospitalized as insane.	7.8
728	Beauty and the Beast	1991	Belle, whose father Maurice is imprisoned by the Beast	7.8
729	Bonnie and Clyde	1967	A somewhat romantized account of the career of the notoriously violent bank robbing couple and their gang.	7.9
730	Clerks	1994	Dante, clerk at a convenience store, must choose between his two girlfriends, with no particular help from friend and fellow clerk Randall.	7.9
731	Shadow of a Doubt	1943	A young woman thinks her uncle may be a serial killer.	8.2
732	Three Kings	1999	In the aftermath of the Gulf War, 4 soldiers set out to steal gold that was stolen from Kuwait, but they discover people who need their help.	7.8
733	Gandhi	1982	Biography of the lawyer who became the famed leader of the Indian revolts against the British through his philosophy of non-violent protest.	7.8
734	E.T. the Extra-Terrestrial	1982	A group of Earth children help a stranded alien botanist return home.	7.7
735	Fanny och Alexander	1982	\N	8.2
736	Close Encounters of the Third Kind	1977	A line worker, after a encounter with UFO's, feels undeniably drawn to an isolated area in the wilderness where something spectacular is about to happen.	7.8
737	Scrooge	1951	\N	8.2
738	All the President's Men	1976	Reporters Woodward and Bernstein uncover the details of the Watergate scandal that leads to President Nixon's resignation.	7.8
739	Fucking amal	\N	\N	\N
740	Harvey	1950	Elwood P. Dowd	8.0
741	Requiem for a Dream	2000	\N	8.6
742	Stagecoach	1939	\N	8.1
743	Player, The	1992	A studio executive is being blackmailed by a writer whose script he rejected but which one? Loaded with Hollywood insider jokes.	7.8
744	\N	\N	Repelled by the commercialism he sees around him, Charlie Brown tries to find the true meaning of Christmas.	8.4
745	Roman Holiday	1953	A young princess, tired of the constraints her position brings, runs away. She doesn't know the man who befriends her is a reporter out for a story.	8.0
746	King Kong	1933	An expedition team go to a tropical island and discover a colossal giant gorilla who takes a shine to their female blonde companion.	7.9
747	Miller's Crossing	1990	Tom Reagan, an advisor to a Prohibition-era crime boss, tries to keep the peace between warring mobs but gets caught in divided loyalties.	7.9
748	Deliverance	1972	A group of friends get more than they bargain for on a canoeing trip in hillbilly country.	7.8
749	Being There	1979	Chance, a simple gardener, has never left the estate until his employer dies. His simple TV-informed utterances are mistaken for profundity.	7.9
750	Amarcord	1974	\N	8.2
751	Birds, The	1963	Birds of all kinds suddenly begin to attack people, in increasing numbers and with increasing viciousness.	7.8
752	Jean de Florette	1986	\N	8.1
753	Killing Fields, The	1984	Dith Pran, friend of US journalist Sydney Schanberg, is trapped in Cambodia.	7.9
754	Rio Bravo	1959	\N	8.0
755	Simple Plan, A	1998	Two brothers	7.8
756	MASH	1970	The staff of a Korean Conflict field hospital use humour and hijinks to keep their sanity amidst the horror of war	7.8
757	39 Steps, The	1935	A man in London tries to help a counterespionage agent, and is soon finding himself in one jam after another.	8.0
758	Billy Elliot	2000	A talented young boy becomes torn between his unexpected love of dance and the disintegration of his family.	8.4
759	Snow White and the Seven Dwarfs	1937	Snow, pursued by a jealous queen, hides with the Dwarfs; the queen feeds her a poison apple, but Prince Charming awakens her with a kiss.	7.8
760	Charade	1963	Romance and suspense in Paris, as a woman is pursued by several men who want a fortune her murdered husband had stolen. Who can she trust?	8.0
761	8 1/2	1963	A harried movie director retreats into his memories and fantasies.	8.0
762	Ed Wood	1994	The mostly true story of the legendary director of awful movies and his strange group of friends and actors.	7.8
763	Day the Earth Stood Still, The	1951	An alien lands and tells the people of Earth that we must live peacefully or be destroyed as a danger to other planets.	7.9
764	Thin Man, The	1934	Comedy-mystery featuring Nick and Nora Charles: a former detective and his rich, playful wife. They solve a murder case mostly for the fun of it.	8.2
765	Man Who Would Be King, The	1975	Two British soldiers in India are mistaken for gods.	7.9
766	Dog Day Afternoon	1975	A man robs a bank to pay for his lover's sex change operation; it turns into a hostage situation and a media circus.	7.8
767	Go	1999	Go! tells the story of the events after a drug deal, told from three different points of view.	7.8
768	Lion in Winter, The	1968	\N	8.1
769	Gods and Monsters	1998	The last days of Frankenstein director James Whale are explored.	7.8
770	X-Men	2000	Two mutants come to a private academy for mutants whose resident superhero team must oppose a powerful mutant terrorist organization.	7.8
771	Crimes and Misdemeanors	1989	\N	7.9
772	South Park: Bigger, Longer and Uncut	1999	When the four boys see an R-rated movie featuring Canadians Terrance & Phillip, they are pronounced "corrupted", and their parents pressure the United States to wage war against Canada.	7.8
773	Remains of the Day, The	1993	A butler who sacrificed body and soul to service in the years before World Way II realizes too late how misguided his loyalty has been.	7.8
774	Rebel Without a Cause	1955	A rebellious young man with a troubled past comes to a new town, finding friends and enemies.	7.8
775	From Here to Eternity	1953	In 1941 Hawaii, a private is cruelly punished for not boxing on his unit's team, while his captain's wife and second in command are falling in love.	8.0
776	Groundhog Day	1993	Phil, a sarcastic weather man, finds himself trapped in the identical February 2, but he's the only person that realizes it.	7.7
777	Fish Called Wanda, A	1988	In London, four very different people team up to commit armed robbery, then try to doublecross each other for the loot.	7.7
778	Violon rouge, Le	1998	\N	8.0
779	Au revoir les enfants	1987	\N	8.1
780	Secrets & Lies	1996	Successful black woman traces her birth mother to a lower-class white woman, who denies it; emotions run high as everyone's secrets are exposed.	7.8
781	Cider House Rules, The	1999	A compassionate young man, raised in an orphanage and trained to be a doctor there, decides to leave to see the world.	7.8
782	Network	1976	A TV network cynically exploits a deranged ex-TV anchor's ravings and revelations about the media for their own profit.	7.8
783	The Inheritence	2013	A young man is torn between his individual hopes and his sense of duty when his father dies and he is expected to take over the family industry.	7.4
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

COPY person (pid, name) FROM stdin;
6526	Marlon Brando
6527	Al Pacino
6528	Diane Keaton
6529	Robert Duvall
6530	Richard S. Castellano
6531	James Caan
6532	Talia Shire
6533	Sterling Hayden
6534	John Marley
6535	Richard Conte
6536	Al Lettieri
6537	Abe Vigoda
6538	Gianni Russo
6539	John Cazale
6540	Rudy Bond
6541	Francis Ford Coppola
6542	Tim Robbins
6543	Morgan Freeman
6544	Bob Gunton
6545	William Sadler
6546	Clancy Brown
6547	Gil Bellows
6548	Mark Rolston
6549	James Whitmore
6550	Jeffrey DeMunn
6551	Larry Brandenburg
6552	Neil Giuntoli
6553	Brian Libby
6554	David Proval
6555	Joseph Ragno
6556	Jude Ciccolella
6557	Stephen King
6558	Frank Darabont
6559	Liam Neeson
6560	Ben Kingsley
6561	Ralph Fiennes
6562	Caroline Goodall
6563	Jonathan Sagall
6564	Embeth Davidtz
6565	Malgoscha Gebel
6566	Shmulik Levy
6567	Mark Ivanir
6568	Be;atrice Macola
6569	Andrzej Seweryn
6570	Friedrich von Thun
6571	Krzysztof Luft
6572	Harry Nehring
6573	Norbert Weisser
6574	Thomas Keneally
6575	Steven Zaillian
6576	Steven Spielberg
6577	Humphrey Bogart
6578	Ingrid Bergman
6579	Paul Henreid
6580	Claude Rains
6581	Conrad Veidt
6582	Sydney Greenstreet
6583	Peter Lorre
6584	S.Z. Sakall
6585	Madeleine LeBeau
6586	Dooley Wilson
6587	Joy Page
6588	John Qualen
6589	Leonid Kinskey
6590	Curt Bois
6591	Murray Burnett
6592	Joan Alison
6593	Michael Curtiz
6594	Orson Welles
6595	Joseph Cotten
6596	Dorothy Comingore
6597	Agnes Moorehead
6598	Ruth Warrick
6599	Ray Collins
6600	Erskine Sanford
6601	Everett Sloane
6602	William Alland
6603	Paul Stewart
6604	George Coulouris
6605	Fortunio Bonanova
6606	Gus Schilling
6607	Philip Van Zandt
6608	Kathryn Trosper
6609	Herman J. Mankiewicz
6610	Kevin Spacey
6611	Annette Bening
6612	Thora Birch
6613	Wes Bentley
6614	Mena Suvari
6615	Peter Gallagher
6616	Allison Janney
6617	Chris Cooper
6618	Scott Bakula
6619	Sam Robards
6620	Barry Del Sherman
6621	Ara Celi
6622	John Cho
6623	Fort Atkinson
6624	Sue Casey
6625	Alan Ball
6626	Sam Mendes
6627	Robert De Niro
6628	Lee Strasberg
6629	Michael V. Gazzo
6630	G.D. Spradlin
6631	Richard Bright
6632	Gastone Moschin
6633	Tom Rosqui
6634	Bruno Kirby
6635	Frank Sivero
6636	Francesca De Sapio
6637	Mark Hamill
6638	Harrison Ford
6639	Carrie Fisher
6640	Peter Cushing
6641	Alec Guinness
6642	Anthony Daniels
6643	Kenny Baker
6644	Peter Mayhew
6645	David Prowse
6646	Phil Brown
6647	Shelagh Fraser
6648	Jack Purvis
6649	Alex McCrindle
6650	Eddie Byrne
6651	Drewe Henley
6652	George Lucas
6653	Takashi Shimura
6654	Toshiro; Mifune
6655	Yoshio Inaba
6656	Seiji Miyaguchi
6657	Minoru Chiaki
6658	Daisuke Kato
6659	Isao Kimura
6660	Kamatari Fujiwara
6661	Kokuten Kodo
6662	Bokuzen Hidari
6663	Yoshio Kosugi
6664	Yoshio Tsuchiya
6665	Keiji Sakakida
6666	Jiro Kumagai
6667	Haruko Toyama
6668	Shinobu Hashimoto
6669	Akira Kurosawa
6670	Jack Nicholson
6671	Louise Fletcher
6672	William Redfield
6673	Michael Berryman
6674	Peter Brocco
6675	Dean R. Brooks
6676	Alonzo Brown
6677	Scatman Crothers
6678	Mwako Cumbuka
6679	Danny DeVito
6680	William Duell
6681	Josip Elic
6682	Lan Fendors
6683	Nathan George
6684	Ken Kenny
6685	Bo Goldman
6686	Lawrence Hauben
6687	Milos Forman
6688	Peter Sellers
6689	George C. Scott
6690	Keenan Wynn
6691	Slim Pickens
6692	Peter Bull
6693	James Earl Jones
6694	Tracy Reed
6695	Jack Creley
6696	Frank Berry
6697	Robert O'Neil
6698	Glenn Beck
6699	Roy Stephens
6700	Shane Rimmer
6701	Hal Galili
6702	Peter George
6703	Stanley Kubrick
6704	James Stewart
6705	Grace Kelly
6706	Wendell Corey
6707	Thelma Ritter
6708	Raymond Burr
6709	Judith Evelyn
6710	Ross Bagdasarian
6711	Georgine Darcy
6712	Sara Berner
6713	Frank Cady
6714	Jesslyn Fax
6715	Rand Harper
6716	Irene Winston
6717	Havis Davenport
6718	John Michael Hayes
6719	Alfred Hitchcock
6720	Karen Allen
6721	Paul Freeman
6722	Ronald Lacey
6723	John Rhys-Davies
6724	Alfred Molina
6725	Denholm Elliott
6726	Wolf Kahler
6727	Anthony Higgins
6728	Vic Tablian
6729	Don Fellows
6730	William Hootkins
6731	Bill Reimbold
6732	Fred Sorenson
6733	Patrick Durkin
6734	Philip Kaufman
6735	Stephen Baldwin
6736	Gabriel Byrne
6737	Benicio Del Toro
6738	Kevin Pollak
6739	Chazz Palminteri
6740	Pete Postlethwaite
6741	Suzy Amis
6742	Giancarlo Esposito
6743	Dan Hedaya
6744	Paul Bartel
6745	Carl Bressler
6746	Phillip Simon
6747	Jack Shearer
6748	Christine Estabrook
6749	Christopher McQuarrie
6750	Bryan Singer
6751	Anthony Perkins
6752	Vera Miles
6753	John Gavin
6754	Martin Balsam
6755	John McIntire
6756	Simon Oakland
6757	Vaughn Taylor
6758	Frank Albertson
6759	Lurene Tuttle
6760	Patricia Hitchcock
6761	John Anderson
6762	Mort Mills
6763	Janet Leigh
6764	Robert Bloch
6765	Joseph Stefano
6766	Billy Dee Williams
6767	Frank Oz
6768	Jeremy Bulloch
6769	John Hollis
6770	Des Webb
6771	Kathryn Mullen
6772	Leigh Brackett
6773	Irvin Kershner
6774	John Travolta
6775	Samuel L. Jackson
6776	Uma Thurman
6777	Harvey Keitel
6778	Tim Roth
6779	Amanda Plummer
6780	Maria de Medeiros
6781	Ving Rhames
6782	Eric Stoltz
6783	Rosanna Arquette
6784	Christopher Walken
6785	Bruce Willis
6786	Paul Calderon
6787	Bronagh Gallagher
6788	Peter Greene
6789	Roger Avary
6790	Quentin Tarantino
6791	Cary Grant
6792	Eva Marie Saint
6793	James Mason
6794	Jessie Royce Landis
6795	Leo G. Carroll
6796	Josephine Hutchinson
6797	Philip Ober
6798	Martin Landau
6799	Adam Williams
6800	Edward Platt
6801	Robert Ellenstein
6802	Les Tremayne
6803	Philip Coolidge
6804	Patrick McVey
6805	Ed Binns
6806	Ernest Lehman
6807	Anthony Hopkins
6808	Jodie Foster
6809	Ted Levine
6810	Lawrence T. Wrentz
6811	Lawrence A. Bonney
6812	Kasi Lemmons
6813	Scott Glenn
6814	Anthony Heald
6815	Frankie Faison
6816	Don Brockett
6817	Frank Seals Jr.
6818	Stuart Rudin
6819	Masha Skorobogatov
6820	Jeffrey Lane
6821	Leib Lensky
6822	Thomas Harris
6823	Ted Tally
6824	Jonathan Demme
6825	Tom Hanks
6826	Tom Sizemore
6827	Edward Burns
6828	Barry Pepper
6829	Adam Goldberg
6830	Vin Diesel
6831	Giovanni Ribisi
6832	Jeremy Davies
6833	Matt Damon
6834	Ted Danson
6835	Paul Giamatti
6836	Dennis Farina
6837	Joerg Stadler
6838	Max Martini
6839	Dylan Bruno
6840	Robert Rodat
6841	Donna Reed
6842	Lionel Barrymore
6843	Thomas Mitchell
6844	Henry Travers
6845	Beulah Bondi
6846	Frank Faylen
6847	Ward Bond
6848	Gloria Grahame
6849	H.B. Warner
6850	Todd Karns
6851	Samuel S. Hinds
6852	Mary Treen
6853	Virginia Patton
6854	Philip Van Doren Stern
6855	Frances Goodrich
6856	Frank Capra
6857	Ray Liotta
6858	Joe Pesci
6859	Lorraine Bracco
6860	Paul Sorvino
6861	Tony Darrow
6862	Mike Starr
6863	Frank Vincent
6864	Chuck Low
6865	Frank DiLeo
6866	Henny Youngman
6867	Gina Mastrogiacomo
6868	Catherine Scorsese
6869	Charles Scorsese
6870	Nicholas Pileggi
6871	Martin Scorsese
6872	Peter O'Toole
6873	Anthony Quinn
6874	Jack Hawkins
6875	Omar Sharif
6876	Jose; Ferrer
6877	Anthony Quayle
6878	Arthur Kennedy
6879	Donald Wolfit
6880	I.S. Johar
6881	Gamil Ratib
6882	Michel Ray
6883	John Dimech
6884	Zia Mohyeddin
6885	T.E. Lawrence
6886	Robert Bolt
6887	David Lean
6888	Henry Fonda
6889	Lee J. Cobb
6890	Ed Begley
6891	E.G. Marshall
6892	Jack Warden
6893	John Fiedler
6894	Jack Klugman
6895	Joseph Sweeney
6896	George Voskovec
6897	Robert Webber
6898	Reginald Rose
6899	Sidney Lumet
6900	Roberto Benigni
6901	Nicoletta Braschi
6902	Giustino Durano
6903	Giuliana Lojodice
6904	Sergio Bini Bustric
6905	Amerigo Fontani
6906	Pietro De Silva
6907	Francesco Guzzo
6908	Raffaella Lebboroni
6909	Giorgio Cantarini
6910	Marisa Paredes
6911	Horst Buchholz
6912	Claudio Alfonsi
6913	Gil Baroni
6914	Massimo Bianchi
6915	Vincenzo Cerami
6916	Kirk Douglas
6917	Ralph Meeker
6918	Adolphe Menjou
6919	George Macready
6920	Wayne Morris
6921	Richard Anderson
6922	Joe Turkel
6923	Christiane Kubrick
6924	Jeffrey Hausner
6925	Peter Capell
6926	Emile Meyer
6927	Bert Freed
6928	Kem Dibbs
6929	Timothy Carey
6930	Fred Bell
6931	Humphrey Cobb
6932	Gregory Peck
6933	John Megna
6934	Frank Overton
6935	Rosemary Murphy
6936	Ruth White
6937	Brock Peters
6938	Estelle Evans
6939	Paul Fix
6940	Collin Wilcox Paxton
6941	James Anderson
6942	Alice Ghostley
6943	William Windom
6944	Crahan Denton
6945	Richard Hale
6946	Harper Lee
6947	Horton Foote
6948	Robert Mulligan
6949	Kim Novak
6950	Barbara Bel Geddes
6951	Tom Helmore
6952	Henry Jones
6953	Raymond Bailey
6954	Ellen Corby
6955	Konstantin Shayne
6956	Lee Patrick
6957	Pierre Boileau
6958	Thomas Narcejac
6959	Haley Joel Osment
6960	Toni Collette
6961	Olivia Williams
6962	Mischa Barton
6963	Trevor Morgan
6964	Donnie Wahlberg
6965	Peter Anthony Tambakis
6966	Jeffry Zubernis
6967	Bruce Norris
6968	Glenn Fitzgerald
6969	Greg Wood
6970	Angelica Torn
6971	Lisa Summerour
6972	Firdous Bamji
6973	M. Night Shyamalan
6974	Tim Allen
6975	Joan Cusack
6976	Kelsey Grammer
6977	Don Rickles
6978	Jim Varney
6979	Wallace Shawn
6980	John Ratzenberger
6981	Annie Potts
6982	Wayne Knight
6983	John Morris
6984	Laurie Metcalf
6985	Estelle Harris
6986	R. Lee Ermey
6987	Jodi Benson
6988	John Lasseter
6989	Peter Docter
6990	Ash Brannon
6991	Keanu Reeves
6992	Laurence Fishburne
6993	Carrie-Anne Moss
6994	Hugo Weaving
6995	Gloria Foster
6996	Joe Pantoliano
6997	Marcus Chong
6998	Julian Arahanga
6999	Matt Doran
7000	Belinda McClory
7001	Ray Anthony Parker
7002	Paul Goddard
7003	Robert Taylor
7004	David Aston
7005	Marc Gray
7006	Andy Wachowski
7007	Larry Wachowski
7008	Albert Brooks
7009	Leonard Harris
7010	Peter Boyle
7011	Cybill Shepherd
7012	Norman Matlock
7013	Diahnne Abbott
7014	Frank Adu
7015	Victor Argo
7016	Gino Ardito
7017	Garth Avery
7018	Harry Cohn
7019	Copper Cunningham
7020	Paul Schrader
7021	Russell Crowe
7022	Guy Pearce
7023	James Cromwell
7024	Kim Basinger
7025	David Strathairn
7026	Ron Rifkin
7027	Matt McCoy
7028	Paul Guilfoyle
7029	Paolo Seganti
7030	Elisabeth Granli
7031	Sandra Taylor
7032	Steve Rankin
7033	Graham Beckel
7034	James Ellroy
7035	Brian Helgeland
7036	Curtis Hanson
7037	Mary Astor
7038	Gladys George
7039	Barton MacLane
7040	Jerome Cowan
7041	Elisha Cook Jr.
7042	James Burke
7043	Murray Alper
7044	John Hamilton
7045	Dashiell Hammett
7046	John Huston
7047	Gustaf Gru;ndgens
7048	Ellen Widmann
7049	Inge Landgut
7050	Otto Wernicke
7051	Franz Stein
7052	Theodor Loos
7053	Friedrich Gnas
7054	Fritz Odemar
7055	Paul Kemp
7056	Theo Lingen
7057	Georg John
7058	Karl Platen
7059	Gerhard Bienert
7060	Rosa Valetti
7061	Paul Falkenberg
7062	Adolf Jansen
7063	Fritz Lang
7064	Alida Valli
7065	Trevor Howard
7066	Paul Ho;rbiger
7067	Ernst Deutsch
7068	Erich Ponto
7069	Siegfried Breuer
7070	Hedwig Bleibtreu
7071	Bernard Lee
7072	Wilfrid Hyde-White
7073	Graham Greene
7074	Alexander Korda
7075	Carol Reed
7076	Edward Norton
7077	Brad Pitt
7078	Meat Loaf
7079	Zach Grenier
7080	Richmond Arquette
7081	David Andrews
7082	George Maguire
7083	Eugenie Bondurant
7084	Christina Cabot
7085	Helena Bonham Carter
7086	Sydney 'Big Dawg' Colston
7087	Rachel Singer
7088	Christie Cronenweth
7089	Tim De Zarn
7090	Ezra Buzzington
7091	Chuck Palahniuk
7092	Jim Uhls
7093	David Fincher
7094	Peter Sallis
7095	Nick Park
7096	Bob Baker
7097	Ju;rgen Prochnow
7098	Herbert Gro;nemeyer
7099	Klaus Wennemann
7100	Hubertus Bengsch
7101	Martin Semmelrogge
7102	Bernd Tauber
7103	Erwin Leder
7104	Martin May
7105	Heinz Hoenig
7106	Uwe Ochsenknecht
7107	Claude-Oliver Rudolph
7108	Jan Fedder
7109	Ralf Richter
7110	Joachim Bernhard
7111	Oliver Stritzel
7112	Lothar G. Buchheim
7113	Wolfgang Petersen
7114	Judy Garland
7115	Ray Bolger
7116	Jack Haley
7117	Bert Lahr
7118	Frank Morgan
7119	Billie Burke
7120	Margaret Hamilton
7121	Charley Grapewin
7122	Pat Walshe
7123	Clara Blandick
7124	L. Frank Baum
7125	Noel Langley
7126	Victor Fleming
7127	William Holden
7128	Gloria Swanson
7129	Erich von Stroheim
7130	Nancy Olson
7131	Fred Clark
7132	Lloyd Gough
7133	Jack Webb
7134	Franklyn Farnum
7135	Larry J. Blake
7136	Charles Dayton
7137	Cecil B. DeMille
7138	Hedda Hopper
7139	Buster Keaton
7140	Anna Q. Nilsson
7141	Charles Brackett
7142	D.M. Marshman Jr.
7143	Billy Wilder
7144	Cathy Moriarty
7145	Nicholas Colasanto
7146	Theresa Saldana
7147	Mario Gallo
7148	Frank Adonis
7149	Joseph Bono
7150	Frank Topham
7151	Lori Anne Flax
7152	Don Dunphy
7153	Bill Hanrahan
7154	Rita Bennett
7155	Jake LaMotta
7156	Joseph Carter
7157	Clint Eastwood
7158	Lee Van Cleef
7159	Aldo Giuffre
7160	Eli Wallach
7161	Luigi Pistilli
7162	Rada Rassimov
7163	Enzo Petito
7164	Agenore Incrocci
7165	Furio Scarpelli
7166	Sergio Leone
7167	Faye Dunaway
7168	Perry Lopez
7169	John Hillerman
7170	Darrell Zwerling
7171	Diane Ladd
7172	Roy Jenson
7173	Roman Polanski
7174	Richard Bakalyan
7175	Joe Mantell
7176	Bruce Glover
7177	Nandu Hinds
7178	James O'Rear
7179	James Hong
7180	Robert Towne
7181	Gene Kelly
7182	Donald O'Connor
7183	Debbie Reynolds
7184	Jean Hagen
7185	Millard Mitchell
7186	Cyd Charisse
7187	Douglas Fowley
7188	Rita Moreno
7189	Betty Comden
7190	Adolph Green
7191	Stanley Donen
7192	Martin Sheen
7193	Frederic Forrest
7194	Albert Hall
7195	Sam Bottoms
7196	Dennis Hopper
7197	Jerry Ziesmer
7198	Bo Byers
7199	James Keane
7200	Kerry Rossall
7201	Joseph Conrad
7202	Bette Davis
7203	Anne Baxter
7204	George Sanders
7205	Celeste Holm
7206	Gary Merrill
7207	Hugh Marlowe
7208	Gregory Ratoff
7209	Barbara Bates
7210	Marilyn Monroe
7211	Walter Hampden
7212	Randy Stuart
7213	Craig Hill
7214	Leland Harris
7215	Barbara White
7216	Joseph L. Mankiewicz
7217	Tony Curtis
7218	Jack Lemmon
7219	George Raft
7220	Pat O'Brien
7221	Joe E. Brown
7222	Nehemiah Persoff
7223	Joan Shawlee
7224	Billy Gray
7225	George E. Stone
7226	Dave Barry
7227	Mike Mazurki
7228	Harry Wilson
7229	Beverly Wills
7230	Barbara Drew
7231	I.A.L. Diamond
7232	John Cusack
7233	Cameron Diaz
7234	Ned Bellamy
7235	Eric Weinstein
7236	Madison Lanc
7237	Octavia Spencer
7238	Mary Kay Place
7239	Orson Bean
7240	Catherine Keener
7241	K.K. Dodds
7242	Reginald C. Hayes
7243	Byrne Piven
7244	Judith Wetzell
7245	John Malkovich
7246	Kevin Carroll
7247	Charlie Kaufman
7248	Spike Jonze
7249	Sessue Hayakawa
7250	James Donald
7251	Geoffrey Horne
7252	Andre; Morell
7253	Peter Williams
7254	John Boxer
7255	Percy Herbert
7256	Harold Goodwin
7257	Ann Sears
7258	Henry Okawa
7259	Keiichiro Katsumoto
7260	M.R.B. Chakrabandhu
7261	Pierre Boulle
7262	Boris Karloff
7263	Dr. Seuss
7264	Chuck Jones
7265	Machiko Kyo
7266	Masayuki Mori
7267	Kichijiro Ueda
7268	Fumiko Honma
7269	Ryunosuke Akutagawa
7270	Billy Crudup
7271	Frances McDormand
7272	Kate Hudson
7273	Jason Lee
7274	Patrick Fugit
7275	Zooey Deschanel
7276	Michael Angarano
7277	Noah Taylor
7278	John Fedevich
7279	Mark Kozelek
7280	Fairuza Balk
7281	Anna Paquin
7282	Olivia Rosewood
7283	Jimmy Fallon
7284	Philip Seymour Hoffman
7285	Cameron Crowe
7286	Keir Dullea
7287	Gary Lockwood
7288	William Sylvester
7289	Daniel Richter
7290	Leonard Rossiter
7291	Margaret Tyzack
7292	Robert Beatty
7293	Sean Sullivan
7294	Douglas Rain
7295	Frank Miller
7296	Arthur C. Clarke
7297	Fred MacMurray
7298	Barbara Stanwyck
7299	Edward G. Robinson
7300	Porter Hall
7301	Jean Heather
7302	Tom Powers
7303	Byron Barr
7304	Richard Gaines
7305	John Philliber
7306	James M. Cain
7307	David Morse
7308	Bonnie Hunt
7309	Michael Clarke Duncan
7310	Michael Jeter
7311	Doug Hutchison
7312	Sam Rockwell
7313	Patricia Clarkson
7314	Harry Dean Stanton
7315	Dabbs Greer
7316	Eve Brent
7317	Edward Furlong
7318	Beverly D'Angelo
7319	Jennifer Lien
7320	Ethan Suplee
7321	Avery Brooks
7322	Elliott Gould
7323	Stacy Keach
7324	William Russ
7325	Guy Torry
7326	Joseph Cortese
7327	Jason Bose Smith
7328	Antonio David Lyons
7329	Alex Sol
7330	David McKenna
7331	Tony Kaye
7332	Graham Chapman
7333	John Cleese
7334	Eric Idle
7335	Terry Gilliam
7336	Terry Jones
7337	Michael Palin
7338	Connie Booth
7339	Carol Cleveland
7340	Neil Innes
7341	Bee Duffell
7342	John Young
7343	Rita Davies
7344	Avril Stewart
7345	Sally Kinghorn
7346	Mark Zycon
7347	Frank Sinatra
7348	Laurence Harvey
7349	Angela Lansbury
7350	Henry Silva
7351	James Gregory
7352	Leslie Parrish
7353	John McGiver
7354	Khigh Dhiegh
7355	James Edwards
7356	Douglas Henderson
7357	Albert Paulsen
7358	Barry Kelley
7359	Lloyd Corrigan
7360	Madame Spivy
7361	George Axelrod
7362	John Frankenheimer
7363	Marion Mack
7364	Charles Smith
7365	Richard Allen
7366	Glen Cavender
7367	Jim Farley
7368	Frederick Vroom
7369	Joe Keaton
7370	Mike Donlin
7371	Tom Nawn
7372	Al Boasberg
7373	Clyde Bruckman
7374	Malcolm McDowell
7375	Patrick Magee
7376	Michael Bates
7377	Warren Clarke
7378	John Clive
7379	Adrienne Corri
7380	Carl Duering
7381	Paul Farrell
7382	Clive Francis
7383	Michael Gover
7384	Miriam Karlin
7385	James Marcus
7386	Aubrey Morris
7387	Godfrey Quigley
7388	Sheila Raynor
7389	Anthony Burgess
7390	Franka Potente
7391	Moritz Bleibtreu
7392	Herbert Knaup
7393	Nina Petri
7394	Armin Rohde
7395	Joachim Kro;l
7396	Ludger Pistor
7397	Suzanne von Borsody
7398	Sebastian Schipper
7399	Julia Lindig
7400	Lars Rudolph
7401	Andreas Petri
7402	Klaus Mu;ller
7403	Utz Krause
7404	Beate Finckh
7405	Tom Tykwer
7406	Walter Huston
7407	Tim Holt
7408	Bruce Bennett
7409	Alfonso Bedoya
7410	Arturo Soto Rangel
7411	Manuel Donde
7412	Jose; Torvay
7413	Margarito Luna
7414	B. Traven
7415	Charlton Heston
7416	Joseph Calleia
7417	Akim Tamiroff
7418	Joanna Cook Moore
7419	Marlene Dietrich
7420	Dennis Weaver
7421	Victor Millan
7422	Lalo Rios
7423	Valentin de Vargas
7424	Mercedes McCambridge
7425	Wayne Taylor
7426	Whit Masterson
7427	Michael Madsen
7428	Chris Penn
7429	Steve Buscemi
7430	Lawrence Tierney
7431	Randy Brooks
7432	Kirk Baltz
7433	Edward Bunker
7434	Rich Turner
7435	David Steen
7436	Tony Cosmo
7437	Stevo Poliy
7438	Michael Sottile
7439	Jean Arthur
7440	Edward Arnold
7441	Guy Kibbee
7442	Eugene Pallette
7443	Harry Carey
7444	Astrid Allwyn
7445	Ruth Donnelly
7446	Grant Mitchell
7447	Pierre Watkin
7448	Lewis R. Foster
7449	Sidney Buchman
7450	Tatsuya Nakadai
7451	Akira Terao
7452	Jinpachi Nezu
7453	Daisuke Ryu
7454	Mieko Harada
7455	Yoshiko Miyazaki
7456	Masayuki Yui
7457	Kazuo Kato
7458	Peter
7459	Hitoshi Ueki
7460	Jun Tazaki
7461	Norio Matsui
7462	Hisashi Igawa
7463	Kenji Kodama
7464	Toshiya Ito
7465	Masato Ide
7466	James Robinson
7467	Sean Lawlor
7468	Sandy Nelson
7469	James Cosmo
7470	Sean McGinley
7471	Alan Tall
7472	Andrew Weir
7473	Gerda Stevenson
7474	Ralph Riach
7475	Mhairi Calvey
7476	Brian Cox
7477	Patrick McGoohan
7478	Peter Hanly
7479	Sophie Marceau
7480	Stephen Billington
7481	Randall Wallace
7482	Mel Gibson
7483	Tom Skerritt
7484	Sigourney Weaver
7485	Veronica Cartwright
7486	John Hurt
7487	Ian Holm
7488	Yaphet Kotto
7489	Bolaji Badejo
7490	Helen Horton
7491	Dan O'Bannon
7492	Ronald Shusett
7493	Ridley Scott
7494	Pat Healy
7495	Genevieve Zweig
7496	Mark Flanagan
7497	Neil Flynn
7498	Rod McLachlan
7499	Allan Graf
7500	Patton Oswalt
7501	Raymond 'Big Guy' Gonzales
7502	Brad Hunt
7503	Jim Meskimen
7504	Chris O'Hara
7505	Clement Blake
7506	Frank Elmore
7507	John Kraft Seitz
7508	Cory Buck
7509	Paul Thomas Anderson
7510	Charles Chaplin
7511	Paulette Goddard
7512	Henry Bergman
7513	Tiny Sandford
7514	Chester Conklin
7515	Hank Mann
7516	Stanley Blystone
7517	Al Ernest Garcia
7518	Richard Alexander
7519	Cecil Reynolds
7520	Mira McKinney
7521	Murdock MacQuarrie
7522	Wilfred Lucas
7523	Edward Le Saint
7524	Fred Malatesta
7525	Virginia Cherrill
7526	Florence Lee
7527	Harry Myers
7528	Joaquin Phoenix
7529	Connie Nielsen
7530	Oliver Reed
7531	Richard Harris
7532	Derek Jacobi
7533	Djimon Hounsou
7534	David Schofield
7535	John Shrapnel
7536	Tomas Arana
7537	Ralph Moeller
7538	Spencer Treat Clark
7539	David Hemmings
7540	Tommy Flanagan
7541	Sven-Ole Thorsen
7542	David H. Franzoni
7543	William H. Macy
7544	Peter Stormare
7545	Kristin Rudru;d
7546	Harve Presnell
7547	Tony Denman
7548	Gary Houston
7549	Sally Wingert
7550	Kurt Schweickhardt
7551	Larissa Kokernot
7552	Melissa Peterman
7553	Steve Reevis
7554	Warren Keith
7555	Steve Edelman
7556	Joel Coen
7557	Ethan Coen
7558	F. Murray Abraham
7559	Tom Hulce
7560	Elizabeth Berridge
7561	Simon Callow
7562	Roy Dotrice
7563	Christine Ebersole
7564	Jeffrey Jones
7565	Charles Kay
7566	Lisabeth Bartlett
7567	Barbara Bryne
7568	Martin Cavina
7569	Roderick Cook
7570	Milan Demjanenko
7571	Peter DiGesu
7572	Peter Shaffer
7573	Rutger Hauer
7574	Sean Young
7575	Edward James Olmos
7576	M. Emmet Walsh
7577	Daryl Hannah
7578	William Sanderson
7579	Brion James
7580	Joanna Cassidy
7581	Morgan Paull
7582	Kevin Thompson
7583	John Edward Allen
7584	Hy Pyke
7585	Philip K. Dick
7586	Hampton Fancher
7587	Ulrich Thomsen
7588	Henning Moritzen
7589	Thomas Bo Larsen
7590	Paprika Steen
7591	Birthe Neumann
7592	Trine Dyrholm
7593	Helle Dolleris
7594	Bjarne Henriksen
7595	Gbatokai Dakinah
7596	Therese Glahn
7597	Klaus Bondam
7598	Lasse Lunderskov
7599	Lars Brygmann
7600	Lene Laub Oksen
7601	Linda Laursen
7602	Mogens Rukov
7603	Thomas Vinterberg
7604	Roy Scheider
7605	Robert Shaw
7606	Richard Dreyfuss
7607	Lorraine Gary
7608	Murray Hamilton
7609	Carl Gottlieb
7610	Jeffrey Kramer
7611	Susan Backlinie
7612	Jonathan Filley
7613	Ted Grossman
7614	Chris Rebello
7615	Jay Mello
7616	Lee Fierro
7617	Jeffrey Voorhees
7618	Craig Kingsbury
7619	Peter Benchley
7620	Paul Newman
7621	Robert Redford
7622	Charles Durning
7623	Ray Walston
7624	Eileen Brennan
7625	Harold Gould
7626	John Heffernan
7627	Dana Elcar
7628	Jack Kehoe
7629	Dimitra Arliss
7630	Robert Earl Jones
7631	James Sloyan
7632	Charles Dierkop
7633	Lee Paul
7634	David W. Maurer
7635	David S. Ward
7636	George Roy Hill
7637	Lamberto Maggiorani
7638	Enzo Staiola
7639	Lianella Carell
7640	Gino Saltamerenda
7641	Vittorio Antonucci
7642	Giulio Chiari
7643	Elena Altieri
7644	Luigi Bartolini
7645	Cesare Zavattini
7646	Vittorio De Sica
7647	Jean Reno
7648	Gary Oldman
7649	Natalie Portman
7650	Danny Aiello
7651	Peter Appel
7652	Willie One Blood
7653	Don Creech
7654	Keith A. Glascoe
7655	Randolph Scott
7656	Michael Badalucco
7657	Ellen Greene
7658	Elizabeth Regen
7659	Carl J. Matusovich
7660	Frank Senger
7661	Lucius 'Cherokee' Wyatt
7662	Luc Besson
7663	Christopher Plummer
7664	Diane Venora
7665	Philip Baker Hall
7666	Lindsay Crouse
7667	Debi Mazar
7668	Stephen Tobolowsky
7669	Colm Feore
7670	Bruce McGill
7671	Gina Gershon
7672	Michael Gambon
7673	Rip Torn
7674	Lynne Thigpen
7675	Hallie Kate Eisenberg
7676	Marie Brenner
7677	Eric Roth
7678	Michael Mann
7679	Groucho Marx
7680	Harpo Marx
7681	Chico Marx
7682	Zeppo Marx
7683	Margaret Dumont
7684	Raquel Torres
7685	Louis Calhern
7686	Edmund Breese
7687	Charles Middleton
7688	Edgar Kennedy
7689	Bert Kalmar
7690	Harry Ruby
7691	Leo McCarey
7692	Claudia Cardinale
7693	Jason Robards
7694	Charles Bronson
7695	Gabriele Ferzetti
7696	Paolo Stoppa
7697	Woody Strode
7698	Jack Elam
7699	Frank Wolff
7700	Lionel Stander
7701	Dario Argento
7702	Sergio Donati
7703	Richard Farnsworth
7704	Sissy Spacek
7705	Everett McGill
7706	John Farley
7707	Kevin P. Farley
7708	Jane Heitz
7709	Joseph A. Carpenter
7710	Donald Wieggert
7711	Tracey Maloney
7712	Don Flannery
7713	Jennifer Edwards-Hughes
7714	Ed Grennan
7715	Jack Walsh
7716	Gil Pearson
7717	John Roach
7718	Mary Sweeney
7719	David Lynch
7720	Woody Allen
7721	Tony Roberts
7722	Carol Kane
7723	Paul Simon
7724	Shelley Duvall
7725	Janet Margolin
7726	Colleen Dewhurst
7727	Donald Symington
7728	Helen Ludlam
7729	Mordecai Lawner
7730	Joan Newman
7731	Jonathan Munk
7732	Ruth Volner
7733	Marshall Brickman
7734	Karl Malden
7735	Rod Steiger
7736	Pat Henning
7737	Leif Erickson
7738	James Westerfield
7739	Tony Galento
7740	Tami Mauriello
7741	John Heldabrand
7742	Don Blackman
7743	Arthur Keegan
7744	Abe Simon
7745	Malcolm Johnson
7746	Elia Kazan
7747	Carrie Henn
7748	Michael Biehn
7749	Paul Reiser
7750	Lance Henriksen
7751	Bill Paxton
7752	William Hope
7753	Jenette Goldstein
7754	Al Matthews
7755	Ricco Ross
7756	Colette Hiller
7757	Daniel Kash
7758	Cynthia Scott
7759	Tip Tipping
7760	James Cameron
7761	Eijiro; Tono
7762	Seizaburo; Kawazu
7763	Isuzu Yamada
7764	Hiroshi Tachikawa
7765	Kyu Sazanka
7766	Ikio Sawamura
7767	Ko Nishimura
7768	Yo;ko Tsukasa
7769	Susumu Fujita
7770	Ryuzo Kikushima
7771	Steve McQueen
7772	James Garner
7773	Richard Attenborough
7774	Donald Pleasence
7775	James Coburn
7776	Hannes Messemer
7777	David McCallum
7778	Gordon Jackson
7779	John Leyton
7780	Angus Lennie
7781	Nigel Stock
7782	Robert Graf
7783	Jud Taylor
7784	Paul Brickhill
7785	James Clavell
7786	John Sturges
7787	Katharine Hepburn
7788	Robert Morley
7789	Theodore Bikel
7790	Walter Gotell
7791	Peter Swanwick
7792	Richard Marner
7793	C.S. Forester
7794	James Agee
7795	Andrew Kevin Walker
7796	Daniel Zacapa
7797	Gwyneth Paltrow
7798	John Cassini
7799	Bob Mack
7800	Peter Crombie
7801	Reg E. Cathey
7802	George Christy
7803	Endre Hules
7804	Hawthorne James
7805	Roscoe Davidson
7806	Bob Collins
7807	Cary Elwes
7808	Mandy Patinkin
7809	Chris Sarandon
7810	Christopher Guest
7811	Andre; the Giant
7812	Fred Savage
7813	Robin Wright
7814	Peter Falk
7815	Peter Cook
7816	Mel Smith
7817	Billy Crystal
7818	Anne Dyson
7819	Margery Mason
7820	William Goldman
7821	Rob Reiner
7822	Cecilia Roth
7823	Candela Pen;a
7824	Antonia San Juan
7825	Pene;lope Cruz
7826	Rosa Mari;a Sarda
7827	Fernando Ferna;n Go;mez
7828	Toni Canto
7829	Eloy Azori;n
7830	Carlos Lozano
7831	Fernando Guille;n
7832	Pedro Almodo
7833	Jennifer Aniston
7834	Harry Connick Jr.
7835	James Gammon
7836	Cloris Leachman
7837	Christopher McDonald
7838	John Mahoney
7839	Eli Marienthal
7840	Mary Kay Bergman
7841	Oliver M. Johnston Jr.
7842	Jack Angel
7843	Robert D. Bergen
7844	Michael Bird
7845	Devon Borisoff
7846	Ted Hughes
7847	Brad Bird
7848	Gunnar Bjo;rnstrand
7849	Bengt Ekerot
7850	Nils Poppe
7851	Max von Sydow
7852	Bibi Andersson
7853	Inga Gill
7854	Maud Hansson
7855	Inga Landgre
7856	Gunnel Lindblom
7857	Bertil Anderberg
7858	Anders Ek
7859	a;ke Fridell
7860	Gunnar Olsson
7861	Erik Strandmark
7862	Ingmar Bergman
7863	Farley Granger
7864	Ruth Roman
7865	Robert Walker
7866	Kasey Rogers
7867	Marion Lorne
7868	Jonathan Hale
7869	Howard St. John
7870	John Brown
7871	Norma Varden
7872	Robert Gist
7873	Raymond Chandler
7874	Czenzi Ormonde
7875	Billy Bob Thornton
7876	Dwight Yoakam
7877	J.T. Walsh
7878	John Ritter
7879	Lucas Black
7880	Natalie Canerday
7881	James Hampton
7882	Rick Dial
7883	Brent Briscoe
7884	Christy Ward
7885	Sarah Boss
7886	Kathy Sue Brown
7887	Wendell Rafferty
7888	Bruce Hampton
7889	Matthew Broderick
7890	Denzel Washington
7891	Jihmi Kennedy
7892	Andre Braugher
7893	John Finn
7894	Donovan Leitch
7895	John David Cullum
7896	Alan North
7897	Cliff De Young
7898	Christian Baskous
7899	RonReaco Lee
7900	Jay O. Sanders
7901	Peter Burchard
7902	Kevin Jarre
7903	Edward Zwick
7904	Yo;ji Matsuda
7905	Yuriko Ishida
7906	Yu;ko Tanaka
7907	Kaoru Kobayashi
7908	Akihiro Miwa
7909	Masahiko Nishimura
7910	Tsunehiko Kamijoe
7911	Sumi Shimamoto
7912	Mitsuko Mori
7913	Hisaya Morishige
7914	Neil Gaiman
7915	Hayao Miyazaki
7916	Jack Oakie
7917	Reginald Gardiner
7918	Henry Daniell
7919	Billy Gilbert
7920	Grace Hayle
7921	Carter DeHaven
7922	Maurice Moscovitch
7923	Emma Dunn
7924	Bernard Gorcey
7925	Paul Weigel
7926	Gary Cooper
7927	Lloyd Bridges
7928	Katy Jurado
7929	Otto Kruger
7930	Lon Chaney Jr.
7931	Harry Morgan
7932	Ian MacDonald
7933	Eve McVeagh
7934	Morgan Farley
7935	Harry Shannon
7936	Robert J. Wilke
7937	Sheb Wooley
7938	John W. Cunningham
7939	Carl Foreman
7940	Fred Zinnemann
7941	John Wayne
7942	Jeffrey Hunter
7943	Natalie Wood
7944	Olive Carey
7945	Henry Brandon
7946	Ken Curtis
7947	Harry Carey Jr.
7948	Antonio Moreno
7949	Hank Worden
7950	Beulah Archuletta
7951	Walter Coy
7952	Dorothy Jordan
7953	Alan Le May
7954	Frank S. Nugent
7955	John Ford
7956	Myrna Loy
7957	Fredric March
7958	Dana Andrews
7959	Teresa Wright
7960	Virginia Mayo
7961	Cathy O'Donnell
7962	Hoagy Carmichael
7963	Harold Russell
7964	Roman Bohnen
7965	Minna Gombell
7966	Walter Baldwin
7967	Steve Cochran
7968	Dorothy Adams
7969	MacKinlay Kantor
7970	Robert E. Sherwood
7971	William Wyler
7972	Ruth Hussey
7973	John Howard
7974	Roland Young
7975	John Halliday
7976	Mary Nash
7977	Virginia Weidler
7978	Lionel Pape
7979	Rex Evans
7980	Philip Barry
7981	Donald Ogden Stewart
7982	George Cukor
7983	Matthew Modine
7984	Adam Baldwin
7985	Vincent D'Onofrio
7986	Dorian Harewood
7987	Arliss Howard
7988	Kevyn Major Howard
7989	Ed O'Ross
7990	John Terry
7991	Kieron Jecchinis
7992	Bruce Boa
7993	Kirk Taylor
7994	Jon Stafford
7995	Tim Colceri
7996	Ian Tyler
7997	Gustav Hasford
7998	Michael Herr
7999	Anne Bancroft
8000	Dustin Hoffman
8001	Katharine Ross
8002	William Daniels
8003	Elizabeth Wilson
8004	Brian Avery
8005	Walter Brooke
8006	Norman Fell
8007	Buck Henry
8008	Eddra Gale
8009	Charles Webb
8010	Calder Willingham
8011	Mike Nichols
8012	Laurence Olivier
8013	Joan Fontaine
8014	Judith Anderson
8015	Gladys Cooper
8016	Nigel Bruce
8017	Reginald Denny
8018	C. Aubrey Smith
8019	Melville Cooper
8020	Florence Bates
8021	Leonard Carey
8022	Edward Fielding
8023	Lumsden Hare
8024	Forrester Harvey
8025	Daphne Du Maurier
8026	Philip MacDonald
8027	John Savage
8028	Meryl Streep
8029	George Dzundza
8030	Chuck Aspegren
8031	Shirley Stoler
8032	Rutanya Alda
8033	Pierre Segui
8034	Mady Kaplan
8035	Amy Wright
8036	Mary Ann Haenel
8037	Richard Kuss
8038	Joe Grifasi
8039	Michael Cimino
8040	Anne Reid
8041	Clark Gable
8042	Claudette Colbert
8043	Walter Connolly
8044	Roscoe Karns
8045	Jameson Thomas
8046	Alan Hale
8047	Arthur Hoyt
8048	Blanche Frederici
8049	Charles C. Wilson
8050	Samuel Hopkins Adams
8051	Robert Riskin
8052	Danny Lloyd
8053	Barry Nelson
8054	Philip Stone
8055	Anne Jackson
8056	Tony Burton
8057	Lia Beldam
8058	Billie Gibson
8059	Barry Dennen
8060	David Baxt
8061	Manning Redwood
8062	Lisa Burns
8063	Diane Johnson
8064	Charles Ruggles
8065	Walter Catlett
8066	Barry Fitzgerald
8067	May Robson
8068	Fritz Feld
8069	Leona Roberts
8070	George Irving
8071	Tala Birell
8072	Virginia Walker
8073	John Kelly
8074	Hagar Wilde
8075	Dudley Nichols
8076	Howard Hawks
8077	Leopoldine Konstantin
8078	Reinhold Schu;nzel
8079	Moroni Olsen
8080	Ivan Triesault
8081	Alex Minotis
8082	Wally Brown
8083	Charles Mendl
8084	Ricardo Costa
8085	Eberhard Krumschmidt
8086	Fay Baker
8087	Ben Hecht
8088	Jean-Pierre Le;aud
8089	Claire Maurier
8090	Albert Re;my
8091	Guy Decomble
8092	Georges Flamant
8093	Patrick Auffray
8094	Daniel Couturier
8095	Franc;ois Nocher
8096	Richard Kanayan
8097	Renaud Fontanarosa
8098	Michel Girard
8099	Henry Moati
8100	Bernard Abbou
8101	Jean-Franc;ois Bergouignan
8102	Michel Lesignor
8103	Franc
8104	Jean Gabin
8105	Dita Parlo
8106	Pierre Fresnay
8107	Julien Carette
8108	Georges Pe;clet
8109	Werner Florian
8110	Jean Daste
8111	Sylvain Itkine
8112	Gaston Modot
8113	Marcel Dalio
8114	Jean Renoir
8115	Charles Spaak
8116	Jane Darwell
8117	John Carradine
8118	Dorris Bowdon
8119	Russell Simpson
8120	O.Z. Whitehead
8121	Eddie Quillan
8122	Zeffie Tilbury
8123	Frank Sully
8124	Frank Darien
8125	Darryl Hickman
8126	Shirley Mills
8127	Roger Imhof
8128	John Steinbeck
8129	Nunnally Johnson
8130	Shirley MacLaine
8131	Jack Kruschen
8132	David Lewis
8133	Hope Holiday
8134	Naomi Stevens
8135	Johnny Seven
8136	Joyce Jameson
8137	Willard Waterman
8138	David White
8139	Edie Adams
8140	Strother Martin
8141	Jeff Corey
8142	George Furth
8143	Ted Cassidy
8144	Kenneth Mars
8145	Donnelly Rhodes
8146	Jody Gilbert
8147	Timothy Scott
8148	Don Keefer
8149	Haya Harareet
8150	Stephen Boyd
8151	Hugh Griffith
8152	Martha Scott
8153	Sam Jaffe
8154	Finlay Currie
8155	Frank Thring
8156	Terence Longdon
8157	George Relph
8158	Lew Wallace
8159	Karl Tunberg
8160	Vivien Leigh
8161	Leslie Howard
8162	Olivia de Havilland
8163	Hattie McDaniel
8164	Barbara O'Neil
8165	Evelyn Keyes
8166	Ann Rutherford
8167	George Reeves
8168	Fred Crane
8169	Oscar Polk
8170	Butterfly McQueen
8171	Victor Jory
8172	Everett Brown
8173	Margaret Mitchell
8174	Sidney Howard
8175	Lauren Bacall
8176	John Ridgely
8177	Martha Vickers
8178	Dorothy Malone
8179	Peggy Knudsen
8180	Regis Toomey
8181	Charles Waldron
8182	Charles D. Brown
8183	Bob Steele
8184	Louis Jean Heydt
8185	William Faulkner
8186	Alfred Abel
8187	Gustav Fro;hlich
8188	Brigitte Helm
8189	Rudolf Klein-Rogge
8190	Fritz Rasp
8191	Heinrich George
8192	Mack Swain
8193	Tom Murray
8194	Georgia Hale
8195	Ire;ne Jacob
8196	Jean-Louis Trintignant
8197	Fre;de;rique Feder
8198	Jean-Pierre Lorit
8199	Samuel Le Bihan
8200	Marion Stalens
8201	Teco Celio
8202	Bernard Escalon
8203	Jean Schlegel
8204	Elzbieta Jasinska
8205	Paul Vermeulen
8206	Jean-Marie Daunas
8207	Roland Carey
8208	Krzysztof Kieslowski
8209	Krzysztof Piesiewicz
8210	Michael Murphy
8211	Mariel Hemingway
8212	Anne Byrne
8213	Karen Ludwig
8214	Michael O'Donoghue
8215	Victor Truro
8216	Tisa Farrow
8217	Helen Hanft
8218	Bella Abzug
8219	Gary Weis
8220	Kenny Vance
8221	Charles Levin
8222	Robert Mitchum
8223	Shelley Winters
8224	Lillian Gish
8225	James Gleason
8226	Evelyn Varden
8227	Peter Graves
8228	Don Beddoe
8229	Billy Chapin
8230	Sally Jane Bruce
8231	Gloria Castillo
8232	Charles Laughton
8233	Sebastian Shaw
8234	Ian McDiarmid
8235	Michael Pennington
8236	Kenneth Colley
8237	Lawrence Kasdan
8238	Richard Marquand
8239	Melinda Dillon
8240	Darren McGavin
8241	Peter Billingsley
8242	Ian Petrella
8243	Scott Schwartz
8244	R.D. Robb
8245	Tedde Moore
8246	Yano Anaya
8247	Zack Ward
8248	Jeff Gillen
8249	Colin Fox
8250	Paul Hubbard
8251	Leslie Carlson
8252	Jim Hunter
8253	Patty Johnson
8254	Leigh Brown
8255	Bob Clark
8256	Antonella Attili
8257	Enzo Cannavale
8258	Isa Danieli
8259	Leo Gullotta
8260	Marco Leonardi
8261	Pupella Maggio
8262	Agnese Nano
8263	Leopoldo Trieste
8264	Salvatore Cascio
8265	Tano Cimarosa
8266	Nicola Di Pinto
8267	Roberta Lena
8268	Nino Terzo
8269	Jacques Perrin
8270	Brigitte Fossey
8271	Peter Fernandez
8272	Giuseppe Tornatore
8273	Lew Ayres
8274	Louis Wolheim
8275	John Wray
8276	Slim Summerville
8277	Arnold Lucy
8278	William Bakewell
8279	Ben Alexander
8280	Scott Kolk
8281	Owen Davis Jr.
8282	Walter Rogers
8283	Russell Gleason
8284	G. Pat Collins
8285	Beryl Mercer
8286	Erich Maria Remarque
8287	George Abbott
8288	Lewis Milestone
8289	Kim Hunter
8290	Nick Dennis
8291	Peg Hillias
8292	Wright King
8293	Richard Garrick
8294	Ann Dere
8295	Edna Thomas
8296	Mickey Kuhn
8297	Oscar Saul
8298	I. Bobrov
8299	Beatrice Vitoldi
8300	N. Poltavseva
8301	Julia Eisenstein
8302	Nina Agadzhanova
8303	Sergei M. Eisenstein
8304	Grigori Aleksandrov
8305	Stephen Young
8306	Lawrence Dobkin
8307	John Doucette
8308	Frank Latimore
8309	Richard Mu;nch
8310	Siegfried Rauch
8311	Paul Stevens
8312	Michael Strong
8313	Karl Michael Vogler
8314	Ladislas Farago
8315	Omar N. Bradley
8316	Franklin J. Schaffner
8317	Priscilla Lane
8318	Raymond Massey
8319	Jack Carson
8320	Edward Everett Horton
8321	Josephine Hull
8322	Jean Adair
8323	John Alexander
8324	Edward McNamara
8325	Garry Owen
8326	Vaughan Glaser
8327	Joseph Kesselring
8328	Julius J. Epstein
8329	George Kennedy
8330	J.D. Cannon
8331	Lou Antonio
8332	Robert Drivas
8333	Jo Van Fleet
8334	Clifton James
8335	Morgan Woodward
8336	Luke Askew
8337	Marc Cavell
8338	Richard Davalos
8339	Robert Donner
8340	Warren Finnerty
8341	Donn Pearce
8342	Stuart Rosenberg
8343	Rosalind Russell
8344	Ralph Bellamy
8345	Gene Lockhart
8346	Ernest Truex
8347	Cliff Edwards
8348	Clarence Kolb
8349	Frank Jenks
8350	Abner Biberman
8351	Frank Orth
8352	Helen Mack
8353	Charles MacArthur
8354	Erik von Detten
8355	Sarah Freeman
8356	Penn Jillette
8357	Spencer Aste
8358	Andrew Stanton
8359	Gene Hackman
8360	Jaimz Woolvett
8361	Saul Rubinek
8362	Frances Fisher
8363	Anna Levine
8364	David Mucci
8365	Rob Campbell
8366	Anthony James
8367	Tara Dawn Frederick
8368	Beverley Elliott
8369	Liisa Repo-Martell
8370	Josie Smith
8371	David Webb Peoples
8372	Elizabeth Taylor
8373	Richard Burton
8374	George Segal
8375	Sandy Dennis
8376	Edward Albee
8377	Bonnie Bedelia
8378	Reginald VelJohnson
8379	Paul Gleason
8380	De'voreaux White
8381	William Atherton
8382	Hart Bochner
8383	James Shigeta
8384	Alan Rickman
8385	Alexander Godunov
8386	Bruno Doyon
8387	Andreas Wisniewski
8388	Clarence Gilyard Jr.
8389	Joey Plewa
8390	Lorenzo Caccialanza
8391	Roderick Thorp
8392	Jeb Stuart
8393	John McTiernan
8394	Gene Wilder
8395	Marty Feldman
8396	Madeline Kahn
8397	Teri Garr
8398	Richard Haydn
8399	Liam Dunn
8400	Danny Goldman
8401	Oscar Beregi Jr.
8402	Arthur Malet
8403	Richard A. Roth
8404	Monte Landis
8405	Rusty Blitz
8406	Mary Shelley
8407	Mel Brooks
8408	Ernest Borgnine
8409	Robert Ryan
8410	Edmond O'Brien
8411	Warren Oates
8412	Jaime Sa;nchez
8413	Ben Johnson
8414	Emilio Ferna;ndez
8415	L.Q. Jones
8416	Albert Dekker
8417	Bo Hopkins
8418	Dub Taylor
8419	Paul Harper
8420	Jorge Russek
8421	Walon Green
8422	Sam Peckinpah
8423	Jackie Gleason
8424	Piper Laurie
8425	Myron McCormick
8426	Michael Constantine
8427	Stefan Gierasch
8428	Vincent Gardenia
8429	Clifford A. Pellow
8430	Gordon B. Clarke
8431	Alexander Rose
8432	Carolyn Coates
8433	Carl York
8434	Sidney Carroll
8435	Robert Rossen
8436	Arnold Schwarzenegger
8437	Linda Hamilton
8438	Robert Patrick
8439	Earl Boen
8440	Joe Morton
8441	S. Epatha Merkerson
8442	Castulo Guerra
8443	Danny Cooksey
8444	Xander Berkeley
8445	Leslie Hamilton Gearren
8446	Ken Gibbel
8447	Robert Winley
8448	Shane Wilder
8449	William Wisher Jr.
8450	Allen Garfield
8451	Cindy Williams
8452	Michael Higgins
8453	Elizabeth MacRae
8454	Mark Wheeler
8455	Robert Shields
8456	Phoebe Alexander
8457	Victor Sjo;stro;m
8458	Ingrid Thulin
8459	Jullan Kindahl
8460	Folke Sundquist
8461	Bjo;rn Bjelfvenstam
8462	Naima Wifstrand
8463	Gunnel Brostro;m
8464	Gertrud Fridh
8465	Sif Ruud
8466	Gunnar Sjo;berg
8467	Yngve Nordwall
8468	Don Taylor
8469	Otto Preminger
8470	Robert Strauss
8471	Harvey Lembeck
8472	Richard Erdman
8473	Neville Brand
8474	Sig Ruman
8475	Michael Moore
8476	Peter Baldwin
8477	Robinson Stone
8478	Robert Shawley
8479	William Pierson
8480	Gil Stratton
8481	Donald Bevan
8482	Edmund Trzcinski
8483	Kitty Carlisle
8484	Allan Jones
8485	Walter Woolf King
8486	Edward Keane
8487	Robert Emmett O'Connor
8488	James Kevin McGuinness
8489	George S. Kaufman
8490	Sam Wood
8491	Tom Berenger
8492	Willem Dafoe
8493	Charlie Sheen
8494	Forest Whitaker
8495	Francesco Quinn
8496	John C. McGinley
8497	Richard Edson
8498	Kevin Dillon
8499	Reggie Johnson
8500	Keith David
8501	Johnny Depp
8502	David Neidorf
8503	Mark Moses
8504	Chris Pedersen
8505	Tony Todd
8506	Oliver Stone
8507	Robin Williams
8508	Ben Affleck
8509	Stellan Skarsga;rd
8510	Minnie Driver
8511	Casey Affleck
8512	Cole Hauser
8513	John Mighton
8514	Rachel Majorowski
8515	Colleen McCauley
8516	Matt Mercier
8517	Ralph St. George
8518	Rob Lynds
8519	Dan Washington
8520	Alison Folland
8521	Gus Van Sant
8522	Jason Flemyng
8523	Dexter Fletcher
8524	Nick Moran
8525	Jason Statham
8526	Steven Mackintosh
8527	Nicholas Rowe
8528	Nick Marq
8529	Charles Forbes
8530	Vinnie Jones
8531	Lenny McLean
8532	Peter McNicholl
8533	P.H. Moriarty
8534	Frank Harper
8535	Steve Sweeney
8536	Huggy Leaver
8537	Guy Ritchie
8538	John Gielgud
8539	Wendy Hiller
8540	Freddie Jones
8541	Michael Elphick
8542	Hannah Gordon
8543	Helen Ryan
8544	John Standing
8545	Lesley Dunlop
8546	Phoebe Nicholls
8547	Pat Gorman
8548	Claire Davenport
8549	Eric Bergren
8550	Christopher De Vore
8551	Geoffrey Rush
8552	Joseph Fiennes
8553	Tom Wilkinson
8554	Steve O'Donnell
8555	Tim McMullen
8556	Steven Beard
8557	Anthony Sher
8558	Patrick Barlow
8559	Martin Clunes
8560	Sandra Reinton
8561	Judi Dench
8562	Bridget McConnell
8563	Georgie Glen
8564	Marc Norman
8565	Tom Stoppard
8566	John Madden
8567	Jean Simmons
8568	Peter Ustinov
8569	Nina Foch
8570	John Ireland
8571	Herbert Lom
8572	John Dall
8573	Charles McGraw
8574	Joanna Barnes
8575	Harold Stone
8576	Howard Fast
8577	Dalton Trumbo
8578	Bjo;rk
8579	Catherine Deneuve
8580	Udo Kier
8581	Joel Grey
8582	Vincent Paterson
8583	Cara Seymour
8584	Jean-Marc Barr
8585	Vladan Kostic
8586	Zeljko Ivanek
8587	Siobhan Fallon
8588	Jens Albinus
8589	Reathel Bean
8590	Mette Berggreen
8591	Lars von Trier
8592	Jonathan Pryce
8593	Katherine Helmond
8594	Bob Hoskins
8595	Ian Richardson
8596	Peter Vaughan
8597	Kim Greist
8598	Jim Broadbent
8599	Barbara Hicks
8600	Charles McKeown
8601	Derrick O'Connor
8602	Kathryn Pogson
8603	Bryan Pringle
8604	Hilary Swank
8605	Chloe; Sevigny
8606	Peter Sarsgaard
8607	Brendan Sexton III
8608	Alicia Goranson
8609	Jeanetta Arnette
8610	Matt McGrath
8611	Cheyenne Rushing
8612	Robert Prentiss
8613	Josh Ridgway
8614	Craig Erickson
8615	Stephanie Sechrist
8616	Jerry Haynes
8617	Kimberly Peirce
8618	Andy Bienen
8619	James Woods
8620	Elizabeth McGovern
8621	Treat Williams
8622	Tuesday Weld
8623	Burt Young
8624	William Forsythe
8625	James Hayden
8626	Darlanne Fluegel
8627	Larry Rapp
8628	Dutch Miller
8629	Robert Harper
8630	Harry Grey
8631	Leonardo Benvenuti
8632	Sean Connery
8633	Alison Doody
8634	Julian Glover
8635	River Phoenix
8636	Michael Byrne
8637	Kevork Malikyan
8638	Robert Eddison
8639	Richard Young
8640	Alexei Sayle
8641	Alex Hyde-White
8642	Paul Maxwell
8643	Isla Blair
8644	Menno Meyjes
8645	Maury Chaykin
8646	Gabrielle Rose
8647	Peter Donaldson
8648	Bruce Greenwood
8649	David Hemblen
8650	Brooke Johnson
8651	Arsine;e Khanjian
8652	Tom McCamus
8653	Stephanie Morgenstern
8654	Earl Pastko
8655	Sarah Polley
8656	Alberta Watson
8657	Caerthan Banks
8658	Kirsten Kieferle
8659	Russell Banks
8660	Atom Egoyan
8661	Phil Daniels
8662	Lynn Ferguson
8663	Tony Haygarth
8664	Jane Horrocks
8665	Miranda Richardson
8666	Julia Sawalha
8667	Timothy Spall
8668	Imelda Staunton
8669	Benjamin Whitrow
8670	John Sharian
8671	Jo Harvey Allen
8672	Lisa Kay
8673	Laura Strachan
8674	Peter Lord
8675	Coleen Gray
8676	Vince Edwards
8677	Jay C. Flippen
8678	Ted de Corsia
8679	Marie Windsor
8680	Joe Sawyer
8681	Kola Kwariani
8682	Jay Adler
8683	Tito Vuolo
8684	Gustav Botz
8685	Karl Etlinger
8686	John Gottowt
8687	Alexander Granach
8688	Wolfgang Heinz
8689	Guido Herzfeld
8690	Ruth Landshoff
8691	Max Nemetz
8692	Georg H. Schnell
8693	Max Schreck
8694	Greta Schro;der
8695	Albert Venohr
8696	Heinrich Witte
8697	Hardy von Francois
8698	Gustav von Wangenheim
8699	Henrik Galeen
8700	F.W. Murnau
8701	Leopold Stokowski
8702	Deems Taylor
8703	Joe Grant
8704	Dick Huemer
8705	James Algar
8706	Samuel Armstrong
8707	Gary Sinise
8708	Mykelti Williamson
8709	Sally Field
8710	Rebecca Williams
8711	Michael Conner Humphreys
8712	Harold G. Herthum
8713	George Kelly
8714	Bob Penny
8715	John Randall
8716	Sam Anderson
8717	Margo Moorer
8718	Ione M. Telech
8719	Christine Seabrook
8720	Winston Groom
8721	Robert Zemeckis
8722	Sam Shepard
8723	Ed Harris
8724	Dennis Quaid
8725	Fred Ward
8726	Barbara Hershey
8727	Kim Stanley
8728	Pamela Reed
8729	Scott Paulin
8730	Charles Frank
8731	Donald Moffat
8732	Levon Helm
8733	Mary Jo Deschanel
8734	Jake Gyllenhaal
8735	Laura Dern
8736	Chris Owen
8737	William Lee Scott
8738	Chad Lindberg
8739	Scott Miles
8740	Randy Stripling
8741	Chris Ellis
8742	Elya Baskin
8743	Courtney Fendley
8744	David Dwyer
8745	Terry Loughlin
8746	Kailie Hollister
8747	Homer H. Hickam Jr.
8748	Lewis Colick
8749	Joe Johnston
8750	Giulietta Masina
8751	Richard Basehart
8752	Aldo Silvani
8753	Marcella Rovere
8754	Livia Venturini
8755	Federico Fellini
8756	Ennio Flaiano
8757	Yun-Fat Chow
8758	Danny Lee
8759	Sally Yeh
8760	Chu Kong
8761	Kenneth Tsang
8762	Fui-On Shing
8763	Wing Cho Ip
8764	Fan Wei Yee
8765	Barry Wong
8766	Parkman Wong
8767	Siu-Hung Ng
8768	Sing Yeung
8769	Siu Hung Ngan
8770	Kwong Leung Wong
8771	John Woo
8772	Paul Winfield
8773	Rick Rossovich
8774	Bess Motta
8775	Dick Miller
8776	Shawn Schepps
8777	Bruce M. Kerner
8778	Franco Columbu
8779	Brad Rearden
8780	Brian Thompson
8781	Gale Anne Hurd
8782	Jim Carrey
8783	Laura Linney
8784	Noah Emmerich
8785	Natascha McElhone
8786	Holland Taylor
8787	Brian Delate
8788	Blair Slater
8789	Peter Krause
8790	Heidi Schanz
8791	Ron Taylor
8792	Ted Raymond
8793	Judy Clayton
8794	Fritz Dominique
8795	Angel Schmiedt
8796	Andrew Niccol
8797	Peter Weir
8798	Ellen Burstyn
8799	Kitty Winn
8800	Jack MacGowran
8801	Jason Miller
8802	Linda Blair
8803	Reverend William O'Malley
8804	Barton Heyman
8805	Peter Masterson
8806	Rudolf Schu;ndler
8807	Gina Petrushka
8808	Robert Symonds
8809	Arthur Storch
8810	Reverend Thomas Bermingham
8811	William Peter Blatty
8812	William Friedkin
8813	Li Gong
8814	Caifei He
8815	Jingwu Ma
8816	Cuifen Cao
8817	Zhao Qi
8818	Jin Shuyuan
8819	Ding Weimin
8820	Cao Zhengyin
8821	Cui Zhihgang
8822	Chu Xiao
8823	Su Tong
8824	Ni Zhen
8825	Yimou Zhang
8826	Fernanda Montenegro
8827	Mari;lia Pe;ra
8828	Vini;cius de Oliveira
8829	Soia Lira
8830	Othon Bastos
8831	Ota;vio Augusto
8832	Stela Freitas
8833	Matheus Nachtergaele
8834	Caio Junqueira
8835	Socorro Nobre
8836	Manoel Gomes
8837	Roberto Andrade
8838	Sheyla Kenia
8839	Malcon Soares
8840	Maria Fernandes
8841	Marcos Bernstein
8842	Joa
8843	Walter Salles
8844	Tom Cruise
8845	Valeria Golino
8846	Gerald R. Molen
8847	Jack Murdock
8848	Michael D. Roberts
8849	Ralph Seymour
8850	Lucinda Jenney
8851	Kim Robillard
8852	Beth Grant
8853	Dolan Dougherty
8854	Marshall Dougherty
8855	Patrick Dougherty
8856	John-Michael Dougherty
8857	Ronald Bass
8858	Barry Levinson
8859	Michael J. Fox
8860	Christopher Lloyd
8861	Lea Thompson
8862	Crispin Glover
8863	Thomas F. Wilson
8864	Claudia Wells
8865	Marc McClure
8866	Wendie Jo Sperber
8867	George DiCenzo
8868	Lee McCain
8869	James Tolkan
8870	J.J. Cohen
8871	Casey Siemaszko
8872	Billy Zane
8873	Harry Waters Jr.
8874	Bob Gale
8875	Nobuo Kaneko
8876	Kyo;ko Seki
8877	Makoto Kobori
8878	Kumeko Urabe
8879	Yoshie Minami
8880	Miki Odagiri
8881	Minosuke Yamada
8882	Haruo Tanaka
8883	Shinichi Himori
8884	Nobuo Nakamura
8885	Kusuo Abe
8886	Kenneth Branagh
8887	Simon Shepherd
8888	James Larkin
8889	Brian Blessed
8890	James Simmons
8891	Alec McCowen
8892	Fabian Cartwright
8893	Stephen Simms
8894	Jay Villiers
8895	Edward Jewesbury
8896	Daniel Webb
8897	Jimmy Yuill
8898	Tyrone Power
8899	Elsa Lanchester
8900	John Williams
8901	Ian Wolfe
8902	Torin Thatcher
8903	Una O'Connor
8904	Francis Compton
8905	Philip Tonge
8906	Ruta Lee
8907	Agatha Christie
8908	Larry Marcus
8909	Wil Wheaton
8910	Corey Feldman
8911	Jerry O'Connell
8912	Kiefer Sutherland
8913	Gary Riley
8914	Bradley Gregg
8915	Jason Oliver
8916	Marshall Bell
8917	Bruce Kirby
8918	William Bronder
8919	Scott Beach
8920	Raynold Gideon
8921	Tommy Lee Jones
8922	Sela Ward
8923	Julianne Moore
8924	Andreas Katsulas
8925	Jeroen Krabbe
8926	Daniel Roebuck
8927	L. Scott Caldwell
8928	Tom Wood
8929	Ron Dean
8930	Joseph F. Kosala
8931	Miguel Nino
8932	John Drummond
8933	Tony Fosco
8934	Roy Huggins
8935	David N. Twohy
8936	Andrew Davis
8937	Ewan McGregor
8938	Ewen Bremner
8939	Jonny Lee Miller
8940	Kevin McKidd
8941	Robert Carlyle
8942	Kelly Macdonald
8943	Peter Mullan
8944	Eileen Nicholas
8945	Susan Vidler
8946	Pauline Lynch
8947	Shirley Henderson
8948	Stuart McQuarrie
8949	Irvine Welsh
8950	Dale Winton
8951	John Hodge
8952	Danny Boyle
8953	Kevin Costner
8954	Charles Martin Smith
8955	Andy Garcia
8956	Richard Bradford
8957	Brad Sullivan
8958	Billy Drago
8959	Vito D'Ambrosio
8960	Steven Goldstein
8961	Peter Aylward
8962	Don Harvey
8963	Robert Swan
8964	Oscar Fraley
8965	Eliot Ness
8966	Brian De Palma
8967	Arletty
8968	Jean-Louis Barrault
8969	Pierre Brasseur
8970	Pierre Renoir
8971	Maria Casare;s
8972	Fabien Loris
8973	Marcel Pe;re;s
8974	Palau
8975	Etienne Decroux
8976	Jane Marken
8977	Marcelle Monthil
8978	Louis Florencie
8979	Habib Benglia
8980	Rognoni
8981	Jacques Pre
8982	Marcel Carne
8983	Maureen O'Hara
8984	Victor McLaglen
8985	Mildred Natwick
8986	Francis Ford
8987	Eileen Crowe
8988	May Craig
8989	Arthur Shields
8990	Charles B. Fitzsimons
8991	James Lilburn
8992	Sean McClory
8993	Joseph O'Dea
8994	Errol Flynn
8995	Basil Rathbone
8996	Patric Knowles
8997	Ian Hunter
8998	Herbert Mundin
8999	Montagu Love
9000	Leonard Willey
9001	Robert Noble
9002	Kenneth Hunter
9003	Norman Reilly Raine
9004	Seton I. Miller
9005	William Keighley
9006	Terence Bayler
9007	Gwen Taylor
9008	Sue Jones-Davies
9009	Lee Marvin
9010	Andy Devine
9011	Ken Murray
9012	Jeanette Nolan
9013	Willis Bouchey
9014	Carleton Young
9015	Denver Pyle
9016	James Warner Bellah
9017	Willis Goldbeck
9018	Iben Hjejle
9019	Todd Louiso
9020	Jack Black
9021	Lisa Bonet
9022	Catherine Zeta-Jones
9023	Chris Rehmann
9024	Ben Carr
9025	Lili Taylor
9026	Joelle Carter
9027	Natasha Gregson Wagner
9028	Shannon Stillo
9029	Drake Bell
9030	Nick Hornby
9031	D.V. DeVincentis
9032	Stephen Frears
9033	Kimberly Stringer
9034	Chazz Domingueza
9035	Shari Hall
9036	R.J. Parnell
9037	David Kaff
9038	Tony Hendra
9039	Michael McKean
9040	Harry Shearer
9041	Jean Cromie
9042	Patrick Maher
9043	Ed Begley Jr.
9044	Danny Kortchmar
9045	Helen Hunt
9046	Greg Kinnear
9047	Cuba Gooding Jr.
9048	Skeet Ulrich
9049	Shirley Knight
9050	Yeardley Smith
9051	Lupe Ontiveros
9052	Bibi Osterwald
9053	Ross Bleckner
9054	Bernadette Balagtas
9055	Jaffe Cohen
9056	Laurie Kilpatrick
9057	Alice Vaughn
9058	Brian Doyle-Murray
9059	Mark Andrus
9060	James L. Brooks
9061	Jon Voight
9062	Sylvia Miles
9063	Brenda Vaccaro
9064	Barnard Hughes
9065	Jennifer Salt
9066	Gilman Rankin
9067	Gary Owens
9068	T. Tom Marlow
9069	George Eppersen
9070	Al Scott
9071	Linda Davis
9072	J.T. Masters
9073	James Leo Herlihy
9074	Waldo Salt
9075	John Schlesinger
9076	Gene Tierney
9077	Clifton Webb
9078	Vincent Price
9079	Vera Caspary
9080	Jay Dratler
9081	Joseph Melito
9082	Jon Seda
9083	Michael Chance
9084	Vernon Campbell
9085	H. Michael Walls
9086	Bob Adrian
9087	Simon Jones
9088	Carol Florence
9089	Bill Raymond
9090	Ernest Abuba
9091	Irma St. Paule
9092	Madeleine Stowe
9093	Joey Perillo
9094	Bruce Kirkpatrick
9095	Chris Marker
9096	Paige O'Hara
9097	Robby Benson
9098	Richard White
9099	Jerry Orbach
9100	David Ogden Stiers
9101	Bradley Pierce
9102	Rex Everhart
9103	Jesse Corti
9104	Hal Smith
9105	Jo Anne Worley
9106	Brian Cummings
9107	Alvin Epstein
9108	Tony Jay
9109	Roger Allers
9110	Linda Woolverton
9111	Gary Trousdale
9112	Kirk Wise
9113	Warren Beatty
9114	Michael J. Pollard
9115	Estelle Parsons
9116	Evans Evans
9117	Robert Benton
9118	David Newman
9119	Arthur Penn
9120	Brian O'Halloran
9121	Jeff Anderson
9122	Marilyn Ghigliotti
9123	Lisa Spoonhauer
9124	Jason Mewes
9125	Kevin Smith
9126	Scott Mosier
9127	Scott Schiaffo
9128	Al Berkowitz
9129	Walter Flanagan
9130	Ed Hapstak
9131	Lee Bendick
9132	David Klein
9133	Pattijean Csik
9134	Ken Clark
9135	Macdonald Carey
9136	Patricia Collinge
9137	Hume Cronyn
9138	Wallace Ford
9139	Edna May Wonacott
9140	Charles Bates
9141	Irving Bacon
9142	Clarence Muse
9143	Janet Shaw
9144	Estelle Jewell
9145	Gordon McDonell
9146	Thornton Wilder
9147	George Clooney
9148	Mark Wahlberg
9149	Ice Cube
9150	Cliff Curtis
9151	Nora Dunn
9152	Jamie Kennedy
9153	Sai;d Taghmaoui
9154	Holt McCallany
9155	Judy Greer
9156	Christopher Lohr
9157	Jon Sklaroff
9158	Liz Stauber
9159	Marsha Horan
9160	John Ridley
9161	David O. Russell
9162	Candice Bergen
9163	Edward Fox
9164	John Mills
9165	Ian Charleson
9166	Athol Fugard
9167	Gu;nther Maria Halmer
9168	Saeed Jaffrey
9169	Geraldine James
9170	Alyque Padamsee
9171	Amrish Puri
9172	Roshan Seth
9173	John Briley
9174	Dee Wallace-Stone
9175	Henry Thomas
9176	Peter Coyote
9177	Robert MacNaughton
9178	Drew Barrymore
9179	K.C. Martel
9180	Sean Frye
9181	C. Thomas Howell
9182	Erika Eleniak
9183	David M. O'Dell
9184	Richard Swingler
9185	Frank Toth
9186	Robert Barton
9187	Michael Durrell
9188	David Berkson
9189	Melissa Mathison
9190	Kristina Adolphson
9191	Bo;rje Ahlstedt
9192	Pernilla Allwin
9193	Kristian Almgren
9194	Harriet Andersson
9195	Pernilla August
9196	Anna Bergman
9197	Mats Bergman
9198	Allan Edwall
9199	Stina Ekblad
9200	Siv Ericks
9201	Ewa Fro;ling
9202	Majlis Granlund
9203	Maria Granlund
9204	Bertil Guve
9205	Franc;ois Truffaut
9206	Bob Balaban
9207	J. Patrick McNamara
9208	Warren J. Kemmerling
9209	Roberts Blossom
9210	Cary Guffey
9211	Shawn Bishop
9212	Adrienne Campbell
9213	Justin Dreyfuss
9214	Merrill Connally
9215	Alastair Sim
9216	Kathleen Harrison
9217	Mervyn Johns
9218	Hermione Baddeley
9219	Michael Hordern
9220	George Cole
9221	John Charlesworth
9222	Francis De Wolff
9223	Rona Anderson
9224	Carol Marsh
9225	Brian Worth
9226	Miles Malleson
9227	Ernest Thesiger
9228	Glyn Dearman
9229	Michael Dolan
9230	Charles Dickens
9231	Brian Desmond Hurst
9232	Hal Holbrook
9233	Jane Alexander
9234	Meredith Baxter
9235	Ned Beatty
9236	Stephen Collins
9237	Penny Fuller
9238	John McMartin
9239	Robert Walden
9240	Frank Wills
9241	Carl Bernstein
9242	Bob Woodward
9243	Alan J. Pakula
9244	Alexandra Dahlstro;m
9245	Rebecka Liljeberg
9246	Erica Carlson
9247	Mathias Rust
9248	Stefan Ho;rberg
9249	Ralph Carlsson
9250	Maria Hedborg
9251	Axel Widegren
9252	Jill Ung
9253	Lisa Skagerstam
9254	Josefine Nyberg
9255	Lina Svantesson
9256	Johanna Larsson
9257	Elinor Johansson
9258	Jessica Melkersson
9259	Lukas Moodysson
9260	Peggy Dow
9261	Charles Drake
9262	Cecil Kellaway
9263	Victoria Horne
9264	Jesse White
9265	William H. Lynn
9266	Nana Bryant
9267	Grayce Mills
9268	Clem Bevans
9269	Mary Chase
9270	Henry Koster
9271	Jared Leto
9272	Jennifer Connelly
9273	Marlon Wayans
9274	Louise Lasser
9275	Sean Gullette
9276	Hubert Selby Jr.
9277	Darren Aronofsky
9278	Claire Trevor
9279	Louise Platt
9280	George Bancroft
9281	Donald Meek
9282	Berton Churchill
9283	Tom Tyler
9284	Ernest Haycox
9285	Greta Scacchi
9286	Whoopi Goldberg
9287	Cynthia Stevenson
9288	Dean Stockwell
9289	Richard E. Grant
9290	Sydney Pollack
9291	Lyle Lovett
9292	Dina Merrill
9293	Angela Hall
9294	Leah Ayres
9295	Michael Tolkin
9296	Robert Altman
9297	Peter Robbins
9298	Tracy Stratford
9299	Christopher Shea
9300	Chris Doran
9301	Geoffrey Ornstein
9302	Karen Mendelson
9303	Kathy Steinberg
9304	Ann Altieri
9305	Sally Dryer
9306	Bill Melendez
9307	Charles M. Schulz
9308	Audrey Hepburn
9309	Eddie Albert
9310	Hartley Power
9311	Harcourt Williams
9312	Margaret Rawlings
9313	Tullio Carminati
9314	Paolo Carlini
9315	Claudio Ermelli
9316	Paola Borboni
9317	Alfredo Rizzo
9318	Laura Solari
9319	Gorella Gori
9320	Ian McLellan Hunter
9321	Fay Wray
9322	Robert Armstrong
9323	Bruce Cabot
9324	Frank Reicher
9325	Sam Hardy
9326	Noble Johnson
9327	Steve Clemente
9328	James Flavin
9329	Merian C. Cooper
9330	James Ashmore Creelman
9331	Ernest B. Schoedsack
9332	Marcia Gay Harden
9333	John Turturro
9334	Jon Polito
9335	J.E. Freeman
9336	Albert Finney
9337	Al Mancini
9338	Richard Woods
9339	Thomas Toner
9340	Mario Todisco
9341	Olek Krupa
9342	Lanny Flaherty
9343	Burt Reynolds
9344	Ronny Cox
9345	Ed Ramey
9346	Billy Redden
9347	Seamon Glass
9348	Randall Deal
9349	Bill McKinney
9350	Herbert 'Cowboy' Coward
9351	Lewis Crone
9352	Ken Keener
9353	Johnny Popwell
9354	John Fowler
9355	Kathy Rickman
9356	James Dickey
9357	John Boorman
9358	Melvyn Douglas
9359	Richard A. Dysart
9360	Ruth Attaway
9361	David Clennon
9362	Fran Brill
9363	Denise DuBarry
9364	Oteil Burbridge
9365	Ravenell Keller III
9366	Brian Corrigan
9367	Alfredine P. Brown
9368	Donald Jacob
9369	Robert C. Jones
9370	Hal Ashby
9371	Armando Brancia
9372	Magali Noe;l
9373	Ciccio Ingrassia
9374	Nando Orfei
9375	Luigi Rossi
9376	Bruno Zanin
9377	Gianfilippo Carcano
9378	Josiane Tanzilli
9379	Maria Antonietta Beluzzi
9380	Giuseppe Ianigro
9381	Ferruccio Brembilla
9382	Tonino Guerra
9383	Rod Taylor
9384	Jessica Tandy
9385	Suzanne Pleshette
9386	Tippi Hedren
9387	Ethel Griffies
9388	Ruth McDevitt
9389	Lonny Chapman
9390	Doodles Weaver
9391	Malcolm Atterbury
9392	John McGovern
9393	Karl Swenson
9394	Richard Deacon
9395	Evan Hunter
9396	Yves Montand
9397	Ge;rard Depardieu
9398	Daniel Auteuil
9399	Elisabeth Depardieu
9400	Margarita Lozano
9401	Ernestine Mazurowna
9402	Armand Meffre
9403	Andre; Dupon
9404	Pierre Nougaro
9405	Jean Maurel
9406	Roger Souza
9407	Didier Pain
9408	Pierre-Jean Rippert
9409	Marc Betton
9410	Cle;ment Cal
9411	Claude Berri
9412	Ge
9413	Sam Waterston
9414	Haing S. Ngor
9415	Julian Sands
9416	Craig T. Nelson
9417	Spalding Gray
9418	Bill Paterson
9419	Graham Kennedy
9420	Katherine Krapum Chey
9421	Oliver Pierpaoli
9422	Edward Entero Chey
9423	Tom Bird
9424	Monirak Sisowath
9425	Lambool Dtangpaibool
9426	Bruce Robinson
9427	Roland Joffe
9428	Dean Martin
9429	Ricky Nelson
9430	Angie Dickinson
9431	Walter Brennan
9432	John Russell
9433	Pedro Gonzales-Gonzales
9434	Estelita Rodriguez
9435	Claude Akins
9436	Jules Furthman
9437	Bridget Fonda
9438	Gary Cole
9439	Becky Ann Baker
9440	Chelcie Ross
9441	Bob Davis
9442	Peter Syvertsen
9443	Tom Carey
9444	John Paxton
9445	Marie Mathay
9446	Paul Magers
9447	Joan Steffand
9448	Scott B. Smith
9449	Sam Raimi
9450	Donald Sutherland
9451	Sally Kellerman
9452	Roger Bowen
9453	Rene Auberjonois
9454	David Arkin
9455	Jo Ann Pflug
9456	Gary Burghoff
9457	Fred Williamson
9458	Indus Arthur
9459	Ken Prymus
9460	Bobby Troup
9461	Richard Hooker
9462	Ring Lardner Jr.
9463	Robert Donat
9464	Madeleine Carroll
9465	Lucie Mannheim
9466	Godfrey Tearle
9467	Peggy Ashcroft
9468	John Laurie
9469	Helen Haye
9470	Frank Cellier
9471	Wylie Watson
9472	Gus McNaughton
9473	Jerry Verno
9474	Peggy Simpson
9475	John Buchan
9476	Charles Bennett
9477	Julie Walters
9478	Jamie Bell
9479	Jamie Draven
9480	Gary Lewis
9481	Jean Heywood
9482	Stuart Wells
9483	Mike Elliot
9484	Janine Birkett
9485	Nicola Blackwell
9486	Billy Fane
9487	Colin MacLachlan
9488	Joe Renton
9489	Trevor Fox
9490	Carol McGuigan
9491	Charlie Hardwick
9492	Lee Hall
9493	Stephen Daldry
9494	Adriana Caselotti
9495	Harry Stockwell
9496	Lucille La Verne
9497	Pinto Colvig
9498	Otis Harlan
9499	Scotty Mattraw
9500	Roy Atwell
9501	Stuart Buchanan
9502	Dorothy Ann Blank
9503	Richard Creedon
9504	David Hand
9505	Walter Matthau
9506	Dominique Minot
9507	Ned Glass
9508	Jacques Marin
9509	Paul Bonifas
9510	Thomas Chelimsky
9511	Peter Stone
9512	Marc Behm
9513	Marcello Mastroianni
9514	Anouk Aime;e
9515	Sandra Milo
9516	Rossella Falk
9517	Barbara Steele
9518	Mario Pisu
9519	Guido Alberti
9520	Jean Rougeul
9521	Caterina Boratto
9522	Annibale Ninchi
9523	Giuditta Rissone
9524	Ian Dallas
9525	Tullio Pinelli
9526	Sarah Jessica Parker
9527	Patricia Arquette
9528	Bill Murray
9529	Max Casella
9530	Brent Hinkley
9531	Lisa Marie
9532	George 'The Animal' Steele
9533	Juliet Landau
9534	Clive Rosengren
9535	Rudolph Grey
9536	Scott Alexander
9537	Tim Burton
9538	Michael Rennie
9539	Patricia Neal
9540	Frances Bavier
9541	Lock Martin
9542	Harry Bates
9543	Edmund H. North
9544	Robert Wise
9545	William Powell
9546	Maureen O'Sullivan
9547	Nat Pendleton
9548	Henry Wadsworth
9549	William Henry
9550	Harold Huber
9551	Cesar Romero
9552	Natalie Moorhead
9553	Edward Brophy
9554	Edward Ellis
9555	Cyril Thornton
9556	Albert Hackett
9557	W.S. Van Dyke
9558	Michael Caine
9559	Doghmi Larbi
9560	Jack May
9561	Karroom Ben Bouih
9562	Mohammad Shamsi
9563	Albert Moses
9564	Paul Antrim
9565	Graham Acres
9566	Shakira Caine
9567	Gladys Hill
9568	Penelope Allen
9569	Sully Boyar
9570	Beulah Garrick
9571	Sandra Kazan
9572	Marcia Jean Kurtz
9573	Amy Levitt
9574	John Marriott
9575	Estelle Omens
9576	Gary Springer
9577	James Broderick
9578	Carmine Foresta
9579	P.F. Kluge
9580	Frank Pierson
9581	Katie Holmes
9582	Suzanne Krull
9583	Desmond Askew
9584	Nathan Bexton
9585	Robert Peters
9586	Scott Wolf
9587	Jay Mohr
9588	Timothy Olyphant
9589	Jodi Bianca Wise
9590	William Fichtner
9591	Rita Bland
9592	Scott Hass
9593	Natasha Melnick
9594	John August
9595	Doug Liman
9596	John Castle
9597	Nigel Terry
9598	Timothy Dalton
9599	Jane Merrow
9600	Kenneth Ives
9601	Fran Stafford
9602	Ella More
9603	Kenneth Griffith
9604	Henry Woolf
9605	Karol Hagar
9606	James Goldman
9607	Anthony Harvey
9608	Ian McKellen
9609	Brendan Fraser
9610	Lynn Redgrave
9611	Lolita Davidovich
9612	David Dukes
9613	Kevin J. O'Connor
9614	Mark Kiely
9615	Jack Plotnick
9616	Rosalind Ayres
9617	Jack Betts
9618	Matt McKenzie
9619	Todd Babcock
9620	Cornelia Hayes O'Herlihy
9621	Brandon Kleyla
9622	Pamela Salem
9623	Christopher Bram
9624	Bill Condon
9625	Hugh Jackman
9626	Patrick Stewart
9627	Famke Janssen
9628	James Marsden
9629	Halle Berry
9630	Tyler Mane
9631	Ray Park
9632	Rebecca Romijn-Stamos
9633	Bruce Davison
9634	Matthew Sharp
9635	Brett Morris
9636	Rhona Shekter
9637	Kenneth McGregor
9638	Tom DeSanto
9639	Bill Bernstein
9640	Claire Bloom
9641	Stephanie Roth
9642	Gregg Edelman
9643	George Mason
9644	Anjelica Huston
9645	Jenny Nichols
9646	Joanna Gleason
9647	Alan Alda
9648	Zina Jasper
9649	Dolores Sutton
9650	Joel Fogel
9651	Trey Parker
9652	Matt Stone
9653	Isaac Hayes
9654	Jesse Howell
9655	Anthony Cross-Thomas
9656	Franchesca Clifford
9657	Bruce Howell
9658	Deb Adair
9659	Jennifer Howell
9660	Brent Spiner
9661	Dave Foley
9662	John Haycraft
9663	Christopher Reeve
9664	Emma Thompson
9665	Caroline Hunt
9666	James Fox
9667	Paula Jacobs
9668	Ben Chaplin
9669	Steve Dibben
9670	Abigail Harrison
9671	Patrick Godfrey
9672	Peter Cellier
9673	Peter Halliday
9674	Hugh Grant
9675	Kazuo Ishiguro
9676	Ruth Prawer Jhabvala
9677	James Ivory
9678	James Dean
9679	Sal Mineo
9680	Jim Backus
9681	Ann Doran
9682	Corey Allen
9683	William Hopper
9684	Rochelle Hudson
9685	Steffi Sidney
9686	Marietta Canty
9687	Virginia Brissac
9688	Beverly Long
9689	Nicholas Ray
9690	Stewart Stern
9691	Burt Lancaster
9692	Montgomery Clift
9693	Deborah Kerr
9694	Mickey Shaughnessy
9695	Harry Bellaver
9696	John Dennis
9697	Merle Travis
9698	Tim Ryan
9699	Barbara Morrison
9700	James Jones
9701	Daniel Taradash
9702	Andie MacDowell
9703	Chris Elliott
9704	Marita Geraghty
9705	Angela Paton
9706	Rick Ducommun
9707	Rick Overton
9708	Robin Duke
9709	Carol Bivins
9710	Willie Garson
9711	Ken Hudson Campbell
9712	Les Podewell
9713	Rod Sell
9714	Danny Rubin
9715	Harold Ramis
9716	Jamie Lee Curtis
9717	Kevin Kline
9718	Maria Aitken
9719	Tom Georgeson
9720	Patricia Hayes
9721	Geoffrey Palmer
9722	Cynthia Cleese
9723	Mark Elwes
9724	Neville Phillips
9725	Peter Jonfield
9726	Ken Campbell
9727	Al Ashton
9728	Roger Hume
9729	Charles Crichton
9730	Irene Grazioli
9731	Carlo Cecchi
9732	Anita Laurenzi
9733	Tommaso Puntelli
9734	Samuele Amighetti
9735	Aldo Brugnini
9736	Jean-Luc Bideau
9737	Christoph Koncz
9738	Clothilde Mollet
9739	Florenti;n Groll
9740	Johannes Silberschneider
9741	Paul Koeker
9742	Rainer Egger
9743	Josef Mairginter
9744	Wolfgang Bo;ck
9745	Don McKellar
9746	Gaspard Manesse
9747	Raphael Fejto
9748	Francine Racette
9749	Stanislas Carre; de Malberg
9750	Philippe Morier-Genoud
9751	Franc;ois Berle;and
9752	Franc;ois Ne;gret
9753	Peter Fitz
9754	Pascal Rivet
9755	Benoi;t Henriet
9756	Richard Leboeuf
9757	Xavier Legrand
9758	Arnaud Henriet
9759	Jean-Se;bastien Chauvin
9760	Luc Etienne
9761	Louis Malle
9762	Phyllis Logan
9763	Brenda Blethyn
9764	Claire Rushbrook
9765	Marianne Jean-Baptiste
9766	Elizabeth Berrington
9767	Michele Austin
9768	Lee Ross
9769	Lesley Manville
9770	Ron Cook
9771	Emma Amos
9772	Brian Bovell
9773	Trevor Laird
9774	Claire Perkins
9775	Elias Perkins McCook
9776	Mike Leigh
9777	Tobey Maguire
9778	Charlize Theron
9779	Delroy Lindo
9780	Paul Rudd
9781	Kathy Baker
9782	Kieran Culkin
9783	Kate Nelligan
9784	Heavy D
9785	K. Todd Freeman
9786	Spencer Diamond
9787	Paz de la Huerta
9788	Erykah Badu
9789	J.K. Simmons
9790	John Irving
9791	Lasse Hallstro
9792	Peter Finch
9793	Wesley Addy
9794	Arthur Burghardt
9795	Bill Burrows
9796	John Carpenter
9797	Jordan Charney
9798	Kathy Cronkite
9799	Ed Crowley
9800	Jerome Dempsey
9801	Conchata Ferrell
9802	Gene Gross
9803	Paddy Chayefsky
9804	Per Fly
\.


--
-- Data for Name: runtime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY runtime (mid, country, runtime) FROM stdin;
533	Argentina	175
533	Australia	173
533	Austria	173
533	Finland	173
533	Mexico	175
533	Norway	173
533	Spain	175
533	Sweden	176
533	UK	175
533	USA	175
534	USA	142
535	Argentina	196
535	Australia	187
535	Germany	186
535	Netherlands	186
535	Spain	195
535	Sweden	195
535	UK	195
535	USA	197
536	Argentina	102
536	USA	102
537	Canada	119
537	USA	119
538	Argentina	122
538	Finland	122
538	Germany	122
538	Japan	122
538	Netherlands	117
538	New Zealand	122
538	UK	121
538	USA	121
539	Argentina	200
539	Australia	200
539	Finland	197
539	Norway	197
539	Spain	200
539	Sweden	197
539	UK	200
539	USA	200
540	Argentina	121
540	Spain	121
540	USA	121
540	USA	125
541	Finland	208
541	Japan	160
541	Japan	203
541	USA	141
541		160
542	Germany	128
542	Sweden	128
542	USA	129
543	Germany	93
543	Italy	93
543	Norway	96
543	UK	93
544	Australia	112
544	Netherlands	107
544	USA	112
545	Sweden	113
545	USA	115
546	Argentina	102
546	Australia	102
546	Germany	105
546	New Zealand	102
546	UK	105
546	USA	106
547	UK	108
547	USA	109
548	Argentina	124
548	Germany	125
548	Germany	127
548	Spain	124
548	USA	124
549	Argentina	145
549	Germany	145
549	Iceland	148
549	USA	154
549	USA	168
550	USA	136
551	Argentina	118
551	Australia	115
551	Netherlands	118
551	USA	118
552	Germany	169
552	Japan	170
552	Netherlands	167
552	Spain	171
552	USA	170
553	USA	130
554	Argentina	146
554	USA	146
555	France	202
555	Portugal	202
555	Spain	202
555	UK	187
555	UK	202
555	UK	210
555	UK	216
555	UK	222
556	Australia	92
556	France	92
556	Sweden	96
556	USA	96
557	Argentina	113
557	France	114
557	Germany	124
557	Italy	122
557	Spain	117
557	USA	114
558	Sweden	88
558	USA	86
559	USA	129
560	USA	128
560	USA	129
561	Argentina	106
561	Finland	108
561	Italy	102
561	Netherlands	107
561	Norway	108
561	UK	107
561	USA	106
562	Argentina	92
562	Finland	95
562	New Zealand	92
562	UK	94
562	USA	92
563	Argentina	136
563	Australia	136
563	Finland	136
563	Germany	136
563	Japan	136
563	Sweden	136
563	UK	136
563	USA	136
564	Argentina	112
564	Australia	110
564	Sweden	114
564	USA	113
565	Argentina	136
565	Australia	138
565	Germany	136
565	Spain	136
565	Sweden	138
565	USA	136
566	Netherlands	99
566	Sweden	100
566	USA	101
567	Germany	108
567	Germany	117
567	USA	99
568	Sweden	104
568	UK	100
568	USA	93
569	Argentina	140
569	Belgium	139
569	Finland	140
569	France	135
569	Israel	140
569	Japan	139
569	Norway	140
569	Sweden	139
569	UK	138
569	USA	139
570	UK	30
571	France	199
571	Germany	149
571	Germany	208
571	Netherlands	124
571	Sweden	146
571	UK	209
571	USA	210
572	Argentina	99
572	USA	101
572	USA	112
573	Hungary	100
573	USA	110
574	USA	129
575	Denmark	154
575	France	165
575	Germany	159
575	Italy	182
575	UK	180
575	USA	161
576	Netherlands	125
576	USA	131
577	Netherlands	99
577	USA	103
578	Sweden	144
578	USA	153
579	Germany	132
579	USA	138
580	UK	120
580	USA	119
581	Finland	112
581	Japan	112
581	Netherlands	112
581	UK	112
581	USA	112
582	UK	155
583	USA	26
584	Japan	88
584	Sweden	86
585	Australia	123
585	Norway	124
585	USA	122
586	Germany	133
586	Sweden	149
586	USA	139
587	USA	107
588	Finland	190
588	France	189
588	Japan	188
588	Netherlands	191
588	UK	188
588	USA	188
589	Argentina	119
589	Australia	119
589	Finland	119
589	Germany	118
589	Japan	120
589	Norway	119
589	Spain	120
589	UK	113
589	USA	117
590	UK	89
590	USA	91
591	USA	126
592	Sweden	97
592	USA	75
593	UK	137
593	USA	137
594	Argentina	90
594	Australia	80
594	Finland	81
594	France	80
594	Germany	81
594	Japan	81
594	Netherlands	85
594	USA	79
595	USA	124
595	USA	126
596	Argentina	105
596	Germany	105
596	USA	112
596	USA	95
597	Germany	95
597	UK	100
597	UK	115
597	USA	99
598	USA	125
599	Germany	154
599	USA	160
600	Argentina	177
600	Australia	179
600	Germany	171
600	Netherlands	166
600	UK	171
600	USA	177
601	Germany	116
601	UK	116
601	USA	117
602	Argentina	188
602	Finland	188
602	France	184
602	Japan	187
602	Portugal	188
602	UK	188
602	USA	188
603	USA	87
604	Sweden	88
604	USA	87
605	Argentina	154
605	Finland	156
605	Japan	155
605	Portugal	152
605	Sweden	152
605	UK	155
605	USA	154
606	Argentina	98
606	USA	98
607	Argentina	160
607	Sweden	161
607	USA	158
608	Argentina	114
608	Germany	112
608	Portugal	117
608	USA	117
609	Argentina	106
609	Denmark	105
609	Germany	106
609	Netherlands	105
610	Australia	127
610	Finland	119
610	Germany	119
610	USA	124
611	Argentina	128
611	Germany	107
611	UK	124
611	USA	129
612	Italy	93
613	Argentina	110
613	Germany	130
613	UK	106
614	Argentina	151
614	Finland	159
614	Japan	158
614	Netherlands	159
614	New Zealand	168
614	USA	160
615	Germany	66
615	USA	70
616	Finland	163
616	Germany	165
616	Italy	165
616	Portugal	160
616	Spain	165
616	Sweden	163
616	UK	165
616	USA	165
617	Argentina	111
617	Australia	111
617	France	111
617	Germany	111
617	Japan	111
617	New Zealand	111
617	Norway	113
617	UK	111
618	USA	93
619	USA	108
620	Netherlands	136
620	USA	137
620	USA	154
621	Japan	110
621	USA	75
622	USA	169
623	USA	105
624	Argentina	125
624	Australia	127
624	Belgium	115
624	Germany	126
624	Portugal	123
624	Sweden	126
624	USA	123
625	UK	94
625	USA	98
626	Argentina	105
626	Finland	102
626	France	105
626	Japan	101
626	Spain	105
626	UK	101
627	Finland	92
627	Germany	86
627	Japan	88
627	Netherlands	90
627	Norway	87
627	UK	86
627	USA	86
628	Sweden	96
628	USA	92
629	Germany	93
629	UK	103
629	USA	101
630	Argentina	135
630	Sweden	134
630	USA	135
631	USA	122
632	USA	133
632	USA	150
633	UK	125
633	USA	126
634	USA	85
635	USA	120
636	USA	172
637	USA	112
638	Australia	116
638	France	112
638	USA	116
639	Canada	106
639	USA	105
640	USA	130
641	Sweden	184
641	USA	183
642	UK	30
643	USA	105
644	UK	119
644	UK	146
644	USA	146
645	USA	102
646	Germany	97
646	USA	101
647	France	94
647	Singapore	99
647	USA	101
648	France	120
648	Sweden	114
648	USA	111
649	USA	128
650	USA	125
651	USA	110
652	Argentina	210
652	USA	212
653	Argentina	230
653	New Zealand	222
653	Sweden	225
653	Sweden	234
653	UK	220
653	USA	222
654	USA	114
654	USA	118
655	Germany	115
655	Germany	150
655	Germany	153
655	Germany	210
655	Germany	80
655	Germany	93
656	USA	100
657	Argentina	99
657	France	99
657	UK	96
658	USA	96
659	USA	93
660	Argentina	132
660	Spain	132
660	Sweden	131
660	UK	132
660	USA	134
661	Canada	94
662	Argentina	123
662	Italy	123
662	Italy	155
662	Italy	170
662	Sweden	124
662	UK	122
663	Germany	136
663	Sweden	124
663	USA	131
664	USA	122
664	USA	125
665	Russia	75
665	UK	75
665	USA	66
666	Sweden	172
667	USA	121
668	USA	126
669	USA	92
670	Argentina	81
670	Finland	80
670	Germany	80
670	UK	77
670	USA	81
671	Argentina	131
671	Australia	123
671	Iceland	123
671	Spain	131
671	UK	123
671	USA	131
672	USA	129
673	Germany	126
673	Sweden	124
673	UK	132
673	USA	131
674	USA	108
675	Sweden	146
675	USA	134
675	USA	145
676	USA	134
677	Germany	132
677	Spain	135
677	UK	136
677	UK	147
677	USA	137
677	USA	152
678	USA	113
679	Sweden	91
679	USA	90
680	USA	120
681	UK	92
681	USA	90
682	Germany	114
682	New Zealand	110
682	USA	111
683	Argentina	121
683	Germany	121
683	New Zealand	120
683	USA	126
684	Argentina	101
684	Australia	108
684	Finland	107
684	Japan	108
684	Spain	106
684	UK	105
685	UK	125
686	Argentina	122
686	Germany	122
686	USA	122
687	Sweden	192
687	USA	161
687	USA	184
687	USA	198
688	Denmark	139
688	France	139
688	Germany	140
688	Japan	140
688	UK	140
689	UK	142
689	USA	131
690	Argentina	118
690	France	114
690	Japan	119
690	Netherlands	116
690	Norway	120
690	UK	118
690	USA	118
691	Australia	232
691	Germany	228
691	Netherlands	238
691	Sweden	230
691	USA	139
691	USA	227
692	Canada	126
692	USA	127
693	Argentina	112
693	Canada	110
693	Germany	110
693	USA	112
694	Portugal	84
694	USA	84
695	USA	85
696	Australia	96
696	Germany	94
696	USA	75
697	Argentina	112
697	USA	120
697	USA	125
698	Australia	136
698	USA	142
699	France	187
699	Germany	180
699	Sweden	193
700	Australia	104
700	Japan	108
700	UK	107
700	USA	108
701	Italy	94
701	Sweden	109
701	USA	115
702	Germany	109
702	Hong Kong	111
702	New Zealand	110
702	Taiwan	140
702	USA	110
702	USA	99
703	Sweden	107
703	USA	108
704	Argentina	103
704	Japan	103
704	Spain	104
704	USA	103
705	USA	122
705	USA	131
706	Argentina	123
706	Germany	125
706	Spain	125
707	Argentina	113
707	Canada	115
707	Finland	110
707	Netherlands	108
708	Argentina	130
708	USA	128
708	USA	133
709	Netherlands	113
709	Sweden	117
709	UK	112
709	USA	111
710	Denmark	143
710	Japan	143
710	USA	140
711	Sweden	137
711	USA	137
712	USA	116
713	USA	87
714	Argentina	127
714	Germany	125
714	Spain	130
714	USA	127
715	Sweden	94
715	UK	93
715	USA	94
716	USA	119
717	France	190
717	Sweden	180
718	Spain	129
718	USA	129
719	Sweden	101
719	USA	102
720	Germany	94
720	UK	93
720	USA	94
721	Germany	122
721	USA	123
721	West Germany	113
722	Argentina	113
722	France	104
722	UK	113
722	USA	113
724	Argentina	138
724	New Zealand	137
724	USA	139
725	USA	113
726	USA	88
727	Australia	130
727	Belgium	128
727	Germany	130
727	USA	129
728	Argentina	84
728	USA	84
729	USA	111
730	Canada	92
730	Japan	90
730	USA	92
731	USA	108
732	Argentina	115
732	Canada	115
732	Finland	116
732	France	115
732	Japan	115
732	Netherlands	115
732	New Zealand	115
732	Norway	116
732	UK	114
732	USA	114
733	Argentina	186
733	UK	188
734	Argentina	115
734	USA	115
735	Argentina	182
735	Sweden	197
736	UK	127
736	USA	132
736	USA	135
737	Canada	88
737	UK	86
737	USA	85
738	USA	138
739	Finland	89
739	Netherlands	89
739	Norway	89
739	Sweden	89
739	UK	89
739	USA	89
740	USA	104
741	France	102
741	USA	100
742	USA	96
743	Australia	123
743	Spain	124
743	Sweden	123
744	USA	25
745	USA	118
746	USA	100
747	USA	115
748	USA	109
749	USA	130
750	Argentina	127
750	France	127
751	USA	119
752	USA	122
753	USA	141
754	USA	141
755	Argentina	121
755	Canada	121
755	Japan	121
755	UK	121
755	USA	121
756	USA	116
757	Australia	83
757	Sweden	88
757	USA	86
758	Australia	110
758	Japan	110
758	UK	110
758	USA	110
759	Argentina	83
759	Finland	82
759	Spain	83
759	Sweden	82
759	USA	83
760	USA	113
761	Italy	145
761	Sweden	141
761	USA	135
762	Argentina	127
762	Germany	126
762	Italy	135
762	Sweden	126
762	USA	127
763	USA	92
764	USA	93
765	Finland	124
765	UK	129
765	USA	129
766	USA	130
767	Argentina	103
767	Finland	103
767	France	102
767	Israel	102
767	Japan	102
767	Sweden	102
767	UK	101
767	USA	103
768	USA	134
769	Argentina	105
769	Japan	106
769	Netherlands	105
769	Norway	106
769	USA	105
770	Argentina	104
770	Denmark	104
770	France	105
770	Japan	104
770	UK	104
770	USA	104
771	Netherlands	104
771	USA	107
772	Finland	82
772	France	81
772	Germany	81
772	Japan	81
772	Netherlands	75
772	Norway	82
772	UK	81
772	USA	80
773	Argentina	134
773	Spain	134
773	Sweden	134
773	UK	138
774	Sweden	110
774	USA	111
775	USA	118
776	Spain	101
776	UK	101
777	Germany	108
777	USA	108
778	Canada	130
778	France	140
778	Spain	132
778	UK	130
778	USA	131
779	France	104
780	Spain	142
780	UK	142
780	USA	136
781	Argentina	125
781	Finland	126
781	New Zealand	125
781	UK	125
781	USA	125
782	Germany	114
782	USA	120
783	USA	120
\.


--
-- Data for Name: writes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY writes (mid, pid) FROM stdin;
533	6541
534	6557
534	6558
535	6574
535	6575
536	6591
536	6592
537	6609
537	6594
538	6625
539	6541
540	6652
541	6668
541	6669
542	6685
542	6686
543	6702
543	6703
544	6718
545	6652
545	6734
546	6749
547	6764
547	6765
548	6652
548	6772
549	6789
549	6790
550	6806
551	6822
551	6823
552	6840
553	6854
553	6855
554	6870
554	6870
555	6885
555	6886
556	6898
557	6915
557	6900
558	6931
558	6703
559	6946
559	6947
560	6957
560	6958
561	6973
562	6988
562	6989
563	7006
563	7007
564	7020
565	7034
565	7035
566	7045
566	7046
567	7061
567	7062
568	7073
568	7074
569	7091
569	7092
570	7095
570	7096
571	7112
571	7113
572	7124
572	7125
573	7141
573	7142
574	7155
574	7156
575	7164
575	7165
576	7180
577	7189
577	7190
578	7201
578	6541
579	7216
580	7231
580	7143
581	7247
582	7261
583	7263
584	7269
584	6668
585	7285
586	7296
586	6703
587	7306
587	7143
588	6557
588	6558
589	7330
590	7332
590	7333
591	7361
592	7372
592	7139
593	7389
593	6703
594	7405
595	7414
595	7046
596	7426
596	6594
597	6789
598	7448
598	7449
599	7465
599	6669
600	7481
601	7491
601	7492
602	7509
603	7510
604	7510
605	7542
605	7542
606	7556
606	7557
607	7572
608	7585
608	7586
609	7602
609	7603
610	7619
610	7609
611	7634
611	7635
612	7644
612	7645
613	7662
614	7676
614	7677
615	7689
615	7690
616	7701
616	7702
617	7717
617	7718
618	7720
618	7733
619	7745
620	7760
621	7770
621	6669
622	7784
622	7785
623	7793
623	7794
624	7795
625	7820
626	7832
627	7846
627	7847
628	7862
629	7873
629	7874
630	7875
631	7901
631	7902
632	7914
632	7915
633	7510
634	7938
634	7939
635	7953
635	7954
636	7969
636	7970
637	7980
637	7981
638	7997
638	7998
639	8009
639	8010
640	8025
640	8026
641	8039
642	7096
642	7095
643	8050
643	8051
644	8063
644	6703
645	8074
645	8075
646	8087
647	8103
647	8103
648	8114
648	8115
649	8128
649	8129
650	7231
650	7143
651	7820
652	8158
652	8159
653	8173
653	8174
654	7873
654	8185
655	7063
656	7510
657	8208
657	8209
658	7720
658	7733
659	7794
660	6652
660	8237
661	8254
661	8255
662	8271
662	8272
663	8286
663	8287
664	8297
665	8302
665	8303
666	8314
666	8315
667	8327
667	8328
668	8341
668	8341
669	8087
669	8353
670	6988
670	8358
671	8371
672	8376
672	6806
673	8391
673	8392
674	8406
674	8394
675	8421
675	8422
676	8434
676	8435
677	7760
677	8449
678	6541
679	7862
680	8481
680	8482
681	8488
681	8489
682	8506
683	6833
683	8508
684	8537
685	8549
685	8550
686	8564
686	8565
687	8576
687	8577
688	8591
689	7335
689	8600
690	8617
690	8618
691	8630
691	8631
692	6652
692	8644
693	8659
693	8660
694	8674
694	7095
695	6703
696	8699
697	8703
697	8704
698	8720
698	7677
699	6734
700	8747
700	8748
701	8755
701	8756
702	8771
703	7760
703	8781
704	8796
705	8811
706	8823
706	8824
707	8841
707	8842
708	8857
709	8721
709	8874
710	6668
710	6669
711	8886
712	8907
712	8908
713	6557
713	8920
714	8934
714	8935
715	8949
715	8951
716	8964
716	8965
717	8981
718	7954
719	9003
719	9004
720	7332
720	7333
721	9016
721	9017
722	9030
722	9031
723	7810
723	9039
724	9059
724	9059
725	9073
725	9074
726	9079
726	9080
727	9095
727	8371
728	9109
728	9110
729	9117
729	9118
730	9125
731	9145
731	9146
732	9160
732	9161
733	9173
734	9189
735	7862
736	6576
736	7020
737	9230
737	7125
738	9241
738	9242
739	9259
740	9269
740	9269
741	9276
741	9276
742	9284
742	8075
743	9295
744	9307
745	8577
745	9320
746	9329
746	9330
747	7556
747	7557
748	9356
748	9356
749	9369
750	8755
750	9382
751	8025
751	9395
752	9411
752	9412
753	9426
754	6772
754	9436
755	9448
755	9448
756	9461
756	9462
757	9475
757	9476
758	9492
759	9502
759	9503
760	9511
760	9512
761	8755
761	9525
762	9535
762	9536
763	9542
763	9543
764	7045
764	9556
765	9567
765	7046
766	9579
766	9580
767	9594
768	9606
769	9623
769	9624
770	9638
770	6750
771	7720
772	9651
772	9652
773	9675
773	9676
774	9689
774	9690
775	9700
775	9701
776	9714
776	9714
777	7333
777	9729
778	9745
778	8103
779	9761
780	9776
781	9790
781	9790
782	9803
783	7602
783	9804
\.


--
-- Name: movie_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (mid);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (pid);


--
-- Name: idx_acts_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_acts_mid ON acts USING btree (mid);


--
-- Name: idx_acts_pid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_acts_pid ON acts USING btree (pid);


--
-- Name: idx_certification_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_certification_mid ON certification USING btree (mid);


--
-- Name: idx_directs_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_directs_mid ON directs USING btree (mid);


--
-- Name: idx_directs_pid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_directs_pid ON directs USING btree (pid);


--
-- Name: idx_genre_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_genre_mid ON genre USING btree (mid);


--
-- Name: idx_language_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_language_mid ON language USING btree (mid);


--
-- Name: idx_movie_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_movie_mid ON movie USING btree (mid);


--
-- Name: idx_person_pid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_person_pid ON person USING btree (pid);


--
-- Name: idx_runtime_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_runtime_mid ON runtime USING btree (mid);


--
-- Name: idx_writes_mid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_writes_mid ON writes USING btree (mid);


--
-- Name: idx_writes_pid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_writes_pid ON writes USING btree (pid);


--
-- Name: acts_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acts
    ADD CONSTRAINT acts_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: acts_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acts
    ADD CONSTRAINT acts_pid_fkey FOREIGN KEY (pid) REFERENCES person(pid);


--
-- Name: certification_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY certification
    ADD CONSTRAINT certification_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: directs_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY directs
    ADD CONSTRAINT directs_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: directs_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY directs
    ADD CONSTRAINT directs_pid_fkey FOREIGN KEY (pid) REFERENCES person(pid);


--
-- Name: genre_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: language_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: runtime_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY runtime
    ADD CONSTRAINT runtime_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: writes_mid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY writes
    ADD CONSTRAINT writes_mid_fkey FOREIGN KEY (mid) REFERENCES movie(mid);


--
-- Name: writes_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY writes
    ADD CONSTRAINT writes_pid_fkey FOREIGN KEY (pid) REFERENCES person(pid);


--
-- PostgreSQL database dump complete
--

