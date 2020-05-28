--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: tylerbowerman
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO tylerbowerman;

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: tylerbowerman
--

CREATE TABLE public.recipes (
    id bigint NOT NULL,
    name character varying,
    ingredients character varying,
    instructions character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.recipes OWNER TO tylerbowerman;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: tylerbowerman
--

CREATE SEQUENCE public.recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO tylerbowerman;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tylerbowerman
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: recipes_tags; Type: TABLE; Schema: public; Owner: tylerbowerman
--

CREATE TABLE public.recipes_tags (
    recipe_id bigint,
    tag_id bigint
);


ALTER TABLE public.recipes_tags OWNER TO tylerbowerman;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tylerbowerman
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO tylerbowerman;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: tylerbowerman
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO tylerbowerman;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: tylerbowerman
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO tylerbowerman;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tylerbowerman
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: tylerbowerman
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: tylerbowerman
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: tylerbowerman
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-05-28 18:20:25.955864	2020-05-28 18:20:25.955864
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: tylerbowerman
--

COPY public.recipes (id, name, ingredients, instructions, created_at, updated_at) FROM stdin;
1	Cheesecake	\N	\N	2020-05-28 20:34:32.502326	2020-05-28 20:34:32.502326
\.


--
-- Data for Name: recipes_tags; Type: TABLE DATA; Schema: public; Owner: tylerbowerman
--

COPY public.recipes_tags (recipe_id, tag_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tylerbowerman
--

COPY public.schema_migrations (version) FROM stdin;
20200528181246
20200528182353
20200528183931
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: tylerbowerman
--

COPY public.tags (id, name, created_at, updated_at) FROM stdin;
1	dessert	2020-05-28 20:35:19.885546	2020-05-28 20:35:19.885546
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tylerbowerman
--

SELECT pg_catalog.setval('public.recipes_id_seq', 1, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tylerbowerman
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tylerbowerman
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: tylerbowerman
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tylerbowerman
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: tylerbowerman
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: index_recipes_tags_on_recipe_id; Type: INDEX; Schema: public; Owner: tylerbowerman
--

CREATE INDEX index_recipes_tags_on_recipe_id ON public.recipes_tags USING btree (recipe_id);


--
-- Name: index_recipes_tags_on_tag_id; Type: INDEX; Schema: public; Owner: tylerbowerman
--

CREATE INDEX index_recipes_tags_on_tag_id ON public.recipes_tags USING btree (tag_id);


--
-- PostgreSQL database dump complete
--

