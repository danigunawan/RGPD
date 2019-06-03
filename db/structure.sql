SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;





--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;






--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;





--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);






--
-- Name: choices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.choices (
    id bigint NOT NULL,
    user_id bigint,
    unsubscription_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    completed boolean DEFAULT false,
    specific boolean
);






--
-- Name: choices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.choices_id_seq OWNED BY public.choices.id;






--
-- Name: modifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modifications (
    id bigint NOT NULL,
    name character varying,
    surname character varying,
    string character varying,
    email character varying,
    phone character varying,
    address character varying,
    city character varying,
    zipcode character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);






--
-- Name: modifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: modifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modifications_id_seq OWNED BY public.modifications.id;





--
-- Name: officers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.officers (
    id bigint NOT NULL,
    firstname character varying,
    lastname character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    remember_digest character varying
);






--
-- Name: officers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.officers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: officers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.officers_id_seq OWNED BY public.officers.id;






--
-- Name: requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    title character varying,
    selected boolean
);






--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;






--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);






--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    secret character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying
);






--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;






--
-- Name: unsubscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unsubscriptions (
    id bigint NOT NULL,
    kind character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    reason_specific boolean
);






--
-- Name: unsubscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.unsubscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: unsubscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.unsubscriptions_id_seq OWNED BY public.unsubscriptions.id;






--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    surname character varying,
    email character varying,
    phone character varying,
    address character varying,
    city character varying,
    zipcode character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    unsubscription_id bigint,
    request_id bigint,
    archived boolean
);






--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;






--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.choices ALTER COLUMN id
SET DEFAULT nextval('public.choices_id_seq'::regclass);






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifications ALTER COLUMN id
SET DEFAULT nextval('public.modifications_id_seq'::regclass);






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.officers ALTER COLUMN id
SET DEFAULT nextval('public.officers_id_seq'::regclass);






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests ALTER COLUMN id
SET DEFAULT nextval('public.requests_id_seq'::regclass);






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id
SET DEFAULT nextval('public.tokens_id_seq'::regclass);






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unsubscriptions ALTER COLUMN id
SET DEFAULT nextval('public.unsubscriptions_id_seq'::regclass);






--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id
SET DEFAULT nextval('public.users_id_seq'::regclass);






--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);






--
-- Name: choices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT choices_pkey PRIMARY KEY (id);





--
-- Name: modifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifications
    ADD CONSTRAINT modifications_pkey PRIMARY KEY (id);





--
-- Name: officers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.officers
    ADD CONSTRAINT officers_pkey PRIMARY KEY (id);






--
-- Name: requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);






--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);






--
-- Name: tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);







--
-- Name: unsubscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unsubscriptions
    ADD CONSTRAINT unsubscriptions_pkey PRIMARY KEY (id);







--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);







--
-- Name: index_choices_on_unsubscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_choices_on_unsubscription_id
ON public.choices
USING btree (unsubscription_id);







--
-- Name: index_choices_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_choices_on_user_id
ON public.choices
USING btree (user_id);






--
-- Name: index_modifications_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_modifications_on_user_id
ON public.modifications
USING btree (user_id);





--
-- Name: index_officers_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_officers_on_email
ON public.officers
USING btree (email);








--
-- Name: index_unsubscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_unsubscriptions_on_user_id
ON public.unsubscriptions
USING btree (user_id);








--
-- Name: index_users_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_request_id
ON public.users
USING btree (request_id);








--
-- Name: index_users_on_unsubscription_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_unsubscription_id
ON public.users
USING btree (unsubscription_id);








--
-- Name: fk_rails_138b4f93cd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT fk_rails_138b4f93cd
    FOREIGN KEY (user_id)
    REFERENCES public.users(id);





--
-- Name: fk_rails_27767b95cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_27767b95cc
    FOREIGN KEY (request_id)
    REFERENCES public.requests(id);





--
-- Name: fk_rails_64277d03f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.choices
    ADD CONSTRAINT fk_rails_64277d03f1
    FOREIGN KEY (unsubscription_id)
    REFERENCES public.unsubscriptions(id);





--
-- Name: fk_rails_bafcccfdbe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unsubscriptions
    ADD CONSTRAINT fk_rails_bafcccfdbe
    FOREIGN KEY (user_id)
    REFERENCES public.users(id);





--
-- Name: fk_rails_c409534eed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modifications
    ADD CONSTRAINT fk_rails_c409534eed
    FOREIGN KEY (user_id)
    REFERENCES public.users(id);





--
-- Name: fk_rails_d0fd6f84ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_d0fd6f84ac
    FOREIGN KEY (unsubscription_id)
    REFERENCES public.unsubscriptions(id);








CREATE VIEW unsubscriptions_kinds
AS SELECT kind
FROM unsubscriptions
GROUP BY kind
ORDER by kind ASC;








CREATE VIEW unsubscriptions_reason_specific
AS SELECT reason_specific
FROM unsubscriptions
GROUP BY reason_specific
ORDER by reason_specific ASC;








--
-- LIST OF USERS EMAILS
--



CREATE VIEW users_emails
AS SELECT email
FROM users
GROUP BY email
ORDER BY email ASC;





--
-- LIST OF USERS ZIPCODES
--


CREATE VIEW users_zipcodes
AS SELECT zipcode
FROM users
GROUP BY zipcode
ORDER BY zipcode ASC;






--
-- LIST OF USER CITIES ORDERED ALPHABETICALLY
--


CREATE VIEW users_cities
AS SELECT city
FROM users
GROUP BY city
ORDER BY city ASC;





--
-- ARCHIVED USERS WITH ALL INFO
--



CREATE VIEW archived_users
AS SELECT name,
surname,
email,
phone,
address,
city,
zipcode
FROM users
WHERE archived = 1;








--
-- OFFICERS WITHOUT PHONES
--


CREATE VIEW users_without_phones
AS SELECT name,
surname,
email,
address,
city,
zipcode
FROM users
WHERE phone = NULL;





--
-- ALL OFFICERS
--



CREATE VIEW officers_index
AS SELECT firstname,
lastname,
email
FROM officers
GROUP BY lastname
ORDER BY lastname ASC;







--
-- LIST ALL USERS AND THEIR MODIFICATIONS
--



CREATE VIEW users_modifications
AS SELECT *
FROM users
INNER JOIN modifications
ON users.id = modifications.user_id;









--
-- List  chosen Users choices
--

CREATE VIEW user_choices
AS SELECT UN.kind
FROM unsubscriptions UN
INNER JOIN choices CH
ON UN.user_id = CH.user_id
INNER JOIN users US
ON UN.user_id = US.id
GROUP BY UN.kind
ORDER BY UN.kind ASC;










--
-- LIST ALL REQUESTS ORDERED ALPHABETICALLY
--


CREATE VIEW requests_index
AS SELECT title
FROM requests
GROUP BY title
ORDER BY title ASC;







--
-- List Emails and secrets from tokens
--

CREATE VIEW secrets_and_emails
AS SELECT secret,
email
FROM tokens
GROUP BY secret
ORDER BY secret DESC;









--
-- Sorts users by creation date
--



CREATE VIEW most_recent_users
AS SELECT name,
surname,
email,
phone,
address,
city,
zipcode,
created_at
FROM users
GROUP BY created_at
ORDER BY created_at ASC;






--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version)
VALUES
('20181114151531'),
('20181114151532'),
('20181114154557'),
('20181116090826'),
('20181116090924'),
('20181121105456'),
('20181212113239'),
('20181213100819'),
('20181213210449'),
('20181214155842'),
('20181217165010'),
('20181217213904'),
('20181218160912'),
('20181218201740'),
('20181218210826'),
('20181114151532'),
('20181114154557'),
('20181214155842'),
('20181224142248'),
('20190102141018'),
('20190104143549'),
('20190112161534');
