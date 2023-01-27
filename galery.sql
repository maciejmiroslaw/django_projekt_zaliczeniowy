--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1+b1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1+b1)

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
-- Name: apka_categorymodel; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.apka_categorymodel (
    id uuid NOT NULL,
    slug character varying(200),
    title character varying(100)
);


ALTER TABLE public.apka_categorymodel OWNER TO admin;

--
-- Name: apka_comment; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.apka_comment (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    body text NOT NULL,
    created_on timestamp with time zone NOT NULL,
    image_id uuid NOT NULL
);


ALTER TABLE public.apka_comment OWNER TO admin;

--
-- Name: apka_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.apka_comment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.apka_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: apka_imagemodel; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.apka_imagemodel (
    id uuid NOT NULL,
    name character varying(100),
    description text,
    image character varying(100) NOT NULL,
    slug character varying(200),
    created timestamp with time zone,
    last_updated timestamp with time zone,
    category_id uuid,
    cropped character varying(100) NOT NULL
);


ALTER TABLE public.apka_imagemodel OWNER TO admin;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Data for Name: apka_categorymodel; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.apka_categorymodel (id, slug, title) FROM stdin;
4ed770e2-9c8f-41f9-9f61-978e489719d6	sport	Sport
c80912e2-d36f-4f18-b395-0c212d3f9875	redit	Reddit
6097eb71-841c-4f88-8acc-2463853267e2	life-style	LifeStyle
aedcf971-2fdb-43eb-8866-740182d02ca2	it	IT
\.


--
-- Data for Name: apka_comment; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.apka_comment (id, name, body, created_on, image_id) FROM stdin;
1	Maciej	Ładna pilka	2023-01-27 12:46:17.877426+01	c5088508-c73b-414e-8c20-00fb06f264cb
2	Maciej2	Widziałem lepsze...	2023-01-27 12:47:04.167756+01	c5088508-c73b-414e-8c20-00fb06f264cb
3	Test	Testuje	2023-01-27 12:55:15.550917+01	c5088508-c73b-414e-8c20-00fb06f264cb
4	Test	Testuje	2023-01-27 12:55:55.853332+01	c5088508-c73b-414e-8c20-00fb06f264cb
5	Test333	Hej testuje	2023-01-27 12:56:03.986112+01	c5088508-c73b-414e-8c20-00fb06f264cb
6	Tescik	Test test	2023-01-27 13:14:35.373796+01	41f0e959-607f-47d6-9faf-917c11753c46
7	Tescik2	Ciekawe czy się sortuje	2023-01-27 13:14:48.115503+01	41f0e959-607f-47d6-9faf-917c11753c46
\.


--
-- Data for Name: apka_imagemodel; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.apka_imagemodel (id, name, description, image, slug, created, last_updated, category_id, cropped) FROM stdin;
41f0e959-607f-47d6-9faf-917c11753c46	No picutre	Image looking as there is no picture ;D	full/default_bMz9dRc.png	noimg	2023-01-27 00:15:44+01	2023-01-27 00:15:45+01	4ed770e2-9c8f-41f9-9f61-978e489719d6	cropped/default_mj1xHWy.png
c5088508-c73b-414e-8c20-00fb06f264cb	Football	ball.	full/index.jpeg	ball	2023-01-27 00:17:20+01	2023-01-27 00:17:23+01	4ed770e2-9c8f-41f9-9f61-978e489719d6	cropped/index.jpeg
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add category model	8	add_categorymodel
30	Can change category model	8	change_categorymodel
31	Can delete category model	8	delete_categorymodel
32	Can view category model	8	view_categorymodel
33	Can add image model	9	add_imagemodel
34	Can change image model	9	change_imagemodel
35	Can delete image model	9	delete_imagemodel
36	Can view image model	9	view_imagemodel
37	Can add comment	10	add_comment
38	Can change comment	10	change_comment
39	Can delete comment	10	delete_comment
40	Can view comment	10	view_comment
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$390000$tUnkBGvZXTQkFyAfdMBJUg$irvZoGOi3gED/qYCozJjiA8s1B05p/yfxlU5zQdRxbc=	2023-01-26 22:58:00.711837+01	t	admin			admin@admin.pl	t	t	2023-01-26 16:08:20.04211+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-01-26 22:07:39.725301+01	4ed770e2-9c8f-41f9-9f61-978e489719d6	CategoryModel object (4ed770e2-9c8f-41f9-9f61-978e489719d6)	1	[{"added": {}}]	8	1
2	2023-01-26 23:05:31.675364+01	34909a1a-09c3-491f-94ff-573085c0e9a5	Sport-tt	1	[{"added": {}}]	9	1
3	2023-01-26 23:15:13.014632+01	34909a1a-09c3-491f-94ff-573085c0e9a5	Sport-tt	3		9	1
4	2023-01-26 23:16:26.398546+01	c80912e2-d36f-4f18-b395-0c212d3f9875	Reddit	1	[{"added": {}}]	8	1
5	2023-01-26 23:19:21.964911+01	6097eb71-841c-4f88-8acc-2463853267e2	LifeStyle	1	[{"added": {}}]	8	1
6	2023-01-26 23:19:32.878196+01	aedcf971-2fdb-43eb-8866-740182d02ca2	IT	1	[{"added": {}}]	8	1
7	2023-01-26 23:23:11.387516+01	aedaf385-14ab-400f-80ba-908bbecab9b3	Sport-SportTest	1	[{"added": {}}]	9	1
8	2023-01-26 23:41:05.466945+01	b7e3f14c-5f6a-43a0-a64e-7b69fd5f4c87	Sport-Test1	1	[{"added": {}}]	9	1
9	2023-01-26 23:41:25.797006+01	014c7539-bf84-40b6-8f8d-937b11c516f0	Sport-Test2	1	[{"added": {}}]	9	1
10	2023-01-26 23:41:41.455956+01	1c9a7932-9fe0-4dde-8ce8-4721d6a0eb9f	Sport-Test3	1	[{"added": {}}]	9	1
11	2023-01-27 00:13:01.895421+01	a5094863-e9cf-4175-8e89-06b77f7d34c7	Sport-Transparent image	1	[{"added": {}}]	9	1
12	2023-01-27 00:14:54.256511+01	aedaf385-14ab-400f-80ba-908bbecab9b3	Sport-SportTest	3		9	1
13	2023-01-27 00:14:58.929038+01	b7e3f14c-5f6a-43a0-a64e-7b69fd5f4c87	Sport-Test1	3		9	1
14	2023-01-27 00:14:58.930508+01	a5094863-e9cf-4175-8e89-06b77f7d34c7	Sport-Transparent image	3		9	1
15	2023-01-27 00:14:58.931357+01	1c9a7932-9fe0-4dde-8ce8-4721d6a0eb9f	Sport-Test3	3		9	1
16	2023-01-27 00:14:58.932129+01	014c7539-bf84-40b6-8f8d-937b11c516f0	Sport-Test2	3		9	1
17	2023-01-27 00:15:46.900487+01	41f0e959-607f-47d6-9faf-917c11753c46	Sport-No picutre	1	[{"added": {}}]	9	1
18	2023-01-27 00:17:24.168547+01	c5088508-c73b-414e-8c20-00fb06f264cb	Sport-Football	1	[{"added": {}}]	9	1
19	2023-01-27 12:46:17.879807+01	1	User: Maciej Text: Ładna pilka	1	[{"added": {}}]	10	1
20	2023-01-27 12:47:04.168379+01	2	User: Maciej2 Text: Widziałem lepsze...	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	galeryapp	category
8	apka	categorymodel
9	apka	imagemodel
10	apka	comment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-01-26 16:07:50.152309+01
2	auth	0001_initial	2023-01-26 16:07:50.20092+01
3	admin	0001_initial	2023-01-26 16:07:50.215204+01
4	admin	0002_logentry_remove_auto_add	2023-01-26 16:07:50.219701+01
5	admin	0003_logentry_add_action_flag_choices	2023-01-26 16:07:50.224126+01
6	contenttypes	0002_remove_content_type_name	2023-01-26 16:07:50.234592+01
7	auth	0002_alter_permission_name_max_length	2023-01-26 16:07:50.239875+01
8	auth	0003_alter_user_email_max_length	2023-01-26 16:07:50.24462+01
9	auth	0004_alter_user_username_opts	2023-01-26 16:07:50.24863+01
10	auth	0005_alter_user_last_login_null	2023-01-26 16:07:50.253509+01
11	auth	0006_require_contenttypes_0002	2023-01-26 16:07:50.254905+01
12	auth	0007_alter_validators_add_error_messages	2023-01-26 16:07:50.259812+01
13	auth	0008_alter_user_username_max_length	2023-01-26 16:07:50.267+01
14	auth	0009_alter_user_last_name_max_length	2023-01-26 16:07:50.272975+01
15	auth	0010_alter_group_name_max_length	2023-01-26 16:07:50.277946+01
16	auth	0011_update_proxy_permissions	2023-01-26 16:07:50.282302+01
17	auth	0012_alter_user_first_name_max_length	2023-01-26 16:07:50.287686+01
18	sessions	0001_initial	2023-01-26 16:07:50.295845+01
19	apka	0001_initial	2023-01-26 16:58:37.779913+01
20	apka	0002_categorymodel_slug_categorymodel_title	2023-01-26 18:17:11.026639+01
21	apka	0003_imagemodel	2023-01-26 22:24:18.750411+01
22	apka	0004_imagemodel_cropped_alter_imagemodel_image	2023-01-26 23:13:30.965953+01
23	apka	0005_alter_imagemodel_cropped_alter_imagemodel_image	2023-01-26 23:18:58.197723+01
24	apka	0006_alter_imagemodel_cropped	2023-01-26 23:22:22.3579+01
25	apka	0007_alter_imagemodel_cropped_alter_imagemodel_image_and_more	2023-01-27 00:31:34.469725+01
26	apka	0008_alter_comment_options	2023-01-27 13:14:14.215351+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
75x4snzxdi2o82fmqm8m29226jbdfxcv	.eJxVjDsOwjAQBe_iGllex-sPJX3OYK13DQ6gRMqnQtwdIqWA9s3Me6lM29ryttQ5D6LOCtTpdyvEjzruQO403ibN07jOQ9G7og-66H6S-rwc7t9Bo6V9a-RYxEU0HXvxhAY9MaRQ2CYyzleUTjhggiskizFgCBFCBySWwDr1_gDRTjbl:1pL5q3:ZVGeL_x1inTL7eo9U0HxPznkzLCeRb9IkbeSZKbMpwE	2023-02-09 18:15:03.874758+01
sk1nbe54xy06vntoetwxmgbltuvw90s1	.eJxVjDsOwjAQBe_iGllex-sPJX3OYK13DQ6gRMqnQtwdIqWA9s3Me6lM29ryttQ5D6LOCtTpdyvEjzruQO403ibN07jOQ9G7og-66H6S-rwc7t9Bo6V9a-RYxEU0HXvxhAY9MaRQ2CYyzleUTjhggiskizFgCBFCBySWwDr1_gDRTjbl:1pLAFs:5RShtSbyf2W5XNco71iiaSKTf7Id2MStG8nC6d_6NhY	2023-02-09 22:58:00.713252+01
\.


--
-- Name: apka_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.apka_comment_id_seq', 7, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 20, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: apka_categorymodel apka_categorymodel_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_categorymodel
    ADD CONSTRAINT apka_categorymodel_pkey PRIMARY KEY (id);


--
-- Name: apka_categorymodel apka_categorymodel_slug_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_categorymodel
    ADD CONSTRAINT apka_categorymodel_slug_key UNIQUE (slug);


--
-- Name: apka_comment apka_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_comment
    ADD CONSTRAINT apka_comment_pkey PRIMARY KEY (id);


--
-- Name: apka_imagemodel apka_imagemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_imagemodel
    ADD CONSTRAINT apka_imagemodel_pkey PRIMARY KEY (id);


--
-- Name: apka_imagemodel apka_imagemodel_slug_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_imagemodel
    ADD CONSTRAINT apka_imagemodel_slug_key UNIQUE (slug);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: apka_categorymodel_slug_bb349f4c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX apka_categorymodel_slug_bb349f4c_like ON public.apka_categorymodel USING btree (slug varchar_pattern_ops);


--
-- Name: apka_comment_image_id_40cffa18; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX apka_comment_image_id_40cffa18 ON public.apka_comment USING btree (image_id);


--
-- Name: apka_imagemodel_category_id_5089e94b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX apka_imagemodel_category_id_5089e94b ON public.apka_imagemodel USING btree (category_id);


--
-- Name: apka_imagemodel_slug_0f12a016_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX apka_imagemodel_slug_0f12a016_like ON public.apka_imagemodel USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: apka_comment apka_comment_image_id_40cffa18_fk_apka_imagemodel_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_comment
    ADD CONSTRAINT apka_comment_image_id_40cffa18_fk_apka_imagemodel_id FOREIGN KEY (image_id) REFERENCES public.apka_imagemodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apka_imagemodel apka_imagemodel_category_id_5089e94b_fk_apka_categorymodel_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.apka_imagemodel
    ADD CONSTRAINT apka_imagemodel_category_id_5089e94b_fk_apka_categorymodel_id FOREIGN KEY (category_id) REFERENCES public.apka_categorymodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

