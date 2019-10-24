--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-24 12:29:51 -03

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

DROP DATABASE vlauth;
--
-- TOC entry 2473 (class 1262 OID 32142)
-- Name: vlauth; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE vlauth WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE vlauth OWNER TO postgres;

\connect vlauth

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

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 32190)
-- Name: oauth_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_users (
    username character varying(255) NOT NULL,
    password character varying(2000),
    first_name character varying(255),
    last_name character varying(255),
    avatar character varying,
    id integer NOT NULL
);


ALTER TABLE public.oauth_users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 40364)
-- Name: informacoes_usuario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.informacoes_usuario AS
 SELECT oauth_users.id,
    oauth_users.username,
    oauth_users.first_name,
    oauth_users.last_name,
    oauth_users.avatar
   FROM public.oauth_users;


ALTER TABLE public.informacoes_usuario OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 32143)
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    access_token character varying(40) NOT NULL,
    client_id character varying(80) NOT NULL,
    user_id character varying(255),
    expires timestamp(0) without time zone NOT NULL,
    scope character varying(2000)
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 32151)
-- Name: oauth_authorization_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_authorization_codes (
    authorization_code character varying(40) NOT NULL,
    client_id character varying(80) NOT NULL,
    user_id character varying(255),
    redirect_uri character varying(2000),
    expires timestamp(0) without time zone NOT NULL,
    scope character varying(2000),
    id_token character varying(2000)
);


ALTER TABLE public.oauth_authorization_codes OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 32159)
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    client_id character varying(80) NOT NULL,
    client_secret character varying(80) NOT NULL,
    redirect_uri character varying(2000) NOT NULL,
    grant_types character varying(80),
    scope character varying(2000),
    user_id character varying(255)
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 32167)
-- Name: oauth_jwt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_jwt (
    client_id character varying(80) NOT NULL,
    subject character varying(80),
    public_key character varying(2000)
);


ALTER TABLE public.oauth_jwt OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 32175)
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_tokens (
    refresh_token character varying(40) NOT NULL,
    client_id character varying(80) NOT NULL,
    user_id character varying(255),
    expires timestamp(0) without time zone NOT NULL,
    scope character varying(2000)
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 32183)
-- Name: oauth_scopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_scopes (
    type character varying(255) DEFAULT 'supported'::character varying NOT NULL,
    scope character varying(2000),
    client_id character varying(80),
    is_default smallint
);


ALTER TABLE public.oauth_scopes OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 40346)
-- Name: oauth_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_users_id_seq OWNER TO postgres;

--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 203
-- Name: oauth_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_users_id_seq OWNED BY public.oauth_users.id;


--
-- TOC entry 2325 (class 2604 OID 40348)
-- Name: oauth_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_users ALTER COLUMN id SET DEFAULT nextval('public.oauth_users_id_seq'::regclass);


--
-- TOC entry 2460 (class 0 OID 32143)
-- Dependencies: 196
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('bea37b554e0bb814c2ef28f0248b6e1a930d3645', 'portal', 'oberdan', '2019-10-18 09:05:50', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('f2021a75de0017bea8fb3e34844a868c7cd17666', 'portal', 'oberdan', '2019-10-18 10:24:32', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('da2173b2163742f0bc09ab238c57130059b585ae', 'portal', 'oberdan', '2019-10-18 10:33:11', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('bc0f40f45427bcdeb5556c7783aebcb09b19f0bd', 'portal', 'oberdan', '2019-10-18 13:17:44', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('8dfa0e39d3b69c6f45237a1988d16273c2cf7d98', 'portal', 'oberdan', '2019-10-18 13:19:23', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b78ce77c1ddb5bf477bd9383d99837c769464347', 'portal', 'oberdan', '2019-10-18 13:20:08', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('e6d29f8b1a5c1b00eacaf67e0e457a093cabef40', 'portal', 'oberdan', '2019-10-18 13:25:33', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('8dc943736e2317e323f8a910d43a82cd60ccb445', 'portal', 'oberdan', '2019-10-18 13:52:41', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('884748f0ba5983b2c4d756e445daf10c86b98c5c', 'portal', 'oberdan', '2019-10-18 15:14:22', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('4a3a63b91d3e7ffd035a6236655b58d43bbc660c', 'portal', 'oberdan', '2019-10-18 15:22:58', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('176bb11ceb402d3efb7e754dc32e627186e12c2d', 'portal', 'oberdan', '2019-10-18 15:25:46', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('47196d7c8bf67c58a0937ec22d029e3fb31f0912', 'portal', 'oberdan', '2019-10-18 15:28:06', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('161146f7b784d3fedde65c43795b642a5db335ef', 'portal', 'oberdan', '2019-10-18 15:30:03', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('a6427d511185169a0b60f3901007cf91375a74fe', 'portal', 'oberdan', '2019-10-18 15:41:42', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b0a804a68bd45710ba80e51c780bfee8409b24ae', 'portal', 'oberdan', '2019-10-18 15:43:17', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('797a2daa1d990fc67d2714e26c9d998bfaeffba5', 'portal', 'oberdan', '2019-10-18 15:44:24', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('6fe2574518d0fb46e7464263a5c6421c7f303eaa', 'portal', 'oberdan', '2019-10-18 15:46:18', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('2240b71838ce27977abd1c22e8af17d5febf00db', 'portal', 'oberdan', '2019-10-18 15:47:46', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b23345c9b4a30a8c5b9c7e0ee7988d521b2b8999', 'portal', 'oberdan', '2019-10-18 15:51:53', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('6911c3d7b9f6b4c592fea0b7cdc676f40e237a9f', 'portal', 'oberdan', '2019-10-18 15:54:13', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b23a20e90e62e5133c702829fdfb3186b0404ebf', 'portal', 'oberdan', '2019-10-18 16:04:22', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('0154775fcd794324ebe1c4c13cd2d8229cc1ab30', 'portal', 'oberdan', '2019-10-18 19:16:37', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('c71aaff041d47f21173ff560c955b0b24ca7d574', 'portal', 'oberdan', '2019-10-18 19:27:37', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('04905a587f2f82bfd2d134c4f9172f3cdf143118', 'portal', 'oberdan', '2019-10-18 19:29:01', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('cb0d67390ba7e36b3a69c7b6385acc9b22415ba4', 'portal', 'oberdan', '2019-10-18 19:37:22', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('e3d60eb9b3cc283784f9347c8aa42113b1926e85', 'portal', 'oberdan', '2019-10-18 19:45:33', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('1cc2bba6f73a670d6c758576495ac9dd5527f77a', 'portal', 'oberdan', '2019-10-18 19:47:29', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('71eb6a00f1c7123c6dd66ad67c08593eef82f9a8', 'portal', 'oberdan', '2019-10-19 04:34:48', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('6a804d8528f26021490c09dfb71b31ab064aa2ca', 'portal', 'oberdan', '2019-10-19 04:47:24', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('cd5efafbd465e9c80d2b9addb2e035e50b186500', 'portal', 'oberdan', '2019-10-19 04:48:46', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('8f6d9f1aaea68a94f4b53c3fc5dc22797157cc84', 'portal', 'oberdan', '2019-10-19 04:51:07', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('678bfb471ff54c382a568b9ac38d5979976fb9d0', 'portal', 'oberdan', '2019-10-19 04:52:45', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('57fb3d5f79a408ceda7ac0098aded61efaf2c465', 'portal', 'oberdan', '2019-10-19 04:54:31', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('4b7bebb2b4d5334c2b92912415c9b2baf9816409', 'portal', 'oberdan', '2019-10-19 05:09:46', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b8da701ba75b5208cfbc829bced88098908f0a74', 'portal', 'oberdan', '2019-10-19 06:01:13', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('2d89ec1da5091695dae4c99ab593715849af8416', 'portal', 'oberdan', '2019-10-19 06:14:14', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b29e8873a4ba9a470cd26a9847c374341a83c7ff', 'portal', 'oberdan', '2019-10-19 06:17:04', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('44cdbe833b4dfacd5a5e05722aa8afdc9d9546a6', 'portal', 'oberdan', '2019-10-19 06:19:16', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('e6b92df8bb17853853ef415dc5000eb63de8943a', 'portal', 'oberdan', '2019-10-19 06:20:42', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('2d925eb5c91414061e32116c8c27a8b6ff27aab0', 'portal', 'oberdan', '2019-10-19 06:22:07', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('0b38818a416aa8cd299af10a63dda64afbf7dc83', 'portal', 'oberdan', '2019-10-19 10:00:16', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('613581f51465373f90a71e787f5e1c4c978152bb', 'portal', 'oberdan', '2019-10-19 10:02:33', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('ec7caece89598114d5712d5a978496262dc85fb5', 'portal', 'oberdan', '2019-10-19 10:03:28', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('a4bbe0cc8bef80f6ba976e7cadd08cfac6a9d0eb', 'portal', 'oberdan', '2019-10-19 10:05:07', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('46bbf27f327f983e8bb3a6c4bb1c74dbde24ff62', 'portal', 'oberdan', '2019-10-19 10:06:25', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('46667490c597a5f9d1888a82252de62da55d8a54', 'portal', 'oberdan@craos.net', '2019-10-19 10:10:14', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('f75900b96dbc7974afa75b81b552f151a8f7242e', 'portal', 'oberdan@craos.net', '2019-10-19 10:54:32', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('13cc5f664893e81cbb171837f46c5aa941a2f428', 'portal', 'oberdan@craos.net', '2019-10-19 16:19:48', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('a0b132d44c33f860fecb16bc1fbd9773dee881ac', 'portal', 'oberdan@craos.net', '2019-10-19 16:22:20', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('6258d50d4eb5fd99e35e31582eeb067d4eb7f091', 'portal', 'oberdan@craos.net', '2019-10-19 16:25:06', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('3ec2a8f98207e09fb8f847dabf1ecb5a07e060eb', 'portal', 'oberdan@craos.net', '2019-10-19 16:28:08', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('6ff8a1b56dd4509d4440b1273a2489c3c82c329f', 'portal', 'oberdan@craos.net', '2019-10-19 17:03:22', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('8f836c63fc87c5dc03fc2c3759f9e130e1c73a31', 'portal', 'oberdan@craos.net', '2019-10-19 17:06:23', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('ab09e6415caef500d3e4116e3fb5b805022996c7', 'portal', 'oberdan@craos.net', '2019-10-19 17:09:10', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('7ef1f3b9c40d66b6923cf8b88418a7171a1103ca', 'portal', 'oberdan@craos.net', '2019-10-19 17:11:31', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('ad15b9d7ed2eb06d8c1152e091657508d0e8bcd3', 'portal', 'oberdan@craos.net', '2019-10-19 17:12:20', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('6061d1568444b1619c2a25aea6d3858e1de835df', 'portal', 'oberdan@craos.net', '2019-10-19 17:13:29', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('904570d581279ca4c15af2610614a53371300157', 'portal', 'oberdan@craos.net', '2019-10-19 17:14:22', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('36b85f08ca473945f47a7a697b5b2db1bc800bbc', 'portal', 'oberdan@craos.net', '2019-10-19 17:15:59', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('fb65d9942dd1209b15a9f5e2eef90d998b311c9d', 'portal', 'oberdan@craos.net', '2019-10-19 17:24:36', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('9597a7c7a05a91ee83ee26dcfeb1ce39418c0efe', 'portal', 'oberdan@craos.net', '2019-10-19 17:41:20', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('d85177e963485ff52314bea0207aa44a84c75ecb', 'portal', 'oberdan@craos.net', '2019-10-19 17:55:43', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('8ce26f5047f25fa43631aa0872e6d588d2997724', 'portal', 'oberdan@craos.net', '2019-10-19 18:01:32', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('25f190b5c0bb02791b5ba3c40ae8c079b5b05090', 'portal', 'oberdan@craos.net', '2019-10-19 18:03:35', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('079119516e8a6ba96b53f5b28412f76348cadfd5', 'portal', 'oberdan@craos.net', '2019-10-19 18:05:10', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('3b8e2b5d623e732408e2871f1e2899f4e5bc176d', 'portal', 'oberdan@craos.net', '2019-10-20 14:25:27', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('effe32e645b6756137810fc790e8c3b235752930', 'portal', 'oberdan@craos.net', '2019-10-20 14:27:21', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('a84a69905870b5b2d45a646f46879729b0614b5e', 'portal', 'oberdan@craos.net', '2019-10-20 14:29:04', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('286d2198f2319c93eb725125625eee19fdfd18b0', 'portal', 'oberdan@craos.net', '2019-10-20 14:32:27', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('3b15c478e9b8399a38d3945185ebe0f6380343cd', 'portal', 'oberdan@craos.net', '2019-10-20 14:37:57', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('f6a1fbc1445c5a338395bd69789ceaf8b7246cef', 'portal', 'oberdan@craos.net', '2019-10-20 14:45:58', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('ead6f6fc225ff55ad6eb3c3871852e9e0a8253e4', 'portal', 'oberdan@craos.net', '2019-10-20 14:46:53', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('9cda862c05d5b5a12d33d1431d5456637222938e', 'portal', 'oberdan@craos.net', '2019-10-21 12:33:05', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('2b8c1582f4118b2d651be7ddc6bb150dbd00f22c', 'portal', 'oberdan@craos.net', '2019-10-21 12:38:31', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('aee67c1c931f5637c963e544045eaaf43119e2d7', 'portal', 'oberdan@craos.net', '2019-10-21 12:45:57', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('91e5654bb99ceb2c146c471fbb15d65e453d6456', 'portal', 'oberdan@craos.net', '2019-10-21 12:54:40', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('ed1df0bad91818593599dbfa7f90f39c4e6d756a', 'portal', 'oberdan@craos.net', '2019-10-21 14:26:02', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('db0444e2d0b9095438ec1ab71db659862719b200', 'portal', 'oberdan@craos.net', '2019-10-21 14:27:20', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('0436a4b1976318d2f04de88626a17d25c216cc05', 'portal', 'oberdan@craos.net', '2019-10-21 14:28:35', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('b70871f00aff27bfbee466eefed57b46924d5253', 'portal', 'oberdan@craos.net', '2019-10-21 14:37:41', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('411a58d002e9c8dcee7b7cc7d3295fdc9d13f8f4', 'portal', 'oberdan@craos.net', '2019-10-21 14:51:17', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('282ac4071adc69f289b7852d2cf584cd112c0483', 'portal', 'oberdan@craos.net', '2019-10-21 14:54:03', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('eeae83ffecd0457eabe669d063e01132cfeb8fca', 'portal', 'oberdan@craos.net', '2019-10-21 15:18:40', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('3f70b40b56925fab79fb721242af2f173357d0f1', 'portal', 'oberdan@craos.net', '2019-10-21 15:22:19', NULL);
INSERT INTO public.oauth_access_tokens (access_token, client_id, user_id, expires, scope) VALUES ('21da51abe1dd66e0827c5facbba73b2aa62268e7', 'portal', 'oberdan@craos.net', '2019-10-21 15:33:48', NULL);


--
-- TOC entry 2461 (class 0 OID 32151)
-- Dependencies: 197
-- Data for Name: oauth_authorization_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oauth_authorization_codes (authorization_code, client_id, user_id, redirect_uri, expires, scope, id_token) VALUES ('b9376d7444a9673ec1910b0c953c1af2d9d02a26', 'portal', NULL, NULL, '2019-10-18 07:43:12', NULL, NULL);


--
-- TOC entry 2462 (class 0 OID 32159)
-- Dependencies: 198
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oauth_clients (client_id, client_secret, redirect_uri, grant_types, scope, user_id) VALUES ('portal', '$2y$10$fTj4N.Z0wfBWPB9DLNuvcOfsc06OXY3pFKgEIFqg5KFuWUdoKxDcS', 'http://localhost/liteapi/testes/oauth2/passo2.php', NULL, NULL, NULL);


--
-- TOC entry 2463 (class 0 OID 32167)
-- Dependencies: 199
-- Data for Name: oauth_jwt; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2464 (class 0 OID 32175)
-- Dependencies: 200
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('fb1f983dae008afb9336df029ffaf07fbb9e660f', 'portal', 'oberdan', '2019-11-01 08:05:50', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('28e67be1e981e75c6892b6f5efa722d0f5afdb04', 'portal', 'oberdan', '2019-11-01 09:24:32', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d495b9fe4ecfc5cf453b8b8b87ccac6f43a934dd', 'portal', 'oberdan', '2019-11-01 09:33:11', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('68463e33615b7ccc522bc011cd86db0d79583b87', 'portal', 'oberdan', '2019-11-01 12:17:44', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('dfd1e5487ad726f2ea393d875b9d923b63cb74f1', 'portal', 'oberdan', '2019-11-01 12:19:23', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('f819bf1cf35e915c9e830ee3bcb56fd3062e37be', 'portal', 'oberdan', '2019-11-01 12:20:08', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('5a0cf2b99b37f5de194450dc101ef93c2d81ec30', 'portal', 'oberdan', '2019-11-01 12:25:33', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('44d59856b639c0adb85a52507a5c078bbfd0e012', 'portal', 'oberdan', '2019-11-01 12:52:41', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('30439a6beeec9f837175adc72aadfdc24bc9e220', 'portal', 'oberdan', '2019-11-01 14:14:22', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d03ed6b06d95c6fcf460171a92d4e89c6597f860', 'portal', 'oberdan', '2019-11-01 14:22:58', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('6bb19419cef44d1c8fc0504569d7ad55a46c10ae', 'portal', 'oberdan', '2019-11-01 14:25:46', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('7815e71d26f722e7aaf57a806bda2e6be9f20538', 'portal', 'oberdan', '2019-11-01 14:28:06', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('554d49163541a461fa69d4af8e9cf68beba9913d', 'portal', 'oberdan', '2019-11-01 14:30:03', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('e805d8a9e2919841269da2a05e75611f956cf984', 'portal', 'oberdan', '2019-11-01 14:41:42', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('af3722b7dba4038c83e7f83b8b13f2768b52010d', 'portal', 'oberdan', '2019-11-01 14:43:17', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('59416bd02badfe6359e608639718aef18bb98261', 'portal', 'oberdan', '2019-11-01 14:44:24', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('dbe9d5274f87024677d0d6d1428764b9459a41b5', 'portal', 'oberdan', '2019-11-01 14:46:18', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('ebda6cbc4845aad85a370031da6e77ea51725703', 'portal', 'oberdan', '2019-11-01 14:47:46', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('cba9768db9e2618db2a9fa2c925bfceb50701847', 'portal', 'oberdan', '2019-11-01 14:51:53', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('fd62faf2e56c3de051609a644299d5a4faf553fe', 'portal', 'oberdan', '2019-11-01 14:54:13', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('1d3b3bee7e65115ef82beada3aabe3aa0d2aa334', 'portal', 'oberdan', '2019-11-01 15:04:22', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('bc6432bbcb9c2cb237e5958c2318d9ccadfa8001', 'portal', 'oberdan', '2019-11-01 18:16:37', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('38772f2422c84c72903c263ae4bbc2d1f2f5ba10', 'portal', 'oberdan', '2019-11-01 18:27:37', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('b20d57b975eb833f4a34fd96cb01a7ceedebfabc', 'portal', 'oberdan', '2019-11-01 18:29:01', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d8c8f45ad107c88c5059c09d98771911c9b47e7a', 'portal', 'oberdan', '2019-11-01 18:37:22', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('f5c66726022238b1861fb62b136ba3ed26074cc0', 'portal', 'oberdan', '2019-11-01 18:45:33', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('ae07b5a56613dff79dbb957d562463f44c15399c', 'portal', 'oberdan', '2019-11-01 18:47:29', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('c4dcf6175440abd64028d6a86969ce718c41526f', 'portal', 'oberdan', '2019-11-02 03:34:48', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('6c0f15096e7b859ce17a7e4423f39c023308c4f5', 'portal', 'oberdan', '2019-11-02 03:47:24', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d8717488c7f8472da814ef697993bba9318c1e52', 'portal', 'oberdan', '2019-11-02 03:48:46', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d7ae80e10108198c7448d17440b3a799d3740eeb', 'portal', 'oberdan', '2019-11-02 03:51:07', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('e07095bc9ee3887d108db319f9c215355f583225', 'portal', 'oberdan', '2019-11-02 03:52:45', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('64d8a4f50be6158e74704bd58647bea605d15132', 'portal', 'oberdan', '2019-11-02 03:54:31', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('2019a0dd9feb2b6ee9e74e47e44948619df80ccd', 'portal', 'oberdan', '2019-11-02 04:09:46', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('05b773c585d94851b4943549b0b25d7f8e1318ff', 'portal', 'oberdan', '2019-11-02 05:01:13', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('128e6cba42e8e9a277ecf9f6a5f272f7547b99c7', 'portal', 'oberdan', '2019-11-02 05:14:14', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('7a87d6624aa1ba95cd4f4416611b30c428aa90ba', 'portal', 'oberdan', '2019-11-02 05:17:04', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('c1af5efd956c22adf93a44110d4fd6e605efae37', 'portal', 'oberdan', '2019-11-02 05:19:16', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('5059b9d6f0cecc0fefce6b1146c0685d512603be', 'portal', 'oberdan', '2019-11-02 05:20:42', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('f79e9d54a1fd26355df847929c1c8d3d22339f8d', 'portal', 'oberdan', '2019-11-02 05:22:07', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('20c44e6044de4b55751bd95be6faff3dd1b0adb0', 'portal', 'oberdan', '2019-11-02 09:00:16', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('7e813952270c6e10fa227e2adfabd6de91ca612e', 'portal', 'oberdan', '2019-11-02 09:02:33', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('1455d3f7404695cae54e782d3ff7273e5061773a', 'portal', 'oberdan', '2019-11-02 09:03:28', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('0596f21b693a9d50f5bd2f8455596a23a9a9dac9', 'portal', 'oberdan', '2019-11-02 09:05:07', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('ef1ba3d17a9592aab17bafdc8c8af4ca7bcd9be5', 'portal', 'oberdan', '2019-11-02 09:06:25', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('bed955f281f4b9ce16be22bbc47c33df8e5dee3b', 'portal', 'oberdan@craos.net', '2019-11-02 09:10:14', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('eba0b466739ec7cd45b0489cae5923aa2edfc251', 'portal', 'oberdan@craos.net', '2019-11-02 09:54:32', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('26e8390adadbd611c2ecf338630ff1a999eb5fa9', 'portal', 'oberdan@craos.net', '2019-11-02 15:19:48', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('6282014d7195daf366547568a6edf5e5895f0cda', 'portal', 'oberdan@craos.net', '2019-11-02 15:22:20', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('362d5751be1fc91490c738b442d70a1249c37285', 'portal', 'oberdan@craos.net', '2019-11-02 15:25:06', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('47b4b8b0dbac2543f98ccfa3990d93f31cf4fa77', 'portal', 'oberdan@craos.net', '2019-11-02 15:28:08', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('2c78c772558543f90249295b29cfae00aa0dfa84', 'portal', 'oberdan@craos.net', '2019-11-02 16:03:22', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('bc2d1b85c7de91b58a3df40c3a0ac6fd57df852c', 'portal', 'oberdan@craos.net', '2019-11-02 16:06:23', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('1b4ae5de0db8b256da647df8dfda0b773a2808d3', 'portal', 'oberdan@craos.net', '2019-11-02 16:09:10', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('b4bc9211eecb581c7e38e49cf499390e19b269ed', 'portal', 'oberdan@craos.net', '2019-11-02 16:11:31', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('686ba0c15209abcebb3b2cabaf7389100b7a8462', 'portal', 'oberdan@craos.net', '2019-11-02 16:12:20', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('b538726a99fd464397adea81fcf1232b741af2f1', 'portal', 'oberdan@craos.net', '2019-11-02 16:13:29', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('45ff89483e0c37ef64f95affc777478e0ad3e10a', 'portal', 'oberdan@craos.net', '2019-11-02 16:14:22', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('697b083f91409eea32822065d39e4fcccd8ace1b', 'portal', 'oberdan@craos.net', '2019-11-02 16:15:59', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('36bf9453b38de2122f26d9c11a7418ffb19b31d0', 'portal', 'oberdan@craos.net', '2019-11-02 16:24:36', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('663bcfd967e2918ca3c094d9a955daeec4d8f29e', 'portal', 'oberdan@craos.net', '2019-11-02 16:41:20', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('541ab1454ec98800e4bdaf3e3129dfd78c9c6421', 'portal', 'oberdan@craos.net', '2019-11-02 16:55:43', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('df3a386c1ce058b1db62848f9abae1393e3f6423', 'portal', 'oberdan@craos.net', '2019-11-02 17:01:32', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('c533b68a99df978828ee57e38872b494524c8ccb', 'portal', 'oberdan@craos.net', '2019-11-02 17:03:35', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d942f8f3f5bfd89e9dc79fa26eed32a886063335', 'portal', 'oberdan@craos.net', '2019-11-02 17:05:10', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('9b2f7fcd666a559cfee2dbcf6eb93ba3d75d023f', 'portal', 'oberdan@craos.net', '2019-11-03 12:25:27', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('93a05875147c2716d5199eb1da723c7140c0a700', 'portal', 'oberdan@craos.net', '2019-11-03 12:27:21', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('9ec2449ad9408533f91ad8d2e6f9e1e4b50c37f0', 'portal', 'oberdan@craos.net', '2019-11-03 12:29:04', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('86e4a43670224c0f20fe492334861c25e3220fd1', 'portal', 'oberdan@craos.net', '2019-11-03 12:32:27', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('f69220081f158dc3caaada3d12f84a05725735de', 'portal', 'oberdan@craos.net', '2019-11-03 12:37:57', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('dcf4faf3b704d93f64fef293e80718b0a21a4294', 'portal', 'oberdan@craos.net', '2019-11-03 12:45:58', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('17ac5cb3876bef2d8b6ad78ef4eea12381e091c7', 'portal', 'oberdan@craos.net', '2019-11-03 12:46:53', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('acdf8306d1af8057d735cbd157e841f645e34d39', 'portal', 'oberdan@craos.net', '2019-11-04 10:33:05', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('01677c9edb63c644329afd5fcbb0a030d272d774', 'portal', 'oberdan@craos.net', '2019-11-04 10:38:31', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('5b0d9eb853f6ee71c57104d67ead0c8cf864d39d', 'portal', 'oberdan@craos.net', '2019-11-04 10:45:57', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('a815eba6e867cad03f37a635e2078db28b3f6d7d', 'portal', 'oberdan@craos.net', '2019-11-04 10:54:40', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('953a07979e1cd3aeb5fba4c4ace719adf634c495', 'portal', 'oberdan@craos.net', '2019-11-04 12:26:02', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('5fea170c49a65b4a4687847dd2ca2ef48afa27f2', 'portal', 'oberdan@craos.net', '2019-11-04 12:27:20', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('dc2abb840bf5137e26947f76e8cafb9b192bb8f8', 'portal', 'oberdan@craos.net', '2019-11-04 12:28:35', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('a222e2dd01b918daa35d91e113e5793f2216e449', 'portal', 'oberdan@craos.net', '2019-11-04 12:37:41', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('d90b6132a4fb3c8fa389aeba08b86158d89c35ea', 'portal', 'oberdan@craos.net', '2019-11-04 12:51:17', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('98c70490380dade594fe7672a7564d9bfde061d1', 'portal', 'oberdan@craos.net', '2019-11-04 12:54:03', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('1b3430144b7fb83073613b4cc578e2019dd2a120', 'portal', 'oberdan@craos.net', '2019-11-04 13:18:40', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('1c793d1b6c402138ec34a9ca521e1534035dcd52', 'portal', 'oberdan@craos.net', '2019-11-04 13:22:19', NULL);
INSERT INTO public.oauth_refresh_tokens (refresh_token, client_id, user_id, expires, scope) VALUES ('6bf4076badf3a00bc10a0c9c18906357f27d680b', 'portal', 'oberdan@craos.net', '2019-11-04 13:33:48', NULL);


--
-- TOC entry 2465 (class 0 OID 32183)
-- Dependencies: 201
-- Data for Name: oauth_scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2466 (class 0 OID 32190)
-- Dependencies: 202
-- Data for Name: oauth_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oauth_users (username, password, first_name, last_name, avatar, id) VALUES ('oberdan@craos.net', '$2y$10$UrTkEIdLjYKnibrUzd0loOcRXp.u4/QmtOkB5LulkUSwu3Z5Bk5Jq', 'Oberdan', 'Brito de Jesus', '/liteapi/services/auth/storage/avatar/oberdan@craos.net.jpg', 1);


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 203
-- Name: oauth_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_users_id_seq', 2, true);


--
-- TOC entry 2327 (class 2606 OID 32150)
-- Name: oauth_access_tokens access_token_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT access_token_pk PRIMARY KEY (access_token);


--
-- TOC entry 2329 (class 2606 OID 32158)
-- Name: oauth_authorization_codes auth_code_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_authorization_codes
    ADD CONSTRAINT auth_code_pk PRIMARY KEY (authorization_code);


--
-- TOC entry 2331 (class 2606 OID 32166)
-- Name: oauth_clients clients_client_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT clients_client_id_pk PRIMARY KEY (client_id);


--
-- TOC entry 2333 (class 2606 OID 32174)
-- Name: oauth_jwt jwt_client_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_jwt
    ADD CONSTRAINT jwt_client_id_pk PRIMARY KEY (client_id);


--
-- TOC entry 2335 (class 2606 OID 32182)
-- Name: oauth_refresh_tokens refresh_token_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT refresh_token_pk PRIMARY KEY (refresh_token);


--
-- TOC entry 2337 (class 2606 OID 32197)
-- Name: oauth_users username_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_users
    ADD CONSTRAINT username_pk PRIMARY KEY (username);


-- Completed on 2019-10-24 12:29:52 -03

--
-- PostgreSQL database dump complete
--

