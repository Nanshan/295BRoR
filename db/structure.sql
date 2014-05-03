--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: histories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE histories (
    id integer NOT NULL,
    "userId" character varying(255),
    "like" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "placeID" integer
);


--
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE histories_id_seq OWNED BY histories.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    latitude numeric(15,10),
    longitude numeric(15,10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "userID" character varying(255)
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "locationType" character varying(255),
    category character varying(255),
    name character varying(255),
    address character varying(255),
    address2 character varying(255),
    city character varying(255),
    state character varying(255),
    zip integer,
    country character varying(255),
    phone character varying(255),
    price integer,
    rating numeric,
    review text,
    latitude numeric(15,10),
    longitude numeric(15,10),
    bbq boolean,
    sport boolean,
    restrooms boolean,
    website character varying(255),
    "yelpId" character varying(255)
);


--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    "userId" character varying(255),
    first_name character varying(255),
    middle_initial character varying(255),
    last_name character varying(255),
    date_of_birth date,
    gender character varying(255),
    phone character varying(255),
    email character varying(255),
    marital_status character varying(255),
    current_location character varying(255),
    hometown_city character varying(255),
    hometown_state character varying(255),
    hometown_country character varying(255),
    education_level character varying(255),
    profession character varying(255),
    employer character varying(255),
    past_employer_1 character varying(255),
    has_kids character varying(255),
    number_of_kids character varying(255),
    number_of_tweets character varying(255),
    number_of_followers character varying(255)
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: similarities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE similarities (
    id integer NOT NULL,
    user1_id integer NOT NULL,
    user2_id integer NOT NULL,
    similarity numeric
);


--
-- Name: similarities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE similarities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: similarities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE similarities_id_seq OWNED BY similarities.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    "userName" character varying(255),
    email character varying(255),
    password character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY histories ALTER COLUMN id SET DEFAULT nextval('histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY similarities ALTER COLUMN id SET DEFAULT nextval('similarities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: similarities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY similarities
    ADD CONSTRAINT similarities_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_on_places_location; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_on_places_location ON places USING gist (st_geographyfromtext((((('SRID=4326;POINT('::text || longitude) || ' '::text) || latitude) || ')'::text)));


--
-- Name: index_similarities_on_user1_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_similarities_on_user1_id ON similarities USING btree (user1_id);


--
-- Name: index_similarities_on_user2_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_similarities_on_user2_id ON similarities USING btree (user2_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140209032238');

INSERT INTO schema_migrations (version) VALUES ('20140213190649');

INSERT INTO schema_migrations (version) VALUES ('20140219034053');

INSERT INTO schema_migrations (version) VALUES ('20140222175522');

INSERT INTO schema_migrations (version) VALUES ('20140227045006');

INSERT INTO schema_migrations (version) VALUES ('20140301175104');

INSERT INTO schema_migrations (version) VALUES ('20140301184059');

INSERT INTO schema_migrations (version) VALUES ('20140306215658');

INSERT INTO schema_migrations (version) VALUES ('20140306220354');

INSERT INTO schema_migrations (version) VALUES ('20140306221026');

INSERT INTO schema_migrations (version) VALUES ('20140306222700');

INSERT INTO schema_migrations (version) VALUES ('20140307001348');

INSERT INTO schema_migrations (version) VALUES ('20140330193522');

INSERT INTO schema_migrations (version) VALUES ('20140330202535');

INSERT INTO schema_migrations (version) VALUES ('20140330202733');

INSERT INTO schema_migrations (version) VALUES ('20140408021356');

INSERT INTO schema_migrations (version) VALUES ('20140408022054');

INSERT INTO schema_migrations (version) VALUES ('20140408025228');

INSERT INTO schema_migrations (version) VALUES ('20140408025325');

INSERT INTO schema_migrations (version) VALUES ('20140408050212');

INSERT INTO schema_migrations (version) VALUES ('20140408050547');

INSERT INTO schema_migrations (version) VALUES ('20140412054307');

INSERT INTO schema_migrations (version) VALUES ('20140421003659');

INSERT INTO schema_migrations (version) VALUES ('20140421004137');

INSERT INTO schema_migrations (version) VALUES ('20140421011700');

INSERT INTO schema_migrations (version) VALUES ('20140421011910');

INSERT INTO schema_migrations (version) VALUES ('20140501061704');

INSERT INTO schema_migrations (version) VALUES ('20140501062654');

INSERT INTO schema_migrations (version) VALUES ('20140502050505');

INSERT INTO schema_migrations (version) VALUES ('20140502051028');

INSERT INTO schema_migrations (version) VALUES ('20140503194344');
