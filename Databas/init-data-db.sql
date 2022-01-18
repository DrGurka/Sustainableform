-- initialize Types table

INSERT INTO Types (ID, Industry)
VALUES (1, "Hotell");

INSERT INTO Types (ID, Industry)
VALUES (2, "Restaurang");

INSERT INTO Types (ID, Industry)
VALUES (3, "Byrå");

INSERT INTO Types (ID, Industry)
VALUES (4, "Evenemangshall");


-- Conditions--

-- Hotell--

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(1, 1, 2);

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(3, 1, 4);

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(7, 1, 8);

-- Byråer --

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(9, 1, 10);

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(11, 1, 12);

-- Restauranger --

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(13, 1, 14);

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(18, 1, 19);

-- Evenemangshallar --

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(22, 1, 23);

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(24, 1, 25);

INSERT INTO Conditions(Question_ID, Button_ID, Next_ID)
VALUES(28, 1, 29);



-- Insert Users data --

-- Hotell--

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info.marinaplaza@elite.se", "Elite Hotel Marina Plaza", 1, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info.mollberg@elite.se", "Elite Hotel Mollberg", 1, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("cl.grandhelsingborg@choice.se", "Clarion Grand Hotel", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("co.nouveau@choice.se", "Comfort Hotel", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("reception@thevaulthotel.se", "The Vault", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@hotellviking.se", "V Hotel", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@hotelkarnan.se", "First Hotel Kärnan", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@scandichotels.com", "Scandic Nord", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@gmorninghotels.se", "Good Morning Hotels", 1, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("kathy.adenlof@amasten.se", "Continental Apartments Hotels", 1, 0);
-- 19 apartments

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@hotellstadsparken.se", "Hotel Stadsparken", 1, 0);
-- 64 rooms

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("linnea@hotell-linnea.se", "Hotell Linnéa", 1, 0);
-- 37 rooms

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@villathalassa.se", "Villa Thalassa", 1, 0);
-- 34 rooms

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@cityvandrarhemmet.com", "Cityvandrarhem", 1, 0);
-- 41 rooms

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@miatorp.nu", "STF Miatorp Hostel & Hotel", 1, 0);
-- 75 - 100 beds


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info.helsingborg@radissonblu.com", "Radisson Blu Metropol Hotel", 1, 0);
-- 205 rooms

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("cl.seau@choice.se", "Clarion Hotel SeaU", 1, 0);
-- 250 rooms


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@sundsgarden.se", "Hotell Sundsgården", 1, 0);
-- 94 rooms


INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("group.sweden@scandichotels.com", "Scandic Oceanhamnen", 1, 0);
-- 180 rooms

-- Evenemangshall--
INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("hbgarena@helsingborg.se", "Helsingborg Arena", 4, 0);



INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("kontakt@jacobhansenshus.se", "Jacob Hansens Hus", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("kontaktcenter@helsingborg.se", "Dunkers Kulturhus", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("konserthuset@helsingborg.se", "Konserthuset", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("stadsteatern@helsingborg.se", "Stadsteatern", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("fredriksdal@helsingborg.se", "Fredriksdal", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@sundsparlan.se", "Sundspärlan", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("parapeten@restaurangtegel.se", "Parapeten", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("Aktivitetshuset.tryckeriet@helsingborg.se", "Tryckeriet", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@bollbrolyckan.com", "Bollbrolyckan", 4, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@folketshushelsingborg.se", "Folkets Hus", 4, 0);
 
-- Resturanger--
INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@drottninggatan35.se", "Drottninggatan 35 ", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@palsjokrog.se", "Pålsjö Krog ", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@sofieroslottsrestaurang.se", "Sofiero Slottsrestaurang", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@restaurangcreo.se", "Creo", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@barricamatvin.se", "Barrica Mat & Vinbar", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@hbgsoder.pinchos.se", "Pinchos", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@tuggburgers.se", "Tugg Burgers", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("paolos.helsingborg@elite.se", "Paolos", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@seaandsalt.se", "Sea & Salt ", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@vasshbg.se", "Vass", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@friabadochbar.se", "Fria Bad och Bar", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("roysmatobar@hotmail.com", "Roys mat och bar", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@thetivoli.se", "The Tivoli", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("strandhuset.resto@gmail.com", "Strandhuset", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@kolhelsingborg.se", "Kol & Cocktails", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("amor@cafeetoile.se", "Etoile", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@baravara.eu", "Bara Vara", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@amarestaurant.se", "AMA - Nikkei Restaurang & Rooftop Bar", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("At Mollberg", "At Mollberg", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@bronxburgers.se", "Bastrad Burgers", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@beach-club.se", "Beach club gröningen", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@cafemezo.se", "Café Mezo", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@cafeviva.se", "Café Viva", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("bokning@charlesdickens.nu", "Charles Dickens Bar & Scen Helsingborg", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("Bikten", "Bikten", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("bokning@brasseriethelsingborg.se", "Brasseriet Helsingborg", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@chforet.se", "Chateau foret", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@currynamnam.nu", "Curry NamNam", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@damastaste.se", "Damas", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("sara@dineburgers.se", "Diné Burgers", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("restaurang@dunkermatsalar.com", "Dunker bar och matsalar", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@ellysost.se", "Ellys Ost & Delikatesser", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@firavin.se", "Firavin", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("restaurangbokning@forseaferries.com", "Forsea", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@freakinfries.se", "Freakin fries", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("VAMOS@HEATHBG.SE", "Heat", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@holygreens.se", "Holy Greens City", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@kebabking.se", "Kebab King", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@kingscorner.se", "Kings Corner Steak ´n Pub", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@kitchenandtable.se", "Kitchen & Table", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("vividwish@hotmail.com", "Koreana Restaurang", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@laventa.se", "La Venta", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@m2tapas.se", "M2 Tapas", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@madamemoustache.se", "Madame Moustache", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@mommees.se", "Mommee´s", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@mollebacken.com", "Möllebacken restaurang & café", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("nellysfoodetc@radissonblu.com", "Nelly´s Food etc.", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@olearys.se", "O´Learys", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@oasenfondue.se", "Oasen Fonduerestaurang", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@pubnessie.se", "Pub Nessie", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@restaurangedelweiss.se", "Restaurang Edelweiss", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@papadamindisk.se", "Restaurant Papadam", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("kullavagenhelsingborg@sugoirestauranger.se", "Sugoi", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@tacosyburritos.se", "Tacos y Burritos", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("telegrafenhbg@gmail.com", "Telegrafen", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@thaicorner.se", "Thai Corner", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("boka@tikal.nu", "Tikal", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("INFO@VEDBYMARIA.SE", "Ved by Maria", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("vegeriet@vegeriet.se", "Vegeriet", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("Venti Trattoria", "reception@thevaulthotel.se", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("pokebowlsweden@gmail.com", "Vibes Poké Bar", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("info@wokonfire.nu", "Wok on fire", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("helsingborg@woso.se", "Woso Sallad & Sushi", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("kontakt@yokodinnerclub.se", "Yoko", 2, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted)
VALUES ("Ålgrändens Ost & Deli", "INFO@ALGRANDENSOST.SE", 2, 0);


-- Byråer--
INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 2
VALUES ("mail@turretur.se", "Tur & Retur", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 3
VALUES ("helsingborg@ticket.se", "Ticket resebyrå", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 4
VALUES ("042216333@telia.com", "Fly Center", 3, 0);


INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 6
VALUES ("info@sindibad.se", "Sindibad Travel", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 7
VALUES ("helsingborg@respartner.se", "Respartner", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 8
VALUES ("info@poseidontravel.se", "Poseidon Travel AB", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 9
VALUES ("bokning@travelpoint.se", "Travel Point AB", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 10
VALUES ("info@tjeckienexperten.se", "TjeckienExperten", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 11
VALUES ("support@flygstolen.se", "Flygstolen", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 12
VALUES ("info@sydafrikaresor.se", "Sydafrikaresor", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 13
VALUES ("travel@tourpacific.se", "Tour Pacific", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 14
VALUES ("info@goxplore.se", "GoXplore Sweden", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 16
VALUES ("nyati@nyati.com", "Nyati Safari Sweden", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 18
VALUES ("info@soderhavsresor.se", "Söderhavsresor", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 19
VALUES ("jp@jpr.se", "JP Resor AB", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 20
VALUES ("info@tronsproduction.se", "Tronds Production", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 21
VALUES ("info@icegroup.se", "I.C.E Group", 3, 0);

INSERT INTO Users (Email, Name, Type_ID, Submitted) -- 22
VALUES ("roland@byrafemtiotva.se", "Byrå Femtitvå", 3, 0);







-- Insert Question data --

-- Q1 ------------------------------------------------
INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Har ert hotell någon miljöcertifiering?", 1);
-- Om ja:

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (1, "Vilken miljöcertifiering har ni?", 1);

-- Q2 -------------------------------------------------
INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Jobbar ni aktivt med att minska matsvinnet?", 1);
-- Om ja:

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (2, "Hur många procent jämfört med föregående år av ert årliga matsvinn har ni lyckats minska?", 1);


-- Q3 -------------------------------------------------
INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Jobbar ni aktivt med att minska engångsartiklar och plastmaterial?", 1);

-- Q4---------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Sorterar ni organiskt avfall?", 1);

-- Q5----------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Finns det en publicerad publik rapport rörande resultaten av ert miljöarbete?", 1);

INSERT INTO Questions(Type_ID, Question_text, Industry_ID)
VALUES(4, "Bifoga länk till rapporten här", 1);


-- Byråer------------------------------------------------

-- Q1----------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0,"Har ni en extern hållbarhetscertifiering/miljöcertifiering?", 3);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES(1, "Vilken hållbarhetscertifiering/miljöcertifiering har ni?", 3);

-- Q2-----------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES(0, "Har ni en skriftlig hållbarhetspolicy?", 3);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES(4,"Är den publikt publicerad bifoga länken till den här:", 3);

-- Restauranger---------------------------------------------

-- Q1------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES(0, "Har ni någon miljöcertifiering?", 2);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (1, "Vilken miljöcertifiering har ni?", 2);

-- Q2------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Arbetar ni aktivt med att minska engångsmaterial i plast?", 2);

-- Q3------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Arbetar ni aktivt med att använda er av ekologiska eller på annat sätt mer hållbara produkter?", 2);

-- Q4------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Sorterar ni organiskt avfall?", 2);

-- Q5------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Jobbar ni aktivt med att minska matsvinnet?", 2);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (2, "Hur stor del i % jämfört med föregående år av ert årliga matsvinn har ni lyckats minska?", 2);

-- Q6-------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Arbetar ni aktivt med att använda lokalt producerade råvaror?", 2);

-- Q7--------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Erbjuder ni plantbaserade rätter som alternativ till den ordinarie menyn?", 2);

-- EVENEMANGSHALLAR-------------------------------------------

-- Q1--------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Har ni någon extern hållbarhets eller miljöcertifiering?", 4);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (1, "Vilken av nedan certifiering har ni?", 4);

-- Q2---------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Jobbar ni aktivt med att minska matsvinnet?", 4);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (2, "Hur stor del i % jämfört med föregående år av ert årliga matsvinn har ni lyckats minska?", 4);

-- Q3----------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Jobbar ni aktivt med att minska engångsartiklar och plastmaterial?", 4);

-- Q4----------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Sorterar ni organiskt avfall?", 4);

-- Q5----------------------------------------------------------

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (0, "Finns det en publicerad publik rapport rörande resultaten av ert miljöarbete?", 4);

INSERT INTO Questions (Type_ID, Question_text, Industry_ID)
VALUES (4, "Bifoga länk till rapporten här", 4);

-- Answer Types -- 

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Ja", 0);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Nej", 0);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Svensk Miljöbas", 1);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Green Key", 1);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("ISO 14001", 1);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Svanen", 1);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Annan Certifiering", 1);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("1-30%", 2);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("30-50%", 2);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("50% och uppåt", 2);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Antal", 3);

INSERT INTO Answer_Types (Button_Text, Type_ID)
VALUES("Link", 4);

-- Admin -- 
INSERT INTO Admins (Username, Password)
VALUES("admin", "123")

