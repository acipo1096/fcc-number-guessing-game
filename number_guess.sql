--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (4, 'user_1723960798557', 2, 242);
INSERT INTO public.user_info VALUES (3, 'user_1723960798558', 5, 242);
INSERT INTO public.user_info VALUES (6, 'user_1723960828843', 2, 242);
INSERT INTO public.user_info VALUES (5, 'user_1723960828844', 5, 242);
INSERT INTO public.user_info VALUES (8, 'user_1723960885874', 2, 242);
INSERT INTO public.user_info VALUES (7, 'user_1723960885875', 5, 242);
INSERT INTO public.user_info VALUES (12, 'user_1723961059250', 2, 242);
INSERT INTO public.user_info VALUES (11, 'user_1723961059251', 5, 242);
INSERT INTO public.user_info VALUES (13, 'Porky', 2, 242);
INSERT INTO public.user_info VALUES (15, 'user_1723961169989', 2, 242);
INSERT INTO public.user_info VALUES (14, 'user_1723961169990', 5, 242);
INSERT INTO public.user_info VALUES (17, 'user_1723961253378', 2, 242);
INSERT INTO public.user_info VALUES (16, 'user_1723961253379', 5, 242);
INSERT INTO public.user_info VALUES (19, 'user_1723961309212', 2, 242);
INSERT INTO public.user_info VALUES (18, 'user_1723961309213', 5, 242);
INSERT INTO public.user_info VALUES (21, 'user_1723961430045', 2, 242);
INSERT INTO public.user_info VALUES (20, 'user_1723961430046', 5, 242);
INSERT INTO public.user_info VALUES (23, 'user_1723961446499', 2, 242);
INSERT INTO public.user_info VALUES (22, 'user_1723961446500', 5, 242);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 23, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

