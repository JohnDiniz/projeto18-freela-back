--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    categories text[] NOT NULL,
    description text,
    sold boolean NOT NULL,
    price numeric(10,2) NOT NULL,
    imgurl text
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "userId" integer
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    imgurl text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, title, categories, description, sold, price, imgurl) FROM stdin;
1f247124-827f-4f60-ba5f-83a7f3444d88	Burzum – Burzum 	{BlackMetal,"Dungeon synth"}	Burzum – Burzum (2019, Vinyl) - Discogs	f	666.66	https://i.discogs.com/lqya9g8vfXe9xrSmGxwHqPDyjSt8Q8MNuMyJe3FBbRc/rs:fit/g:sm/q:90/h:589/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0NjU4/NjI1LTE1NzkwNzg2/MjMtMzQ4Mi5qcGVn.jpeg
bc966541-c8d8-4fdc-93ee-0f7e0f1ed562	flies the coop 	{BlackMetal,"Dungeon synth"}	flies the coop | Hole Dweller | Dungeons Deep Records	f	33.66	https://f4.bcbits.com/img/0032266511_71.jpg
26410e35-295f-4f4b-9cff-b2b93ce3cbef	The Beatles	{"Rock 'n' Roll"}	The Beatles – Abbey Road (1969, Sandwich cover, Vinyl) - Discogs	t	29.99	https://i.discogs.com/zqE-1M7Ehi-uDsEhpuW0D9F26jezy0zNwwxuX_oeAv4/rs:fit/g:sm/q:40/h:300/w:300/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM5NDM3/ODgtMTQzMDg2ODE0/OS00NjYzLmpwZWc.jpeg
a46c6976-71a3-4c19-b4b3-45adfb08794e	BATHORY ‎– Hammerheart	{BlackMetal}	BATHORY ‎– Hammerheart (Double Black Vinyl) | TShirtSlayer TShirt and BattleJacket Gallery	t	66.99	https://tshirtslayer.com/files-tshirt/styles/shirtview/public/user-30412/tss--f081a903f1c2310ea1d6610110325611.jpg
bfa40f70-f89c-4dde-aed4-1448838047a9	King Of Asgard Karg Lp Amon Amarth Einherjer Unleashed	{BlackMetal}	King Of Asgard Karg Lp Amon Amarth Einherjer Unleashed Tr | Frete grátis	f	66.99	https://http2.mlstatic.com/D_NQ_NP_689232-MLB45228494364_032021-W.jpg
de56ba61-533e-4f2c-9d2b-973013b79e1b	Order and Sigil (black cover)	{BlackMetal}	Order and Sigil (black cover)	f	66.99	https://www.sound-cave.com/uploads/Product/image/burzum-order-and-sigil-black-cover.jpg?v=1553358169
bbe229ee-2c19-4a2f-9da4-84e3031f0ea1	Montana I Love Music Put It in Love Promo Copy 19215 Record	{Jazz,Blues}	Montana I Love Music Put It in Love Promo Copy 19215 Record - Etsy	f	66.99	https://www.sound-cave.com/uploads/Product/image/burzum-order-and-sigil-black-cover.jpg?v=1553358169
dc9b7df8-bc5d-4477-891f-ff87e06580f6	LP Tim Maia - Tim Maia 1993	{Jazz,Blues,Funk}	LP Tim Maia - Tim Maia 1993 - Vinyl Virtual Shop - Discos de vinil e CDs	t	66.99	https://static.cloud-boxloja.com/lojas/b58ow/produtos/58f0e7af-678c-4102-8ece-785c6e737819.jpg
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, token, "createdAt", "userId") FROM stdin;
1	f55b43f4-dfe8-4670-a6ca-c0262e0ef871	2023-08-14 08:14:03.008582	2
2	f47fa083-18e8-4b4e-943a-2054bc1e5182	2023-08-14 08:16:38.060173	2
3	ab0c3b6f-d309-4097-a518-712ea893adb2	2023-08-14 08:17:06.59386	2
4	a9a11514-3144-495c-9f25-ab248dabbf20	2023-08-14 08:26:09.822562	2
5	b957922b-23bf-4bb3-b027-80d44117507d	2023-08-14 08:27:12.653371	2
6	3e423458-fed6-4d65-95de-6b5c05db4800	2023-08-14 08:34:13.059884	2
7	bd1276ac-08f3-489d-849a-e682ce8c994e	2023-08-14 08:36:15.444406	2
8	d53a8086-1d68-4bd8-885e-1c8199d6f56c	2023-08-14 09:01:22.975465	2
9	37355805-000c-4ba2-9bb8-ba8fdc508730	2023-08-14 09:28:14.895139	2
10	6c8604ef-f187-4258-9694-27c003f7ab71	2023-08-14 09:33:22.726721	3
11	722c907f-f678-4668-9dd3-e9c51aa5d84b	2023-08-14 09:33:50.51489	3
12	212d4a49-2df7-4237-b410-1d08774851a6	2023-08-14 09:33:53.90369	3
13	5b4a587f-26e0-493e-a7d6-5524f94e6530	2023-08-14 09:35:34.356336	3
14	0c5c734d-7083-47ef-9c74-8e74eb2fbbb2	2023-08-14 09:42:32.673427	3
15	9b318053-37ff-4047-a9ca-dbce1b537a42	2023-08-14 09:43:31.554924	3
16	623b9c61-bbd4-4117-9f45-67978e3e69f4	2023-08-14 09:44:07.936045	3
17	0519f3c9-8d42-4054-9f61-95a17ec0b540	2023-08-14 09:44:35.921668	3
18	c959a82d-fa2b-4496-a6a7-92d72082bc3d	2023-08-14 09:47:58.746919	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "createdAt", imgurl) FROM stdin;
1	joao	joao111@gmail.com	$2b$10$fdGdnPzlmNCttLgMx6M6je417Rx7I6Zo9W7GwExPoBvqkm827Obwm	2023-08-14 08:02:51.640474	\N
2	joao	joao@gmail.com	$2b$10$4PJjajbOm8EAvBl5Qi7JJu9FWktxtJRoRK9B68RpyvSUAFeyMuPCy	2023-08-14 08:05:35.929745	https://i.pinimg.com/236x/0a/ee/69/0aee69d2dab1247a46d6785100c3f3fe.jpg
3	meu	meu@gmail.com	$2b$10$f6M24uIQnon07jIU0FbfuuyanM9bmfKpRTRqAiUVKBs.3nYRGAzfu	2023-08-14 09:33:14.433836	https://i.pinimg.com/564x/ae/24/87/ae24874dd301843548c034a3d2973658.jpg
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 18, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

