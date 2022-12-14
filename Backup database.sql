--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.6

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    description text NOT NULL,
    price real NOT NULL,
    title text NOT NULL,
    date_time_of_created timestamp without time zone,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'books');
INSERT INTO public.category (id, name) VALUES (2, 'diffusers');
INSERT INTO public.category (id, name) VALUES (3, 'accessories');


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '3091fa88-fba7-4c45-830b-d9fe93b9f94b.img_20220306_084858_617.webp', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '85f69639-806d-49e3-bdd7-f351cbc412c9.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '077685cf-b371-467e-96bd-4a9a4e34168e.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, 'fba56f2f-c1ec-446d-be7d-fd9188c03e98.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '7349ef55-f895-4e4b-aa20-2721797d2474.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'b269521a-369f-4935-abf7-ad9ff7389e04.orgpicseditorblurbackground_20223169288670.webp', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '97515a43-8d0e-443b-892a-e18a361c287e.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '8565c288-d6b6-4e71-9e84-3ef36777fb5a.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '52556608-0db3-4614-a4f6-b577654df333.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '8c1235d6-1b89-485c-9567-0095bbf15e6d.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, 'cc6ac0ac-2697-47a9-88d4-ffd4046ffd71.???????????? ???????????? 2022-12-09 ?? 20.54.02.png', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '723c56af-e833-4735-bc0f-800d511c530a.dsc07769.webp', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, 'd2c10bcb-7232-4675-8c69-9d58d69c53a9.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '35b61974-2314-4e41-912c-56df2dc20536.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '0e75573c-03d0-4352-bb70-ccfaa1306432.', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '1e1e711d-e5e7-4142-b3ca-e80eb16a99ee.photo_2022-12-09_20-58-12.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '808755d6-ec79-4e81-bd67-53ddfc14d2ed.dsc07339.webp', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '93cd65d4-2839-4006-a28f-50f5f9e7d275.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '4802c608-e680-460c-a820-7b5f3c9ddca6.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, 'd8c15773-0efb-4a11-a72d-8f282c00c81c.', 5);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2022-12-09 21:08:35.347058', '2a96877b-4a3c-4fd6-96ff-722e85c87ef0', 4700, 1, 4, 1);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (3, 'admin', '$2a$10$3AMCL7u6CwDD3jYAPLmGjeo1PeqkHgWzqcc/zkiv1vkPUExcMZ1BS', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'user_test', '$2a$10$jrf2mUCKbZpu.YsPsBYBgesZs89oF5fNyBi3AA0WJJOe9r2/ywRMm', 'ROLE_USER');


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, description, price, title, date_time_of_created, category_id) VALUES (1, '??????????: ???????????????? ?????? ??????????????

?? ??????????????:
- 6 ?????????????? ???????????? ???????????? (??????????????, ??????????????????, ??????????????, ????????????????????, ????????????, ??????????)
- 60 ???????????????? ?????????????????? 2 ???? ?????? ??????????????
- ??????????????????????????: 40 ???????????????? ?????????????????? 2 ????
- ?????????????? "?????????? ????????????????????"', 4700, '??????????: ???????????????? ?????? ??????????????', '2022-12-09 20:40:23.149113', 3);
INSERT INTO public.product (id, description, price, title, date_time_of_created, category_id) VALUES (4, '?????????? ???????????????? ???????????????????????? AROMACUBE (??????????????)

Ceramic care AROMACUBE - ???????????????????????? ?? ?????????? ???????? ???????????????????????? ??????????????????????????, ?????????????????? ???????????????? ?????? ???? ???????????? ???????????????? ???????????? ?????????????? ??????????, ???? ?? ???????????????????????? ????????????????????????. ???????????????? ???????????????????????? ?????????????????? ?????????????????????????? ?????? ???????????????????? ?? ?????????????????????? ???????????????????????? ?????????? ?????????????? ?????????????? ?????????? ?? ????????????.

?????????????????????? ????????????????????????. ???????????????????????? ???????????????????????????? ?????????????????? ?????????????????? ?????????? ?????????? ?????????? ???????????????? ?????????? ?????????????????? ???????????????? ???????? ??????????????????. ???????????? ???????? ?????????????? ?????????? ???????????????? ?????????????????????????????? ?????????????????? ???????????????????? ?? ?????? ????????????????????????????, ?????????????? ???????????????? ???????????????????????? ?????? ?????????????????????? ?????????? ????????????????.

?????????????? ?????? ??????????. ???????????????? ?????????????? ???????? ?????? ?????????????????????????????? ???????????? ?????????????? ???????????????????? ???? ?????????????????????? Ceramic ???????? AROMACUBE ?? ???????????????????? ?????? ?? ?????????????? ??????????????. ???????????????? ??  ???????????????????????????????? ???????????????? ?? ????????????????, ???????????????????? ???????????? ???????????????????????? ?????????????????? ???????????????? ???? ????????????????.

?????? ???????????? - ???????? ??????????????. Ceramic ???????? AROMACUBE ???? ???????????????????????? ?????? ???? ?? ??????. ?????? ???? ???????? ???? ???? ?????????? ????????????. ???? ?????????????????????? ?????? ????????????, ???????????????? ??????????????????. ?????????? ????????, ?????? ?????????????????????????? ???????????????????? ?????????????????? ???????? ??????????????????, ???????????? ?????????????????????? ?????????? ????????????. ???????????????????????? ???????????????? ?????????????????? ?????? ???????????? ???????? ?? ?????????? ???????????????? ???????????????????? ?? ???????????????????? ???????????????? ????????????????.

???????????????????????? ????????????????????????. Ceramic ???????? AROMACUBE ?????????? ?????????? ???????????????????? ???????? ?? ?????????????? ??????????????, ?????????????? ???????????????????????? ?????? ?????????????? ?? ????????????????????. ?????????????????? ?????? ???????????????????? ??????????????????, ?????????????? ???????? ?? ??????????????????. ???????????????????????? ?????????????????????????? ?????????????? ???????????????? ?????????? ???????????????? ?? ???????????????????? ?????? ???????????????????? ????????.

?? ??????????????????: ?????????? ???????????????? + ??????????????????

????????????????????????: ???????????????????????? ???????????????? ?????? ???????????????????? ?????????????? ???????????? ???? ???????????? ???????????????????????? ????????????????????. ???????????????????????? ?????????????????? ?????????? ?? ????????????.', 2500, '?????????? ???????????????? ???????????????????????? AROMACUBE (??????????????)', NULL, 2);
INSERT INTO public.product (id, description, price, title, date_time_of_created, category_id) VALUES (5, '?????????? ???????????????? ???????????????????????? AROMACUBE (????????????)

Ceramic care AROMACUBE - ???????????????????????? ?? ?????????? ???????? ???????????????????????? ??????????????????????????, ?????????????????? ???????????????? ?????? ???? ???????????? ???????????????? ???????????? ?????????????? ??????????, ???? ?? ???????????????????????? ????????????????????????. ???????????????? ???????????????????????? ?????????????????? ?????????????????????????? ?????? ???????????????????? ?? ?????????????????????? ???????????????????????? ?????????? ?????????????? ?????????????? ?????????? ?? ????????????.

?????????????????????? ????????????????????????. ???????????????????????? ???????????????????????????? ?????????????????? ?????????????????? ?????????? ?????????? ?????????? ???????????????? ?????????? ?????????????????? ???????????????? ???????? ??????????????????. ???????????? ???????? ?????????????? ?????????? ???????????????? ?????????????????????????????? ?????????????????? ???????????????????? ?? ?????? ????????????????????????????, ?????????????? ???????????????? ???????????????????????? ?????? ?????????????????????? ?????????? ????????????????.

?????????????? ?????? ??????????. ???????????????? ?????????????? ???????? ?????? ?????????????????????????????? ???????????? ?????????????? ???????????????????? ???? ?????????????????????? Ceramic ???????? AROMACUBE ?? ???????????????????? ?????? ?? ?????????????? ??????????????. ???????????????? ??  ???????????????????????????????? ???????????????? ?? ????????????????, ???????????????????? ???????????? ???????????????????????? ?????????????????? ???????????????? ???? ????????????????.

?????? ???????????? - ???????? ??????????????. Ceramic ???????? AROMACUBE ???? ???????????????????????? ?????? ???? ?? ??????. ?????? ???? ???????? ???? ???? ?????????? ????????????. ???? ?????????????????????? ?????? ????????????, ???????????????? ??????????????????. ?????????? ????????, ?????? ?????????????????????????? ???????????????????? ?????????????????? ???????? ??????????????????, ???????????? ?????????????????????? ?????????? ????????????. ???????????????????????? ???????????????? ?????????????????? ?????? ???????????? ???????? ?? ?????????? ???????????????? ???????????????????? ?? ???????????????????? ???????????????? ????????????????.

???????????????????????? ????????????????????????. Ceramic ???????? AROMACUBE ?????????? ?????????? ???????????????????? ???????? ?? ?????????????? ??????????????, ?????????????? ???????????????????????? ?????? ?????????????? ?? ????????????????????. ?????????????????? ?????? ???????????????????? ??????????????????, ?????????????? ???????? ?? ??????????????????. ???????????????????????? ?????????????????????????? ?????????????? ???????????????? ?????????? ???????????????? ?? ???????????????????? ?????? ???????????????????? ????????.

?? ??????????????????: ?????????? ???????????????? + ??????????????????

????????????????????????: ???????????????????????? ???????????????? ?????? ???????????????????? ?????????????? ???????????? ???? ???????????? ???????????????????????? ????????????????????. ???????????????????????? ?????????????????? ?????????? ?? ????????????.
', 2700, '?????????? ???????????????? ???????????????????????? AROMACUBE (????????????)', '2022-12-09 21:02:40.679594', 2);
INSERT INTO public.product (id, description, price, title, date_time_of_created, category_id) VALUES (2, '?????????????????? ???? 4?? ???????? "?????????????? ????????????????" + ??????????????

?????????????????????? ?????????????????? ???????? ???? ?????????????? ????????????.
?????????????????? ?????????????? ?????? ????????????????, ?????????????????????? ?? ?????????????? ??????????.

?? ?????????????????? ?????? ???????? ?????????? ???????????????????? ??????????, ?????????????? ???????????????? ???????????? ?????????? ?????????? ???? ?????????? ????????.
1. ?????????????? ?????????? - ?????? ????????????
2. ???????????? ?? ?????????????? ?????????? + ???????????? ????????????
3. ?????????????? ???????????? ???? ?? ???? ??
4. ???????????? ???????????????? "???????????????? ????????????" + ????????????????

??, ?????????????? ????, ???????????? ?? ???????????????? ?????????????? - ???????????????????? ?????? ?????????????? ??????????!
???? ???? ?????????? ?????????????????????????? ???????????????????? ????????, ???? ???? ???????????? ???????????????? ?????????????????? ?? ???????????????????????? ?? ???????????? (??????????, ????????????, ??????????, ?????????????? ?????? ?????????????????? ????????)', 6400, '?????????????????? ???? 4?? ???????? "?????????????? ????????????????" + ??????????????', '2022-12-09 21:04:27.543768', 1);


--
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_cart (id, person_id, product_id) VALUES (5, 4, 1);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 30, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 5, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 6, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--

