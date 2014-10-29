--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.5
-- Started on 2014-10-15 11:04:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 261 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 261
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16397)
-- Name: attachments; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30) DEFAULT NULL::character varying,
    filename character varying(255) DEFAULT ''::character varying NOT NULL,
    disk_filename character varying(255) DEFAULT ''::character varying NOT NULL,
    filesize integer DEFAULT 0 NOT NULL,
    content_type character varying(255) DEFAULT ''::character varying,
    digest character varying(40) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying(255),
    disk_directory character varying(255)
);


ALTER TABLE public.attachments OWNER TO redmine;

--
-- TOC entry 171 (class 1259 OID 16411)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO redmine;

--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 171
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- TOC entry 172 (class 1259 OID 16413)
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying(255),
    account_password character varying(255) DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter character varying(255),
    timeout integer
);


ALTER TABLE public.auth_sources OWNER TO redmine;

--
-- TOC entry 173 (class 1259 OID 16424)
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE auth_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO redmine;

--
-- TOC entry 2700 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE auth_sources_id_seq OWNED BY auth_sources.id;


--
-- TOC entry 174 (class 1259 OID 16426)
-- Name: boards; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description character varying(255),
    "position" integer DEFAULT 1,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE public.boards OWNER TO redmine;

--
-- TOC entry 175 (class 1259 OID 16436)
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO redmine;

--
-- TOC entry 2701 (class 0 OID 0)
-- Dependencies: 175
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE boards_id_seq OWNED BY boards.id;


--
-- TOC entry 176 (class 1259 OID 16438)
-- Name: changes; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying(255),
    revision character varying(255),
    branch character varying(255)
);


ALTER TABLE public.changes OWNER TO redmine;

--
-- TOC entry 177 (class 1259 OID 16445)
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changes_id_seq OWNER TO redmine;

--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 177
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE changes_id_seq OWNED BY changes.id;


--
-- TOC entry 178 (class 1259 OID 16447)
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.changeset_parents OWNER TO redmine;

--
-- TOC entry 179 (class 1259 OID 16450)
-- Name: changesets; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying(255) NOT NULL,
    committer character varying(255),
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying(255),
    user_id integer
);


ALTER TABLE public.changesets OWNER TO redmine;

--
-- TOC entry 180 (class 1259 OID 16456)
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE changesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changesets_id_seq OWNER TO redmine;

--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 180
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE changesets_id_seq OWNED BY changesets.id;


--
-- TOC entry 181 (class 1259 OID 16458)
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.changesets_issues OWNER TO redmine;

--
-- TOC entry 182 (class 1259 OID 16461)
-- Name: comments; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    comments text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO redmine;

--
-- TOC entry 183 (class 1259 OID 16470)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO redmine;

--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 183
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- TOC entry 184 (class 1259 OID 16472)
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying(255) DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text
);


ALTER TABLE public.custom_fields OWNER TO redmine;

--
-- TOC entry 185 (class 1259 OID 16490)
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO redmine;

--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 185
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE custom_fields_id_seq OWNED BY custom_fields.id;


--
-- TOC entry 186 (class 1259 OID 16492)
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_projects OWNER TO redmine;

--
-- TOC entry 187 (class 1259 OID 16497)
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.custom_fields_roles OWNER TO redmine;

--
-- TOC entry 188 (class 1259 OID 16500)
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_trackers OWNER TO redmine;

--
-- TOC entry 189 (class 1259 OID 16505)
-- Name: custom_values; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE public.custom_values OWNER TO redmine;

--
-- TOC entry 190 (class 1259 OID 16514)
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE custom_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_values_id_seq OWNER TO redmine;

--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 190
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE custom_values_id_seq OWNED BY custom_values.id;


--
-- TOC entry 191 (class 1259 OID 16516)
-- Name: documents; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE public.documents OWNER TO redmine;

--
-- TOC entry 192 (class 1259 OID 16525)
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO redmine;

--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 192
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- TOC entry 193 (class 1259 OID 16527)
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.enabled_modules OWNER TO redmine;

--
-- TOC entry 194 (class 1259 OID 16530)
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE enabled_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_modules_id_seq OWNER TO redmine;

--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 194
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE enabled_modules_id_seq OWNED BY enabled_modules.id;


--
-- TOC entry 195 (class 1259 OID 16532)
-- Name: enumerations; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    is_default boolean DEFAULT false NOT NULL,
    type character varying(255),
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE public.enumerations OWNER TO redmine;

--
-- TOC entry 196 (class 1259 OID 16539)
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE enumerations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enumerations_id_seq OWNER TO redmine;

--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 196
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE enumerations_id_seq OWNED BY enumerations.id;


--
-- TOC entry 197 (class 1259 OID 16541)
-- Name: groups_users; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO redmine;

--
-- TOC entry 198 (class 1259 OID 16544)
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE public.issue_categories OWNER TO redmine;

--
-- TOC entry 199 (class 1259 OID 16549)
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE issue_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_categories_id_seq OWNER TO redmine;

--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 199
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE issue_categories_id_seq OWNED BY issue_categories.id;


--
-- TOC entry 200 (class 1259 OID 16551)
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying(255) DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE public.issue_relations OWNER TO redmine;

--
-- TOC entry 201 (class 1259 OID 16555)
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE issue_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_relations_id_seq OWNER TO redmine;

--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 201
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE issue_relations_id_seq OWNED BY issue_relations.id;


--
-- TOC entry 202 (class 1259 OID 16557)
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    default_done_ratio integer
);


ALTER TABLE public.issue_statuses OWNER TO redmine;

--
-- TOC entry 203 (class 1259 OID 16564)
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE issue_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_statuses_id_seq OWNER TO redmine;

--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 203
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE issue_statuses_id_seq OWNED BY issue_statuses.id;


--
-- TOC entry 204 (class 1259 OID 16566)
-- Name: issues; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone
);


ALTER TABLE public.issues OWNER TO redmine;

--
-- TOC entry 205 (class 1259 OID 16576)
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO redmine;

--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 205
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE issues_id_seq OWNED BY issues.id;


--
-- TOC entry 206 (class 1259 OID 16578)
-- Name: journal_details; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE public.journal_details OWNER TO redmine;

--
-- TOC entry 207 (class 1259 OID 16587)
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE journal_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_details_id_seq OWNER TO redmine;

--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 207
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE journal_details_id_seq OWNED BY journal_details.id;


--
-- TOC entry 208 (class 1259 OID 16589)
-- Name: journals; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.journals OWNER TO redmine;

--
-- TOC entry 209 (class 1259 OID 16599)
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_id_seq OWNER TO redmine;

--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 209
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE journals_id_seq OWNED BY journals.id;


--
-- TOC entry 210 (class 1259 OID 16601)
-- Name: member_roles; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE public.member_roles OWNER TO redmine;

--
-- TOC entry 211 (class 1259 OID 16604)
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE member_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_roles_id_seq OWNER TO redmine;

--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 211
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE member_roles_id_seq OWNED BY member_roles.id;


--
-- TOC entry 212 (class 1259 OID 16606)
-- Name: members; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO redmine;

--
-- TOC entry 213 (class 1259 OID 16612)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO redmine;

--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 213
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- TOC entry 214 (class 1259 OID 16614)
-- Name: messages; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying(255) DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE public.messages OWNER TO redmine;

--
-- TOC entry 215 (class 1259 OID 16624)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO redmine;

--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 215
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- TOC entry 216 (class 1259 OID 16626)
-- Name: news; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.news OWNER TO redmine;

--
-- TOC entry 217 (class 1259 OID 16636)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO redmine;

--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 217
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- TOC entry 218 (class 1259 OID 16638)
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying(255),
    assoc_type character varying(255),
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO redmine;

--
-- TOC entry 219 (class 1259 OID 16644)
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE open_id_authentication_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO redmine;

--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 219
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE open_id_authentication_associations_id_seq OWNED BY open_id_authentication_associations.id;


--
-- TOC entry 220 (class 1259 OID 16646)
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying(255),
    salt character varying(255) NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO redmine;

--
-- TOC entry 221 (class 1259 OID 16652)
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE open_id_authentication_nonces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO redmine;

--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 221
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE open_id_authentication_nonces_id_seq OWNED BY open_id_authentication_nonces.id;


--
-- TOC entry 222 (class 1259 OID 16654)
-- Name: projects; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying(255) DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying(255),
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL
);


ALTER TABLE public.projects OWNER TO redmine;

--
-- TOC entry 223 (class 1259 OID 16665)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO redmine;

--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 223
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- TOC entry 224 (class 1259 OID 16667)
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects_trackers OWNER TO redmine;

--
-- TOC entry 225 (class 1259 OID 16672)
-- Name: queries; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE queries (
    id integer NOT NULL,
    project_id integer,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying(255),
    type character varying(255),
    visibility integer DEFAULT 0,
    options text
);


ALTER TABLE public.queries OWNER TO redmine;

--
-- TOC entry 226 (class 1259 OID 16681)
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_id_seq OWNER TO redmine;

--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 226
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE queries_id_seq OWNED BY queries.id;


--
-- TOC entry 227 (class 1259 OID 16683)
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.queries_roles OWNER TO redmine;

--
-- TOC entry 228 (class 1259 OID 16686)
-- Name: repositories; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying(255) DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying(255),
    path_encoding character varying(64) DEFAULT NULL::character varying,
    log_encoding character varying(64) DEFAULT NULL::character varying,
    extra_info text,
    identifier character varying(255),
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO redmine;

--
-- TOC entry 229 (class 1259 OID 16700)
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO redmine;

--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 229
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE repositories_id_seq OWNED BY repositories.id;


--
-- TOC entry 230 (class 1259 OID 16702)
-- Name: roles; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO redmine;

--
-- TOC entry 231 (class 1259 OID 16713)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO redmine;

--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 231
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 232 (class 1259 OID 16715)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO redmine;

--
-- TOC entry 233 (class 1259 OID 16718)
-- Name: settings; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE public.settings OWNER TO redmine;

--
-- TOC entry 234 (class 1259 OID 16725)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO redmine;

--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 234
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- TOC entry 235 (class 1259 OID 16727)
-- Name: time_entries; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(255),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.time_entries OWNER TO redmine;

--
-- TOC entry 236 (class 1259 OID 16730)
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE time_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_entries_id_seq OWNER TO redmine;

--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 236
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE time_entries_id_seq OWNED BY time_entries.id;


--
-- TOC entry 237 (class 1259 OID 16732)
-- Name: tokens; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL
);


ALTER TABLE public.tokens OWNER TO redmine;

--
-- TOC entry 238 (class 1259 OID 16738)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO redmine;

--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 238
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE tokens_id_seq OWNED BY tokens.id;


--
-- TOC entry 239 (class 1259 OID 16740)
-- Name: trackers; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0
);


ALTER TABLE public.trackers OWNER TO redmine;

--
-- TOC entry 240 (class 1259 OID 16748)
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO redmine;

--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 240
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE trackers_id_seq OWNED BY trackers.id;


--
-- TOC entry 241 (class 1259 OID 16750)
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT false,
    time_zone character varying(255)
);


ALTER TABLE public.user_preferences OWNER TO redmine;

--
-- TOC entry 242 (class 1259 OID 16758)
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO redmine;

--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 242
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE user_preferences_id_seq OWNED BY user_preferences.id;


--
-- TOC entry 243 (class 1259 OID 16760)
-- Name: users; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying(255) DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    mail character varying(60) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying(255),
    identity_url character varying(255),
    mail_notification character varying(255) DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO redmine;

--
-- TOC entry 244 (class 1259 OID 16776)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO redmine;

--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 244
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 245 (class 1259 OID 16778)
-- Name: versions; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying(255),
    status character varying(255) DEFAULT 'open'::character varying,
    sharing character varying(255) DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.versions OWNER TO redmine;

--
-- TOC entry 246 (class 1259 OID 16789)
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO redmine;

--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 246
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- TOC entry 247 (class 1259 OID 16791)
-- Name: watchers; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE watchers (
    id integer NOT NULL,
    watchable_type character varying(255) DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE public.watchers OWNER TO redmine;

--
-- TOC entry 248 (class 1259 OID 16796)
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchers_id_seq OWNER TO redmine;

--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 248
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE watchers_id_seq OWNED BY watchers.id;


--
-- TOC entry 249 (class 1259 OID 16798)
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(255) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_content_versions OWNER TO redmine;

--
-- TOC entry 250 (class 1259 OID 16806)
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE wiki_content_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_content_versions_id_seq OWNER TO redmine;

--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 250
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE wiki_content_versions_id_seq OWNED BY wiki_content_versions.id;


--
-- TOC entry 251 (class 1259 OID 16808)
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(255) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_contents OWNER TO redmine;

--
-- TOC entry 252 (class 1259 OID 16815)
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE wiki_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_contents_id_seq OWNER TO redmine;

--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 252
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE wiki_contents_id_seq OWNED BY wiki_contents.id;


--
-- TOC entry 253 (class 1259 OID 16817)
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE public.wiki_pages OWNER TO redmine;

--
-- TOC entry 254 (class 1259 OID 16821)
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE wiki_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO redmine;

--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 254
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE wiki_pages_id_seq OWNED BY wiki_pages.id;


--
-- TOC entry 255 (class 1259 OID 16823)
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255),
    redirects_to character varying(255),
    created_on timestamp without time zone NOT NULL
);


ALTER TABLE public.wiki_redirects OWNER TO redmine;

--
-- TOC entry 256 (class 1259 OID 16829)
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE wiki_redirects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_redirects_id_seq OWNER TO redmine;

--
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 256
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE wiki_redirects_id_seq OWNED BY wiki_redirects.id;


--
-- TOC entry 257 (class 1259 OID 16831)
-- Name: wikis; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.wikis OWNER TO redmine;

--
-- TOC entry 258 (class 1259 OID 16835)
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE wikis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikis_id_seq OWNER TO redmine;

--
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 258
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE wikis_id_seq OWNED BY wikis.id;


--
-- TOC entry 259 (class 1259 OID 16837)
-- Name: workflows; Type: TABLE; Schema: public; Owner: redmine; Tablespace: 
--

CREATE TABLE workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE public.workflows OWNER TO redmine;

--
-- TOC entry 260 (class 1259 OID 16846)
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO redmine;

--
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 260
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE workflows_id_seq OWNED BY workflows.id;


--
-- TOC entry 2134 (class 2604 OID 17080)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 17081)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY auth_sources ALTER COLUMN id SET DEFAULT nextval('auth_sources_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 17082)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY boards ALTER COLUMN id SET DEFAULT nextval('boards_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 17083)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY changes ALTER COLUMN id SET DEFAULT nextval('changes_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 17084)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY changesets ALTER COLUMN id SET DEFAULT nextval('changesets_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 17085)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- TOC entry 2165 (class 2604 OID 17086)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY custom_fields ALTER COLUMN id SET DEFAULT nextval('custom_fields_id_seq'::regclass);


--
-- TOC entry 2173 (class 2604 OID 17087)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY custom_values ALTER COLUMN id SET DEFAULT nextval('custom_values_id_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 17088)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 17089)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY enabled_modules ALTER COLUMN id SET DEFAULT nextval('enabled_modules_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 17090)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY enumerations ALTER COLUMN id SET DEFAULT nextval('enumerations_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 17091)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY issue_categories ALTER COLUMN id SET DEFAULT nextval('issue_categories_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 17092)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY issue_relations ALTER COLUMN id SET DEFAULT nextval('issue_relations_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 17093)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY issue_statuses ALTER COLUMN id SET DEFAULT nextval('issue_statuses_id_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 17094)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY issues ALTER COLUMN id SET DEFAULT nextval('issues_id_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 17095)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY journal_details ALTER COLUMN id SET DEFAULT nextval('journal_details_id_seq'::regclass);


--
-- TOC entry 2207 (class 2604 OID 17096)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY journals ALTER COLUMN id SET DEFAULT nextval('journals_id_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 17097)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY member_roles ALTER COLUMN id SET DEFAULT nextval('member_roles_id_seq'::regclass);


--
-- TOC entry 2212 (class 2604 OID 17098)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 17099)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 17100)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 17101)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_associations_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 17102)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_nonces_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 17103)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 17104)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY queries ALTER COLUMN id SET DEFAULT nextval('queries_id_seq'::regclass);


--
-- TOC entry 2245 (class 2604 OID 17105)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY repositories ALTER COLUMN id SET DEFAULT nextval('repositories_id_seq'::regclass);


--
-- TOC entry 2251 (class 2604 OID 17106)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2253 (class 2604 OID 17107)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- TOC entry 2254 (class 2604 OID 17108)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY time_entries ALTER COLUMN id SET DEFAULT nextval('time_entries_id_seq'::regclass);


--
-- TOC entry 2258 (class 2604 OID 17109)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY tokens ALTER COLUMN id SET DEFAULT nextval('tokens_id_seq'::regclass);


--
-- TOC entry 2264 (class 2604 OID 17110)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY trackers ALTER COLUMN id SET DEFAULT nextval('trackers_id_seq'::regclass);


--
-- TOC entry 2267 (class 2604 OID 17111)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY user_preferences ALTER COLUMN id SET DEFAULT nextval('user_preferences_id_seq'::regclass);


--
-- TOC entry 2278 (class 2604 OID 17112)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2284 (class 2604 OID 17113)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- TOC entry 2287 (class 2604 OID 17114)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY watchers ALTER COLUMN id SET DEFAULT nextval('watchers_id_seq'::regclass);


--
-- TOC entry 2290 (class 2604 OID 17115)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('wiki_content_versions_id_seq'::regclass);


--
-- TOC entry 2292 (class 2604 OID 17116)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY wiki_contents ALTER COLUMN id SET DEFAULT nextval('wiki_contents_id_seq'::regclass);


--
-- TOC entry 2294 (class 2604 OID 17117)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY wiki_pages ALTER COLUMN id SET DEFAULT nextval('wiki_pages_id_seq'::regclass);


--
-- TOC entry 2295 (class 2604 OID 17118)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY wiki_redirects ALTER COLUMN id SET DEFAULT nextval('wiki_redirects_id_seq'::regclass);


--
-- TOC entry 2297 (class 2604 OID 17119)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY wikis ALTER COLUMN id SET DEFAULT nextval('wikis_id_seq'::regclass);


--
-- TOC entry 2304 (class 2604 OID 17120)
-- Name: id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY workflows ALTER COLUMN id SET DEFAULT nextval('workflows_id_seq'::regclass);


--
-- TOC entry 2600 (class 0 OID 16397)
-- Dependencies: 170
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (2, 3, 'WikiPage', 'nomenclatura.png', '140725125658_nomenclatura.png', 16733, '', '6065f9c319bddc2511f06837d2c0b5fa', 0, 3, '2014-07-25 12:56:58.626', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (3, 4, 'WikiPage', 'Guiadeinstalacion_RPM_2013.doc', '140725130404_Guiadeinstalacion_RPM_2013.doc', 1703424, '', 'be105ab46871aebbfbbdc8ce71379f77', 0, 3, '2014-07-25 13:04:04.996', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (4, 1, 'Issue', 'Dummies 05.docx', '140725133145_9111e8ee3024797cc532eeafd4e92cc6.docx', 26368, '', '47686eb2de87a3fd1bc001967bb5dde1', 0, 6, '2014-07-25 13:31:45.669', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (5, 1, 'Issue', 'Dummies 06.docx', '140725133148_00587c03ea9d21fe9c8474148ce3f75b.docx', 26559, '', '4b9108ff6b3f77c0ca0b43b0985f5c1e', 0, 6, '2014-07-25 13:31:48.172', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (6, NULL, NULL, 'outarray.java', '140725174346_outarray.java', 3612, '', '2b3da788847259913cc9625c2efbcc41', 0, 3, '2014-07-25 17:43:46.725', NULL, '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (7, 2, 'Issue', 'ClienteSocketCU.java', '140728132845_ClienteSocketCU.java', 1054, '', '525d15e5df722d0b0c9cd2c76f587f4e', 0, 3, '2014-07-28 13:28:45.79', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (9, 2, 'Issue', 'img2.png', '140728132845_img2.png', 58274, '', '3ad18d96753127e50d6b832f65cfc790', 0, 3, '2014-07-28 13:28:46.009', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (10, 2, 'Issue', 'img1.png', '140728133229_img1.png', 57078, '', '5cab1fd80ac5309b8207e4410940458e', 0, 3, '2014-07-28 13:32:29.071', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (12, 3, 'Issue', 'Atención_Clientes_2.pdf', '140728135458_98a712e526e6688ed5f1ec8029cc0a75.pdf', 2004787, '', 'b474e3bca2ffe95cb4d810c9975ba0b1', 0, 3, '2014-07-28 13:54:58.484', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (11, 3, 'Issue', 'Menu.pdf', '140728135458_Menu.pdf', 635057, '', 'd5f7c42457e53f06565334e742013c79', 0, 3, '2014-07-28 13:54:58.03', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (13, 9, 'WikiPage', 'build.gradle', '140728174136_build.gradle', 7894, '', '869b3f5fc4f4687aa84eeda53d949dc6', 0, 3, '2014-07-28 17:41:36.759', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (14, 9, 'WikiPage', 'settings.gradle', '140728174136_settings.gradle', 32, '', '2079f64493e87f2ef5c1a149a1337143', 0, 3, '2014-07-28 17:41:36.803', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (15, 9, 'WikiPage', 'gradle.properties', '140728174136_gradle.properties', 2311, '', 'd4cf81a851e39721c959b0292fc38712', 0, 3, '2014-07-28 17:41:36.842', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (16, 9, 'WikiPage', 'gradle.properties', '140728174945_gradle.properties', 445, '', '367b72ed67331b9fe18d2d94ddad6e3a', 0, 3, '2014-07-28 17:49:45.863', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (17, 6, 'WikiPage', 'Manual GIT.pdf', '140729171040_5ac8d418247926df3a2233fbdcc9a73b.pdf', 250911, '', '12de4da3d15f00cc0497c066d6a87ada', 0, 5, '2014-07-29 17:10:40.98', 'Guia para ingresar al portal de GITBLIT y descargar los repositorios.', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (18, 6, 'WikiPage', 'Manual GIT.pdf', '140729171152_5ac8d418247926df3a2233fbdcc9a73b.pdf', 250911, '', '12de4da3d15f00cc0497c066d6a87ada', 0, 5, '2014-07-29 17:11:52.021', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (19, 2, 'Issue', 'TipoDatosWS.png', '140729174951_TipoDatosWS.png', 79826, '', '32eefe482387810771aa9e633ee36c23', 0, 3, '2014-07-29 17:49:51.611', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (20, 2, 'Issue', 'Contrato Interfaz wsBlockbusterNewBank2.xlsx', '140729180532_718245f7fba4811a7cebab68f920269d.xlsx', 55874, '', '5bc82be4618f18193d15cbedc1c59fc6', 0, 3, '2014-07-29 18:05:32.158', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (21, NULL, NULL, 'services.js', '140730130601_services.js', 645, '', '7260b81da869671e58d9527b04f3c840', 0, 4, '2014-07-30 13:06:01.801', NULL, '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (23, 4, 'Issue', 'Dummies 05.docx', '140731125220_9111e8ee3024797cc532eeafd4e92cc6.docx', 28288, '', 'e8eae99e53ce235d3d9b860b5b1cadbf', 0, 6, '2014-07-31 12:52:20.619', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (24, 4, 'Issue', 'Dummies 06.docx', '140731125224_00587c03ea9d21fe9c8474148ce3f75b.docx', 28019, '', '99f7a144da6661bfec0d5d0c690d96ee', 0, 6, '2014-07-31 12:52:24.241', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (25, 4, 'Issue', 'Catalogos 3.docx', '140731125228_9f9b855f332552480db79d3ed180b07c.docx', 38971, '', '90b1b4681efd966b194920a758d17214', 0, 6, '2014-07-31 12:52:28.167', '', '2014/07');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (28, 12, 'WikiPage', 'AsistenciasAcertum.xlsx', '140801183341_AsistenciasAcertum.xlsx', 12226, '', '1366eb9dbfe04ec724b6f44e707093ec', 0, 3, '2014-08-01 18:33:41.222', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (29, 8, 'Issue', 'Atencion_Clientes_060814.pptx', '140806182212_Atencion_Clientes_060814.pptx', 3196040, '', '907fdebb5685624aa707fa76c20a321c', 0, 3, '2014-08-06 18:22:12.69', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (30, NULL, NULL, 'Atencion_Clientes_060814.pptx', '140807133520_Atencion_Clientes_060814.pptx', 3196040, '', '907fdebb5685624aa707fa76c20a321c', 0, 12, '2014-08-07 13:35:20.489', NULL, '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (33, NULL, NULL, 'Contrato Interfaz BlockbusterNewBank.xlsx', '140807190339_a4ea336ef20286defd5c0655e63912ba.xlsx', 51896, '', 'ea33f14f1806b949fd39c583617b355b', 0, 4, '2014-08-07 19:03:39.314', NULL, '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (36, 8, 'Issue', 'Images_Acertum.zip', '140807192435_Images_Acertum.zip', 43311, '', 'ffde853dd0c80f7d71e6c55ea33237a0', 0, 3, '2014-08-07 19:24:35.906', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (37, 8, 'Issue', 'Contrato Interfaz BlockbusterNewBank.xlsx', '140808094646_a4ea336ef20286defd5c0655e63912ba.xlsx', 51930, '', 'c48bbf4977d0308b6f504ec994033ceb', 0, 4, '2014-08-08 09:46:46.347', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (38, 8, 'Issue', 'PRUEBA.svg', '140808103632_PRUEBA.svg', 18308, '', 'b285c2df896132e50e528c753e4a0447', 0, 3, '2014-08-08 10:36:32.204', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (39, 8, 'Issue', 'PRUEBA__tiny1_1.svg', '140808113502_PRUEBA__tiny1_1.svg', 1366, '', '14fb3a87a6fd90076b7049dc371fa39d', 0, 3, '2014-08-08 11:35:02.454', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (40, 8, 'Issue', 'PRUEBA_basic1_1.svg', '140808113502_PRUEBA_basic1_1.svg', 1430, '', 'e8ea86f35841841bb2c24d2046208f5d', 0, 3, '2014-08-08 11:35:02.499', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (41, 8, 'Issue', 'PRUEBA_tiny1_1plus.svg', '140808113502_PRUEBA_tiny1_1plus.svg', 1366, '', '14fb3a87a6fd90076b7049dc371fa39d', 0, 3, '2014-08-08 11:35:02.549', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (42, 8, 'Issue', 'PRUEBA_tiny1_2.svg', '140808113502_PRUEBA_tiny1_2.svg', 1272, '', '8ed98f09731eb9d571cb3d19e8e7c7e7', 0, 3, '2014-08-08 11:35:02.609', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (43, 12, 'Issue', 'Aclaraciones.pdf', '140812194518_Aclaraciones.pdf', 1608969, '', 'c7abfcf56b736dc6f5abb3a7e20b4368', 0, 3, '2014-08-12 19:45:18.349', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (63, 14, 'WikiPage', 'RestClient.java', '140818134029_RestClient.java', 276, '', '5c9a8f313714696110260a534b1d00fc', 0, 4, '2014-08-18 13:40:29.127', 'Rest Client - Ejemplo', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (64, NULL, NULL, 'BB71 -Datos Beneficiarios PreaperturaSelectaWEB.doc', '140818195937_04363112f0faf4b9362469941be0f3bb.doc', 112128, '', '98fda008cf0c77728837b33559ebc2f2', 0, 3, '2014-08-18 19:59:37.455', NULL, '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (65, NULL, NULL, 'BB70 -Preaperturas SelectaWEB.doc', '140818195937_e04ba178551cdbec11f2c2d595f38e51.doc', 144384, '', '9098d0aead16c203513bde2eebb0e961', 0, 3, '2014-08-18 19:59:37.51', NULL, '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (66, NULL, NULL, 'BB73 - Alta Datos complementariosWEB.doc', '140818195937_d805ed19c50509f6ce8700b794d10fa6.doc', 141824, '', '157107fdd9282f930a3269a927eaaa69', 0, 3, '2014-08-18 19:59:37.782', NULL, '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (68, 15, 'Issue', 'BB70 -Preaperturas SelectaWEB.doc', '140818200743_e04ba178551cdbec11f2c2d595f38e51.doc', 144384, '', '9098d0aead16c203513bde2eebb0e961', 0, 3, '2014-08-18 20:07:43.762', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (67, 15, 'Issue', 'BB71 -Datos Beneficiarios PreaperturaSelectaWEB.doc', '140818200743_04363112f0faf4b9362469941be0f3bb.doc', 112128, '', '98fda008cf0c77728837b33559ebc2f2', 0, 3, '2014-08-18 20:07:43.699', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (69, 15, 'Issue', 'BB73 - Alta Datos complementariosWEB.doc', '140818200744_d805ed19c50509f6ce8700b794d10fa6.doc', 141824, '', '157107fdd9282f930a3269a927eaaa69', 0, 3, '2014-08-18 20:07:44.012', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (70, 15, 'Issue', '0.gif', '140818201027_0.gif', 29416, '', '66f5ddd0c61c82650c5702028b23746d', 0, 3, '2014-08-18 20:10:27.875', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (71, 16, 'Issue', 'Atencion_Clientes_190814.pdf', '140819120001_Atencion_Clientes_190814.pdf', 4709572, '', 'b6bdaa490b471675c7f347f2a835c230', 0, 3, '2014-08-19 12:00:02.031', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (72, 15, 'Issue', 'RESTClient.txt', '140821101815_RESTClient.txt', 1080, '', 'ee994a55952b137d6c08810a0c35d8d6', 0, 18, '2014-08-21 10:18:15.361', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (73, 15, 'Issue', 'json_nuevo.txt', '140821171318_json_nuevo.txt', 1087, '', '3474e2bf4cc371c961bc114056b95a07', 0, 18, '2014-08-21 17:13:18.996', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (74, 17, 'Issue', 'captura_aclaraciones.pptx', '140822104307_captura_aclaraciones.pptx', 2384892, '', '013f4eb4ade94964edf9ada9135d4d81', 0, 3, '2014-08-22 10:43:07.409', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (75, 18, 'Issue', 'CONTRATO B41S_web.doc', '140825183101_690d37ef1699f12f4b27df040a57ebdc.doc', 288768, '', '5e5022fda8b6d183db44f45735eb9987', 0, 9, '2014-08-25 18:31:01.831', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (76, 18, 'Issue', 'PE28 Busqueda de Relaciones con Entidad.doc', '140825190005_e48c58e5beacb580cd403e800ff4c0e3.doc', 287744, '', '609fc30be765a7889e3ebf8b5941a53b', 0, 9, '2014-08-25 19:00:05.812', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (77, 20, 'Issue', 'Servicios REST Aclaraciones.xlsx', '140826100528_8054a2571135fe72b08a5cc70e53f3b6.xlsx', 11822, '', '7aa4d6ba2525174fedec90c0e5b6650f', 0, 14, '2014-08-26 10:05:28.068', 'Contrato de servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (80, 21, 'Issue', 'Servicios REST Aclaraciones 2.xlsx', '140826185840_c3c268aa0539548317b39761da60fb82.xlsx', 10901, '', 'b35e27a281457e4a381e8f0be867e1aa', 0, 14, '2014-08-26 18:58:40.807', 'Ejemplos de invocación y url de los servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (81, 22, 'Issue', 'Servicios REST Aclaraciones 2.xlsx', '140826190047_c3c268aa0539548317b39761da60fb82.xlsx', 10901, '', 'b35e27a281457e4a381e8f0be867e1aa', 0, 14, '2014-08-26 19:00:47.957', 'Ejemplos de invocación y urls de los servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (82, 24, 'Issue', 'DisenioSegundaFase.zip', '140827115822_DisenioSegundaFase.zip', 923074, '', '3f618ae1b5b77b8b1c1e94863bc839e0', 0, 3, '2014-08-27 11:58:23.028', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (83, 25, 'Issue', 'Aclaraciones.pdf', '140827120237_Aclaraciones.pdf', 1757876, '', 'b758ab15ec3cf6a415714ed834a5c822', 0, 3, '2014-08-27 12:02:37.56', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (44, 12, 'Issue', 'Img_svg.zip', '140814183550_Img_svg.zip', 12122, '', '8f95542538419c95d24fb4a8cafc84da', 0, 3, '2014-08-14 18:35:50.295', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (45, 2, 'Issue', 'Ejemplo funciones CU.doc', '140815112322_b0fcff070d3b66fdd26f4b03b0ad143b.doc', 47616, '', 'a18d34c9d74ea10065de52331450e957', 0, 12, '2014-08-15 11:23:22.674', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (84, 27, 'Issue', 'Servicios REST Aclaraciones 3.xlsx', '140827175328_0968a230bc635015550cbcabe5c6bcd6.xlsx', 11327, '', '94b886c343da3094f2dc6e12da636ba0', 0, 14, '2014-08-27 17:53:28.206', 'Ejemplos de invocación y url de los servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (85, 28, 'Issue', 'Servicios REST Aclaraciones 3.xlsx', '140827175515_0968a230bc635015550cbcabe5c6bcd6.xlsx', 11327, '', '94b886c343da3094f2dc6e12da636ba0', 0, 14, '2014-08-27 17:55:15.66', 'Ejemplos de invocación y url de los servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (86, 29, 'Issue', 'Servicios REST Aclaraciones 3.xlsx', '140827175627_0968a230bc635015550cbcabe5c6bcd6.xlsx', 11327, '', '94b886c343da3094f2dc6e12da636ba0', 0, 14, '2014-08-27 17:56:27.148', 'Ejemplos de invocación y url de los servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (48, 2, 'Issue', 'Captura.PNG', '140815115605_Captura.PNG', 35594, '', '02e0fc395682fe79ff2108a489cc2702', 0, 4, '2014-08-15 11:56:05.296', 'Resultados de las pruebas de CU.', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (49, 13, 'Issue', 'flujo_dashboard.PNG', '140815123550_flujo_dashboard.PNG', 34019, '', 'e580c760b967531a7c0fa30505d475d6', 0, 8, '2014-08-15 12:35:50.751', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (87, 30, 'Issue', 'Servicios REST Aclaraciones 3.xlsx', '140827175755_0968a230bc635015550cbcabe5c6bcd6.xlsx', 11327, '', '94b886c343da3094f2dc6e12da636ba0', 0, 14, '2014-08-27 17:57:55.318', 'Ejemplos de invocación y url de los servicios REST', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (88, 25, 'Issue', 'Aclaraciones_5.pdf', '140827194308_Aclaraciones_5.pdf', 1817942, '', 'fd063dd00095b15df87439f5ad85e036', 0, 3, '2014-08-27 19:43:08.659', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (90, 32, 'Issue', 'Servicios REST Aclaraciones usuario.xlsx', '140828105035_18b3e41931bef3bcdb450732ed68d5dd.xlsx', 9919, '', '7cb782e1b82d5d7b13ac8112b6d0c948', 0, 9, '2014-08-28 10:50:35.694', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (91, 31, 'Issue', 'Servicios REST Aclaraciones movimientos alnova.xlsx', '140829123042_cefaf61e1c38230cefa55220772ecda7.xlsx', 11482, '', 'd1073851450192fba85bbc6b823847a2', 0, 9, '2014-08-29 12:30:42.914', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (50, 14, 'Issue', 'DocContrato_SelRoles.doc', '140818112446_DocContrato_SelRoles.doc', 130560, '', '00201b1bfea3866ef5017493cf9f3a63', 0, 12, '2014-08-18 11:24:46.728', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (51, 14, 'Issue', 'DocContrato_SelUsuarios.doc', '140818112520_DocContrato_SelUsuarios.doc', 100352, '', 'c255ddbcb41675e17a713c605575d534', 0, 12, '2014-08-18 11:25:20.066', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (54, 14, 'Issue', 'ConInterfaz_SPMXDELUSERTOKN.doc', '140818112559_ConInterfaz_SPMXDELUSERTOKN.doc', 215552, '', 'd7534b708965b3d2c534518028cb1ddb', 0, 12, '2014-08-18 11:25:59.362', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (55, 14, 'Issue', 'ConInterfaz_SPMXSELUSERTOKN.doc', '140818112607_ConInterfaz_SPMXSELUSERTOKN.doc', 215552, '', '8b07fc1713db455e93d4297e2b634e50', 0, 12, '2014-08-18 11:26:07.087', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (56, 14, 'Issue', 'ConInterfaz_SPMXSELUSRROLTK.doc', '140818112620_ConInterfaz_SPMXSELUSRROLTK.doc', 214016, '', '60a4471f9891043e0dfccf9af94fdde9', 0, 12, '2014-08-18 11:26:20.065', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (57, 14, 'Issue', 'ConInterfaz_SPMXUPDUSERTOKN.doc', '140818115415_ConInterfaz_SPMXUPDUSERTOKN.doc', 221696, '', '6ac3288b6cdc89a021aadfa1bac4e55f', 0, 12, '2014-08-18 11:54:15.257', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (58, 14, 'Issue', 'DgrVS_SG_Tokens.vsd', '140818115444_DgrVS_SG_Tokens.vsd', 181248, '', '42cf470a58ab05694718668aab8e8433', 0, 12, '2014-08-18 11:54:44.59', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (59, 14, 'Issue', 'ConInterfaz_SPMXINSUSERTOKN.doc', '140818122911_ConInterfaz_SPMXINSUSERTOKN.doc', 238080, '', 'a237e993eed301412321696a2905497a', 0, 12, '2014-08-18 12:29:11.611', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (60, 14, 'Issue', 'ConInterfaz_SPMXSELVISTA.doc', '140818125904_ConInterfaz_SPMXSELVISTA.doc', 183808, '', '34eb8cedc89244a2f0e52a087310838b', 0, 12, '2014-08-18 12:59:04.763', '', '2014/08');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (94, 44, 'Issue', 'Servicios REST aclaraciones binxproducto.xlsx', '140902113411_2f3118146ef3e8cf1dbc32a3fdc9d4c0.xlsx', 9553, '', 'e27069701e0de51e13445b818651969a', 0, 9, '2014-09-02 11:34:11.698', '', '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (95, 44, 'Issue', 'Servicios REST aclaraciones clasificacionalnova.xlsx', '140902113415_c160a4dad8b6c9cc0284911ac71f216d.xlsx', 9646, '', '104209b23995b2a4419e57f594b74b40', 0, 9, '2014-09-02 11:34:15.224', '', '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (96, 44, 'Issue', 'Servicios REST Aclaraciones docxpreaclaracion.xlsx', '140902113424_d255fcd9900aaa3ed73d08e1da731455.xlsx', 9621, '', '5b7db8b5e0e65951b21c2102f9173d43', 0, 9, '2014-09-02 11:34:24.861', '', '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (97, NULL, NULL, 'Servicios REST Aclaraciones guardar preaclaracion.xlsx', '140902163834_137eefcdab221921b1f9833da8197374.xlsx', 10129, '', '8ca1418d39e2ed444b1427bdd670386b', 0, 9, '2014-09-02 16:38:34.97', NULL, '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (98, 43, 'Issue', 'Servicios REST Aclaraciones guardar preaclaracion.xlsx', '140902163921_137eefcdab221921b1f9833da8197374.xlsx', 10129, '', '8ca1418d39e2ed444b1427bdd670386b', 0, 9, '2014-09-02 16:39:21.668', '', '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (99, 58, 'Issue', 'AclaracionInmediata.PNG', '140909095605_AclaracionInmediata.PNG', 25517, '', '43a11ae797013398b232e031277f9f89', 0, 3, '2014-09-09 09:56:05.774', '', '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (100, 4, 'Project', 'Guiadeinstalacion_RPM_2013.pdf', '140918104138_Guiadeinstalacion_RPM_2013.pdf', 537753, '', '3aa35568b3143c6fca1e78939060f715', 1, 4, '2014-09-18 10:41:38.559', '', '2014/09');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (101, NULL, NULL, 'Captura.PNG', '141001134532_Captura.PNG', 4604, '', '62f64f4294463fd27852a459c706a28f', 0, 4, '2014-10-01 13:45:32.281', NULL, '2014/10');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (103, 88, 'Issue', 'Tiempos FCR.png', '141006172112_21e3bfe8d6cbf902cce6d5f123d69bfb.png', 20686, '', '4d985525a756eba4b2774710d8e8bbc1', 0, 12, '2014-10-06 17:21:13.166', '', '2014/10');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (104, 88, 'Issue', 'tiempo_resolucion tipoaclaracion_propuesta.jpg', '141006175830_1e652ca3c808c96da6097ae3719f5849.jpg', 32221, '', '7dd2be0afd93e1b4c3fd0258e4218aac', 0, 9, '2014-10-06 17:58:30.836', '', '2014/10');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (106, 4, 'Project', 'gradle.properties', '141006185442_gradle.properties', 1933, '', '16a424ddf1f2360d17ff892a0ed37df4', 0, 1, '2014-10-06 18:54:42.852', '', '2014/10');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (107, 4, 'Project', 'settings.gradle', '141006185453_settings.gradle', 32, '', '2079f64493e87f2ef5c1a149a1337143', 0, 1, '2014-10-06 18:54:53.497', '', '2014/10');
INSERT INTO attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) VALUES (105, 4, 'Project', 'build.gradle', '141006185426_build.gradle', 8931, '', '251027b70c54419ccc5e8ac80788c876', 1, 1, '2014-10-06 18:54:26.456', '', '2014/10');


--
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 171
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('attachments_id_seq', 107, true);


--
-- TOC entry 2602 (class 0 OID 16413)
-- Dependencies: 172
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('auth_sources_id_seq', 1, false);


--
-- TOC entry 2604 (class 0 OID 16426)
-- Dependencies: 174
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 175
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('boards_id_seq', 1, false);


--
-- TOC entry 2606 (class 0 OID 16438)
-- Dependencies: 176
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 177
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('changes_id_seq', 1, false);


--
-- TOC entry 2608 (class 0 OID 16447)
-- Dependencies: 178
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2609 (class 0 OID 16450)
-- Dependencies: 179
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 180
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('changesets_id_seq', 1, false);


--
-- TOC entry 2611 (class 0 OID 16458)
-- Dependencies: 181
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2612 (class 0 OID 16461)
-- Dependencies: 182
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 183
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- TOC entry 2614 (class 0 OID 16472)
-- Dependencies: 184
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 185
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('custom_fields_id_seq', 1, false);


--
-- TOC entry 2616 (class 0 OID 16492)
-- Dependencies: 186
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2617 (class 0 OID 16497)
-- Dependencies: 187
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2618 (class 0 OID 16500)
-- Dependencies: 188
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2619 (class 0 OID 16505)
-- Dependencies: 189
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 190
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('custom_values_id_seq', 1, false);


--
-- TOC entry 2621 (class 0 OID 16516)
-- Dependencies: 191
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 192
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- TOC entry 2623 (class 0 OID 16527)
-- Dependencies: 193
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO enabled_modules (id, project_id, name) VALUES (1, 1, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (2, 1, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (3, 1, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (4, 1, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (5, 1, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (6, 1, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (7, 1, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (8, 1, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (9, 1, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (10, 1, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (11, 2, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (12, 2, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (13, 2, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (14, 2, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (15, 2, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (16, 2, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (17, 2, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (18, 2, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (19, 2, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (20, 2, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (21, 3, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (22, 3, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (23, 3, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (24, 3, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (25, 3, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (26, 3, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (27, 3, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (28, 3, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (29, 3, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (30, 3, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (31, 4, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (32, 4, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (33, 4, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (34, 4, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (35, 4, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (36, 4, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (37, 4, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (38, 4, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (39, 4, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (40, 4, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (41, 5, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (42, 5, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (43, 5, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (44, 5, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (45, 5, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (46, 5, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (47, 5, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (48, 5, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (49, 5, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (50, 5, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (51, 6, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (52, 6, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (53, 6, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (54, 6, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (55, 6, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (56, 6, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (57, 6, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (58, 6, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (59, 6, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (60, 6, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (61, 7, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (62, 7, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (63, 7, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (64, 7, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (65, 7, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (66, 7, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (67, 7, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (68, 7, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (69, 7, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (70, 7, 'gantt');
INSERT INTO enabled_modules (id, project_id, name) VALUES (71, 8, 'issue_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (72, 8, 'time_tracking');
INSERT INTO enabled_modules (id, project_id, name) VALUES (73, 8, 'news');
INSERT INTO enabled_modules (id, project_id, name) VALUES (74, 8, 'documents');
INSERT INTO enabled_modules (id, project_id, name) VALUES (75, 8, 'files');
INSERT INTO enabled_modules (id, project_id, name) VALUES (76, 8, 'wiki');
INSERT INTO enabled_modules (id, project_id, name) VALUES (77, 8, 'repository');
INSERT INTO enabled_modules (id, project_id, name) VALUES (78, 8, 'boards');
INSERT INTO enabled_modules (id, project_id, name) VALUES (79, 8, 'calendar');
INSERT INTO enabled_modules (id, project_id, name) VALUES (80, 8, 'gantt');


--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 194
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('enabled_modules_id_seq', 80, true);


--
-- TOC entry 2625 (class 0 OID 16532)
-- Dependencies: 195
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (1, 'Low', 1, false, 'IssuePriority', true, NULL, NULL, 'lowest');
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (2, 'Normal', 2, true, 'IssuePriority', true, NULL, NULL, 'default');
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (3, 'High', 3, false, 'IssuePriority', true, NULL, NULL, 'high3');
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (4, 'Urgent', 4, false, 'IssuePriority', true, NULL, NULL, 'high2');
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (5, 'Immediate', 5, false, 'IssuePriority', true, NULL, NULL, 'highest');
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (6, 'User documentation', 1, false, 'DocumentCategory', true, NULL, NULL, NULL);
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (7, 'Technical documentation', 2, false, 'DocumentCategory', true, NULL, NULL, NULL);
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (8, 'Design', 1, false, 'TimeEntryActivity', true, NULL, NULL, NULL);
INSERT INTO enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) VALUES (9, 'Development', 2, false, 'TimeEntryActivity', true, NULL, NULL, NULL);


--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 196
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('enumerations_id_seq', 9, true);


--
-- TOC entry 2627 (class 0 OID 16541)
-- Dependencies: 197
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO groups_users (group_id, user_id) VALUES (11, 6);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 23);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 1);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 4);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 21);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 14);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 8);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 19);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 18);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 24);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 3);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 22);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 9);
INSERT INTO groups_users (group_id, user_id) VALUES (25, 5);
INSERT INTO groups_users (group_id, user_id) VALUES (26, 16);
INSERT INTO groups_users (group_id, user_id) VALUES (26, 12);
INSERT INTO groups_users (group_id, user_id) VALUES (26, 15);


--
-- TOC entry 2628 (class 0 OID 16544)
-- Dependencies: 198
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 199
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('issue_categories_id_seq', 1, false);


--
-- TOC entry 2630 (class 0 OID 16551)
-- Dependencies: 200
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 201
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('issue_relations_id_seq', 1, false);


--
-- TOC entry 2632 (class 0 OID 16557)
-- Dependencies: 202
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO issue_statuses (id, name, is_closed, is_default, "position", default_done_ratio) VALUES (1, 'New', false, true, 1, NULL);
INSERT INTO issue_statuses (id, name, is_closed, is_default, "position", default_done_ratio) VALUES (2, 'In Progress', false, false, 2, NULL);
INSERT INTO issue_statuses (id, name, is_closed, is_default, "position", default_done_ratio) VALUES (3, 'Resolved', false, false, 3, NULL);
INSERT INTO issue_statuses (id, name, is_closed, is_default, "position", default_done_ratio) VALUES (4, 'Feedback', false, false, 4, NULL);
INSERT INTO issue_statuses (id, name, is_closed, is_default, "position", default_done_ratio) VALUES (5, 'Closed', true, false, 5, NULL);
INSERT INTO issue_statuses (id, name, is_closed, is_default, "position", default_done_ratio) VALUES (6, 'Rejected', true, false, 6, NULL);


--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 203
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('issue_statuses_id_seq', 6, true);


--
-- TOC entry 2634 (class 0 OID 16566)
-- Dependencies: 204
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (1, 2, 3, 'Contrato dummy', 'Contratos dummie para Servicio de ingreso y de egreso.', NULL, NULL, 1, NULL, 2, NULL, 6, 0, '2014-07-25 13:32:10.554', '2014-07-25 13:32:10.554', '2014-07-25', 0, NULL, NULL, 1, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (4, 1, 3, 'Actualizacion de dummies', 'Se agregaron las reglas del negocio

Se agrego el contrato de la función para denominaciones', NULL, NULL, 2, NULL, 5, NULL, 6, 0, '2014-07-31 12:52:41.946', '2014-07-31 12:52:41.946', '2014-07-31', 0, NULL, NULL, 4, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (84, 1, 4, 'Consulta de componentes por roles', '
Se genero el procedimiento para consultar todos los componentes, respecto a un arreglo de roles.

El contrato de interfaz se encuentra en:


    E:\2014\REPO_ATENCION\ci\PORTAL_ATENCION\PKMXSG_ROLVISTACOMP\ConInterfaz_SPMXSELRLVISCOM

Cualquier duda con gusto la podemos validar', NULL, NULL, 1, 1, 2, NULL, 12, 0, '2014-10-03 13:30:39.316', '2014-10-03 13:30:39.316', '2014-10-03', 0, NULL, NULL, 84, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (5, 2, 4, 'Foto Cliente Único', 'Te mando el wsdl del servicio para recuperar la fotografia por cliente único. Es del tipo SOAP.

http://10.50.125.30:8080/WSFotoCU/FotoCUService?wsdl


El método que consumirás es el siguiente:

"recuperaFoto": Recibe 4 parámetros del tipo entero que son el cliente único. "país, canal, sucursal y folio".


La cadena que recibes esta en Base64.
', NULL, NULL, 1, 4, 2, NULL, 3, 1, '2014-07-31 16:40:04.114', '2014-07-31 16:42:20.698', '2014-07-31', 0, NULL, 2, 2, 2, 3, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (9, 2, 4, 'Búsqueda por nombre', 'NOMBRE, APELLIDO PATERNO, APELLIDO MATERNO, FECHA DE NACIMIENTO

	CTE_UNICO.SPSELBACKHOMNB(''MARCO ANTONIO'',''FLORES'',''LOPEZ'',''19-08-1985'')

	CTE_UNICO.SPSELBACKNOMNB(''MARCO ANTONIO'',''FLORES'',''LOPEZ'',''19-08-1985'')
', NULL, NULL, 1, 4, 2, NULL, 3, 0, '2014-08-07 09:08:46.598', '2014-08-07 09:08:46.598', '2014-08-07', 0, NULL, NULL, 9, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (11, 1, 4, 'Búsqueda por nombre', '', NULL, NULL, 5, 12, 2, NULL, 12, 3, '2014-08-07 13:32:32.497', '2014-08-07 13:34:32.127', '2014-08-07', 0, NULL, NULL, 11, 1, 2, false, '2014-08-07 13:34:32.127');
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (10, 2, 4, 'Funciones de consulta de vistas', 'Se requiere las siguientes consultas:

*_+Búsqueda por vista+_*
*Entrada*
URL Vista ejemplo "vistas/busqieda_cliente.html"

*Salida*
Roles asignado a la vista

*_+Búsqueda por componentes+_*
*Entrada*

*_+Crear tabla de tokens con los siguientes campos+_*
*Campos*
Token
Usuario
id Sesion
fecha creacion
campos auditoria

*_+Busqueda de usuario por token+_*
*Entrada*
Token
*Salida*
id usuario
rol usuario

URL Vista - ejemplo "vistas/busqieda_cliente.html"
Rol
*Salida*
Componentes asignados a la vista rol

*_+Búsqueda por usuario+_*
*Entrada*
numeroUsuario
*Salida*
Roles asignados al usuario', NULL, NULL, 5, 12, 2, NULL, 3, 5, '2014-08-07 13:30:37.686', '2014-08-11 12:56:22.267', '2014-08-07', 0, 2, NULL, 10, 1, 2, false, '2014-08-11 12:56:22.267');
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (85, 2, 6, 'Conexiones desarrollo', '

En la siguiente ruta se encuentran los datos de las conexiones de desarrollo.

    
           REPO_ATENCION\docs\Conexiones

Cualquier duda con gusto la validamos.', NULL, NULL, 1, NULL, 2, NULL, 12, 0, '2014-10-06 11:13:28.326', '2014-10-06 11:13:28.326', '2014-10-06', 0, NULL, NULL, 85, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (86, 2, 6, 'Geografia Portal atencion a clientes', 'Hola!

Me podrias  apoyar por favor con los siguientes cambios:

   -- En el esquema Portal_Atencion sutituir las tablas de Pais e Idiomas que se encuentran actualmente en el esquema por las que se generaron en el esquema de monioreo.

   -- Generar las referencias necesarias

   -- Modificar todos los objetos para que apunten hacia las nuevas tablas del esquema monitore.

   -- Realizar las modificaciones al diagrama e/r

Gracias, cualquier duda con gusto la validamos.
', NULL, NULL, 1, 15, 2, NULL, 12, 0, '2014-10-06 12:06:50.183', '2014-10-06 12:06:50.183', '2014-10-06', 0, NULL, NULL, 86, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (43, 2, 4, 'Contrato para guardar preaclaracion', 'Contratos provisional para guardar preaclaracion y preaclaracion con detalle', NULL, NULL, 2, 9, 2, NULL, 9, 2, '2014-09-02 11:29:36.282', '2014-09-02 19:18:23.448', '2014-09-02', 0, NULL, NULL, 43, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (47, 2, 4, 'Servicios de obtención de catálogo de nacionalidad y catálogo de estado civil', 'Implementación de servicios de obtención de catálogo de nacionalidad y catálogo de estado civil', NULL, NULL, 1, 9, 2, NULL, 1, 0, '2014-09-03 12:42:50.228', '2014-09-03 12:42:50.228', '2014-09-03', 0, 2, NULL, 47, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (7, 2, 4, 'Logueo al sitio', 'Añadir la función de logueo a la plataforma', '2014-08-04', NULL, 5, 5, 2, NULL, 5, 1, '2014-08-04 11:32:07.009', '2014-08-26 11:41:07.428', '2014-08-04', 30, 5, NULL, 7, 1, 2, false, '2014-08-26 11:41:07.428');
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (87, 2, 6, 'ABC Catalogos Pais, canal, sucursal y divisa', 'Hola!!!

Me podrias apoyar por favor a generar los paquetes de ABC para las tablas del esquema de monitoreo (Pais, Divisa, Canal y Sucursal).

Otro cambio que se requiere es agregarle el campo FIIDPAIS a la tabla TARP_BITRULETA que se encuentra en el esquema de BITACORAS, este campo se debera colocar despues del campo FIIDPREGUNTA y debera tener referencia al campo FIIDPAIS del catalogo de paises que se encuentra en la tabla monitoreo.

Cualquier duda con gusto la validamos.

Gracias







', NULL, NULL, 1, NULL, 2, NULL, 12, 0, '2014-10-06 12:25:58.706', '2014-10-06 12:25:58.706', '2014-10-06', 0, NULL, NULL, 87, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (6, 2, 4, 'Búsqueda por teléfono celular y Cliente único', 'Búsqueda por teléfono celular (10 dígitos)
	CTE_UNICO.SPSELBACKCELNB(''5552142055'')

Búsqueda por Cliente único
	CTE_UNICO.SPSELBACKCUNB(1,1,2244,75734)
', NULL, NULL, 5, 4, 2, NULL, 3, 2, '2014-07-31 16:42:05.085', '2014-08-26 11:41:48.591', '2014-07-31', 0, NULL, 2, 2, 4, 5, false, '2014-08-26 11:41:48.591');
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (45, 2, 4, 'Implementación Servicio REST - Insertar en bitacora', 'Se realiza la implementación del servicio REST para insertar un registro en la bitacora

La URL para invocar el servicio REST mediante POST es:

http://localhost:8080/bocrw-atn-clientes/bitacora/insertBitacora

JSON Entrada

{
 "tipoUsr":2,
 "canal":1, 
 "numCte":351,
 "nombreCte":"Juan Perez",
 "usrId":"123456",
 "nombreUsr":"Pedro Hernandez",
 "idioma":1
}

Respuesta Exitosa
{
   "success":true,
   "errorCode":1,
   "folio":123
}


Respuesta Error

{
   "success":false,
   "errorCode":0,
   "errorMessage":"No existe dado de alta el Canal y Tipo de usuario en los catalogos "
}', '2014-09-02', NULL, 3, 14, 2, NULL, 14, 2, '2014-09-02 19:05:22.879', '2014-09-03 12:01:36.178', '2014-09-02', 100, 3, NULL, 45, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (46, 2, 4, 'Generar consecutivo de Preapertura', 'Necesitamos generar un número consecutivo que sea administrado a través de BD para incluirlo en las solicitudes que se envían a Alnova ya que dicha área nos pide que nosotros administremos nuestros propios ids.

Para lo anterios necesitamos una función que nos devuelva un id consecutivo de longitud 7, cuando se alcance el máximo 9,999,999 debe resetearse e iniciar de nuevo con el uno ya que así lo manejará alnova.', NULL, NULL, 1, 12, 2, NULL, 3, 1, '2014-09-02 19:22:47.305', '2014-09-03 13:05:47.498', '2014-09-02', 0, NULL, NULL, 46, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (3, 2, 4, 'Diseño portal', 'Crear pantallas iniciales', NULL, NULL, 3, 8, 2, NULL, 3, 2, '2014-07-28 13:55:00.382', '2014-09-15 09:51:49.307', '2014-07-28', 100, NULL, NULL, 3, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (8, 2, 4, 'Diseño búsqueda Cliente Único', '', NULL, NULL, 3, 8, 2, NULL, 3, 7, '2014-08-06 18:22:47.514', '2014-09-18 11:04:07.084', '2014-08-06', 100, NULL, NULL, 8, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (44, 2, 4, 'contratos para bintarxproducto, clasificaciones alnova, docxpreaclaracion', 'Servicios para consultar un producto a partir de un bin de tarjeta, las clasificaciones alnova(movimientos tarjeta, movimientos cuenta, retenciones modificación datos) y consultar documentos por preaclaracion.
', NULL, NULL, 1, NULL, 2, NULL, 9, 8, '2014-09-02 11:34:53.269', '2014-09-05 11:13:03.361', '2014-09-02', 0, NULL, NULL, 44, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (20, 2, 4, 'Implementación de Servicios REST Aclaraciones', 'Se realizo la implementación de los siguientes servicios
 - Consulta de preaclaraciones y aclaraciones asociadas a un cliente
 - Detalle de una preaclaración
 - Detalle de una aclaración
 - Consulta de los datos del canal de captura
 - Inserción y actualización de los datos del canal de captura', '2014-08-26', NULL, 3, 14, 2, NULL, 14, 21, '2014-08-26 10:07:43.25', '2014-10-10 11:23:45.731', '2014-08-19', 100, 40, NULL, 20, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (24, 2, 4, 'Diseño segunda fase', 'Hola les envío el diseño que están implementando los demás sistemas de Acertum. La idea es que sea el mismo estilo y css para todas nuestras páginas.', NULL, NULL, 3, 8, 2, NULL, 3, 2, '2014-08-27 11:58:25.483', '2014-09-18 11:02:38.267', '2014-08-27', 100, NULL, NULL, 24, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (16, 2, 4, 'Nueva versión de diseño portal', 'Implementar el diseño del login y pantalla de cliente con detalles de acuerdo a lo mostrado en el pdf.', NULL, NULL, 3, 8, 2, NULL, 3, 1, '2014-08-19 12:01:18.374', '2014-09-18 11:03:03.695', '2014-08-19', 100, NULL, NULL, 16, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (12, 2, 4, 'Implementar diseño de login', 'Implementar diseño de login enviado por diseño', NULL, NULL, 3, 8, 2, NULL, 3, 3, '2014-08-12 19:45:19.259', '2014-09-18 11:03:27.15', '2014-08-12', 100, NULL, NULL, 12, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (13, 2, 4, 'Dashboard', 'Flujo de secuencia para componentes del dahsboard, productos de inversion y cuentas del cliente unico', '2014-08-19', NULL, 1, 4, 1, NULL, 8, 0, '2014-08-15 12:36:11.987', '2014-08-15 12:36:11.987', '2014-08-15', 10, 16, NULL, 13, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (19, 3, 4, 'Servicios REST Dashboard', 'Estructura de petición y respuesta para servicios REST dashboard

*//Solicitud de productos para cliente unico acertum
//res/productoscu/85553*

{"codError":1, "descripcion":"solicitud procesada", "productos" : [{"idproducto":1, "nombre": "Ganare Selecto", "estacontratado": true, "cuentaeje": "45781030478049", "saldo": 98765999, "cuentaclabe": "45781030478049000", "plazo":"90",  "taza": 4.10, "fechacontrato": "10/04/2014", "retenido": 12345, "disponible": 98798754, "montominimo": 100000, "muestradetalle": false, "posicion": 0},{"idproducto":2, "nombre": "Inversión Selecta", "estacontratado": true, "cuentaeje": "87400254796341", "saldo": 87541, "cuentaclabe": "87400254796341666", "plazo":"90", "taza": 1.57, "fechacontrato": "14/07/2014", "retenido": 12345, "disponible": 98798754, "montominimo": 4548, "muestradetalle": false, "posicion": 1},{"idproducto":3, "nombre": "Cede Selecto", "estacontratado": false, "cuentaeje": "", "saldo": 0, "muestradetalle": false, "posicion": 2},{"idproducto":4, "nombre": "Mercado de Dinero", "estacontratado": false, "cuentaeje": "", "saldo": 0, "muestradetalle": false, "posicion": 3},{"idproducto":5, "nombre": "Pagare Selecto VIP", "estacontratado": false, "cuentaeje": "45781030478049", "saldo": 98765, "muestradetalle": false, "posicion": 4}]}


*//Solicitud de resumen de 5 movimientos por producto
//res/resumen/producto/85553/1/12345678900000*

{"codError":1, "descripcion":"solicitud procesada", "movimientos": [{"fecha": "10/08/2014","concepto": "Transferencia de terceros","importe": 1231234445}, {"fecha": "12/08/2014","concepto": "Pago de servicios","importe": 5657}, {"fecha": "11/08/2014","concepto": "Inversión 7 días","importe": 32587}, {"fecha": "14/08/2014","concepto": "Pago de tarjeta de crédito","importe": 5478},{"fecha": "15/08/2014","concepto": "Pago de Colegiatura","importe": 9874}]}


*//Solicitud detalle de movimientos por producto
//res/detalle/producto/85553/1/12345678900000*

{"codError":1, "descripcion":"solicitud procesada", "movimientos": [{"fecha": "10/08/2014","concepto": "Transferencia de terceros","importe": 1, "saldo": 1234578}, {"fecha": "12/08/2014","concepto": "Pago de servicios","importe": -2, "saldo": 1234578}, {"fecha": "11/08/2014","concepto": "Inversión 7 días","importe": -3, "saldo": 1234578}, {"fecha": "14/08/2014","concepto": "Pago de tarjeta de crédito","importe": 4, "saldo": 1234578},{"fecha": "15/08/2014","concepto": "Pago de Colegiatura","importe": 5, "saldo": 1234578},{"fecha": "01/08/2014","concepto": "Pago de servicios","importe": 6, "saldo": 1234578},{"fecha": "25/07/2014","concepto": "Pago de tarjeta","importe": 7, "saldo": 1234578},{"fecha": "24/07/2014","concepto": "Inversión plazo corto","importe": 8, "saldo": 1234578},{"fecha": "22/07/2014","concepto": "Inversión plazo corto","importe": 9, "saldo": 1234578},{"fecha": "20/07/2014","concepto": "Colegiatura","importe": 10, "saldo": 1234578},{"fecha": "18/07/2014","concepto": "Mensualidad club deportivo","importe": 11, "saldo": 1234578},{"fecha": "17/07/2014","concepto": "Pension estacionamiento","importe": 12, "saldo": 1234578},{"fecha": "15/07/2014","concepto": "Curso de certificacion","importe": 13, "saldo": 1234578},{"fecha": "14/07/2014","concepto": "Pension familiar","importe": 14, "saldo": 1234578},{"fecha": "13/07/2014","concepto": "Renta establecimiento","importe": 15, "saldo": 1234578},{"fecha": "12/07/2014","concepto": "Rendimientos asociados SA","importe": 16, "saldo": 1234578},{"fecha": "10/07/2014","concepto": "Renta departamento","importe": 17, "saldo": 1234578},{"fecha": "07/07/2014","concepto": "Inversión plazo corto","importe": 18, "saldo": 1234578},{"fecha": "04/07/2014","concepto": "Adelamto rendimientos","importe": 19, "saldo": 1234578},{"fecha": "02/07/2014","concepto": "Reservacion vuelo","importe": 20, "saldo": 1234578},{"fecha": "01/07/2014","concepto": "Contrato inversion","importe": 21, "saldo": 1234578}]}', '2014-08-27', NULL, 2, 4, 2, NULL, 8, 0, '2014-08-25 18:38:45.281', '2014-08-25 18:38:45.281', '2014-08-25', 10, 16, NULL, 19, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (18, 2, 4, 'Tx alnova de consulta de cuenta', 'Obtener las tx alnova y de ser posible su contrato de interfaz para lo siguiente:

* Consultas de cuentas activas del cliente
* Consultas de detalle de cuenta
* Consultas de movimientos de cuenta', NULL, NULL, 1, 9, 3, NULL, 3, 2, '2014-08-25 12:50:21.453', '2014-08-25 19:03:15.428', '2014-08-25', 0, NULL, NULL, 18, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (14, 2, 4, 'Contratos de interfaz ', '*Envio los contratos de interfaz de los procedimientos.*

  1.-Se realizo la modificación al procedimiento PORTAL_ATENCION.PKMXSG_VISTAROL.SPMXSELROLES para que la busqueda sea por id en lugar de url de la vista (DocContrato_SelRoles.doc)
 
  2.-Se realizo el procedimiento de consultas simple de vistas ()

  3.-Se realizo el paquete para insercion, actualizacion y eliminacion de tokens (ConInterfaz_SPMXINSUSERTOKN.doc,ConInterfaz_SPMXUPDUSERTOKN.doc,ConInterfaz_SPMXDELUSERTOKN.doc)

  4.- Se realizaro el procedimiento para consultar los datos de los usuarios por nombre de usuario, password y estatus (DocContrato_SelUsuarios.doc)

 



', NULL, NULL, 4, 1, 2, NULL, 12, 2, '2014-08-18 12:37:36.127', '2014-08-20 13:28:58.579', '2014-08-18', 20, 3, NULL, 14, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (17, 2, 4, 'Desarrollo de servicios de aclaraciones', 'Generar los servicios Rest de Aclaraciones necesarios para generación y consulta de folios.', NULL, NULL, 1, 1, 2, NULL, 3, 0, '2014-08-22 10:43:09.596', '2014-08-22 10:43:09.596', '2014-08-22', 0, NULL, NULL, 17, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (15, 2, 4, 'Alnova', 'as clases que se encuentran en el paquete com.bancoazteca.aclaracionesWS.externos.alnova 

las clases que pueden ser utilizadas para ajustarlo a otro proyecto son 


EjecutaAlnovaWS.java esta se utilizara para poner los metodos que ejecuten la transaccion

Estas clases hay que pasarlas completas si hay alguna que al momento de agregarla envie errores todas las clases estan en el paquete que te mencione

AlnovaWS.java
ResponseParser.java
DataField.java si hay alguna que haga falta al da', NULL, NULL, 1, 18, 2, NULL, 3, 6, '2014-08-18 20:08:01.836', '2014-08-22 12:25:55.515', '2014-08-18', 0, NULL, NULL, 15, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (2, 2, 4, 'Implementación WS cliente único', 'Buen dia

En base a la reunión sostenida esta mañana,  te hago llegar el medio por el cual podrás obtener información y pruebes la implementación del socket.

- Datos desarrollo 
- El medio es el socket de Cliente Único de las tiendas.
- IP: 10.50.193.20 ptto 9999
- Función a ejecutar: CTE_UNICO.WEBCU.SPSELCTEUNICOALNOVA
- Parámetros de entrada de la función: País, Canal Sucursal y Folio
- Respuesta de la Función: 

FIPAIS
FICANAL
FISUCURSAL
FIFOLIO
FCSUCURSAL_GESTORA
FCCUENTA
FCAPELLIDO_PATERNO
FCAPELLIDO_MATERNO
FCNOMBRE
FDFECHA_NACIMIENTO
FCTIPO_PRODUCTO
FCTIPO_SUBPRODUCTO
FCTIPOCLIENTEAHR
FCNUMERO_TARJETA
FCCLIENTE_ALNOVA


- Armado de la cadena

CTE_UNICO.WEBCU.SPSELCTEUNICOALNOVA(1,20,172,16414)

- Ejemplo de implementación del socket de CU:



- Respuesta que se obtiene del socket de CU:

Nota: del pipe a la izquierda son los meta datos, del pipe a la derecha es la información que corresponde a cada meta dato, se pude regresar una o mas cuentas por Cliente Único, en el segundo ejemplo tenemos un cliente que regresa tres registros tres cuentas, el pipe separa cada registro, el @END indica el final de la respuesta.

!img1.png!
!img2.png!

- Datos de prueba:

Clientes con cuentas de captación
1, 1, 100, 45662
1, 1, 100, 85553
1, 1, 172, 5350
1, 1, 1009, 49143
1, 1, 518, 509

Favor de hacer pruebas con clientes inexistentes.

Quedamos en espera de sus comentarios.

Saludos!!!!', NULL, NULL, 1, 4, 2, NULL, 3, 8, '2014-07-28 13:29:46.367', '2014-08-26 11:41:48.698', '2014-07-31', 50, NULL, NULL, 2, 1, 6, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (23, 2, 4, 'Implementación de JsonSerializer', 'Se realiza la implementación de JsonSerializer para los objetos tipo java.util.Date que estan siendo regresado como JSON', '2014-08-26', NULL, 3, 14, 2, NULL, 14, 0, '2014-08-26 19:02:50.756', '2014-08-26 19:02:50.756', '2014-08-26', 100, 0.5, NULL, 23, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (25, 2, 4, 'Diseño aclaraciones', 'Primer entrega del diseño de Aclaraciones a ser implementada en el formulario de prefolio.', NULL, NULL, 1, 5, 2, NULL, 3, 1, '2014-08-27 12:05:14.737', '2014-08-27 19:44:12.353', '2014-08-27', 0, NULL, NULL, 25, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (21, 2, 4, 'Implementación de Servicios REST Cliente', 'Se realiza la implementacion de los servicios REST
 - Consulta de cliente
 - Insercion ó actualizacion de cliente', '2014-08-26', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-26 18:59:46.425', '2014-08-29 18:27:22.413', '2014-08-26', 100, 5, NULL, 21, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (22, 2, 4, 'Implementación de Servicios REST Retenciones', 'Se realiza la implementacion del servicio REST de busqueda de retenciones', '2014-08-26', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-26 19:00:57.443', '2014-08-29 18:28:53.625', '2014-08-26', 100, 3, NULL, 22, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (34, 2, 4, 'Implementación Servicio REST - Guarda Retención', '

La URL para invocar el servicio por metodo POST es

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/guardarActualizarRetencion

1. Json entrada Para Guardar una retención

{
	"pais":"1",
	"tipoOperacion":1,
	"commitEnabled":1,
	"idPreAcl":659881,
	"tipoPreAcl":"N",
	"impRet":100.00,
	"conceptoRet":"",
	"fechaRet":"28/08/2014",
	"horaRet":"00:00",
	"tipoRet":"C",
	"usuarioModifico":"-"
}

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "idRetencion":"35690"
}

Respuesta con error

{
   "success":false,
   "errorCode":12,
   "idRetencion":null
}

2. Json entrada para actualizar una retención

{
	"pais":"1",
	"tipoOperacion":2,
	"commitEnabled":1,
	"idRetencion":35690,
	"idPreAcl":659881,
	"tipoPreAcl":"N",
	"impRet":100.00,
	"conceptoRet":"",
	"fechaRet":"28/08/2014",
	"horaRet":"00:00",
	"tipoRet":"C",
	"usuarioModifico":"-"
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "idRetencion":"35690"
}

Respuesta Error

{
   "success":false,
   "errorCode":12,
   "idRetencion":null
}
', '2014-08-28', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-28 18:24:13.189', '2014-09-01 11:17:09.168', '2014-08-28', 100, 2, NULL, 34, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (26, 2, 4, 'Listado Servicios Aclaraciones', '|_.	Task Name	|_.	Recurso	|_.	Terminado (Si/No)	|
|	Servicios Rest	|		|		|
|	*Login usuario*	|		|		|
|	      Servicio buscar usuario	|	Oscar	|		|
|	      Servicio UsuporRolPorSistemaPorPais	|	Oscar	|		|
|	      Servicio sucursalxpais	|	Oscar	|		|
|	      Servicio sucursal as400	|	Oscar	|		|
|	*Busqueda Cliente*	|		|		|
|	      Busqueda por cliente alnova	|	Oscar	|		|
|	      busqueda en tabla cliente	|	Victor	|		|
|	      Insercion tabla cliente	|	Victor	|		|
|	*Busqueda de listado de aclaraciones y preaclaracion*	|		|		|
|	      Busqueda de aclaraciones y preaclaracion	|	Victor	|		|
|	      Busqueda de detalle preaclaracion y aclaracion	|	Victor	|		|
|	      Detalle preaclaracion	|	Victor	|		|
|	      Detalle aclaracion	|	Victor	|		|
|	*Captura de preaclaracion*	|		|		|
|	      Busque da de productosxbin	|	Oscar	|		|
|	      Busqueda de clasificacion alnova	|	Oscar	|		|
|	      Busqueda e insercion de datos captura	|	Victor	|		|
|	      Busqueda de tipo operacion	|	Giovanni	|		|
|	      Busqueda de tipoaclaracion (spconstipoaclaracion)	|	Giovanni	|		|
|	      Busqueda de tipoaclaracion (spapptipoaclaaracion)	|	Giovanni	|		|
|	      Busqueda docsxoporte tipoacl	|	Giovanni	|		|
|	      Busqueda de movimientos de cuenta	|	Oscar	|		|
|	      Busqueda de movimientos de tarjeta	|	Oscar	|		|
|	      Busqueda de retenciones	|	Victor	|		|
|	      Busqueda de catalogo de tipo de datos	|	Victor	|		|
|	      Guarda Preaclaracion	|	Oscar	|		|
|	      Guarda movimientos	|	Giovanni	|		|
|	      Guardar retenciones	|	Giovanni	|		|
|	      Guardar modificacion de datos	|	Victor	|		|
|	*Captura de aclaracion*	|		|		|
|	      Consultar prefolio	|	Victor	|		|
|	      Digitalizar documentos	|	Oscar	|		|
|	      Guardar aclaracion	|	Giovanni	|		|
|	      Guardar movimientos CNBV	|	Victor	|		|
|	      Guardar historial aclaracion	|	Giovanni	|		|
', NULL, NULL, 1, NULL, 2, NULL, 3, 0, '2014-08-27 16:52:22.637', '2014-08-27 16:52:22.637', '2014-08-27', 0, NULL, NULL, 26, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (48, 2, 4, 'Contrato interfaz Cierre bitacora atención', 'Para el cierre del folio de atención ya se encuentra el contrato de interfaz en la siguiente ruta:

REPO_ATENCION\ci\BITACORAS\PKMXBT_ATNCION\ConInterfaz_SPMXUPDATENCION', NULL, NULL, 1, 14, 2, NULL, 3, 0, '2014-09-03 13:04:43.348', '2014-09-03 13:04:43.348', '2014-09-03', 0, NULL, NULL, 48, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (88, 2, 4, 'Modificacion tiempos de resolucion aclaraciones FCR', '
Solicito de su apoyo para realizar la modificacion en desarrollo de los tiempos de resolucion de las aclaraciones para el producto de cuenta selecta, considerando los tiempos en color amarillo que se muestran en la imagen.

!Tiempos FCR.png!


Gracias!! Cualquier duda con gusto la podemos validar.', NULL, NULL, 1, 9, 2, NULL, 12, 2, '2014-10-06 17:24:18.67', '2014-10-06 17:58:45.002', '2014-10-06', 0, NULL, NULL, 88, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (59, 2, 4, 'Contratos de interfaz Ruleta de preguntas', 'Se realizaron los siguientes procedimientos, para la interacción con la ruleta de preguntas

*1.- Consulta de preguntas*  (contrato de interfaz  REPO_ATENCION\ci\BITACORAS\PKMXRP_PREGUNTAS\ConInterfaz_SPMXSELPREGUNTS)

*2.- Consulta de numero de pregutas correctas y numero de errores* (contrato de interfaz   REPO_ATENCION\ci\BITACORAS\PKMXRP_RONDAS\ConInterfaz_SPMXSELRONDA)
*
3.- Insercion en bitacora de ruleta*  ( contrato de interfaz  \REPO_ATENCION\ci\BITACORAS\PKMXRP_RULETA\ConInterfaz_SPMXINSRULETA)

', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-09-09 19:07:34.628', '2014-09-09 19:07:34.628', '2014-09-09', 0, NULL, NULL, 59, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (30, 2, 4, 'Implementación de servicio REST - Búsqueda tipo aclaración app', 'Se realiza la implementación del servicio REST búsqueda de tipo aclaración app', '2014-08-27', NULL, 3, 14, 2, NULL, 14, 6, '2014-08-27 17:58:03.768', '2014-09-10 12:12:00.415', '2014-08-27', 100, 2.5, NULL, 30, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (29, 2, 4, 'Implementación de servicio REST - Búsqueda de tipo aclaración', 'Se realiza la implementación del servicio REST búsqueda de tipo aclaración', '2014-08-27', NULL, 3, 14, 2, NULL, 14, 8, '2014-08-27 17:56:35.597', '2014-09-05 11:09:47.956', '2014-08-27', 100, 2.5, NULL, 29, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (49, 2, 4, 'Bloqueo de pantalla', 'Implementar bloqueo de pantalla al realizar una acción para evitar múltiples peticiones del cliente.', NULL, NULL, 3, 8, 2, NULL, 3, 1, '2014-09-03 13:09:10.317', '2014-09-18 11:01:55.396', '2014-09-03', 100, NULL, NULL, 49, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (27, 2, 4, 'Implementación servicio Rest - Guardar modificación de datos', 'Se realiza la implementación del servicio REST guardar implementación de datos', '2014-08-27', NULL, 3, 14, 2, NULL, 14, 2, '2014-08-27 17:53:59.66', '2014-08-29 18:50:49.154', '2014-08-27', 100, 2, NULL, 27, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (31, 2, 4, 'Servicios de busqueda de movimientos tarjeta y cuenta alnova', 'Se crean servicios de consulta de movimientos de cuenta y tarjeta de alnova', NULL, NULL, 2, 9, 2, NULL, 9, 4, '2014-08-28 09:56:15.14', '2014-09-22 13:44:22.029', '2014-08-28', 0, NULL, NULL, 31, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (33, 2, 4, 'Implementación Servicio REST - Guarda Movimientos', 'La URL para invocar el servicio por metodo POST es 

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/guardarActualizarMovimiento

1. Json entrada Para Guardar un movimiento

{	
	"pais":"1",
	"tipoOperacion":1,
	"commitEnabled":1,
	"idPreAcl":105300,
	"tipoPreAcl":"N",
	"numMovto":10,
	"fechaMovto":"28/08/2014",
	"descMovto":"ABO.LIQ.INT.R",
	"impMovto":81.98,
	"folioAlnova":"0",
	"idBancoAdq":0,
	"impAfectacionCta":0,
	"comentarioMovto":"-",
	"tipoMovto":"0",
	"numAut":0,
	"divisa":"",
	"idTipoOperacion":0,
	"numRefMov":"74027668189200404225556",
	"giro":0,
	"numAfiliacion":"0",
	"idDevolucion":0,
	"montoReclamo":0,
	"estaCNBV":0,
	"idTipoAcl":96,
	"esFraude":"0",
	"reembolso":"",
	"idEstatusProsa":1,
	"capturista":"1",
	"eliminado":"0",
	"descCanalOper":"NA",
	"numextracto":"0",
	"numOperacion":"0",
	"voucherImg":"1",
	"codigo":99,
	"descCodigo":"-----"
}	

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "idMovto":"205505"
}

Respuesta con error

{
   "success":false,
   "errorCode":12,
   "idMovto":null
}

2. Json entrada para actualizar un movimiento

{	
	"pais":"1",
	"tipoOperacion":2,
	"commitEnabled":1,
	"idMovto":205505,
	"idPreAcl":105300,
	"tipoPreAcl":"N",
	"numMovto":10,
	"fechaMovto":"28/08/2014",
	"descMovto":"ABO.LIQ.INT.R",
	"impMovto":81.98,
	"folioAlnova":"0",
	"idBancoAdq":0,
	"impAfectacionCta":0,
	"comentarioMovto":"-",
	"tipoMovto":"0",
	"numAut":0,
	"divisa":"",
	"idTipoOperacion":0,
	"numRefMov":"74027668189200404225556",
	"giro":0,
	"numAfiliacion":"0",
	"idDevolucion":0,
	"montoReclamo":0,
	"estaCNBV":0,
	"idTipoAcl":96,
	"esFraude":"0",
	"reembolso":"",
	"idEstatusProsa":1,
	"capturista":"1",
	"eliminado":"0",
	"descCanalOper":"NA",
	"numextracto":"0",
	"numOperacion":"0",
	"voucherImg":"1",
	"codigo":99,
	"descCodigo":"-----"
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "idMovto":"205505"
}

Respuesta Error

{
   "success":false,
   "errorCode":12,
   "idMovto":null
}
', '2014-08-28', NULL, 3, 14, 2, NULL, 14, 0, '2014-08-28 18:21:00.455', '2014-08-28 18:21:00.455', '2014-08-28', 0, 2, NULL, 33, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (28, 2, 4, 'Implementación de servicio REST - Búsqueda de tipo operación', 'Se realiza la implementación del servicio REST búsqueda de tipo operación', '2014-08-27', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-27 17:55:27.635', '2014-08-29 18:24:06.075', '2014-08-27', 100, 2, NULL, 28, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (32, 2, 4, 'Servicios busqueda e insercion de usuarios', 'Se crean servicios para consultar e insertar usuarios', NULL, NULL, 1, 9, 2, NULL, 9, 3, '2014-08-28 10:50:56.799', '2014-08-29 19:01:33.096', '2014-08-28', 0, NULL, NULL, 32, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (50, 2, 4, 'Configuracion de app para despliegue en Jboss', 'Se realiza la configuracion necesaria en la aplicacion para realizar el despliegue en Jboss

En el archivo domain.xml de Jboss standalone se deben agregar los siguientes datasources

<datasource jta="false" jndi-name="java:jboss/datasources/jdbc/acertum" pool-name="AcertumDS" enabled="true" use-ccm="false">
                    <connection-url>jdbc:oracle:thin:@10.51.213.213:1521:ACERTUM</connection-url>
                    <driver-class>oracle.jdbc.OracleDriver</driver-class>
                    <connection-property name="autoCommit">
                        false
                    </connection-property>
                    <driver>oracle</driver>
                    <pool>
                        <min-pool-size>30</min-pool-size>
                        <max-pool-size>100</max-pool-size>
                    </pool>
                    <security>
                        <user-name>USRCENTRAL</user-name>
                        <password>C4J420144C3RT6M</password>
                    </security>
                    <validation>
                        <validate-on-match>false</validate-on-match>
                        <background-validation>false</background-validation>
                        <exception-sorter class-name="org.jboss.jca.adapters.jdbc.extensions.oracle.OracleExceptionSorter"/>
                    </validation>
                    <statement>
                        <share-prepared-statements>false</share-prepared-statements>
                    </statement>
                </datasource>
                <datasource jta="false" jndi-name="java:jboss/datasources/jdbc/atnctes" pool-name="AtnClientesDS" enabled="true" use-ccm="false">
                    <connection-url>jdbc:oracle:thin:@10.51.214.176:1521:BDATNCTES</connection-url>
                    <driver-class>oracle.jdbc.OracleDriver</driver-class>
                    <connection-property name="autoCommit">
                        false
                    </connection-property>
                    <driver>oracle</driver>
                    <pool>
                        <min-pool-size>30</min-pool-size>
                        <max-pool-size>100</max-pool-size>
                    </pool>
                    <security>
                        <user-name>PORTAL_ATENCION</user-name>
                        <password>portal_atencion01</password>
                    </security>
                    <validation>
                        <validate-on-match>false</validate-on-match>
                        <background-validation>false</background-validation>
                        <exception-sorter class-name="org.jboss.jca.adapters.jdbc.extensions.oracle.OracleExceptionSorter"/>
                    </validation>
                    <statement>
                        <share-prepared-statements>false</share-prepared-statements>
                    </statement>
                </datasource>', '2014-09-03', NULL, 3, 14, 2, NULL, 14, 0, '2014-09-03 13:18:28.123', '2014-09-03 13:18:28.123', '2014-09-03', 100, 1, NULL, 50, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (36, 2, 4, 'Implementación servicio REST - Guardar historial aclaración', 'La URL para invocar el servicio por metodo POST es

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/guardarActualizarHistAclaracion

1. Json entrada Para Guardar el historial de una aclaración

{
	"pais":"1",
	"tipoOperacion":1,
	"commitEnabled":1,
	"idAcl":618912,
	"idAccion":23,
	"idRol":1,
	"usuario":"777777",
	"fechaHistAcl":"01/07/14",
	"comentario":"ASIGNACION PROSA RETIROS",
	"fechaOrig":"01/07/14"
}

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "idHistAclaracion":100002265500
}

Respuesta con error

{
   "success":false,
   "errorCode":38,
   "idHistAclaracion":null
}

2. Json entrada para actualizar el historial de una aclaración

{
	"pais":"1",
	"tipoOperacion":2,
	"commitEnabled":1,
	"idHistAcl":100002265500,
	"idAcl":618912,
	"idAccion":23,
	"idRol":1,
	"usuario":"777777",
	"fechaHistAcl":"01/07/14",
	"comentario":"ASIGNACION PROSA RETIROS",
	"fechaOrig":"01/07/14"
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "idHistAclaracion":100002265500
}

Respuesta Error

{
   "success":false,
   "errorCode":38,
   "idHistAclaracion":null
}
', '2014-08-28', NULL, 3, 14, 2, NULL, 14, 0, '2014-08-28 18:30:11.664', '2014-08-28 18:30:11.664', '2014-08-28', 100, 2, NULL, 36, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (51, 2, 4, 'Contrato interfaz bitacoras codificacion', '*+Bitacoras para codificacion+*

Ya se encuentran en las rutas del repositorio los contratos de interfaz para:

+Cierre de atencion+

    REPO_ATENCION\ci\BITACORAS\PKMXBT_ATNCION\ConInterfaz_SPMXUPDATENCION

+Generacion de nueva accion+
   
    REPO_ATENCION\ci\BITACORAS\PKMXBT_ACCIONES\ConInterfaz_SPMXINSACCION

Favor de confirmar si se requiere algo adicional para la generación de los servicios    ', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-09-03 13:23:58.966', '2014-09-03 13:23:58.966', '2014-09-03', 0, NULL, NULL, 51, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (52, 2, 4, 'Implementación Servicio REST - Actualizar bitacora', 'Se realiza la implementación del servicio REST que actualiza un registro en la bitacora

URL (POST) http://localhost:8080/bocrw-atn-clientes/rs/bitacora/updateBitacora

JSON Entrada

{
 "folio":12,
 "idEncuesta":20,
 "califEncuesta":9,
 "estatus":1,
 "idioma":1
}

Respuesta Exitosa

{
   "success":true,
   "codigo":1,
   "descripcion":"Proceso terminado correctamente."
}

Respuesta Error

{
   "success":false,
   "codigo":0,
   "descripcion":"Se han violado los contraints de los parametros de entrada"
}', '2014-09-03', NULL, 3, 14, 2, NULL, 14, 0, '2014-09-03 16:40:57.957', '2014-09-03 16:40:57.957', '2014-09-03', 100, 2, NULL, 52, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (60, 2, 4, 'Implementación servicio REST Consultar catalogo casos', 'Se realiza la implementación del servicio para consultar el catalogo de casos en base a un producto

URL invocacion por metodo POST

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/consultarCatCaso

JSON Entrada

{
"pais":"1",
"idProducto":1
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "lstCatCasos":[
      {
         "idCaso":1,
         "descCaso":"Desc caso 1",
         "fecha":true
      },
      {
         "idCaso":2,
         "descCaso":"Desc caso 2",
         "fecha":false
      },
      {
         "idCaso":3,
         "descCaso":"Desc caso 3",
         "fecha":true
      },
      {
         "idCaso":4,
         "descCaso":"Desc caso 4",
         "fecha":false
      },
      {
         "idCaso":5,
         "descCaso":"Desc caso 5",
         "fecha":true
      }
   ]
}', NULL, NULL, 4, 14, 2, NULL, 14, 1, '2014-09-10 17:21:16.827', '2014-09-11 11:15:17.182', '2014-09-10', 80, NULL, NULL, 60, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (57, 2, 4, 'Adecuación en parametros para agregar accion', 'De acuerdo a lo solicitado se agregaron los siguientes parametros de entrada en el procedimiento alta de accion PKMXBT_ACCIONES.SPMXINSACCION

*+Parametros+*
PE_RESOLUCION
PE_NUMCLIENTE
PE_NOMCLIENTE
PE_CANAL
PE_IDENCUESTA
PE_CALIFENCUENTA

El contrato de interfaz se encuentra en la ruta  REPO_ATENCION\ci\BITACORAS\PKMXBT_ACCIONES\ConInterfaz_SPMXINSACCION

De igual forma se agrego el parametro de entrada PE_RESOLUCION en el procedimiento de cierre de bitacora PKMXBT_ACCIONES.SPMXUPDCIERREAC el cual se encuentra en la ruta REPO_ATENCION\ci\BITACORAS\PKMXBT_ACCIONES\ConInterfaz_SPMXUPDCIERREAC
', NULL, NULL, 1, 4, 2, NULL, 12, 3, '2014-09-08 16:18:51.532', '2014-09-08 19:13:48.675', '2014-09-08', 0, NULL, NULL, 57, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (53, 2, 4, 'Implementación dashboard', 'El documento se encuentra en el repo en la siguiente ruta ...\Disenio\AtnClientes\Portal Asesor Post-login.pdf', NULL, NULL, 3, 8, 2, NULL, 3, 1, '2014-09-04 12:47:28.878', '2014-09-18 11:00:41.556', '2014-09-04', 100, NULL, NULL, 53, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (69, 2, 4, 'Consulta catalogos codificacion', 'Se generaron los siguientes objetos para la consulta de los catalogos:

*+TEMA+*

Ruta contrato de interfaz:  

                              REPO_ATENCION\ci\BITACORAS\PKMXBT_TEMAS\ConInterfaz_SPMXSELTEMA

*+SUBTEMA+*

Ruta contrato de interfaz:  

                              REPO_ATENCION\ci\BITACORAS\PKMXBT_SUBTEMAS\ConInterfaz_SPMXSELSUBTEMA

*+DETALLE+*

Ruta contrato de interfaz:  

                              REPO_ATENCION\ci\BITACORAS\PKMXBT_CODIFICA\ConInterfaz_SPMXSELCODIFICA

De igual forma se genero la modificacion para el objeto *PKMXBT_CODIFICA.SPMXSELCODIFICA* (agregando al inicio del cursor el id de codificacion)

Ruta contrato de interfaz:  

                              REPO_ATENCION\ci\BITACORAS\PKMXBT_CODIFICA\ConInterfaz_SPMXSELCODIFICA


Cualquier duda con gusto la podemos validar.

Gracias!!!', '2014-09-22', NULL, 1, 3, 2, NULL, 12, 1, '2014-09-22 11:27:02.734', '2014-09-22 15:58:37.549', '2014-09-22', 100, 5, NULL, 69, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (37, 2, 4, 'Implementación servicio REST - Guardar movimiento CNBV', '

La URL para invocar el servicio por metodo POST es

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/guardarActualizarMovimientoCNBV

1. Json entrada Para Guardar un movimiento CNBV

{
	"pais":"1",
	"tipoOperacion":1,
	"commitEnabled":1,
	"idAcl":661713,
	"idMovto":205457,
	"subfolio":"1234",
	"idFallo":2,
	"comentario":"comment",
	"montoAbonado":10.00,
	"fechaAbono":"28/08/2014",
	"esQuebranto":1,
	"idCausaResolucion":1,
	"usuarioModifico":"300584"
}

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "idAclaracion":"661713"
}

Respuesta con error

{
   "success":false,
   "errorCode":43,
   "idAclaracion":null
}

2. Json entrada para actualizar un movimiento CNBV

{
	"pais":"1",
	"tipoOperacion":2,
	"commitEnabled":1,
	"idAcl":661713,
	"idMovto":205457,
	"subfolio":"1234",
	"idFallo":2,
	"comentario":"comment",
	"montoAbonado":10.00,
	"fechaAbono":"28/08/2014",
	"esQuebranto":1,
	"idCausaResolucion":1,
	"usuarioModifico":"300584"
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "idAclaracion":"661713"
}

Respuesta Error
{
   "success":false,
   "errorCode":43,
   "idAclaracion":null
}
', '2014-08-28', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-28 19:36:28.637', '2014-09-01 11:03:51.3', '2014-08-28', 100, 2, NULL, 37, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (40, 2, 4, 'Implementación de Servicio REST - Consulta Catalogo Datos Personales', 'La URL para invocar el servicio por metodo POST es

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/consultarCatDatosPersonales

Json Entrada para consultar las opciones del catalogo de datos personales

{
"pais":"1",
"tipoOperacion":2
}

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "lstCatDatosPersonales":[
      {
         "idDatoPersonal":1,
         "descDatoPersonal":"NOMBRE",
         "activo":"1",
         "mesaControl":0,
         "maxCaracteres":20
      },
      {
         "idDatoPersonal":2,
         "descDatoPersonal":"APELLIDO PATERNO",
         "activo":"1",
         "mesaControl":1,
         "maxCaracteres":20
      },
      {
         "idDatoPersonal":3,
         "descDatoPersonal":"APELLIDO MATERNO",
         "activo":"1",
         "mesaControl":2,
         "maxCaracteres":20
      },
      {
         "idDatoPersonal":4,
         "descDatoPersonal":"CALLE",
         "activo":"1",
         "mesaControl":3,
         "maxCaracteres":25
      },
      {
         "idDatoPersonal":5,
         "descDatoPersonal":"NUMERO",
         "activo":"1",
         "mesaControl":4,
         "maxCaracteres":5
      },
      {
         "idDatoPersonal":6,
         "descDatoPersonal":"COLONIA",
         "activo":"1",
         "mesaControl":6,
         "maxCaracteres":55
      },
      {
         "idDatoPersonal":7,
         "descDatoPersonal":"ESTADO",
         "activo":"1",
         "mesaControl":7,
         "maxCaracteres":20
      },
      {
         "idDatoPersonal":8,
         "descDatoPersonal":"DELEGACION",
         "activo":"1",
         "mesaControl":8,
         "maxCaracteres":35
      },
      {
         "idDatoPersonal":9,
         "descDatoPersonal":"C.P.",
         "activo":"0",
         "mesaControl":0,
         "maxCaracteres":5
      },
      {
         "idDatoPersonal":10,
         "descDatoPersonal":"TELEFONO",
         "activo":"1",
         "mesaControl":10,
         "maxCaracteres":20
      },
      {
         "idDatoPersonal":11,
         "descDatoPersonal":"EXTENSION",
         "activo":"1",
         "mesaControl":11,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":12,
         "descDatoPersonal":"OTROS",
         "activo":"0",
         "mesaControl":0,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":13,
         "descDatoPersonal":"NACIONALIDAD",
         "activo":"1",
         "mesaControl":14,
         "maxCaracteres":10
      },
      {
         "idDatoPersonal":14,
         "descDatoPersonal":"ESTADO CIVIL",
         "activo":"1",
         "mesaControl":17,
         "maxCaracteres":10
      },
      {
         "idDatoPersonal":15,
         "descDatoPersonal":"CURP",
         "activo":"1",
         "mesaControl":12,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":16,
         "descDatoPersonal":"RFC",
         "activo":"1",
         "mesaControl":13,
         "maxCaracteres":19
      },
      {
         "idDatoPersonal":17,
         "descDatoPersonal":"NUMERO INTERIOR",
         "activo":"0",
         "mesaControl":0,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":18,
         "descDatoPersonal":"NUMERO EXTERIOR",
         "activo":"0",
         "mesaControl":5,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":19,
         "descDatoPersonal":"SEXO",
         "activo":"1",
         "mesaControl":15,
         "maxCaracteres":9
      },
      {
         "idDatoPersonal":20,
         "descDatoPersonal":"FECHA DE NACIMIENTO",
         "activo":"1",
         "mesaControl":16,
         "maxCaracteres":10
      },
      {
         "idDatoPersonal":21,
         "descDatoPersonal":"LUGAR DE NACIMIENTO",
         "activo":"0",
         "mesaControl":0,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":22,
         "descDatoPersonal":"OCUPACION",
         "activo":"0",
         "mesaControl":0,
         "maxCaracteres":0
      },
      {
         "idDatoPersonal":23,
         "descDatoPersonal":"ESTADO CIVIL",
         "activo":"1",
         "mesaControl":0,
         "maxCaracteres":1
      }
   ]
}

Respuesta Error

{
   "success":false,
   "errorCode":8,
   "lstCatDatosPersonales":[

   ]
}
', '2014-08-29', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-29 17:48:32.387', '2014-09-01 11:41:02.238', '2014-08-29', 100, 3, NULL, 40, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (39, 2, 4, 'Diseño folio generado', 'El diseño con especificaciones de la pantalla de generación de folio esta en el repo en la carpeta _*Disenio*_

', NULL, NULL, 1, 5, 2, NULL, 3, 0, '2014-08-29 12:42:18.487', '2014-08-29 12:42:18.487', '2014-08-29', 0, NULL, NULL, 39, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (54, 2, 4, 'Datos Cliente único', 'Es necesario un servicio que proporcione la información del cliente único para presentarla en el dashboard. Acutalmente, en el módulo de aclaraciones existe un servicio que proporciona la información del cliente. La estructura de ese objeto es la siguiente:

cliente = {
  ''nomCliente'': "",
  ''appatCliente'': "",
  ''apmatCliente'': "",
  ''calle'': "",
  ''numero'': "",
  ''colonia'': "",
  ''fechaNacimiento'': "",
  ''cp'': "",
  ''delegacion'': "",
  ''estado'': "",
  ''telefono'': "",
  ''extension'': "",
  ''nacionalidad'': "",
  ''codigoNacionalidad'': "",
  ''edoCivil'': "",
  ''curp'': "",
  ''rfc'': "",
  ''sexo'': ""
}

De esa manera, veriamos la forma de almacenar esta información en el front para que sea accesible sin tener que hacer múltiples solicitudes.', NULL, NULL, 4, 1, 2, NULL, 8, 4, '2014-09-04 12:54:12.399', '2014-09-09 18:58:18.804', '2014-09-04', 80, 1, NULL, 54, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (55, 2, 4, 'Bitácora nueva accion', 'Implementar el SP para inserción de acciones de bitácora, el contrato está en el repo:

_intNegocio\ci\BITACORAS\PKMXBT_ACCIONES\ConInterfaz_SPMXINSACCION_', '2014-09-04', NULL, 3, 14, 2, NULL, 3, 3, '2014-09-04 13:25:24.944', '2014-09-09 10:44:06.059', '2014-09-04', 100, 2, NULL, 55, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (41, 2, 4, 'Implementación Servicio REST - Consulta Documentos Soporte Por Tipo Aclaración', 'La URL para invocar el servicio REST mediante POST es

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/consultarDocsSoporteXTipoAclaracion

Json Entrada para consultar los documentos soporte

{
"pais":"1",
"tipoOperacion":4,
"idTipoAcl":998
}

{
"pais":"1",
"tipoOperacion":5,
"idTipoAcl":998,
"activo":"1",
"idEtapa":1
}

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "lstDocSoporteXTipoAcl":[
      {
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiiddocxtipoacl":2427,
         "catdocsoporte":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiiddocsoporte":3,
            "fcdescdocsoporte":"TICKET DE RETIRO",
            "fiiddocdig":321
         },
         "tipoaclaracion":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiidtipoacl":1000,
            "catmodulo":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidmodulo":null,
               "fiidsistema":null,
               "fiidmodulopadre":null,
               "fcactivo":null,
               "fcdescmodulo":null,
               "fcnomcortomodulo":null,
               "fcobservaciones":null
            },
            "catcaso":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidcaso":null,
               "fcdesccaso":null,
               "fcnomcortocaso":null,
               "fcobservaciones":null,
               "fccodigorazon":null
            },
            "cattipodias":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidtipodias":null,
               "fcdesctipodias":null
            },
            "catproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidproducto":null,
               "fcdescproducto":null,
               "fcnomcortoproducto":null,
               "fcobservaciones":null,
               "lstProdTipoClientes":[

               ]
            },
            "catsubproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidsubproducto":null,
               "fcdescsubproducto":null,
               "fcnomcortosubproducto":null,
               "fcobservaciones":null,
               "fcdescproducto":"",
               "totalproducto":"",
               "totalsubproducto":"",
               "totalaclaraciones":"",
               "colUsuarios":[

               ]
            },
            "catclasificacion":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidclasificacion":null,
               "fcdescclasificacion":null,
               "fcnomcortoclasificacion":null,
               "fcobservaciones":null
            },
            "fitiempoestresol":null,
            "fccontaauto":null,
            "fcsolicitamonto":null,
            "fcactivo":null,
            "fccodigo":null,
            "fncomision":null,
            "lstDocSoporteTipoAcls":[

            ],
            "lstRespuestaTipoAcls":[

            ],
            "lstDespTipoAclaracions":[

            ],
            "lstTipoDatoProdTipoAcls":[

            ],
            "lstArchivoProsaAcl":[

            ]
         },
         "fcactivo":"1",
         "fiidetapa":1,
         "fiiddocgrupo":2006
      },
      {
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiiddocxtipoacl":2428,
         "catdocsoporte":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiiddocsoporte":33,
            "fcdescdocsoporte":"CARTA DE DESISTIMIENTO Y CARTA FINIQUITO",
            "fiiddocdig":431
         },
         "tipoaclaracion":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiidtipoacl":1000,
            "catmodulo":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidmodulo":null,
               "fiidsistema":null,
               "fiidmodulopadre":null,
               "fcactivo":null,
               "fcdescmodulo":null,
               "fcnomcortomodulo":null,
               "fcobservaciones":null
            },
            "catcaso":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidcaso":null,
               "fcdesccaso":null,
               "fcnomcortocaso":null,
               "fcobservaciones":null,
               "fccodigorazon":null
            },
            "cattipodias":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidtipodias":null,
               "fcdesctipodias":null
            },
            "catproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidproducto":null,
               "fcdescproducto":null,
               "fcnomcortoproducto":null,
               "fcobservaciones":null,
               "lstProdTipoClientes":[

               ]
            },
            "catsubproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidsubproducto":null,
               "fcdescsubproducto":null,
               "fcnomcortosubproducto":null,
               "fcobservaciones":null,
               "fcdescproducto":"",
               "totalproducto":"",
               "totalsubproducto":"",
               "totalaclaraciones":"",
               "colUsuarios":[

               ]
            },
            "catclasificacion":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidclasificacion":null,
               "fcdescclasificacion":null,
               "fcnomcortoclasificacion":null,
               "fcobservaciones":null
            },
            "fitiempoestresol":null,
            "fccontaauto":null,
            "fcsolicitamonto":null,
            "fcactivo":null,
            "fccodigo":null,
            "fncomision":null,
            "lstDocSoporteTipoAcls":[

            ],
            "lstRespuestaTipoAcls":[

            ],
            "lstDespTipoAclaracions":[

            ],
            "lstTipoDatoProdTipoAcls":[

            ],
            "lstArchivoProsaAcl":[

            ]
         },
         "fcactivo":"1",
         "fiidetapa":2,
         "fiiddocgrupo":2006
      },
      {
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiiddocxtipoacl":2425,
         "catdocsoporte":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiiddocsoporte":29,
            "fcdescdocsoporte":"DOC. RESPUESTA ANALISIS",
            "fiiddocdig":345
         },
         "tipoaclaracion":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiidtipoacl":1000,
            "catmodulo":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidmodulo":null,
               "fiidsistema":null,
               "fiidmodulopadre":null,
               "fcactivo":null,
               "fcdescmodulo":null,
               "fcnomcortomodulo":null,
               "fcobservaciones":null
            },
            "catcaso":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidcaso":null,
               "fcdesccaso":null,
               "fcnomcortocaso":null,
               "fcobservaciones":null,
               "fccodigorazon":null
            },
            "cattipodias":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidtipodias":null,
               "fcdesctipodias":null
            },
            "catproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidproducto":null,
               "fcdescproducto":null,
               "fcnomcortoproducto":null,
               "fcobservaciones":null,
               "lstProdTipoClientes":[

               ]
            },
            "catsubproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidsubproducto":null,
               "fcdescsubproducto":null,
               "fcnomcortosubproducto":null,
               "fcobservaciones":null,
               "fcdescproducto":"",
               "totalproducto":"",
               "totalsubproducto":"",
               "totalaclaraciones":"",
               "colUsuarios":[

               ]
            },
            "catclasificacion":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidclasificacion":null,
               "fcdescclasificacion":null,
               "fcnomcortoclasificacion":null,
               "fcobservaciones":null
            },
            "fitiempoestresol":null,
            "fccontaauto":null,
            "fcsolicitamonto":null,
            "fcactivo":null,
            "fccodigo":null,
            "fncomision":null,
            "lstDocSoporteTipoAcls":[

            ],
            "lstRespuestaTipoAcls":[

            ],
            "lstDespTipoAclaracions":[

            ],
            "lstTipoDatoProdTipoAcls":[

            ],
            "lstArchivoProsaAcl":[

            ]
         },
         "fcactivo":"1",
         "fiidetapa":2,
         "fiiddocgrupo":2006
      },
      {
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiiddocxtipoacl":2426,
         "catdocsoporte":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiiddocsoporte":1,
            "fcdescdocsoporte":"CARTA RECLAMO",
            "fiiddocdig":319
         },
         "tipoaclaracion":{
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiidtipoacl":1000,
            "catmodulo":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidmodulo":null,
               "fiidsistema":null,
               "fiidmodulopadre":null,
               "fcactivo":null,
               "fcdescmodulo":null,
               "fcnomcortomodulo":null,
               "fcobservaciones":null
            },
            "catcaso":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidcaso":null,
               "fcdesccaso":null,
               "fcnomcortocaso":null,
               "fcobservaciones":null,
               "fccodigorazon":null
            },
            "cattipodias":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidtipodias":null,
               "fcdesctipodias":null
            },
            "catproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidproducto":null,
               "fcdescproducto":null,
               "fcnomcortoproducto":null,
               "fcobservaciones":null,
               "lstProdTipoClientes":[

               ]
            },
            "catsubproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidsubproducto":null,
               "fcdescsubproducto":null,
               "fcnomcortosubproducto":null,
               "fcobservaciones":null,
               "fcdescproducto":"",
               "totalproducto":"",
               "totalsubproducto":"",
               "totalaclaraciones":"",
               "colUsuarios":[

               ]
            },
            "catclasificacion":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidclasificacion":null,
               "fcdescclasificacion":null,
               "fcnomcortoclasificacion":null,
               "fcobservaciones":null
            },
            "fitiempoestresol":null,
            "fccontaauto":null,
            "fcsolicitamonto":null,
            "fcactivo":null,
            "fccodigo":null,
            "fncomision":null,
            "lstDocSoporteTipoAcls":[

            ],
            "lstRespuestaTipoAcls":[

            ],
            "lstDespTipoAclaracions":[

            ],
            "lstTipoDatoProdTipoAcls":[

            ],
            "lstArchivoProsaAcl":[

            ]
         },
         "fcactivo":"1",
         "fiidetapa":1,
         "fiiddocgrupo":2006
      }
   ]
}

Respuesta Error

{
   "success":false,
   "errorCode":25,
   "lstDocSoporteXTipoAcl":[

   ]
}
', '2014-08-29', NULL, 3, 14, 2, NULL, 14, 1, '2014-08-29 17:53:07.392', '2014-09-12 13:20:43.507', '2014-08-29', 100, 3, NULL, 41, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (66, 2, 4, 'Procedimiento para consulta de acciones por numero de cliente', '*+Consulta principal de acciones+*

Ya se encuentra en el repositorio el contrato de interfaz para la consulta de acciones por cliente.

Este procedimiento recibe un numero de cliente y muestra como resutado las acciones que tiene pendientes, asi como las ultimas 10 cerradas.

Ruta de contrato de interfaz:

            *REPO_ATENCION\ci\BITACORAS\PKMXBT_VISTAPAGINA\ConInterfaz_SPMXSELCTEACCION*

*+Consulta para descripcion de codificacion+*

Este procedimiento recibe el id de codificacion y regresa la descripcion tanto del tema, sub-tema y detalle de dicha accion, en caso de ser nulo ó no encontrarse dado de alta en el catalogo mustras los valores por default que indican que no se encuentra codificada dicha accion.

Ruta de contrato de interfaz:

            *REPO_ATENCION\ci\BITACORAS\PKMXBT_VISTAPAGINA\ConInterfaz_SPMXSELCODIFICA*

Gracias!!!
       ', '2014-09-18', NULL, 1, 3, 2, NULL, 12, 2, '2014-09-18 12:11:38.747', '2014-09-18 18:38:45.046', '2014-09-18', 100, 2.5, NULL, 66, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (38, 2, 4, 'Repositorio documentos', '
*_Instalar y configurar el repositorio de documentos de acuerdo a lo siguiente:_*

_Los datos para acceder al repositorio de documentos están en la siguiente ruta:_
http://10.51.215.38:18060/projects/gerencia/wiki/Subversion

_Estructura:_

*ci* 	    - Carpeta para contratos de interfaz que se distribuirán tanto entre ustedes como a otras áreas.				
*diagramas* - Documentación como diagramas de flujo, de proceso, de estados, etc. Todo lo que necesiten documentar sobre sus procesos en particular.
*docs* 	    - Aquí deberán subir los documentos relevantes para desarrollo como manuales, tutoriales, etc.
*Disenio* - Material relacionado al diseño del front del portal.


En las carpetas antes mencionadas será necesario crear subcarpetas por módulo para no mezclar información. Iremos agregando carpetas y subcarpetas de acuerdo a las necesidades. ', NULL, NULL, 1, NULL, 2, NULL, 3, 1, '2014-08-29 12:41:46.709', '2014-09-22 19:16:31.909', '2014-08-29', 0, NULL, NULL, 38, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (42, 1, 4, 'libreria ngTable', 'Se deben modificar los siguientes componentes:

<table *ng-table="listaAclaraciones"* class="table table-striped ng-table-rowselected">
    <tr ng-repeat="folio in $data">
        <td data-title="''Prefolio''" *sortable="''folio''"*>{{folio.folio}}</td>
        <td data-title="''Producto''" sortable="''producto''">{{folio.producto}}</td>
        <td data-title="''Subproducto''" sortable="''subProducto''">{{folio.subProducto}}</td>
        <td data-title="''Clasificacion''" sortable="''clasificacion''">{{folio.clasificacion}}</td>
        <td data-title="''Caso''" sortable="''caso''">{{folio.caso}}</td>
        <td data-title="''Status''" sortable="''estatus''">{{folio.estatus}}</td>
    </tr>
</table>

En el JS:

*$scope.data* = datares.lstAclaraciones;
            *$scope.listaAclaraciones* = new ngTableParams({
                $liveFiltering: true,
                page: 1,            // show first page
                count: 10,           // count per page
                sorting: {
                        folio: ''desc'' // ordenamiento inicial
                    }
            }, {
                counts: [],
                total: *$scope.data*.length, // length of data
                getData: function($defer, params) {
                    var orderedData = params.sorting() ? $filter(''orderBy'')(*$scope.data*, params.orderBy()) : *$scope.data*;
                    params.total(orderedData.length);
                    $defer.resolve(*$scope.data*.slice((params.page() - 1) * params.count(), params.page() * params.count()));
                }
            });

Tambien debes tener cuidado de no mezclar el objeto data para las tablas, me di cuenta que intentas tener dos tablas en la misma página, tal vez eso te pueda causar conflictos.

Saludos', '2014-09-02', NULL, 2, 5, 2, NULL, 8, 1, '2014-09-01 10:41:28.346', '2014-09-01 10:45:14.314', '2014-09-01', 50, 16, NULL, 42, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (56, 2, 4, 'Implementación servicio REST - Consulta catalogo nacionalidad', 'Se realiza la implementación del servicio para obtener el catalogo de nacionalidad

URL de invocación por metodo POST

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/consultarCatEstadoDatoPer

JSON Entrada

{
"pais":"1",
"tipoOperacion":3,
"idDatoPersonal":13,
"activo":"1"
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "lstEstadoDatoPer":[
      {
         "idCombo":1,
         "descCombo":"MEXICANO",
         "codigo":"001"
      },
      {
         "idCombo":2,
         "descCombo":"GUATEMALTECO",
         "codigo":"002"
      },
      {
         "idCombo":3,
         "descCombo":"ANTILLANO",
         "codigo":"003"
      },
      {
         "idCombo":4,
         "descCombo":"ARGENTINO",
         "codigo":"004"
      },
      {
         "idCombo":5,
         "descCombo":"BAHAMES",
         "codigo":"005"
      },
      {
         "idCombo":6,
         "descCombo":"BARBADENSE",
         "codigo":"006"
      },
      {
         "idCombo":7,
         "descCombo":"BELICENO",
         "codigo":"007"
      },
      {
         "idCombo":8,
         "descCombo":"BOLIVIANO",
         "codigo":"008"
      },
      {
         "idCombo":9,
         "descCombo":"BORICUA",
         "codigo":"009"
      },
      {
         "idCombo":10,
         "descCombo":"BRASILENO",
         "codigo":"010"
      },
      {
         "idCombo":11,
         "descCombo":"BRASILERO",
         "codigo":"011"
      },
      {
         "idCombo":12,
         "descCombo":"BRITANICAS",
         "codigo":"012"
      },
      {
         "idCombo":13,
         "descCombo":"CAIMANES",
         "codigo":"013"
      },
      {
         "idCombo":14,
         "descCombo":"CANADIENSE",
         "codigo":"014"
      },
      {
         "idCombo":15,
         "descCombo":"COLOMBIANO",
         "codigo":"015"
      },
      {
         "idCombo":16,
         "descCombo":"COSTARRICENSE",
         "codigo":"016"
      },
      {
         "idCombo":17,
         "descCombo":"CUBANO",
         "codigo":"017"
      },
      {
         "idCombo":18,
         "descCombo":"CHILENO",
         "codigo":"018"
      },
      {
         "idCombo":19,
         "descCombo":"DOMINICANO",
         "codigo":"019"
      },
      {
         "idCombo":20,
         "descCombo":"ECUATORIANO",
         "codigo":"020"
      },
      {
         "idCombo":21,
         "descCombo":"ESTADOUNIDENSE",
         "codigo":"021"
      },
      {
         "idCombo":22,
         "descCombo":"GRANADINO",
         "codigo":"022"
      },
      {
         "idCombo":23,
         "descCombo":"GUAYANES ",
         "codigo":"023"
      },
      {
         "idCombo":24,
         "descCombo":"GUYANES",
         "codigo":"024"
      },
      {
         "idCombo":25,
         "descCombo":"HAITIANO",
         "codigo":"025"
      },
      {
         "idCombo":26,
         "descCombo":"HONDURENO",
         "codigo":"026"
      },
      {
         "idCombo":27,
         "descCombo":"JAMAICANO",
         "codigo":"027"
      },
      {
         "idCombo":28,
         "descCombo":"MARTINIQUES",
         "codigo":"028"
      },
      {
         "idCombo":29,
         "descCombo":"NICARAG&Uuml;ENSE",
         "codigo":"029"
      },
      {
         "idCombo":30,
         "descCombo":"PANAMENO",
         "codigo":"030"
      },
      {
         "idCombo":31,
         "descCombo":"PARAGUAYO",
         "codigo":"031"
      },
      {
         "idCombo":32,
         "descCombo":"PERUANO",
         "codigo":"032"
      },
      {
         "idCombo":33,
         "descCombo":"PORTORRIQUENO",
         "codigo":"033"
      },
      {
         "idCombo":34,
         "descCombo":"SALVADORENO",
         "codigo":"034"
      },
      {
         "idCombo":35,
         "descCombo":"SANCRISTOBALENSE",
         "codigo":"035"
      },
      {
         "idCombo":36,
         "descCombo":"SANTALUCENSE",
         "codigo":"036"
      },
      {
         "idCombo":37,
         "descCombo":"SANVICENTINO",
         "codigo":"037"
      },
      {
         "idCombo":38,
         "descCombo":"TRINITARIO",
         "codigo":"039"
      },
      {
         "idCombo":39,
         "descCombo":"URUGUAYO",
         "codigo":"040"
      }
   ]
}

Respuesta Error

{
   "success":false,
   "errorCode":8,
   "lstEstadoDatoPer":[

   ]
}', '2014-09-04', NULL, 3, 14, 2, NULL, 14, 1, '2014-09-04 17:01:17.1', '2014-09-04 19:12:41.145', '2014-09-04', 100, 2, NULL, 56, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (68, 2, 4, 'Implementación de Servicio REST - Abono automatico CAT', 'Se realiza la implementación del abono automatico de los movimientos de un folio de aclaración

URL por metodo POST http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/abonarCATAutomatico

JSONEntrada

{
"pais":"1",
"idAcl":4564,
"usuario":"dasdas"
}
', '2014-09-15', NULL, 2, 14, 2, NULL, 14, 2, '2014-09-19 10:55:30.27', '2014-10-06 18:32:03.068', '2014-09-12', 90, 8, NULL, 68, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (90, 2, 4, 'Modificacion de paquete para insecion en bitacora de ruleta', 'Se realizo un cambio al procedimiento PKMXRP_RULETA.SPMXINSRULETA, se agrego el campo de pais.

El contrato de interfaz ya se encuentra modificado en el repositorio en la ruta:


E:\2014\REPO_ATENCION\ci\BITACORAS\PKMXRP_RULETA\ConInterfaz_SPMXINSRULETA  

Cualquier duda con gusto la validamos', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-10-08 10:44:10.906', '2014-10-08 10:44:10.906', '2014-10-08', 0, NULL, NULL, 90, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (58, 2, 4, 'Aclaración inmediata', 'Implementar el funcionamiento de abono inmediato a cliente de acuerdo al diagrama incluido.

El documento se encuentra en el repo *diagramas/FlujoPropuestoAclaraciones.vsdx*', NULL, NULL, 1, 4, 2, NULL, 3, 0, '2014-09-09 09:59:15.712', '2014-09-09 09:59:15.712', '2014-09-09', 0, NULL, NULL, 58, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (67, 2, 4, 'Consulta de atencion por cliente', '*+Procedimiento para consultar atenciones de un cliente+*

Se encuentra en el repositorio el procedimiento que dado un número de cliente, una fecha de inicio y una de fin, asi como el estatus (1=Cerrado, 2=En proceso) realiza la consulta de todos los folios de atencion de ese cliente en especifico.

Ruta: 

     REPO_ATENCION\ci\BITACORAS\PKMXBT_VISTAPAGINA\ConInterfaz_SPMXSELCTEATENS 

*+Procedimiento para consultar todas las acciones de un folio de atencion+*

De igual forma se encuentra en el repositorio el procedimiento que dado un folio de atencion regresa todas las acciones correspondientes.

Ruta:

    REPO_ATENCION\ci\BITACORAS\PKMXBT_VISTAPAGINA\ConInterfaz_SPMXSELCTEACION 

Cualquier duda con gusto la validamos.

', '2014-09-19', NULL, 1, 3, 2, NULL, 12, 2, '2014-09-18 19:22:23.966', '2014-09-19 16:39:42.182', '2014-09-18', 50, 3, NULL, 67, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (91, 2, 4, 'Implementación cuenta mail', 'Implementar la nueva cuenta de correo en el proyecto de atención a clientes y en Aclaraciones

test@acertumfinancial.com

', NULL, NULL, 1, 19, 2, NULL, 3, 0, '2014-10-08 11:22:42.747', '2014-10-08 11:22:42.747', '2014-10-08', 0, NULL, NULL, 91, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (92, 1, 6, 'Modificacion tabla TAAC_BITAUTOACL', 'Se elimino la relacion existente entre la tabla CATMONTOSXCATCL en el esquema ACLARAMX y la tabla TAAC_BITAUTOACL en el esquema ATN_ACLACIONES.


El diagrama y los objetos ya se encuentran modificados.


', NULL, NULL, 1, 15, 2, NULL, 12, 0, '2014-10-08 11:43:59.812', '2014-10-08 11:43:59.812', '2014-10-08', 0, NULL, NULL, 92, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (93, 2, 4, 'Modificaciones reunión 08/10/2014', '*En solicitud, configurar fecha inicial con un mes de atraso y fecha final con fecha actual, ejemplo: 08/09/2014 y 08/10/2014
*En detalle aclaración agrupar cambiar el orden de fechas, en una columna tiempo estimado y fecha promesa, en la derecha fecha captura y fecha resolución
*En confirmación de mails se enviará el folio para ambos casos, manual y automática.
*El correo de notificación para automáticas se enviará sólo hasta que se haya aplicado el pago, se quita la notificación de "Será aplicado el día de hoy"
*En confirmación ordenar de acuerdo a lo siguiente: 1 - automáticas, 2-confirmación, 3-Datos aclaración,4-movimientos manual', NULL, NULL, 1, 5, 3, NULL, 3, 0, '2014-10-08 11:48:40.926', '2014-10-08 11:48:40.926', '2014-10-08', 0, NULL, NULL, 93, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (64, 2, 4, 'Servicio de cancelación de tarjeta', 'Implementación de servicio de cancelación de tarjeta (dummy)

URL: rs/tarjeta/{numTarjeta}
Method: DELETE
Response: {
"codigo": 1,
"descripcion": "",
"success": true,
"respuesta": 55555
}', NULL, NULL, 4, 19, 2, NULL, 1, 3, '2014-09-15 10:58:28.586', '2014-10-08 18:32:27.921', '2014-09-15', 80, 2, NULL, 64, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (35, 2, 4, 'Implementación servicio REST - Guardar Aclaracion', 'La URL para invocar el servicio por metodo POST es

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/guardarActualizarAclaracion

1. Json entrada Para Guardar una aclaración

{
	"pais":"1",
	"tipoOperacion":1,
	"commitEnabled":1,
	"idPreAcl":673273,
	"tipoPreAcl":"N",
	"flagReactiva":"0",
	"idAclAnt":0,
	"idSoporteXEstatus":4,
	"usuario":"300584",
	"idPrioridad":1,
	"bloqueo":"0",
	"idColor":0,
	"fechaCaptura":"30/07/14",
	"fechaVence":"30/06/14",
	"fechaResolucion":"25/06/14",
	"idfallo":0,
	"importeQuebranto":0
}

Respuesta Exitosa

{
   "success":true,
   "errorCode":0,
   "idAclaracion":631721
}

Respuesta con error

{
   "success":false,
   "errorCode":12,
   "idAclaracion":null
}

2. Json entrada para actualizar una aclaración

{
	"pais":"1",
	"tipoOperacion":2,
	"commitEnabled":1,
	"idAcl":631721,
	"idPreAcl":673273,
	"tipoPreAcl":"N",
	"flagReactiva":"0",
	"idAclAnt":0,
	"idSoporteXEstatus":4,
	"usuario":"300584",
	"idPrioridad":1,
	"bloqueo":"0",
	"idColor":0,
	"fechaCaptura":"30/07/14",
	"fechaVence":"30/06/14",
	"fechaResolucion":"25/06/14",
	"idfallo":0,
	"importeQuebranto":0
}

Respuesta exitosa

{
   "success":true,
   "errorCode":0,
   "idAclaracion":631721
}

Respuesta Error

{
   "success":false,
   "errorCode":12,
   "idAclaracion":null
}', '2014-08-28', NULL, 3, 14, 2, NULL, 14, 7, '2014-08-28 18:27:31.276', '2014-10-02 17:16:33.382', '2014-08-28', 100, 2, NULL, 35, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (94, 2, 4, 'Generacion de procedimientos para Monitoreo de servidores', 'Se generaron los siguientes objetos en el esquema ATN_ACLARACIONES

TABLAS:

TAMN_MONSERV     (Tabla transaccional para monitoreo) 
TCMN_SERVIDORES  (Catalogo de servidores)

PROCEDIMIENTOS:

PKMXMN_MONSERV.SPMXINSMONSERV  (INSERSION PARA TABLA  TAMN_MONSERV )
PKMXMN_MONSERV.SPMXDELMONSERV  (ELIMINACION POR ID DE SERVIDOR PARA TABLA  TAMN_MONSERV ) 
PKMXMN_MONSERV.SPMXUPDMONSERV  (ACTUALIZACION POR ID DE SERVIDOR PARA TABLA  TAMN_MONSERV, SE PUEDEN ACTUALIZAR CUALQUIER CAMPO EXCEPTO EL ID DE SERVIDOR )  
PKMXMN_MONSERV.SPMXSELMONSERV  (CONSULTA PARA TABLA  TAMN_MONSERV ) 

PKMXMN_SERVIDOR.SPMXINSSERVIDOR  (INSERCION PARA CATALOGO TCMN_SERVIDORES
PKMXMN_SERVIDOR.SPMXDELSERVIDOR  (ELIMINACION PARA CATALOGO TCMN_SERVIDORES, POR ID DE SERVIDOR)
PKMXMN_SERVIDOR.SPMXUPDSERVIDOR  (ACTUALIZACION PARA CATALOGO TCMN_SERVIDORES, POR ID DE SERVIDOR, SE PUEDE ACTUALIZAR CUALQUIER CAMPO)
PKMXMN_SERVIDOR.SPMXSELSERVIDOR  (CONSULTA  PARA CATALOGO TCMN_SERVIDORES, SE PUEDE CONSULTAR POR ID DE SERVIDOR, NOMBRE E IP)

Los contratos de interfaz ya se encuentran en el repositorio de atencion a clientes en la siguiente ruta:

E:\2014\REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXMN_MONSERV
E:\2014\REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXMN_SERVIDOR

Cualquier duda con gusto la validamos.

', NULL, NULL, 1, 23, 2, NULL, 12, 1, '2014-10-09 18:54:24.387', '2014-10-09 19:00:46.08', '2014-10-09', 0, NULL, NULL, 94, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (89, 2, 4, 'Implementacion de servicios de cuenta', '*) Consulta de que cuentas y tarjetas asociadas tiene un cliente (por cliente unico) para los productos:
		Cuenta Selecta
		Inversión Selecta
		Ganaré Selecto
		Mercado de dinero

*) Detalle de una cuenta (búsqueda por número de cuenta) que devuelva: 
		Descripción de la Cuenta
		Cuenta CLABE (si aplica)
		Fecha de contrato/Apertura
		Plazo
		Tasa
		Saldo actual
		Fecha de próxima renovación (si aplica)
		Periodicidad de corte (si aplica)

*) Movimientos de cuenta y tarjeta (búsqueda por rango de fechas, cuenta/tarjeta) con el Layout:
		Fecha del movimiento
		Concepto
		Importe
		Saldo final después del movimiento (si se tiene y aplica)
	
		* En caso de se pueda encapsular lo requerido en 3 y 4, si la cuenta no tienen movimientos,  con que nos manden los datos del cabecero esta bien.

*) Servicio para cancelar una tarjeta de débito/crédito y otra para solicitar su reposición (o si se puede encapsular en uno solo con un parámetro de reposición estaría mejor) ', NULL, NULL, 1, 8, 3, NULL, 3, 1, '2014-10-07 09:47:07.685', '2014-10-10 11:45:31.802', '2014-10-07', 0, NULL, NULL, 89, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (95, 2, 6, 'Creacion de tablas relacionales esquema de monitoreo', 'Hola chicos:

Validando el esquema de monitoreo, note que hacian falta algunas tablas relacionales, estas tablas ya se encuentran actualizadas en el diagrama del repositorio.

Me podrian apoyar el día lunes con su creacion, asi como los procedimientos de insecion y elimnacion en los esquemas SADBDDES  y ACLBDDES, las tablas faltantes son:

 -TCGF_PAISDIVISA
 -TCGF_PAISCANAL
 -TCGF_CANALSUC

Mil gracias por su apoyo.

Saludos!!



', NULL, NULL, 1, 16, 2, NULL, 12, 0, '2014-10-10 17:09:20.933', '2014-10-10 17:09:20.933', '2014-10-10', 0, NULL, NULL, 95, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (96, 2, 4, 'Notificaciones masivas aclaraciones ordinarias', 'Hola:

Les envío la información solicitada.

Envia cursor con id de aclaraciones finalizadas manualmente por día.

 PKMXAC_ESTFINALES.SPMXSELESTFINAL

El contrato de interfaz, ya se encuentran en las rutas acostumbradas.

Para este proceso como ya se habia platicado se creo la tabla TAAC_AVISOS en donde se colocaran todos los fiidacl de aclaraciones a las que se ha notificado por día, esto para realizar los proceso en batch y  no repetir las notificaciones.

Para insertar los registros en esta tabla se puede realizar con el siguiente procedimiento.  PKMXAC_AVISOS.SPMXINSAVISOS



Cualqueir duda con gusto la validamos.', NULL, NULL, 1, 4, 2, NULL, 12, 0, '2014-10-13 13:08:02.885', '2014-10-13 13:08:02.885', '2014-10-13', 0, NULL, NULL, 96, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (97, 2, 6, 'Correccion en objetos validados por DBA''s', 'Hola:

Me podrias apoyar con la generacion de la siguiente tabla en el esquema ATN_ACLARACIONES 

Nombre:   TCAC_ESTBANAUT

El diagrama ya se encuentra actualizado en el repo.

De igual manera me podrias apoyar con su ABC respectivo por favor y con la carga de los siguientes datos:

1   =   APLICADOS
2   =   PENDIENTES

Muchas gracias!!  Cualquier duda con gusto la validamos. =D

 
  ', NULL, NULL, 1, 16, 2, NULL, 12, 0, '2014-10-13 17:23:15.031', '2014-10-13 17:23:15.031', '2014-10-13', 0, NULL, NULL, 97, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (61, 2, 4, 'Implementacion de servicio REST Busqueda de movimientos por producto y caso', 'Se realiza la implementacion de la busqueda de movimientos por producto y caso

URL Invocacion metodo POST

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/consultarMovimientos

JSON Entrada

//Cuando fecha en el catalogo de casos es true (Se refiere a un movimiento de tarjeta)
{
"pais":"1",
"idProducto":1,
"idCaso":1,
"numTarjeta":"5512380304869601",
"fechaMovto":"2014-08-01",
"funckey":"00"
}

//Cuando fecha en el catalogo de casos es false(Se refiere a un movimiento de cuenta)
{
"pais":"1",
"idProducto":1,
"idCaso":1,
"numCuenta":"59361362175069"
}

JSON respuesta

{
   "success":true,
   "errorCode":0,
   "idTipoDatoProducto":13,
   "lstConsultaMovtoAlnovaResponses":[
      {
         "idError":"1",
         "descError":"CONSULTA EJECUTADA CORRECTAMENTE",
         "finummovto":1,
         "strFechamovto":"03/08/2014",
         "fcdescmovto":"GPO FLECHA AMARILLA I  , LEON DE LOS A",
         "fnimpmovto":58.0,
         "fctipomovto":"COMPRA",
         "finumaut":424451,
         "fcdivisa":"MXP",
         "fcnumrefmov":"75445504215106674764172",
         "figiro":5969,
         "fcnumafiliacion":"0000000000",
         "strhoramovto":"06:11",
         "fimontoreclamo":58.0,
         "fiidbancoadquiriente":0,
         "numTajeta":"5512380304869601"
      },
      {
         "idError":"1",
         "descError":"CONSULTA EJECUTADA CORRECTAMENTE",
         "finummovto":1,
         "strFechamovto":"03/08/2014",
         "fcdescmovto":"BEST BUY 2028 ECOM     , CIUDAD DE MEX",
         "fnimpmovto":5399.0,
         "fctipomovto":"COMPRA",
         "finumaut":424560,
         "fcdivisa":"MXP",
         "fcnumrefmov":"75435294216717352578665",
         "figiro":5732,
         "fcnumafiliacion":"0000000000",
         "strhoramovto":"03:38",
         "fimontoreclamo":5399.0,
         "fiidbancoadquiriente":0,
         "numTajeta":"5512380304869601"
      },
      {
         "idError":"1",
         "descError":"CONSULTA EJECUTADA CORRECTAMENTE",
         "finummovto":2,
         "strFechamovto":"03/08/2014",
         "fcdescmovto":"OXXO GAS LIBRAMIENTO   , ESCOBEDO NL",
         "fnimpmovto":450.0,
         "fctipomovto":"COMPRA",
         "finumaut":423514,
         "fcdivisa":"MXP",
         "fcnumrefmov":"75412914216966610111401",
         "figiro":5541,
         "fcnumafiliacion":"0000000000",
         "strhoramovto":"03:38",
         "fimontoreclamo":450.0,
         "fiidbancoadquiriente":0,
         "numTajeta":"5512380304869601"
      },
      {
         "idError":"1",
         "descError":"CONSULTA EJECUTADA CORRECTAMENTE",
         "finummovto":3,
         "strFechamovto":"03/08/2014",
         "fcdescmovto":"OXXO LIBRAMIENTO NORES , GENERAL ESCOB",
         "fnimpmovto":75.0,
         "fctipomovto":"COMPRA",
         "finumaut":423687,
         "fcdivisa":"MXP",
         "fcnumrefmov":"75412914216967347689610",
         "figiro":5499,
         "fcnumafiliacion":"0000000000",
         "strhoramovto":"03:38",
         "fimontoreclamo":75.0,
         "fiidbancoadquiriente":0,
         "numTajeta":"5512380304869601"
      },
      {
         "idError":"1",
         "descError":"CONSULTA EJECUTADA CORRECTAMENTE",
         "finummovto":4,
         "strFechamovto":"03/08/2014",
         "fcdescmovto":"OXXO LIBRAMIENTO NORES , GENERAL ESCOB",
         "fnimpmovto":30.0,
         "fctipomovto":"COMPRA",
         "finumaut":423874,
         "fcdivisa":"MXP",
         "fcnumrefmov":"75412914216967347689636",
         "figiro":5499,
         "fcnumafiliacion":"0000000000",
         "strhoramovto":"03:38",
         "fimontoreclamo":30.0,
         "fiidbancoadquiriente":0,
         "numTajeta":"5512380304869601"
      }
   ]
}', NULL, NULL, 4, 14, 2, NULL, 14, 2, '2014-09-10 18:34:31.737', '2014-09-11 12:22:56.308', '2014-09-10', 80, NULL, NULL, 61, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (98, 2, 6, 'Generacion de objetos en esquema ATN_ACLARACIONES', 'Hola:

Me podrias apoyar con la generacion de la siguiente tabla en el esquema de aclaraciones, asi como su ABC.

TCAC_CASOSXPROD   (Este objeto ya se muestra en el diagrama entidad relacion)

Mil gracias, cualquier duda con gusto la validamos.

Saludos!!!', NULL, NULL, 1, 15, 2, NULL, 12, 0, '2014-10-14 17:32:29.458', '2014-10-14 17:32:29.458', '2014-10-14', 0, NULL, NULL, 98, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (62, 2, 4, 'Enviar correo de Pre-aclaración', '*ESPECIFICACIÓN*

* Dirección:
http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/preaclaracion/prefolio/email

* Método:
POST

* Cuerpo de la petición:
{
"nombreCliente":"NOMBRE DEL CLIENTE",
"fecha":"dd/MM/yyyy",
"prefolio":"000000"
}


*EJEMPLO*

POST - http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/preaclaracion/prefolio/email

{
"nombreCliente":"DANIEL VALENCIA CONTRERAS",
"fecha":"10/09/2014",
"prefolio":"676251"
}', NULL, NULL, 1, 5, 2, NULL, 4, 0, '2014-09-12 09:46:08.295', '2014-09-12 09:46:08.295', '2014-09-12', 0, NULL, NULL, 62, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (63, 2, 4, 'Modificaciones modulo de seguridad', '*+Modificaciones modulo de seguridad+*

Los contratos de interfaz se encuentran en el repositorio 

Repositorio de atencion a clientes   http://10.51.214.96:9880/atncCtes/trunk/intNegocio

1.- Código para tokens duplicados = 2
2.- Estatus inicial para tokens   = 1

\ci\PORTAL_ATENCION\PKMXSG_TOKENS

3.- Modificación para entregar en un arreglo los roles con la estructura (id rol, descripcion y estatus)
4.- Agregar apellidos a la salida de usuarios.

\ci\PORTAL_ATENCION\PKMXSG_USUARIOS
\ci\PORTAL_ATENCION\PKMXSG_VISTAROL
 
Cualquier duda con gusto la podemos validar.
', NULL, NULL, 1, 1, 2, NULL, 12, 0, '2014-09-12 19:28:16.776', '2014-09-12 19:28:16.776', '2014-09-12', 0, NULL, NULL, 63, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (99, 1, 4, 'Objetos para Administrador de Tareas', 'Buen día:

Se genero la estructura acordada en el esquema ATN_ACLARACIONES. Por otra parte ya se encuentran en el repositorio los contratos de interfaz para los siguientes procesos.

1.- E:\2014\REPO_ATENCION\ci\PORTAL_ATENCION\PKMXAT_CONFIG\ConInterfaz_SPMXINSCONFIG   ---Insercion hacia la tabla de configuracion
2.- E:\2014\REPO_ATENCION\ci\PORTAL_ATENCION\PKMXAT_CONFIG\ConInterfaz_SPMXSELCONFIG   ---Consulta de la tabla de configuracion
3.- E:\2014\REPO_ATENCION\ci\PORTAL_ATENCION\PKMXAT_DEPENDNCIA\ConInterfaz_SPMXINSDEPNDCIA  --Insercion de la tabla de dependencia
4.- E:\2014\REPO_ATENCION\ci\PORTAL_ATENCION\PKMXAT_DEPENDNCIA\ConInterfaz_SPMXSELDEPNDCIA  --Consulta de la tabla de dependencia

Cualquier duda quedo a tus órdenes

Saludos!! ', NULL, NULL, 1, 1, 2, NULL, 12, 0, '2014-10-14 18:41:36.659', '2014-10-14 18:41:36.659', '2014-10-14', 0, NULL, NULL, 99, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (65, 2, 7, 'Configuración del proyecto', 'El proyecto lo clonan con la siguiente línea:
_git clone ssh://gfarfanb@10.51.215.38:29418/~gfarfanb/projects/web/BoCRWCatalogManager.git_

h2. Ambiente

* NetBeans
* Gradle Plugin para NetBeans
* Gradle 1.12
* JDK 7
* Git

h2. Tareas de Gradle

Proyecto > Prperties > Manage Tasks > Add New

h3. Debug

*Tasks*
<pre>
clean build jettyRun 
</pre>

*Arguments*
<pre>
--stacktrace
-x:test
-x:javadocJar
-x:sourcesJar
-x:war
</pre>

*JVM Arguments*
<pre>
-Xdebug
-Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=n
</pre>

h3. Build

*Tasks*
<pre>
clean build
</pre>

*Arguments*
<pre>
--stacktrace
-x:test
-x:javadocJar
-x:sourcesJar
</pre>

h2. Escuchador de Debug

Menú > Debug > Attach Debugger...

|Debugger|Java Debugger (JPDA)|
|Connector|SocketAttach (Attaches by socket to other VMs)|
|Transport|dt_socket|
|Host|*YOUR_HOST*|
|Port|9999 (*mismo que en configuración de tarea*)|

La comprobación de la configuración se realiza ejecutando la tarea *Debug* y accediendo a la siguiente URL (donde se encuenta la documentación de los servicios REST): 
http://localhost:8080/bocrw-catalog-manager/api/restdoc.html
', NULL, NULL, 1, NULL, 2, NULL, 1, 1, '2014-09-17 12:28:31.482', '2014-09-17 13:15:45.671', '2014-09-17', 0, 0.5, NULL, 65, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (70, 2, 4, 'Manejo de ambientes en construcción con gradle', 'Se realiza la implementación del manejo de diferentes ambientes (desarrollo y producción)

- Se crea el folder src/main/resources/global para todos los archivos que aplican para ambos ambientes
- Se crea el folder src/main/resources/dev para los archivos que solo aplican en el ambiente de desarrollo
- Se crea el folder src/main/resources/prod para los archivos que solo aplican en el ambiente productivo

Inicialmente solo se tiene el archivo log4j.properties en las carpetas dev y prod, para desarrollo se configuro el nivel de log para mostrar (INFO,WARN,ERROR,FATAL) y para producción para mostrar (ERROR,FATAL)

Cuando en la construcción del proyecto con gradle no se especifica un ambiente por default se toma el ambiente de desarrollo

Ejemplos de lineas de comandos para construcción:

gradle clean build -x:test jettyRun (Desarrollo)

gradle -Penv=prod clean build -x:test jettyRun (Producción)
', '2014-09-23', NULL, 3, 14, 2, NULL, 14, 0, '2014-09-23 11:02:43.537', '2014-09-23 11:02:43.537', '2014-09-22', 100, 2, NULL, 70, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (71, 2, 4, 'Procedimiento para insercion uno a uno bitacora ruleta de preguntas', 'Se genero el procedimiento *PKMXRP_RULETA_.SPMXINSRULETA* para poder realizar la insercion uno a uno en la bitacora de rulta de preguntas.

Los cambios que implica son :

Id bitacora de ruleta (Cuando se inserte la primer pregunta debera ser nulo, de la pregunta 2 a la n nos deberan regresar el id que se genero en la primera)

Se agrego el campo FIIDPREGUNTA (Se enviara el numero de pregunta que se esta realizando)

El contrato de interfaz se encuentra en la ruta:

                                      REPO_ATENCION\ci\BITACORAS\PKMXRP_RULETA\ConInterfaz_SPMXINSRULETA

Cualquier duda con gusto la validamos!!!! 
                                                  ', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-09-24 13:13:54.456', '2014-09-24 13:13:54.456', '2014-09-24', 0, NULL, NULL, 71, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (73, 2, 4, 'Adicion a bateria de preguntas', 'Considerar por favor en la bateria de preguntas las ultimas 4  que se agregaron al catalogo.


¿Cuál es su correo electronico?                          correo              
¿Cuál es su teléfono de oficina (10 digitos)?            telefonoOficina   
¿Cuál es la colonia de su domicilio?                     colonia 
¿Cuál es la calle de su domicilio?                       calle 
¿Cuál es su RFC?                                         rfc

Gracias!!', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-09-25 10:13:27.601', '2014-09-25 10:13:27.601', '2014-09-25', 0, NULL, NULL, 73, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (74, 2, 4, 'Consulta bateria de preguntas', '*+BATERIA DE PREGUNTAS CON PROCESO RANDOM+* 

Se realizo la modificación al procedimiento de bateria de preguntas para que se muestren de manera aleatoria.

El cambio fue transparente para la plataforma java.

Favor de apoyarnos con la validación.


Gracias!!!!! =D

', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-09-25 18:59:31.763', '2014-09-25 18:59:31.763', '2014-09-25', 0, NULL, NULL, 74, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (75, 2, 4, 'Implementación Servicio REST - Consulta catalogo estatus acciones', 'Se realiza la implementación del servicio REST de consulta del catalogo de estatus para las acciones de la bitacora

URL Metodo GET

http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/estatus


', '2014-09-25', NULL, 3, 14, 2, NULL, 14, 0, '2014-09-26 08:40:53.406', '2014-09-26 08:40:53.406', '2014-09-25', 100, 2, NULL, 75, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (72, 2, 4, 'Cambios en B.D. para abono automático.', 'Cambios necesarios:
# Crear la tabla _CATESTABONOAUTO_, secuencia y SPs de inserción y consulta.
# Agregar campos (_FIIDESTABONOAUTO_ y _FINUMINTENTOS_) a la tabla _ABONOAUTXCLIENT_ y a los SPs _SPABONOAUTXCLIENT_ y _SPCONSABONOAUTCLIENT_.
# Agregar consulta a SP _SPCONSABONOAUTCLIENT_ para registros con _FIIDESTABONOAUTO_ igual a 2 y 3.
# Agregar campos (_FINUMINTPERMITIDOS_) a la tabla _CATABONOAUTO_ y a los SPs _SPCATABONOAUTO_ y _SPCONSCATABONOAUTO_.
# Agregar consulta a SP _SPCONSCATABONOAUTO_ para obtener _FINUMINTPERMITIDOS_.

Ubicación del modelo de base de datos:
http://10.51.214.96:9880/atncCtes/trunk/portal/diagramas/AbonoAutxClienteModel.erwin', NULL, NULL, 1, 12, 2, NULL, 4, 2, '2014-09-24 14:08:06.731', '2014-09-26 11:04:14.652', '2014-09-24', 0, NULL, NULL, 72, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (81, 2, 6, 'Modificaciones en la estructura de ATN_ACLARACION', 'Favor de realizar los siguientes cambios en la estructura de ATN_ACLARACION

Se generaran las tablas TAAC_AVISOS, TCAC_ESTAVISOS y TCAC_ESTFINALES de acuerdo a la estructura que se encuentra en el diagrama 

  E:\2014\REPO_ATENCION\diagramas\ACLARACIONES\Dgr_Reembolso_Automatico

Y realizar los siguientes procedimientos:

1.- Procedimiento que consulte  la tabla ACLARAMX.ACLARACION y traiga todos losm FIIDACL del día actual solo de los estatus cargados en la tabla TCAC_ESTFINALES ( de inicio se deben de cargar en FIIDSOPORTEXESTATUS = 14 y FIIDFALLODIF = 2) es decir todos los registros con FIIDSOPORTEXESTATUS  = 14 y FIIDFALLO <> 2  y que el FIIDACL no exista en la tabla TAAC_BITAUTOACL, y que tampoco existan en la tabla TAAC_AVISOS con la bandera FIBANENVIADO = 1

2.- Generar un procedimiento que reciba un  arreglo con los FIIDACL y FIESTATUS para insertarlos en la tabla TAAC_AVISOS colocando en el campo de intentos = 0

Cualquier duda con gusto la validamos.

 
', NULL, NULL, 1, 16, 2, NULL, 12, 0, '2014-10-02 12:29:40.422', '2014-10-02 12:29:40.422', '2014-10-02', 0, NULL, NULL, 81, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (82, 2, 6, 'Apoyo para eliminar objetos de Etiquetas', 'Bianca,

Me podrias apoyar por favor a eliminar los siguientes objetos del esquema PORTAL_ATENCION

 - TASG_VISTAETQTA
 - TCSG_TIPOETQTA
 - TCSG_ETIQUETAS
 - TASG_ETQIDIOMA

Asi como los paquetes en donde se utilicen por favor.

Hugo,

Me podrias apoyar por favor con la creacion de una nueva tabla en el esquema PORTAL_ATENCION con las siguientes caracteristicas por favor.

TASG_ROLVISCOMP

FIIDROL
FIIDCOMPONENTE
FIIDVISTA
FIIDAPLICACION
FIBANAPLICA
(CAMPOS DE AUDITORIA)

RELACIONADO A LAS TABLAS PADRE ( TCSG_ROLES, TCSG_VISTAS, TCSG_COMPONENTE)


Y generar un procedimiento que dado un arreglo de roles devuelva el id de vista y el id de componentes que tengan 1 en el campo FIBANAPLICA, la consulta debe de ser con un distinct para no repetir registros.


Mil gracias, culquier duda con gusto la validamos.






', NULL, NULL, 1, 16, 2, NULL, 12, 0, '2014-10-02 19:08:45.678', '2014-10-02 19:08:45.678', '2014-10-02', 0, NULL, NULL, 82, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (83, 2, 6, 'Actualizacion diagramas Entidad - Relacion', 'Hola!!

Debido a que ultimamente se han realizado algunos cambios en las estructuras de los esquemas, me podrian apoyar actualizando los diagramas en el repositorio con la version final de cada uno de estos por favor.

  Bianca

    Monitoreo
    Aclaraciones

  Hugo

    Portal_Atencion
    Bitacoras


 Mil gracias, cualquier duda con gusto la validamos.


', NULL, NULL, 1, 15, 2, NULL, 12, 0, '2014-10-03 12:54:23.008', '2014-10-03 12:54:23.008', '2014-10-03', 0, NULL, NULL, 83, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (76, 2, 6, 'Procedimientos para acumulado de operaciones', '

Como primer modificacion eliminar el campo FNNUMAUTPEND a la tabla TAAC_AUTPENCTES

Favor de generar un paquete con la descripcion de totales acumulados y colocar dentro de el un procedimiento para el manejo de cada una de las siguientes tablas:

*TAAC_AUTPENCTES* 

     Por cada insercion en la tabla TAAC_BITAUTOACL se dispararan las siguientes acciones:

        1.- Si no existe un registro en la tabla TAAC_AUTPENCTES con el numero de FNNUMCTEALNOVA se debera generar un registro nuevo con el valor 1 en el campo FNNUMAUTPEND 
 
        2.- En caso de que ya exista un valor en la tabla TAAC_AUTPENCTES con el numero de FNNUMCTEALNOVA se debera actualizar el campo FNNUMAUTOTORGADAS sumando uno a el valor que tenga en ese momento.


Se debera generar otro procedimiento en el mismo paquete que consulte por  FNNUMCTEALNOVA el numero de autorizaciones otorgadas FNNUMAUTOTORGADAS vs el numero de abonos que se encuentra en la tabla TCAC_PARAMABONO en el campo FNNUMABONOS.

El cursor de este paquete debera enviar la siguiente salida

     - Numero de Cliente Alnova
     - Bandera igual a 1 (indicando que si tiene acceso a autorizacion automatica, mediante la operación FNNUMABONOS  - FNNUMAUTOTORGADAS si se obtiene un valor positivo de  esta )
     - Monto permitido para siguiente operación (se obtiene de la tabla TCAC_PARAMABONO del campo FNMONTOPERMITDO)   
     - La divisa del monto
    
Los parametros de entrada para este procedimiento son:

     -   No de cliente alnova 
     -   Divisa 

Se generara un ultimo procedimiento en este mismo paquete que valide si es 01/01/XXXX debera actualizar todos los registros de la tabla TAAC_AUTPENDCTES en el campo FNNUMAUTOTORGADAS dejandolos igual a cero.

Mil gracias!!!

Todas las dudas las podemos validar!!!




', NULL, NULL, 1, 15, 2, NULL, 12, 0, '2014-09-29 12:24:08.69', '2014-09-29 12:24:08.69', '2014-09-29', 0, NULL, NULL, 76, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (78, 2, 4, 'Directiva para combos de fecha', 'Como parte de las modificaciones en el campo para especificar la fecha, se ha creado la directiva *datecombo* mediante la cual se puede especificar la fecha en combos separados para el dia, mes y año.

Esta directiva tiene algunos atributos configurables, que funcionan de la siguiente manera:

*data-ng-model*: Sirve para identificar el elemento al que hace referencia la fecha especificada. Esto porque en algunas vistas es necesario especificar fecha inicial y fecha final. Cuando la directiva devuelve el valor de la fecha, se identifica esta propiedad como modelname y entonces se puede hacer el manejo adecuado de la fecha especificada.

*min-year*: Sirve para determinar cual es el menor año que se muestra dentro del combo. Si no se especifica, la directiva muestra diez años anteriores a partir del año actual.

*emptydefault*: Si el valor es true, la directiva no establece una fecha por default y asigna a cada control una etiqueta para indicar el valor correspondiente (Día, Mes, Año). Se debe validar en el controlador si el valor esta vacío e informar al usuario que el campo fecha esta vacío.  Si el valor es false o no se especifica, la directiva establece por default la fecha del día actual.

*initialdate*: Determina cual es el valor inicial de la fecha en caso de que se requiera que no sea vacío ni la fecha del día actual. Este dato debe ser una cadena con formato "DD/MM/YYYY", ya que así se esta manejando la fecha actualmente en el sistema.

Esta directiva devuelve el valor especificado mediante dos callbacks: *getadateobject* y *getacustomobject*.

La primera devuelve el valor especificado en los combos como un objeto date de JavaScript y la segunda devuelve los atributos dia, mes y año.

A continuacion les muestro el código para utilizar la directiva y el código en JavaScript para hacer manejo de la misma:

En HTML se puede utilizar de la siguiente manera:

<div class="input-group" datecombo data-ng-model="fechaNacimiento" 
    getadateobject="retrieveDateObj(*dateupdated*, *modelname*)" 
    min-year="1900" emptydefault="true" 
    initialdate="fecNacCteAcert">
</div>

<div class="input-group" datecombo data-ng-model="fechaInicio" getacustomobject="datosxseparado(*day*, *month*, *year*, *modelname*)" min-year="1999" emptydefault="true" initialdate="name"></div>

Y en el controlador respectivo en JavaScript:

$scope.retrieveDateObj = function (fechaactualizada, modelo) {
            $scope.fechaNacimiento = $filter(''date'')(fechaactualizada, ''dd/MM/yyyy'');
            console.log($scope.fechaNacimiento);
};


$scope.datosxseparado = function (day, month, year, modelo) {
        if (modelo === ''fechaInicio'') {
            fechaInicio = {
                "dia": day,
                "mes": month,
                "anhio": year
            };
        }
        if (modelo === ''fechaFinal'') {
            fechaFinal  = {
                "dia": day,
                "mes": month,
                "anhio": year
            };
        }
        if (typeof(modelo) === ''undefined'') {
            fechaInicio = fechaFinal = {
                "dia": day,
                "mes": month,
                "anhio": year
            };
        }
        console.log(fechaInicio);
        console.log(fechaFinal);
    };

Es muy importante recalcar que los nombres de los parametros de las funciones deben ser esos que muestro en este ejemplo, por alguna razon que todavia no entiendo, AngularJS hace un mapeo con los nombres de los argumentos especificados, si cambian el nombre de alguno de los parametros de la funcion getadateobject o getacustomobject lo mas seguro es que la directiva no les devuelva el valor especificado, cosa extraña, pero asi funciona Angular.

cualquier duda me pueden preguntar y les ayudo a incorporar este elemento en sus vistas.

Saludos :-)', NULL, NULL, 3, 8, 2, NULL, 8, 0, '2014-09-30 18:48:02.913', '2014-09-30 18:48:02.913', '2014-09-30', 0, NULL, NULL, 78, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (79, 2, 4, 'Modificaciones en objetos de Codificacion y Ruleta', '
Se realizaron modificaciones a los procedimientos, para agregar los campos geograficos (Pais, canal, sucursal), por otra parte el campo de canal que ya existia se modifico por el de pe_origen.

Los objetos que se modificaron fueron los siguientes:
 
    PKMXBT_ACCIONES.SPMXINSACCION   (se agrego: pe_pais, pe_sucursal, pe_canal y se modifico pe_canal por pe_origen)
    PKMXBT_ATNCION.SPMXINSATENCION  (se agrego: pe_pais, pe_sucursal, pe_canal y se modifico pe_canal por pe_origen )
    PKMXRP_RONDAS.SPMXINSRONDA      (se agrego: pe_idpais)

Los contratos de interfaz ya se encuentran en las rutas indicadas anteriormente.

    REPO_ATENCION\ci\BITACORAS

Por favor confirmarnos en cuanto ya podamos apuntar a los procedimientos con los cambios antes mencionados.
 

    
', NULL, NULL, 1, 3, 2, NULL, 12, 0, '2014-10-01 18:40:34.109', '2014-10-01 18:40:34.109', '2014-10-01', 0, NULL, NULL, 79, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (77, 2, 4, 'Bitacora de aclaraciones FCR', 'Se genero el procedimiento para la bitacora de aclaraciones.

El contrato de interfaz se localiza en la ruta de atencion a clientes  


        REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_BITAUTOACLARA\ConInterfaz_SPMXACBTAUTOACL

De igual forma se generaron las tablas para el control de estatus TCAC_ESTACAUT, el contrato de interfaz para la consulta de esta tabla se encuentra en :

       REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_BITAUTOACLARA\ConInterfaz_SPMXACBTAUTOACL\ConInterfaz_SPMXSELESTACAUT 

Se genero un procedimentos para indicar si aplica la aclaracion automatica para el cliente, de acuerdo a los criterios y al numero de veces que se le han concedido este privilegio al cliente. Los contratos de interfaz se encuentran en :

       REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_BITAUTOACLARA\ConInterfaz_SPMXACBTAUTOACL\ConInterfaz_SPMXSELAUTPNCTE


Cualquier duda con gusto la validamos.
   
   ', NULL, NULL, 1, 3, 2, NULL, 12, 2, '2014-09-29 19:42:03.659', '2014-10-02 12:36:01.381', '2014-09-29', 0, NULL, NULL, 77, 1, 2, false, NULL);
INSERT INTO issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) VALUES (80, 2, 4, 'Procedimiento de consulta para movimientos por arreglo de estatus', 'Se genero el procedimiento SPMXSELBTACLARA

Recibe los parametros de entrada:

  Estatus (arreglo con estatus)
  Idioma

Regresa todos los movimientos que se encuentran en la tabla ATN_ACLARACIONES.TAAC_BITAUTOACL de acuerdo al arreglo de estatus enviado.

*Favor de confirmar si es necesario agregar un filtro de fecha para esta consulta y cuales serian las condiciones.*', NULL, NULL, 1, 3, 2, NULL, 12, 2, '2014-10-01 19:47:46.084', '2014-10-03 09:57:51.932', '2014-10-01', 0, NULL, NULL, 80, 1, 2, false, NULL);


--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 205
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('issues_id_seq', 99, true);


--
-- TOC entry 2636 (class 0 OID 16578)
-- Dependencies: 206
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (1, 1, 'attachment', '8', 'img1.png', NULL);
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (2, 2, 'attachment', '10', NULL, 'img1.png');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (3, 3, 'attachment', '19', NULL, 'TipoDatosWS.png');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (4, 4, 'attachment', '20', NULL, 'Contrato Interfaz wsBlockbusterNewBank2.xlsx');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (5, 5, 'attr', 'assigned_to_id', NULL, '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (6, 6, 'attr', 'status_id', '1', '5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (7, 7, 'attr', 'status_id', '5', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (8, 8, 'attr', 'status_id', '2', '5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (9, 9, 'attr', 'status_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (10, 10, 'attachment', '34', NULL, 'Contrato Interfaz BlockbusterNewBank.xlsx');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (11, 11, 'attachment', '34', 'Contrato Interfaz BlockbusterNewBank.xlsx', NULL);
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (12, 12, 'attachment', '35', NULL, 'Contrato Interfaz BlockbusterNewBank.xlsx');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (13, 13, 'attachment', '36', NULL, 'Images_Acertum.zip');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (14, 15, 'attr', 'status_id', '2', '5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (15, 16, 'attr', 'status_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (16, 17, 'attachment', '35', 'Contrato Interfaz BlockbusterNewBank.xlsx', NULL);
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (17, 18, 'attachment', '37', NULL, 'Contrato Interfaz BlockbusterNewBank.xlsx');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (18, 19, 'attachment', '38', NULL, 'PRUEBA.svg');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (19, 20, 'attachment', '39', NULL, 'PRUEBA__tiny1_1.svg');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (20, 20, 'attachment', '40', NULL, 'PRUEBA_basic1_1.svg');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (21, 20, 'attachment', '41', NULL, 'PRUEBA_tiny1_1plus.svg');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (22, 20, 'attachment', '42', NULL, 'PRUEBA_tiny1_2.svg');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (23, 21, 'attr', 'status_id', '5', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (24, 21, 'attr', 'estimated_hours', NULL, '2.0');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (25, 23, 'attr', 'status_id', '4', '5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (26, 24, 'attr', 'assigned_to_id', NULL, '8');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (27, 25, 'attachment', '44', NULL, 'Img_svg.zip');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (28, 26, 'attachment', '45', NULL, 'Ejemplo funciones CU.doc');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (29, 27, 'attachment', '47', NULL, 'Captura.PNG');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (30, 28, 'attachment', '47', 'Captura.PNG', NULL);
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (31, 29, 'attachment', '48', NULL, 'Captura.PNG');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (32, 30, 'attachment', '60', NULL, 'ConInterfaz_SPMXSELVISTA.doc');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (33, 31, 'attachment', '70', NULL, '0.gif');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (34, 33, 'attr', 'status_id', '1', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (35, 33, 'attr', 'done_ratio', '0', '20');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (36, 33, 'attr', 'estimated_hours', NULL, '3.0');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (37, 34, 'attachment', '72', NULL, 'RESTClient.txt');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (38, 35, 'attachment', '73', NULL, 'json_nuevo.txt');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (39, 38, 'attachment', '75', NULL, 'CONTRATO B41S_web.doc');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (40, 39, 'attachment', '76', NULL, 'PE28 Busqueda de Relaciones con Entidad.doc');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (41, 40, 'attr', 'status_id', '3', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (42, 40, 'attr', 'done_ratio', '100', '30');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (43, 41, 'attr', 'status_id', '2', '5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (44, 42, 'attr', 'status_id', '1', '5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (45, 49, 'attachment', '88', NULL, 'Aclaraciones_5.pdf');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (46, 50, 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (47, 50, 'attr', 'assigned_to_id', NULL, '9');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (48, 51, 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (49, 51, 'attr', 'assigned_to_id', NULL, '9');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (50, 58, 'attachment', '89', 'Servicios REST Aclaraciones movimientos alnova.xlsx', NULL);
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (51, 59, 'attachment', '91', NULL, 'Servicios REST Aclaraciones movimientos alnova.xlsx');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (52, 59, 'attr', 'status_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (53, 76, 'attr', 'status_id', '4', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (54, 76, 'attr', 'done_ratio', '30', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (55, 77, 'attachment', '93', 'Servicios REST Aclaraciones guardar preaclaracion.xlsx', NULL);
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (56, 78, 'attachment', '98', NULL, 'Servicios REST Aclaraciones guardar preaclaracion.xlsx');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (57, 88, 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (58, 88, 'attr', 'status_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (59, 88, 'attr', 'estimated_hours', NULL, '1.0');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (60, 90, 'attr', 'status_id', '2', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (61, 90, 'attr', 'done_ratio', '0', '80');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (62, 100, 'attr', 'due_date', NULL, '2014-09-04');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (63, 100, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (64, 100, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (65, 100, 'attr', 'estimated_hours', NULL, '2.0');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (66, 112, 'attr', 'assigned_to_id', '3', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (67, 121, 'attr', 'status_id', '2', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (68, 121, 'attr', 'done_ratio', '50', '80');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (69, 122, 'attr', 'status_id', '2', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (70, 122, 'attr', 'done_ratio', '50', '80');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (71, 125, 'attr', 'status_id', '2', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (72, 125, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (73, 126, 'attr', 'status_id', '1', '4');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (74, 127, 'attr', 'done_ratio', '0', '80');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (75, 130, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (76, 130, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (77, 131, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (78, 131, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (79, 132, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (80, 132, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (81, 133, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (82, 133, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (83, 134, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (84, 134, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (85, 135, 'attr', 'status_id', '1', '3');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (86, 135, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (87, 136, 'attr', 'due_date', NULL, '2014-09-18');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (88, 136, 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (89, 136, 'attr', 'estimated_hours', NULL, '2.5');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (90, 137, 'attr', 'done_ratio', '50', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (91, 139, 'attr', 'due_date', NULL, '2014-09-19');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (92, 139, 'attr', 'done_ratio', '0', '50');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (93, 139, 'attr', 'estimated_hours', NULL, '3.0');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (94, 142, 'attr', 'due_date', NULL, '2014-09-22');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (95, 142, 'attr', 'done_ratio', '0', '100');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (96, 142, 'attr', 'estimated_hours', NULL, '5.0');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (97, 144, 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (98, 152, 'attr', 'tracker_id', '1', '2');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (99, 153, 'attr', 'assigned_to_id', NULL, '9');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (100, 154, 'attachment', '104', NULL, 'tiempo_resolucion tipoaclaracion_propuesta.jpg');
INSERT INTO journal_details (id, journal_id, property, prop_key, old_value, value) VALUES (101, 158, 'attr', 'assigned_to_id', '3', '23');


--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 207
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('journal_details_id_seq', 101, true);


--
-- TOC entry 2638 (class 0 OID 16589)
-- Dependencies: 208
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (1, 2, 'Issue', 3, '', '2014-07-28 13:32:14.714', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (2, 2, 'Issue', 3, '', '2014-07-28 13:32:31.145', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (3, 2, 'Issue', 3, '', '2014-07-29 17:49:55.385', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (4, 2, 'Issue', 3, '', '2014-07-29 18:05:34.155', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (5, 5, 'Issue', 3, '', '2014-07-31 16:42:20.774', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (6, 11, 'Issue', 12, '', '2014-08-07 13:33:06.141', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (7, 11, 'Issue', 12, '', '2014-08-07 13:34:06.401', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (8, 11, 'Issue', 12, '', '2014-08-07 13:34:32.148', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (9, 10, 'Issue', 12, '', '2014-08-07 18:04:30.178', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (10, 8, 'Issue', 4, '', '2014-08-07 19:04:18.893', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (11, 8, 'Issue', 4, '', '2014-08-07 19:07:11.19', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (12, 8, 'Issue', 4, '', '2014-08-07 19:07:59.069', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (13, 8, 'Issue', 3, 'Se agregan los íconos del diseño', '2014-08-07 19:25:04.83', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (14, 10, 'Issue', 12, '*+Búsqueda por vista+*
Se genero el objeto:
Objetivo:  Regresar todos los roles correspondientes a una vista.

Base:     BDATNCTES
Esquema : Portal_Atencion
Paquete : PKMXSG_VISTAROL
Procedimiento : SPMXSELROLES

*Parametros de entrada:*
pe_idvista         tipo: integer
pe_idaplicacion    tipo: integer 

*Parametros de salida:*
ps_curroles        tipo: cursor  (regresa id rol, descripcion del rol y estatus)

*+Nuevo campo tabla Usuarios+*

Se agrego el campo FCNOMUSR en la tabla PORTAL_ATENCION.TCSG_USUARIOS

*+Creacion de tabla tokens+*
Se creo la tabla PORTAL_ATENCION.TASG_TOKENS
Con la siguiente estructura:
  FITOKEN        NUMBER(38)                     NOT NULL,
  FIIDUSUARIO    NUMBER(38)                     NOT NULL,
  FCSESION       VARCHAR2(10 BYTE)              NOT NULL,
  FDFECHAGENERA  DATE                           NOT NULL,
  FIESTATUS      NUMBER(38)                     NOT NULL,
  FCUSRMODIF     VARCHAR2(30 BYTE)              NOT NULL,
  FDFECHAMODIF   DATE                           NOT NULL

*+Funcion tokens+*

Se genero el objeto:
Objetivo:  Regresa todos los roles y usuarios refrentes a un token

Base:     BDATNCTES
Esquema : Portal_Atencion
Paquete : PKMXSG_TOKENS
Procedimiento : SPMXSELUSRROLTK

*Parametros de entrada:*
pe_token      tipo: Integer

*Parametros de salida:*
pe_curusrrol  tipo:  cursor  (regresa id usuario, nombre usuario, id rol, descripcion del rol)





', '2014-08-07 20:02:42.49', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (15, 10, 'Issue', 12, '', '2014-08-07 20:04:50.891', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (16, 3, 'Issue', 3, '', '2014-08-08 09:39:15.001', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (17, 8, 'Issue', 4, '', '2014-08-08 09:46:39.676', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (18, 8, 'Issue', 4, '', '2014-08-08 09:46:49.959', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (19, 8, 'Issue', 3, 'Se agrega svg para generar GlyphIcons', '2014-08-08 10:36:55.89', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (20, 8, 'Issue', 3, '', '2014-08-08 11:35:06.267', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (21, 10, 'Issue', 1, 'Debido a que la administración de los identificadores de vista sería más costoso a nivel de aplicación, se necesita que la _búsqueda por vista_ se realize a partir de la URL de la vista en lugar del identificador de vista. Además sería conveniente la agregación del status de los registros de resultado.

*Parámetro de entrada*
PE_IDAPLICACION:INTEGER
PE_FCVISTA:VARCHAR
> ej. vistas/busqueda_cliente
PE_FISTATUS:INTEGER 
> status < 0 ó null regresar todos los estatus
> status > -1 filtrar registros por status

A su vez, se requiere, por cuestiones de complejidad en el token, que el tipo de dato de dicho campo sea VARCHAR; tanto en el parámetro de entrada de la función de obtención de información, como en la tabla.

PE_TOKEN:VARCHAR

FCTOKEN:VARCHAR


', '2014-08-08 17:49:02.267', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (22, 6, 'Issue', 4, 'Numero de celular: 5552142055', '2014-08-11 12:39:57.421', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (23, 10, 'Issue', 12, 'Se realizaron las modificaciones solicitada.

Objeto: *+PORTAL_ATENCION.PKMXSG_VISTAROL.SPMXSELROLES+*
Parametros de entrada:
   pe_idaplicacion    INTEGER    (id de la aplicacion)
   pe_vista           VARCHAR2   (url de la vista) 
   pe_estatus         INTEGER    (estatus = null regresa todos los registros
                                  estatus = 1 solo roles activos
                                  estatus = 0 solo roles inactivos) 
El cursor regresa los campos:
FCVISTA   (URL vista)
FIESTATUS (Estatus vista)
FIIDROL   (Id del rol)
FCROL     (Nombre del rol)
FIESTATUS (Estatus rol) 

*+TOKENS+*

Se modifico el campo FCTOKEN a varchar2(30) en la tabla PORTAL_ATENCION.TASG_TOKENS


', '2014-08-11 12:56:22.298', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (24, 12, 'Issue', 3, '', '2014-08-12 19:45:34.56', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (25, 12, 'Issue', 3, '', '2014-08-14 18:35:52.076', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (26, 2, 'Issue', 12, '', '2014-08-15 11:23:27.176', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (27, 2, 'Issue', 4, '', '2014-08-15 11:51:47.732', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (28, 2, 'Issue', 4, '', '2014-08-15 11:55:55.936', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (29, 2, 'Issue', 4, '', '2014-08-15 11:56:11.962', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (30, 14, 'Issue', 12, '', '2014-08-18 12:59:11.094', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (31, 15, 'Issue', 3, '', '2014-08-18 20:10:31.822', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (32, 15, 'Issue', 3, 'Agrego la dirección del servidor de desarrollo alnova:

http://10.63.32.115/Conexion_TF/Servicio_Conexion.asmx?op=MTEjecutaTransaccion', '2014-08-19 12:52:51.054', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (33, 14, 'Issue', 1, '', '2014-08-20 13:28:58.612', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (34, 15, 'Issue', 18, '', '2014-08-21 10:18:19.965', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (35, 15, 'Issue', 18, '', '2014-08-21 17:13:22.715', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (36, 15, 'Issue', 3, 'La aplicación de pre apertura a sufrido cambios a través del tiempo, pero las transacciones siguen siendo las mismas, la diferencia que se envían parámetros nulos o con 0.
Ejemplo de producción:

REQ BB70:TERMINAL/NKRM~ENTITY/0127~BRANCH/4037~USER/NETNET~OPCION/A~FOPREAP/CS07313~NOMBRET/ENRIQUE EFRAIN~APLLPAT/PASCENCIA~APLLMAT/PALACIOS~CODID/null~NUMID/null~FECHNAC/22-07-1952~RFC/null~NACIONA/null~GENERO/M~ESTACIV/null~CURP/null~TELOFIC/33-38538426~EXTENSI/0~TELCASA/null-null~TELCEL/3338087696~CORREOE/docplas.plac@gmail.com~CALLET/null~NUMEXT/null~NUMINT/null~CODPOST/44290~COLONIA/null~ESTADO/JALISCO~POBLAC/GUADALAJARA~IMPOPER/000000000010000~CALLEVI/null~NUMEXTV/null~NUMINTV/null~CODPOSV/null~COLONIV/null~ESTADOV/null~POBLACV/null~FECHORV/12-05-2014 11:45-A.M.~REFCALL/null~ESTATUS/1~OBSERVA/null~COMENTA/null
RESP BB70:Warning messages:(BGA0025) OK. OPERACION EFECTUADA.

REQ BB71:TERMINAL/NKRM~ENTITY/0127~BRANCH/4037~USER/NETNET~OPERACIO/BB71~OPCIONT/A~FOPREAP/CS07313~NOMBEN1/NULL~APEPAB1/NULL~APEMAB1/NULL~PARENT1/NULL~PORCEN1/0~CALLEB1/NULL~NUMEXT1/NULL~NUMINT1/NULL~CODPOS1/NULL~COLONB1/NULL~ESTADO1/NULL~POBLAC1/NULL~LADATE1/NULL~EXTENS1/NULL~NOMBEN2/NULL~APEPAB2/NULL~APEMAB2/NULL~PARENT2/NULL~PORCEN2/0~CALLEB2/NULL~NUMEXT2/NULL~NUMINT2/NULL~CODPOS2/NULL~COLONB2/NULL~ESTADO2/NULL~POBLAC2/NULL~LADATE2/NULL~EXTENS2/NULL
RESP BB71:Warning messages:(BGA0009) OK. ALTA EFECTUADA

REQ BB73:TERMINAL/NKRM~ENTITY/0127~BRANCH/4037~USER/NETNET~OPERACIO/BB73~OPCIONT/A~FOPREAP/CS07313~ACTPROF/NULL~ACTECON/NULL~SECTLAB/NULL~TRANESP/NULL~USOCUEN/NULL~ORIRECU/NULL~FUENING/NULL~EMPRESA/NULL~PUESTOD/NULL~TIEMLAB/NULL~DIREMPR/NULL~TELTRAB/NULL~INGMENS/0~EGREMEN/0~SECEMPR/NULL~PROFOFI/NULL~PPEXPUE/00~PPEXPUF/00~NOMPPE/NULL~APPAPPE/NULL~APMAPPE/NULL~CALLEPP/NULL~NUMEXTP/NULL~NUMINTP/NULL~CODPOST/NULL~COLONIA/NULL~ESTADO/NULL~CIUDAD/NULL
RESP BB73:Warning messages:(BGA0009) OK. ALTA EFECTUADA

REQ BB79:TERMINAL/NKRM~ENTITY/0127~BRANCH/4037~USER/NETNET~ENTCTA/3548  ~CENCTA/3548  ~NUMCTA/CS07313~APEPAT/PASCENCIA~APEMAT/PALACIOS~NOMCLI/ENRIQUE EFRAIN~USUARIO/CS07313
RESP BB79:Warning messages:(BGA0171) OK. OPERACION EFECTUADA', '2014-08-21 17:39:14.462', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (37, 15, 'Issue', 3, '
Agrego más cadenas de prueba enviadas por Araceli Avilés:

<pre>
Envío las estructuras de las cadenas Web de ejemplo sobre los contratos enviados BB70, BB71, BB73.

BB70
Cadena entrada
TERMINAL/R9OU~ENTITY/0127~BRANCH/0172~USER/B111111~OPCION/A~FOPREAP/CS07464~NOMBRET/FRANCISCO~APLLPAT/PIZARRO~APLLMAT/PIZARRO~CODID/C~NUMID/135898~FECHNAC/1990-10-10~RFC/EERE830422~NACIONA/MEXICANA~GENERO/MASCULINO~ESTACIV/CASADO~CURP/EERE830422HDFSSD09~TELOFIC/~EXTENSI/~TELCASA/5554585956~TELCEL/~CORREOE/esdtrd@yahoo.com~CALLET/ALONDRA~NUMEXT/2~NUMINT/3~CODPOST/55050~COLONIA/GARDENIAS~ESTADO/PUEBLA~POBLAC/PUEBLA~IMPOPER/2000~CALLEVI/COLLARIN~NUMEXTV/5~NUMINTV/3~CODPOSV/55050~COLONIV/CAMARA~ESTADOV/SONORA~POBLACV/SONORA~FECHORV/2012-06-06-12:45~REFCALL/AZUL~ESTATUS/~OBSERVA/~COMENTA/~FECHREG/~FECHAIN/~FECHAFI/~HORAREG/
Cadena salida
  <?xml version="1.0" encoding="utf-8" ?> 
  <string xmlns="http://tempuri.org/">Warning messages:(BGA0025) OK. OPERACION EFECTUADA.</string> 


BB71
Entrada
TERMINAL/R9OU~ENTITY/0127~BRANCH/0172~USER/B111111~OPCIONT/A~FOPREAP/CS07464~NOMBEN1/nombre~APEPAB1/patern~APEMAB1/matern~CODTIN/~PARENT1/PADRE~PORCEN1/50~CALLEB1/ALONDRA~NUMEXT1/50~NUMINT1/50~CODPOS1/55050~COLONB1/POST~ESTADO1/PUEBLA~POBLAC1/PUEBLA~LADATE1/~EXTENS1/~NOMBEN2/~APEPAB2/~APEMAB2/~PARENT2/~PORCEN2/~CALLEB2/~NUMEXT2/~NUMINT2/~CODPOS2/~COLONB2/~ESTADO2/~POBLAC2/~LADATE2/~EXTENS2/
Cadena de salida
  <?xml version="1.0" encoding="utf-8" ?> 
  <string xmlns="http://tempuri.org/">Warning messages:(BGA0009) OK. ALTA EFECTUADA</string> 


BB73
Cadena de entrada
TERMINAL/R9OU~ENTITY/0127~BRANCH/0172~USER/B111111~OPCIONT/A~FOPREAP/CS07464~ACTPROF/01~ACTECON/22~SECTLAB/MAQUILA~TRANESP/~USOCUEN/0104010401040104~ORIRECU/05~FUENING/~EMPRESA/~PUESTOD/~TIEMLAB/~DIREMPR/~TELTRAB/~INGMENS/~EGREMEN/~SECEMPR/~PROFOFI/~PPEXPUE/NO~NOMPPE/~APPAPPE/~APMAPPE/~CALLEPP/~NUMEXTP/~NUMINTP/~CODPOST/~COLONIA/~ESTADO/~CIUDAD/~PPEXPUF/NO~TELCONT/~LADATEL/
Cadena de salida
  <?xml version="1.0" encoding="utf-8" ?> 
  <string xmlns="http://tempuri.org/">Warning messages:(BGA0009) OK. ALTA EFECTUADA</string> 
</pre>', '2014-08-22 12:25:55.532', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (38, 18, 'Issue', 9, 'cadenas de ejemplo B41S

entrada

ENTITY/0127~BRANCH/4037~USER/BSISCAL~TERMINAL/X195~CHANNEL/01~ACCOUNT/01275936131362175069~DATFROM/~DATUNTI/~OPENUM/~MOREDTA/~PAP/N~FINNUM/~TRANS/~INQRDC/N~TOTOPE/025

Salida


<?xml version="1.0" encoding="utf-8" ?><string xmlns="http://tempuri.org/">ACCENT/0127~ACCFCC/MXP ~ACCNUM/1362175069~ADDRESS/BA EKT CHAMPOTON ~BRNCOD/5936~CENT/5936~CLABE/127053013621750698~COND1/X~COND2/X~COND3/ ~CURDES/PESO ~DIGIT/13~EQVFCC/0015 ~FMT/COYOACAN, 15 DE AGOSTO DE 2014 ~HOLDER1/ DANIEL VALENCIA CONTRERAS ~HOLDER2/ ~PROD/CUENTA SELECTA ~PROXLIQ/2014-09-02~SUBPROD/0015~AMT/00000000867000~BALANCE/000000000000920349~OBSERV/DEPOSITO DE EFECTIVO 5936 ~OPEDT/2014-08-02~OPENUM/00000638~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-03~AMT/-00000000250000~BALANCE/000000000000670349~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-02~OPENUM/00000639~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-03~AMT/-00000000005800~BALANCE/000000000000664549~OBSERV/COMPRA GPO FLECHA AMARILLA I ~OPEDT/2014-08-04~OPENUM/00000640~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-04~AMT/-00000000060000~BALANCE/000000000000604549~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-04~OPENUM/00000641~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-04~AMT/-00000000539900~BALANCE/000000000000064649~OBSERV/COMPRA BEST BUY 2028 ECOM ~OPEDT/2014-08-05~OPENUM/00000642~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-05~AMT/-00000000045000~BALANCE/000000000000019649~OBSERV/COMPRA OXXO GAS LIBRAMIENTO ~OPEDT/2014-08-05~OPENUM/00000643~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-05~AMT/-00000000007500~BALANCE/000000000000012149~OBSERV/COMPRA OXXO LIBRAMIENTO NORES ~OPEDT/2014-08-05~OPENUM/00000644~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-05~AMT/-00000000003000~BALANCE/000000000000009149~OBSERV/COMPRA OXXO LIBRAMIENTO NORES ~OPEDT/2014-08-05~OPENUM/00000645~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-05~AMT/00000000310000~BALANCE/000000000000319149~OBSERV/DEPOSITO DE EFECTIVO 5936 ~OPEDT/2014-08-05~OPENUM/00000646~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-05~AMT/-00000000200000~BALANCE/000000000000119149~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-05~OPENUM/00000647~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-05~AMT/-00000000100000~BALANCE/000000000000019149~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-07~OPENUM/00000648~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-07~AMT/-00000000010000~BALANCE/000000000000009149~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-08~OPENUM/00000649~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-08~AMT/00000000325000~BALANCE/000000000000334149~OBSERV/DEPOSITO DE EFECTIVO 5936 ~OPEDT/2014-08-09~OPENUM/00000650~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-10~AMT/-00000000200000~BALANCE/000000000000134149~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-09~OPENUM/00000651~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-10~AMT/-00000000100000~BALANCE/000000000000034149~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-10~OPENUM/00000652~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-10~AMT/00000000539900~BALANCE/000000000000574049~OBSERV/DEVOLUCION BEST BUY 2028 ECOM ~OPEDT/2014-08-11~OPENUM/00000653~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-11~AMT/-00000000200000~BALANCE/000000000000374049~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-11~OPENUM/00000654~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-11~AMT/00000000350000~BALANCE/000000000000724049~OBSERV/DEPOSITO DE EFECTIVO 5936 ~OPEDT/2014-08-12~OPENUM/00000655~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-12~AMT/-00000000250000~BALANCE/000000000000474049~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-12~OPENUM/00000656~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-12~AMT/-00000000150000~BALANCE/000000000000324049~OBSERV/RETIRO DE EFECTIVO ~OPEDT/2014-08-14~OPENUM/00000657~ORIAMT/00000000000000~ORIFCC/ ~VALDAT/2014-08-14~TXT/NO EXISTEN MAS MOVIMIENTOS ~ACCFCC/ ~AVABAL/000000000000324049~AVAEQV/000000000000000000~BALANCE/000000000000324049~BREAK1/ ~BREAK10/ ~BREAK11/ ~BREAK12/ ~BREAK13/ ~BREAK14/ ~BREAK15/ ~BREAK16/ ~BREAK17/ ~BREAK18/ ~BREAK19/ ~BREAK2/ ~BREAK20/ ~BREAK3/ ~BREAK4/ ~BREAK5/ ~BREAK6/ ~BREAK7/ ~BREAK8/ ~BREAK9/ ~EQLIFCC/ ~EQVBAL/000000000000000000~EQVBALR/000000000000000000~EQVFCC/ ~EQVLIM/000000000000000000~EQVTXT/ ~EXCHNG/ ~FCCDES/ ~LIM/000000000000000000~LIMDES/ ~PAGBRKB/ ~RETBAL/000000000000000000~SPACE/ ~BREAK/ ~BRN/CALZADA DE TLAPAN 4353 0 ~COND/ ~CSRCAT/ ~CSRNAME/ ~ENTCOD/BANCO AZTECA ~KEYHH/13:06~PREFIX/ ~SEQ/000000000~TPH/000000~TRANSCO/B41S~TRM/NKRL~TXT1/SOLICITADO POR: ~Warning messages:(BGA0000) BGA0150 BGA0001</string>
', '2014-08-25 18:31:58.501', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (94, 29, 'Issue', 1, 'Se implementa el modelo de salida en base al resultado del servicio de obtención de tipos de aclaración (listado de tipos).', '2014-09-04 18:06:12.514', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (95, 20, 'Issue', 5, 'Modificar el servicio "Consultar tipo aclaración":

http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/subproducto/{pais}/{idProducto}/{idSubproducto}/{idClasificacion}/{idCaso}

Solo son necesarios los parametros IdPais, IdProducto, IdClasificacion e IdSubproducto. También implementar una forma para determinar si el IdOperacion es 6 (IdClasicion igual a 0) o 7 (IdClasificacion diferente de 0)', '2014-09-04 18:09:55.931', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (96, 20, 'Issue', 1, 'Resuelto en Issue #29', '2014-09-04 18:11:57.384', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (141, 31, 'Issue', 9, '

{
"idPais":"1",
"numTarjeta": "5512380304869601",
"numCuenta":  "0",
"fechaIniMovto": "2014-08-01",
"fechaFinMovto":"2014-08-15",
"funckey": "00"
}', '2014-09-22 13:44:22.042', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (39, 18, 'Issue', 9, 'Ejemplos cadena transacción PE28 búsqueda de cuentas y tarjetas a partir de un num cliente alnova

cadena entrada

ENTITY/0127~BRANCH/4037~USER/BSISCAL~TERMINAL/X195~CHANNEL/01~CUSNUM/29919806

Cadena salida

 <?xml version="1.0" encoding="utf-8" ?> 
  <string xmlns="http://tempuri.org/">ACTACC/ ~CHECK01/ ~CHECK02/ ~CHECK03/ ~CHECK04/ ~CHECK05/ ~CHECK06/ ~CHECK07/ ~CHECK08/ ~CHECK09/ ~CHECK10/ ~CONNU01/01270218140200002417~CONNU02/ ~CONNU03/ ~CONNU04/ ~CONNU05/ ~CONNU06/ ~CONNU07/ ~CONNU08/ ~CONNU09/ ~CONNU10/ ~CUSCOD/1199909150412 00~CUSNM/JUAN ~CUSNUM/01536003~ORD/00~PARTI01/T~PARTI02/ ~PARTI03/ ~PARTI04/ ~PARTI05/ ~PARTI06/ ~PARTI07/ ~PARTI08/ ~PARTI09/ ~PARTI10/ ~PROD01/INVERSION AZTECA 30 ~PROD03/ ~PRODD02/ ~PRODD04/ ~PRODD05/ ~PRODD06/ ~PRODD07/ ~PRODD08/ ~PRODD09/ ~PRODD10/ ~QLTY/ ~RELST01/C~RELST02/ ~RELST03/ ~RELST04/ ~RELST05/ ~RELST06/ ~RELST07/ ~RELST08/ ~RELST09/ ~RELST10/ ~SEQTI08/ ~SEQTY01/01~SEQTY02/ ~SEQTY03/ ~SEQTY04/ ~SEQTY05/ ~SEQTY06/ ~SEQTY07/ ~SEQTY09/ ~SEQTY10/ ~SFNM/ ~SURNM/PEREZ ~TARJE01/ ~TARJE02/ ~TARJE03/ ~TARJE04/ ~TARJE05/ ~TARJE06/ ~TARJE07/ ~TARJE08/ ~TARJE09/ ~TARJE10/ ~Warning messages:(PEA0016) NO EXISTEN MAS RELACIONES</string> ', '2014-08-25 19:03:15.441', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (41, 7, 'Issue', 3, '', '2014-08-26 11:41:07.446', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (42, 6, 'Issue', 3, '', '2014-08-26 11:41:48.713', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (116, 35, 'Issue', 1, 'Inserción de aclaración con flujo completo

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/aclaracion/full', '2014-09-09 11:55:03.047', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (117, 20, 'Issue', 9, 'Salida detalle aclaracion

    {
       "success": true,
       "errorCode": 0,
       "estatusAclaracion":
       {
           "fallo": "SIN FALLO",
           "estatus": "SIN DESPACHAR",
           "fechaResolucion": "12/08/2014",
           "prioridad": 1
       },
       "datosCliente":
       {
           "nombre": "DANIEL VALENCIA CONTRERAS",
           "numCuenta": "59361362175069",
           "numTarjeta": "5512380304869601",
           "calle": "FUENTE DE DIANA",
           "numero": "345",
           "colonia": "EVOLUCION",
           "estado": "MEXICO",
           "delegacionMunicipio": "NEZAHUALCOYOTL",
           "cp": "57700",
           "telefono": "00000000000",
           "extension": "000000000"
       },
       "datosCanalCaptura":
       {
           "canal": "ELEKTRA",
           "nombreFuncionario": "ISSAC BAUTISTA BAUTISTA",
           "numSucursal": "9999",
           "sucursal": "CALL CENTER"
       },
       "datosAclaracion":
       {
           "idPreFolio": 675932,
           "idFolio": 634220,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CONSUMO NO RECONOCIDO ",
           "idTipoacl": 929,
           "montoReclamado": 58,
           "fechaCaptura": "12/08/2014",
           "tiempoEstimadoResolucion": "45 Dias NATURALES",
           "fechaEstimadaResolucion": "26/09/2014",
           "modulo": "MODULO AHORRO",
           "comisionAcl": 0
       },
       "lstDocSoporte":
       [
           {
               "idDocSoporte": 1,
               "descDocSoporte": "CARTA RECLAMO"
           }
       ],
       "obsGenerales": "SE RECLAMA EL CONSUMO NO RECONOCIDO"
    }


salida detalle preaclaración

{
   "success": true,
   "errorCode": 0,
   "datosCliente":
   {
       "nombre": "PRUEBA PPRUEBAD CUENTA",
       "numCuenta": "0",
       "numTarjeta": "5512380304869601",
       "calle": "CICALCO",
       "numero": "128",
       "colonia": "PEDREGAL DE SANTO DOMINGO",
       "estado": "DISTRITO FEDERAL",
       "delegacionMunicipio": "COYOACAN",
       "cp": "4369",
       "telefono": "00000558484",
       "extension": "000558484"
   },
   "datosCanalCaptura":
   {
       "canal": "ELEKTRA",
       "nombreFuncionario": "ISSAC BAUTISTA BAUTISTA",
       "numSucursal": "9999",
       "sucursal": "CALL CENTER"
   },
   "datosAclaracion":
   {
       "idPreFolio": 675975,
       "idFolio": 0,
       "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
       "subProducto": "COMPRA EN ESTABLECIMIENTO",
       "clasificacion": "CARGO INDEBIDO",
       "caso": "CONSUMO NO RECONOCIDO ",
       "idTipoacl": 0,
       "montoReclamado": 528,
       "fechaCaptura": "20/08/2014",
       "tiempoEstimadoResolucion": "45 Dias NATURALES",
       "fechaEstimadaResolucion": "22/08/2014",
       "modulo": null,
       "comisionAcl": 0
   },
   "lstMovimientos":
   [
       {
           "subFolio": null,
           "numeroOperacion": 2,
           "fecha": "01/08/2014",
           "descripcion": "SANBORN S P CUICUILCO , MEXICO DF ",
           "importe": 199,
           "tipoOperacion": "COMPRA",
           "canalOperacion": "NA",
           "fallo": null,
           "montoReclamo": 0,
           "caso": null
       },
       {
           "subFolio": null,
           "numeroOperacion": 1,
           "fecha": "01/08/2014",
           "descripcion": "SANBORN S PERISUR , MEXICO DF ",
           "importe": 329,
           "tipoOperacion": "COMPRA",
           "canalOperacion": "NA",
           "fallo": null,
           "montoReclamo": 0,
           "caso": null
       }
   ],
   "observaciones":
   {
       "observacionesGenerales": "TEST",
       "montoTotalReclamo": 528
   }
', '2014-09-09 13:33:03.905', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (44, 20, 'Issue', 1, 'Detalle de aclaración

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/detalle/aclaracion/{pais}/{folio}

Ejemplo:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/detalle/aclaracion/1/634220
', '2014-08-26 12:01:17.904', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (40, 20, 'Issue', 1, 'Servicio: Historial de pre-aclaraciones y aclaraciones

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/cuenta/{pais}/{numReferencia}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/tarjeta/{pais}/{numReferencia}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/contrato/{pais}/{numReferencia}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/alnova/{pais}/{numReferencia}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/unico/{pais}/{numReferencia}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/emisor/{pais}/{numReferencia}

Ejemplo:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/cuenta/1/59361362175069
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/tarjeta/1/59361362175069
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/contrato/1/59361362175069
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/alnova/1/59361362175069
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/unico/1/59361362175069
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/folios/historial/emisor/1/59361362175069', '2014-08-26 11:38:32.487', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (111, 57, 'Issue', 12, '+*Modificaciones formato contrato de interfaz*+

Se realizaron las modificaciones en el contrato de interfaz para el proceso Alta de accion y Actualizacion de estatus.

Para el ejemplo especifico de Pre-apertura de cuenta se tienen los siguientes valores para tema, subtema y codificacion.

Tema
      1    Ventas

Subtemas
      1   Pre-apertura

Codificacion
      1   Solicitud no precencial
      2   Solicitud en sucursal

    
Ejemplo

Tema   Subtema   codificacion
 1        1           1
 1        1           2

   
          

', '2014-09-08 19:03:28.146', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (112, 57, 'Issue', 12, 'FYI', '2014-09-08 19:13:48.693', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (115, 55, 'Issue', 14, 'Se agregan parametros de entrada para el SP

La nueva entrada Json es

{
"folioAtn":1,
"idModulo":1,
"idTipoUsr":1,
"idTema":1,
"idSubTema":1,
"idCodificacion":1,
"usrId":"185A",
"nombreUsr":"RSalas",
"fechaIni":"02/09/2014 18:31:21",
"fechaPromesa":"21/09/2014",
"retroAlimentacion":"Cliente satisfecho",
"fechaFin":"02/09/2014 18:32:21",
"tiempoAtn":1,
"estatus":1,
"resolucion":"Se soluciona acceso a Web",
"numCliente":123456,
"nomCliente":"Juan Perez",
"canal":1,
"idEncuesta":1,
"califEncuesta":9,
"idioma":1
}

ó

{
"folioAccion":14090408,
"folioAtn":1,
"idModulo":1,
"idTipoUsr":1,
"idTema":1,
"idSubTema":1,
"idCodificacion":1,
"usrId":"185A",
"nombreUsr":"RSalas",
"fechaIni":"02/09/2014 18:31:21",
"fechaPromesa":"21/09/2014",
"retroAlimentacion":"Cliente satisfecho",
"fechaFin":"02/09/2014 18:32:21",
"tiempoAtn":1,
"estatus":1,
"resolucion":"Se soluciona acceso a Web",
"numCliente":123456,
"nomCliente":"Juan Perez",
"canal":1,
"idEncuesta":1,
"califEncuesta":9,
"idioma":1
}

', '2014-09-09 10:44:06.069', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (118, 54, 'Issue', 8, 'Hola Giovanni. Es necesario que modifiques el resultado de tu servicio para que temporalmente me devuelvas una estructura como esta:

{
    "fechaNacimiento":"26/01/1981",
    "cp":57700,
    "nomCliente":"DANIEL",
    "appatCliente":"VALENCIA",
    "apmatCliente":"CONTRERAS",
    "numCteAlnova":"29919806",
    "calle":"FUENTE DE DIANA",
    "numero":"345",
    "colonia":"EVOLUCION",
    "delegacion":"NEZAHUALCOYOTL",
    "estado":"MEXICO",
    "telefono":"5556581111",
    "extension":"00000000000",
    "nacionalidad":"MEXICANO",
    "codigoNacionalidad":"001",
    "edoCivil":"1",
    "curp":"VACD810126HDFLNN04",
    "rfc":"VACD810126M22",
    "sexo":"M"
}

Gracias.', '2014-09-09 18:27:18.381', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (119, 54, 'Issue', 1, 'Actualizado (con valores dummy), se requiere saber si hay algún listado de datos de entrada específicos para implementar dichos recursos.', '2014-09-09 18:58:18.819', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (46, 20, 'Issue', 1, 'Consulta de datos de cliente Alnova

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/alnova/cliente/{idPais}/{idOrigenCliente}/{numCteAlnova}
', '2014-08-26 17:48:26.917', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (47, 20, 'Issue', 1, 'Consulta retenciones

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/retenciones/cuenta/{pais}/{numCuenta}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/retenciones/tarjeta/{pais}/{numTarjeta}', '2014-08-27 13:59:01.081', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (43, 20, 'Issue', 1, 'Detalle de pre-aclaración

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/detalle/preaclaracion/{pais}/{prefolio}/{tipoPreaclaracion}

Ejemplo:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/detalle/preaclaracion/1/675975/n
', '2014-08-26 11:56:56.954', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (114, 35, 'Issue', 9, 'se sustituye el campo idPais por pais

{
"pais":"1",
"idPreacl":676051,
"tipoPreacl":"N",
"usuario":"777777",
"observaciones":"comentario" 
}
', '2014-09-09 09:34:06.222', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (113, 35, 'Issue', 9, 'url

http://host:puerto/aclaracionesWS/service/rest/aclaraciones/guardarAclaracionCompleta

cadena entrada

{
"idPais":"1",
"idPreacl":676051,
"tipoPreacl":"N",
"usuario":"777777",
"observaciones":"comentario"
}
', '2014-09-08 20:01:22.018', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (120, 30, 'Issue', 1, 'Actualzación de servicio de obtención de tipo de aclaración (app)

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/producto/{pais}/{idProducto}/{idCaso}', '2014-09-10 12:12:00.425', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (121, 60, 'Issue', 1, 'Consulta de catálogo de casos

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/catalogo/casos/{pais}/{idProducto}', '2014-09-11 11:15:17.298', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (122, 61, 'Issue', 1, 'Consulta de movimientos por producto

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimientos/producto/{pais}/{idProducto}/{idCaso}', '2014-09-11 11:17:26.64', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (123, 61, 'Issue', 1, 'Consulta de movimientos por producto

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimientos/producto/tarjeta/{pais}/{idProducto}/{idCaso}/{numTarjeta}/{fechaMovto}/{funckey} - tarjeta
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimientos/producto/cuenta/{pais}/{idProducto}/{idCaso}/{numCuenta} - cuenta', '2014-09-11 12:22:56.318', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (124, 41, 'Issue', 1, 'Consulta de documentos de soporte

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/soporte/documentos/tipoaclaracion/{pais}/{idTipoAcl}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/soporte/documentos/tipoaclaracion/{pais}/{idTipoAcl}/{idEtapa}', '2014-09-12 13:20:43.579', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (140, 67, 'Issue', 14, 'Se implementa servicio REST de consulta de acciones por numero de folio de atencion

URL Metodo GET 
http://ip:puerto/bocrw-atn-clientes/rs/accionfolioatn/{numAtn}

Ejemplo invocacion

http://localhost:9090/bocrw-atn-clientes/rs/accionfolioatn/140911070915001', '2014-09-19 16:39:42.252', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (142, 69, 'Issue', 14, 'Se implementa funcionalidad para el manejo de catalogos de codificacion en objetos a nivel aplicacion

Servicio REST para consulta de temas:

Metodo GET - http://ip:puerto/bocrw-atn-clientes/rs/bitacora/codificacion/temas

Servicio REST para consulta de subtemas:

Metodo GET - http://ip:puerto/bocrw-atn-clientes/rs/bitacora/codificacion/subtemas/{idTema}

Servicio REST para consulta de detalle:

Metodo GET - http://ip:puerto/bocrw-atn-clientes/rs/bitacora/codificacion/detalles/{idTema}/{idSubtema}
', '2014-09-22 15:58:37.566', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (143, 38, 'Issue', 3, 'Las personas de más reciente ingreso deben tener su copia del repositorio para poder copartir documentos con el resto del equipo.', '2014-09-22 19:16:31.918', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (144, 72, 'Issue', 4, '', '2014-09-24 16:08:40.473', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (145, 72, 'Issue', 4, 'Estatus considerados para CATESTABONOAUTO:

# Aplicado
# Pendiente CAT
# Pendiente autorización CAT
# Intentos agotados
# Aplicado manualmente
# Notificado', '2014-09-26 11:04:16.836', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (146, 20, 'Issue', 9, '{
   "success": true,
   "errorCode": 0,
   "lstPreAclaraciones":
   [
       {
           "preFolio": 675989,
           "tipoBusqueda": 1,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "RETENCIONES",
           "caso": "IMPORTE RETENIDO NO RECONOCIDO POR EL CLIENTE ",
           "estatus": "PREFOLIO",
           "tipoPreAclaracion": "N",
           "fechaCapturaPreacl": "28/08/2014"
       },
       {
           "preFolio": 676140,
           "tipoBusqueda": 1,
           "producto": "TARJETA AZTECA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CARGO NO RECONOCIDO ",
           "estatus": "PREFOLIO",
           "tipoPreAclaracion": "N",
           "fechaCapturaPreacl": "05/09/2014"
       },
       {
           "preFolio": 676141,
           "tipoBusqueda": 1,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CONSUMO NO RECONOCIDO ",
           "estatus": "PREFOLIO",
           "tipoPreAclaracion": "N",
           "fechaCapturaPreacl": "05/09/2014"
       },
       {
           "preFolio": 676142,
           "tipoBusqueda": 1,
           "producto": "TARJETA AZTECA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CARGO NO RECONOCIDO ",
           "estatus": "PREFOLIO",
           "tipoPreAclaracion": "N",
           "fechaCapturaPreacl": "05/09/2014"
       },
       {
           "preFolio": 676143,
           "tipoBusqueda": 1,
           "producto": "TARJETA AZTECA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CARGO NO RECONOCIDO ",
           "estatus": "PREFOLIO",
           "tipoPreAclaracion": "N",
           "fechaCapturaPreacl": "05/09/2014"
       },', '2014-09-26 18:53:30.679', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (54, 20, 'Issue', 14, 'Se agrega propiedad observaciones generales a la respuesta al consultar el detalle de la preaclaracion', '2014-08-28 16:25:08.245', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (48, 20, 'Issue', 1, 'Consulta de clientes

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/cliente/id/{pais}/{idCliente}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/cliente/alnova/{pais}/{numCteAlnova}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/cliente/unico/{pais}/{numCu}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/cliente/conteo/{pais}/{idCliente}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/cliente/num/{pais}/{numCteAlnova}/{numCu}


Inserción o actualizacion de datos de cliente

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/cliente', '2014-08-27 17:42:15.082', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (45, 20, 'Issue', 1, 'Consulta de datos de captura de canal

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/id/{pais}/{idDatoCaptura}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/sucursal/{pais}/{idSucursal}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/usuario/{pais}/{usuario}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/sucursal/usuario/{pais}/{idSucursal}/{usuario}


Ejemplo:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/id/1/11210
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/sucursal/1/100
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/usuario/1/300584
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/sucursal/usuario/1/100/300584


Inserción o actualizacion de datos de captura de canal

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/

Ejemplo
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/canalcaptura/
Inserción
{
	"pais":"1",
	"commitEnabled":1,
	"tipoOperacion": 1,
	"usuario":"300584",
	"idSucursal": 4576
}

Actualizacion
{
	"pais":"1",
	"idDatoCaptura":32688,
	"commitEnabled":1,
	"tipoOperacion": 2,
	"usuario":"300584",
	"idSucursal": 9382
}
', '2014-08-26 16:49:00.37', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (49, 25, 'Issue', 3, 'Lalo, favor de implementar este nuevo diseño, los íconos queda pendiente que los envíe Nydia, por el momento sólo trabajemos con botones con texto.', '2014-08-27 19:44:12.361', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (50, 31, 'Issue', 9, '', '2014-08-28 10:51:35.794', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (51, 32, 'Issue', 9, '', '2014-08-28 10:52:04.555', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (52, 29, 'Issue', 14, 'Se cambian las propiedades del objeto regresado por el servicio para regresar listas en vez de los Sets, ahora la respuesta sera de esta forma

{
   "success":true,
   "errorCode":0,
   "tipoaclaracion":{
      "mensaje":null,
      "query":"",
      "parametros":null,
      "estatusBD":null,
      "tipoOperacion":0,
      "commitEnbd":0,
      "idCombo":null,
      "descCombo":"",
      "visibilidadCheck":null,
      "descComboCats":"",
      "usuario_modifico":null,
      "fiidtipoacl":1,
      "catmodulo":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidmodulo":16,
         "fiidsistema":null,
         "fiidmodulopadre":null,
         "fcactivo":null,
         "fcdescmodulo":null,
         "fcnomcortomodulo":null,
         "fcobservaciones":null
      },
      "catcaso":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidcaso":1,
         "fcdesccaso":null,
         "fcnomcortocaso":null,
         "fcobservaciones":null,
         "fccodigorazon":null
      },
      "cattipodias":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidtipodias":1,
         "fcdesctipodias":null
      },
      "catproducto":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidproducto":1,
         "fcdescproducto":null,
         "fcnomcortoproducto":null,
         "fcobservaciones":null,
         "lstProdTipoClientes":[

         ]
      },
      "catsubproducto":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidsubproducto":1,
         "fcdescsubproducto":null,
         "fcnomcortosubproducto":null,
         "fcobservaciones":null,
         "fcdescproducto":"",
         "totalproducto":"",
         "totalsubproducto":"",
         "totalaclaraciones":"",
         "colUsuarios":[

         ]
      },
      "catclasificacion":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidclasificacion":1,
         "fcdescclasificacion":null,
         "fcnomcortoclasificacion":null,
         "fcobservaciones":null
      },
      "fitiempoestresol":15,
      "fccontaauto":"0",
      "fcsolicitamonto":"1",
      "fcactivo":"1",
      "fccodigo":null,
      "fncomision":50.0,
      "lstDocSoporteTipoAcls":[

      ],
      "lstRespuestaTipoAcls":[

      ],
      "lstDespTipoAclaracions":[

      ],
      "lstTipoDatoProdTipoAcls":[

      ],
      "lstArchivoProsaAcl":[

      ]
   }
}', '2014-08-28 13:12:09.51', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (53, 30, 'Issue', 14, 'Se cambian las propiedades del objeto regresado por el servicio para regresar listas en vez de los Sets, ahora la respuesta sera de este tipo

{
   "success":true,
   "errorCode":0,
   "tipoaclaracion":{
      "mensaje":null,
      "query":"",
      "parametros":null,
      "estatusBD":null,
      "tipoOperacion":0,
      "commitEnbd":0,
      "idCombo":null,
      "descCombo":"",
      "visibilidadCheck":null,
      "descComboCats":"",
      "usuario_modifico":null,
      "fiidtipoacl":1,
      "catmodulo":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidmodulo":16,
         "fiidsistema":null,
         "fiidmodulopadre":null,
         "fcactivo":null,
         "fcdescmodulo":"MODULO AHORRO",
         "fcnomcortomodulo":"MAH",
         "fcobservaciones":null
      },
      "catcaso":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":1,
         "descCombo":"EL CLIENTE NO RECONOCE DISPOSICION ",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidcaso":1,
         "fcdesccaso":"EL CLIENTE NO RECONOCE DISPOSICION ",
         "fcnomcortocaso":null,
         "fcobservaciones":null,
         "fccodigorazon":null
      },
      "cattipodias":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidtipodias":1,
         "fcdesctipodias":"HABILES"
      },
      "catproducto":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":null,
         "descCombo":"",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidproducto":1,
         "fcdescproducto":"AHORRO",
         "fcnomcortoproducto":"AHO",
         "fcobservaciones":null,
         "lstProdTipoClientes":[

         ]
      },
      "catsubproducto":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":1,
         "descCombo":"GUARDADITO",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidsubproducto":1,
         "fcdescsubproducto":"GUARDADITO",
         "fcnomcortosubproducto":"GDTO",
         "fcobservaciones":null,
         "fcdescproducto":"",
         "totalproducto":"",
         "totalsubproducto":"",
         "totalaclaraciones":"",
         "colUsuarios":[

         ]
      },
      "catclasificacion":{
         "mensaje":null,
         "query":"",
         "parametros":null,
         "estatusBD":null,
         "tipoOperacion":0,
         "commitEnbd":0,
         "idCombo":1,
         "descCombo":"RETIRO",
         "visibilidadCheck":null,
         "descComboCats":"",
         "usuario_modifico":null,
         "fiidclasificacion":1,
         "fcdescclasificacion":"RETIRO",
         "fcnomcortoclasificacion":null,
         "fcobservaciones":null
      },
      "fitiempoestresol":15,
      "fccontaauto":"0",
      "fcsolicitamonto":"1",
      "fcactivo":"1",
      "fccodigo":null,
      "fncomision":50.0,
      "lstDocSoporteTipoAcls":[

      ],
      "lstRespuestaTipoAcls":[

      ],
      "lstDespTipoAclaracions":[

      ],
      "lstTipoDatoProdTipoAcls":[
         {
            "mensaje":null,
            "query":"",
            "parametros":null,
            "estatusBD":null,
            "tipoOperacion":0,
            "commitEnbd":0,
            "idCombo":null,
            "descCombo":"",
            "visibilidadCheck":null,
            "descComboCats":"",
            "usuario_modifico":null,
            "fiidtipoacl":1,
            "cattipodatoproducto":{
               "mensaje":null,
               "query":"",
               "parametros":null,
               "estatusBD":null,
               "tipoOperacion":0,
               "commitEnbd":0,
               "idCombo":null,
               "descCombo":"",
               "visibilidadCheck":null,
               "descComboCats":"",
               "usuario_modifico":null,
               "fiidtipodatoproducto":4,
               "fcdesctipodatoproducto":"MOVIMIENTO"
            },
            "fcopcional":"1",
            "fcactivo":"1",
            "fiidtipodatoprodxtipoacl":41
         }
      ],
      "lstArchivoProsaAcl":[

      ]
   }
}', '2014-08-28 13:14:23.316', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (56, 20, 'Issue', 1, 'Consulta de movimientos

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/movimientos/tarjeta/{idPais}/{numTarjeta}/{fechaMovto}/{funckey}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/movimientos/cuenta/{idPais}/{numCuenta}', '2014-08-28 19:38:37.001', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (55, 20, 'Issue', 1, 'Consulta de tipo de aclaración

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/id/{pais}/{idTipoAclaracion}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/subproducto/{pais}/{idProducto}/{idSubproducto}/{idClasificacion}/{idCaso}/{activo}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/activo/{pais}/{idTipoAclaracion}/{activo}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/subproducto/{pais}/{idProducto}/{idSubproducto}/{idClasificacion}/{idCaso}/{activo}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/producto/{pais}/{idProducto}/{idClasificacion}/{idCaso}/{activo}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/caso/{pais}/{idProducto}/{idClasificacion}/{idCaso}/{activo}

Consulta de tipo de operacion

(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/operacion/tipo/{pais}/{descTipoOperacion}', '2014-08-28 18:43:11.578', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (57, 27, 'Issue', 14, 'Se agrega un metodo para poder realizar la insercion o actualizacion de una lista de datos

URL Servicio por metodo POST

http://ip:puerto/aclaracionesWS/service/rest/aclaraciones/guardarListModificacionDatos

Json Entrada para realizar la modificacion de una lista de datos

{
"lstModificacionDatosRequest":[
{
"pais":"1",
"tipoOperacion":1,
"commitEnabled":1,
"idPreAcl":1,
"tipoPreAcl":"N",
"idDatoPersonal":1,
"datoModificado":"datoM",
"datoOriginal":"datoO"
},
{
"pais":"1",
"tipoOperacion":1,
"commitEnabled":1,
"idPreAcl":1,
"tipoPreAcl":"N",
"idDatoPersonal":1,
"datoModificado":"datoM",
"datoOriginal":"datoO"
},
{
"pais":"1",
"tipoOperacion":1,
"commitEnabled":1,
"idPreAcl":1,
"tipoPreAcl":"N",
"idDatoPersonal":1,
"datoModificado":"datoM",
"datoOriginal":"datoO"
}
]
}

Respuesta Exitosa
{
   "lstModificacionDatosResponse":[
      {
         "success":true,
         "errorCode":0,
         "idModDatos":"43282"
      },
      {
         "success":true,
         "errorCode":0,
         "idModDatos":"43283"
      },
      {
         "success":true,
         "errorCode":0,
         "idModDatos":"43284"
      }
   ]
}


Respuesta con error de algun elemento enviado en la lista
{
   "success":true,
   "errorCode":0,
   "lstModificacionDatosResponse":[
      {
         "success":true,
         "errorCode":0,
         "idModDatos":"43293"
      },
      {
         "success":true,
         "errorCode":0,
         "idModDatos":"43294"
      },
      {
         "success":false,
         "errorCode":22,
         "idModDatos":null
      }
   ]
}

Respuesta con error
{
   "success":false,
   "errorCode":45,
   "lstModificacionDatosResponse":[

   ]
}

', '2014-08-29 11:32:17.963', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (58, 31, 'Issue', 9, '', '2014-08-29 12:30:20.019', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (59, 31, 'Issue', 9, 'Se agrega campo de tarjeta al resultado de movimientos', '2014-08-29 12:31:24.628', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (60, 20, 'Issue', 1, 'Inserción o actualización de aclaración

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion', '2014-08-29 16:41:29.626', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (61, 24, 'Issue', 3, 'Julián González wrote:
> Hola les envío el diseño que están implementando los demás sistemas de Acertum. La idea es que sea el mismo estilo y css para todas nuestras páginas.

La fuente se encuentra en el repo en \Desarrollo\Disenio\exo.zip', '2014-08-29 17:40:11.267', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (129, 20, 'Issue', 9, 'lstAclaraciones":
   [
       {
           "folio": 634220,
           "tipoBusqueda": 1,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CONSUMO NO RECONOCIDO ",
           "estatus": "SIN DESPACHAR",
           "fechaCaptura": "12/08/2014",
           "dias_resol": -9
       },
       {
           "folio": 634221,
           "tipoBusqueda": 1,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "RETENCIONES",
           "caso": "IMPORTE RETENIDO NO RECONOCIDO POR EL CLIENTE ",
           "estatus": "SIN DESPACHAR",
           "fechaCaptura": "12/08/2014",
           "dias_resol": 21
       },', '2014-09-17 17:51:01.649', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (64, 28, 'Issue', 1, 'Consulta de tipo de operacion

(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/operacion/tipo/{pais}/{descTipoOperacion}', '2014-08-29 18:24:06.086', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (66, 31, 'Issue', 1, 'Consulta de movimientos

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/movimientos/tarjeta/{idPais}/{numTarjeta}/{fechaMovto}/{funckey}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/movimientos/cuenta/{idPais}/{numCuenta}', '2014-08-29 18:25:28.191', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (68, 22, 'Issue', 1, 'Consulta retenciones

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/retenciones/cuenta/{pais}/{numCuenta}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/retenciones/tarjeta/{pais}/{numTarjeta}', '2014-08-29 18:28:53.632', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (130, 53, 'Issue', 8, 'Dashboard completado', '2014-09-18 11:00:41.572', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (62, 29, 'Issue', 1, 'Consulta de tipo de aclaración

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/id/{pais}/{idTipoAclaracion}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/subproducto/{pais}/{idProducto}/{idSubproducto}/{idClasificacion}/{idCaso}', '2014-08-29 18:22:10.19', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (63, 30, 'Issue', 1, 'Consulta de tipo de aclaración (app)

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/activo/{pais}/{idTipoAclaracion}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/subproducto/{pais}/{idProducto}/{idSubproducto}/{idClasificacion}/{idCaso}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/producto/{pais}/{idProducto}/{idClasificacion}/{idCaso}
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/app/caso/{pais}/{idProducto}/{idClasificacion}/{idCaso}', '2014-08-29 18:22:56.263', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (65, 35, 'Issue', 1, 'Inserción o actualización de aclaración

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/aclaracion - inserción
(PUT) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/aclaracion - actualización', '2014-08-29 18:24:47.516', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (128, 65, 'Issue', 1, 'Para la URL, acceden al servidor GitBlit y seleccionan:

Repositorio (BoCRWCatalogManager) > URL del Repositorio > Git > (alguna opción con lectura y escritura)

Ejemplo:
git clone ssh://gfarfanb@10.51.215.38:29418/projects/web/BoCRWCatalogManager.git

Durante el clone se solicitará el password de su usuario de GitBlit.', '2014-09-17 13:15:45.681', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (131, 49, 'Issue', 8, 'Componente para bloquear la pantalla al realizar solicitudes AJAX finalizado', '2014-09-18 11:01:55.412', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (132, 24, 'Issue', 8, 'Los estilos y componentes sugeridos por el área de diseño fueron aplicados en el proyecto', '2014-09-18 11:02:38.298', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (133, 16, 'Issue', 8, 'Diseño aplicado al proyecto', '2014-09-18 11:03:03.711', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (134, 12, 'Issue', 8, 'Página de login finalizada', '2014-09-18 11:03:27.15', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (135, 8, 'Issue', 8, 'Componente para buscar al cliente único por diferentes criterios ha quedado finalizada', '2014-09-18 11:04:07.099', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (136, 66, 'Issue', 14, 'Implementacion del servicio de consulta de acciones por cliente (Consulta principal de acciones)

URL metodo GET http://ip:puerto/bocrw-atn-clientes/rs/accioncte/{numCte}

Ejemplo invocación

http://ip:puerto/bocrw-atn-clientes/rs/accioncte/999999
http://ip:puerto/bocrw-atn-clientes/rs/accioncte/123', '2014-09-18 17:40:51.335', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (137, 66, 'Issue', 14, 'Implementacion del servicio de consulta de codificacion (Consulta para descripcion de codificacion)

URL Metodo GET http://ip:puerto/bocrw-atn-clientes/rs/bitacora/codificacion/{idCodificacion}

Ejemplos invocación:

http://ip:puerto/bocrw-atn-clientes/rs/bitacora/codificacion/1
http://ip:puerto/bocrw-atn-clientes/rs/bitacora/codificacion/10000', '2014-09-18 18:38:45.077', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (67, 21, 'Issue', 1, 'Consulta de clientes

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/cliente/id/{pais}/{idCliente}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/cliente/alnova/{pais}/{numCteAlnova}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/cliente/unico/{pais}/{numCu}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/cliente/conteo/{pais}/{idCliente}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/cliente/num/{pais}/{numCteAlnova}/{numCu}

Inserción o actualizacion de datos de cliente

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/cliente', '2014-08-29 18:27:22.42', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (138, 68, 'Issue', 1, 'Devolución automática de aclaración

URL:
(PUT) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/devolucion/automatico', '2014-09-19 12:15:07.408', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (139, 67, 'Issue', 14, 'Se realiza la implementacion del servicio REST consultar folio atencion clientes (Procedimiento para consultar atenciones de un cliente)

URL Metodo GET

http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/{numCte}/{fechaIni}/{fechaFin}/{status}/{idioma}
http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/{numCte}/{fechaIni}/{fechaFin}/{status}
http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/{numCte}/{fechaIni}/{fechaFin}

Ejemplos invocacion

http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/999999/2014-08-01/2014-12-11/1/1
http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/999999/2014-08-01/2014-12-11/1
http://ip:puerto/bocrw-atn-clientes/rs/foliosaccioncte/999999/2014-08-01/2014-12-11

', '2014-09-19 12:48:20.296', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (82, 44, 'Issue', 1, 'Consulta de documentos de pre-aclaración

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/preaclaracion/documentos/id/{idPais}/{idPreacl}/{tipoPreacl}', '2014-09-02 20:29:03.024', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (79, 43, 'Issue', 1, 'Inserción o actualización de pre-aclaración

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/preaclaracion - inserción
(PUT) http://localhost:8080/bocrw-atn-clientes/aclaraciones/preaclaracion - actualización

Inserción de pre-aclaración con resumen

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/preaclaracion/resumen - inserción
', '2014-09-02 19:18:23.455', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (70, 32, 'Issue', 4, '*Servicio: Búsqueda de usuario*

URL: http://localhost:8080/bocrw-atn-clientes/aclaraciones/usuario/{idPais}/{usuario}

Método: GET


*Ejemplo*

GET - http://localhost:8080/bocrw-atn-clientes/aclaraciones/usuario/1/300584', '2014-08-29 18:59:04.433', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (71, 32, 'Issue', 4, '*Servicio: Inserción de usuario*

URL: http://localhost:8080/bocrw-atn-clientes/aclaraciones/usuario

Método: POST

Cuerpo de la petición:

{
"idPais":"1",
"fcusuario":"987654",
"fcnombre":"ALEX",
"fcappaterno":"MAGNUM",
"fcapmaterno":"MAZE",
"fcmail":"otrocorreo@elektra.com.mx",
"fiidsistema":"1",
"fiidrol":"15"
}


*Ejemplo*

POST - http://localhost:8080/bocrw-atn-clientes/aclaraciones/usuario

{
"idPais":"1",
"fcusuario":"987654",
"fcnombre":"ALEX",
"fcappaterno":"MAGNUM",
"fcapmaterno":"MAZE",
"fcmail":"otrocorreo@elektra.com.mx",
"fiidsistema":"1",
"fiidrol":"15"
}', '2014-08-29 19:01:33.103', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (72, 42, 'Issue', 8, 'debes cambiar esta linea para que el ordenamiento funcione

*$defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));*', '2014-09-01 10:45:14.374', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (74, 34, 'Issue', 1, 'Inserción o actualización de retención

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/aclaraciones/retencion - inserción
(PUT) http://localhost:8080/bocrw-atn-clientes/aclaraciones/retencion - actualización
', '2014-09-01 11:17:09.175', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (76, 20, 'Issue', 1, '', '2014-09-01 11:42:09.117', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (77, 43, 'Issue', 9, '', '2014-09-02 16:39:11.467', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (78, 43, 'Issue', 9, 'Modificación de la cadena json para el servicio de guardar preaclaracion ', '2014-09-02 16:39:52.951', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (75, 40, 'Issue', 1, 'Consulta de catálogo de datos personales

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/catalogo/datos/personales/{pais} 
', '2014-09-01 11:41:02.245', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (83, 45, 'Issue', 14, 'Se realizan correcciones al código para adaptarse a estandares de programación', '2014-09-03 10:53:13.775', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (84, 45, 'Issue', 1, 'URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/bitacora', '2014-09-03 12:01:36.186', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (85, 46, 'Issue', 3, 'El contrato de interfaz para la generación de la secuencia se encuentra en la ruta:

REPO_ATENCION\ci\PORTAL ATENCION\ConInterfaz_FNMXAP_IDCUENTA

usuario  : atn_portal
pwd:    atn_portal01', '2014-09-03 13:05:47.505', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (80, 44, 'Issue', 1, 'Consulta de bin de tarjeta por producto

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/tarjeta/producto/{idPais}/{idProducto}/{numTarjeta}', '2014-09-02 19:46:07.888', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (81, 44, 'Issue', 1, 'Consulta de catálogo de clasificación Alnova

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/catalogo/alnova/clasificacion/{idPais}/{idCatClasifAlnova}', '2014-09-02 20:05:18.926', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (86, 44, 'Issue', 5, 'El servicio "Clasificación ALNOVA" no regresa nada, en el servidor me marca el mismo error que salían en los métodos anteriores.', '2014-09-04 12:32:40.038', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (87, 44, 'Issue', 1, 'Se agregaron los valores de consulta interno para el consumo correcto del servicio (activo, tipoOperacion). El servicio response adecuadamente. No hay cambios en URL definida.', '2014-09-04 12:45:15.284', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (88, 54, 'Issue', 1, '', '2014-09-04 13:03:47.374', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (89, 44, 'Issue', 5, 'El servicio "Consulta de bin de tarjeta por producto" manda una respuesta adecuada en el cuerpo, pero el Header lo manda con código 406 Not Acceptable', '2014-09-04 13:34:25.658', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (90, 54, 'Issue', 1, 'Consulta de datos de cliente (datos dummy)

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/cliente/{idCliente}

Ej. de resultado:
{

    "fechaNacimiento":"04/09/2014",
    "idCliente":5,
    "nombre":"Nombre",
    "apPaterno":"Paterno",
    "apMaterno":"Materno",
    "nacionalidad":"Mexicano",
    "codigoNacionalidad":5,
    "edoCivil":"Casado",
    "curp":"FFFF55555FFFF55F",
    "rfc":"FFFF55555FFFF",
    "sexo":"m",
    "direccion":{
        "calle":"Calle",
        "numExterior":"5",
        "numInterior":"5",
        "colonia":"Colonia",
        "cp":555555,
        "municipio":"Delegación",
        "estado":"Estado"
    },
    "numTelefonos":[
        {
            "telefono":"5555555555",
            "extension":55555,
            "tipo":null
        }
    ]

}', '2014-09-04 17:16:39.575', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (91, 29, 'Issue', 9, 'Se modifico el servicio para regresar un listado de tipoaclaracion cadena de salida:



    {
       "success": true,
       "errorCode": 0,
       "arlTipoaclaracion":
       [
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": 1,
               "descCombo": "EL CLIENTE NO RECONOCE DISPOSICION ",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidcaso": 1,
               "fcdesccaso": "EL CLIENTE NO RECONOCE DISPOSICION ",
               "fcnomcortocaso": null,
               "fcobservaciones": null,
               "fccodigorazon": null
           },
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": 163,
               "descCombo": "EL CAJERO AUTOMATICO NO ENTREGO CANTIDAD SOLICITADA ",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidcaso": 163,
               "fcdesccaso": "EL CAJERO AUTOMATICO NO ENTREGO CANTIDAD SOLICITADA ",
               "fcnomcortocaso": null,
               "fcobservaciones": null,
               "fccodigorazon": null
           },
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": 2,
               "descCombo": "DISPOSICION DUPLICADA ",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidcaso": 2,
               "fcdesccaso": "DISPOSICION DUPLICADA ",
               "fcnomcortocaso": null,
               "fcobservaciones": null,
               "fccodigorazon": null
           }
       ]
    }


', '2014-09-04 17:24:25.648', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (92, 44, 'Issue', 1, 'Se solicitó la actualización en los servicios de aclaraciones: el idError debe ser 1 cuando la operación sea exitosa', '2014-09-04 17:41:42.849', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (73, 37, 'Issue', 1, 'Inserción o actualización de movimiento

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimiento - inserción
(PUT) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimiento - actualización


Inserción o actualización de movimiento CNBV

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimiento/cnbv - inserción
(PUT) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/movimiento/cnbv - actualización', '2014-09-01 11:03:51.313', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (69, 27, 'Issue', 4, '*Servicio: Guardar modificación de datos*

URL: http://localhost:8080/bocrw-atn-clientes/aclaraciones/datos/

Método: POST

Cuerpo de la petición:

{
 "lstModificacionDatosRequest":[
  {
   "pais":"1",
   "tipoOperacion":1,
   "commitEnabled":1,
   "idPreAcl":1,
   "tipoPreAcl":"N",
   "idDatoPersonal":1,
   "datoModificado":"datoM",
   "datoOriginal":"datoO"
  },
  ...
 ]
}

*Ejemplo*
POST - http://localhost:8080/bocrw-atn-clientes/aclaraciones/datos/

{
 "lstModificacionDatosRequest":[
  {
   "pais":"1",
   "tipoOperacion":1,
   "commitEnabled":1,
   "idPreAcl":1,
   "tipoPreAcl":"N",
   "idDatoPersonal":1,
   "datoModificado":"datoM",
   "datoOriginal":"datoO"
  }, {
   "pais":"1",
   "tipoOperacion":1,
   "commitEnabled":1,
   "idPreAcl":1,
   "tipoPreAcl":"N",
   "idDatoPersonal":1,
   "datoModificado":"datoM",
   "datoOriginal":"datoO"
  }, {
   "pais":"1",
   "tipoOperacion":1,
   "commitEnabled":1,
   "idPreAcl":1,
   "tipoPreAcl":"N",
   "idDatoPersonal":1,
   "datoModificado":"datoM",
   "datoOriginal":"datoO"
  }
 ]
}', '2014-08-29 18:50:49.161', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (97, 56, 'Issue', 1, 'Consulta de catálogo de nacionalidad

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/catalogo/nacionalidad/id/{pais}/{idEstadoDatoPer}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/catalogo/nacionalidad/codigo/{pais}/{codigo}
(GET) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/catalogo/nacionalidad/dato/{pais}/{idDatoPersonal}', '2014-09-04 19:12:41.15', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (98, 30, 'Issue', 5, 'El método debe recibir 3 parametros: idProducto, idClasificacion e idCaso.

El idOperacion depende de: Si idClasificacion es MAYOR que 0 es igual idOperacion es 4, de lo contrario idOperacion es igual 3', '2014-09-04 19:33:11.384', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (99, 30, 'Issue', 5, 'Corrijó, debe recibir 4 parametros: idProducto, idClasificacion, idCaso mas idPais.', '2014-09-04 19:35:38.05', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (100, 55, 'Issue', 14, 'URL invocación por metodo POST

http://ip:puerto/bocrw-atn-clientes/rs/bitacora/insertAccionBitacora

JSON Entrada

{
"folioAtn":1,
"idModulo":1,
"idTipoUsr":1,
"idTema":1,
"idSubTema":1,
"idCodificacion":1,
"usrId":"185A",
"nombreUsr":"RSalas",
"fechaIni":"02/09/2014 18:31:21",
"fechaPromesa":"21/09/2014",
"retroAlimentacion":"Cliente satisfecho",
"fechaFin":"02/09/2014 18:32:21",
"tiempoAtn":1,
"estatus":1,
"idioma":1
}

ó

{
"folioAccion":14090408,
"folioAtn":1,
"idModulo":1,
"idTipoUsr":1,
"idTema":1,
"idSubTema":1,
"idCodificacion":2,
"usrId":"185A",
"nombreUsr":"RSalas",
"fechaIni":"02/09/2014 18:31:21",
"fechaPromesa":"21/09/2014",
"retroAlimentacion":"Cliente satisfecho",
"fechaFin":"02/09/2014 18:32:21",
"tiempoAtn":1,
"estatus":1,
"idioma":1
}

Respuesta exitosa

{
   "success":true,
   "codigo":1,
   "descripcion":"Proceso terminado correctamente.",
   "folioAccion":14090408
}

Respuesta Error

{
   "success":false,
   "codigo":0,
   "descripcion":"Se han violado los contraints de los parametros de entrada"
}', '2014-09-04 20:03:12.311', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (101, 55, 'Issue', 14, 'URL Invocación servicio REST por metodo POST

http://ip:puerto/bocrw-atn-clientes/rs/bitacora/updateAccionBitacora

JSON Entrada

{
"folioAccion":14090408,
"folioAtn":1,
"usrModif":"185A",
"idioma":1
}

Respuesta exitosa

{
   "success":true,
   "codigo":1,
   "descripcion":"Proceso terminado correctamente"
}

Respuesta Error

{
   "success":false,
   "codigo":0,
   "descripcion":"Se han violado los contraints de los parametros de entrada"
}', '2014-09-04 20:06:14.697', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (93, 29, 'Issue', 1, 'Consulta de tipo de aclaración

URL:
(GET) http://localhost:8080/bocrw-atn-clientes/aclaraciones/aclaracion/tipo/subproducto/{pais}/{idProducto}/{idSubproducto}/{idClasificacion}

Se resuelve internamente la condición:
idClasificacion > 0 entonces tipoOperacion = 6
idClasificacion < 1 entonces tipoOperacion = 7', '2014-09-04 17:51:40.501', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (102, 30, 'Issue', 1, 'Se resuelve internamente la condición:
idClasificacion > 0 entonces tipoOperacion = 4
idClasificacion < 1 entonces tipoOperacion = 3', '2014-09-04 20:20:06.764', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (103, 29, 'Issue', 5, 'Al invocar el servicio, el servidor arroja el siguiente error:
Caused by: com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException: Unrecognized field "fiidcaso"', '2014-09-04 20:36:11.149', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (104, 29, 'Issue', 9, 'se corrige la respuesta de tipo aclaración para que regrese solo una lista de objetos Tipoaclaracion


    {
       "success": true,
       "errorCode": 0,
       "arlTipoaclaracion":
       [
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": null,
               "descCombo": "",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidtipoacl": null,
               "catmodulo":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidmodulo": null,
                   "fiidsistema": null,
                   "fiidmodulopadre": null,
                   "fcactivo": null,
                   "fcdescmodulo": null,
                   "fcnomcortomodulo": null,
                   "fcobservaciones": null
               },
               "catcaso":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": 7,
                   "descCombo": "RETIRO DUPLICADO ",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidcaso": 7,
                   "fcdesccaso": "RETIRO DUPLICADO ",
                   "fcnomcortocaso": null,
                   "fcobservaciones": null,
                   "fccodigorazon": null
               },
               "cattipodias":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidtipodias": null,
                   "fcdesctipodias": null
               },
               "catproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidproducto": null,
                   "fcdescproducto": null,
                   "fcnomcortoproducto": null,
                   "fcobservaciones": null,
                   "lstProdTipoClientes":
                   [
                   ]
               },
               "catsubproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidsubproducto": null,
                   "fcdescsubproducto": null,
                   "fcnomcortosubproducto": null,
                   "fcobservaciones": null,
                   "fcdescproducto": "",
                   "totalproducto": "",
                   "totalsubproducto": "",
                   "totalaclaraciones": "",
                   "colUsuarios":
                   [
                   ]
               },
               "catclasificacion":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidclasificacion": null,
                   "fcdescclasificacion": null,
                   "fcnomcortoclasificacion": null,
                   "fcobservaciones": null
               },
               "fitiempoestresol": null,
               "fccontaauto": null,
               "fcsolicitamonto": null,
               "fcactivo": null,
               "fccodigo": null,
               "fncomision": null,
               "lstDocSoporteTipoAcls":
               [
               ],
               "lstRespuestaTipoAcls":
               [
               ],
               "lstDespTipoAclaracions":
               [
               ],
               "lstTipoDatoProdTipoAcls":
               [
               ],
               "lstArchivoProsaAcl":
               [
               ]
           },
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": null,
               "descCombo": "",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidtipoacl": null,
               "catmodulo":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidmodulo": null,
                   "fiidsistema": null,
                   "fiidmodulopadre": null,
                   "fcactivo": null,
                   "fcdescmodulo": null,
                   "fcnomcortomodulo": null,
                   "fcobservaciones": null
               },
               "catcaso":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": 7,
                   "descCombo": "RETIRO DUPLICADO ",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidcaso": 7,
                   "fcdesccaso": "RETIRO DUPLICADO ",
                   "fcnomcortocaso": null,
                   "fcobservaciones": null,
                   "fccodigorazon": null
               },
               "cattipodias":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidtipodias": null,
                   "fcdesctipodias": null
               },
               "catproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidproducto": null,
                   "fcdescproducto": null,
                   "fcnomcortoproducto": null,
                   "fcobservaciones": null,
                   "lstProdTipoClientes":
                   [
                   ]
               },
               "catsubproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidsubproducto": null,
                   "fcdescsubproducto": null,
                   "fcnomcortosubproducto": null,
                   "fcobservaciones": null,
                   "fcdescproducto": "",
                   "totalproducto": "",
                   "totalsubproducto": "",
                   "totalaclaraciones": "",
                   "colUsuarios":
                   [
                   ]
               },
               "catclasificacion":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidclasificacion": null,
                   "fcdescclasificacion": null,
                   "fcnomcortoclasificacion": null,
                   "fcobservaciones": null
               },
               "fitiempoestresol": null,
               "fccontaauto": null,
               "fcsolicitamonto": null,
               "fcactivo": null,
               "fccodigo": null,
               "fncomision": null,
               "lstDocSoporteTipoAcls":
               [
               ],
               "lstRespuestaTipoAcls":
               [
               ],
               "lstDespTipoAclaracions":
               [
               ],
               "lstTipoDatoProdTipoAcls":
               [
               ],
               "lstArchivoProsaAcl":
               [
               ]
           },
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": null,
               "descCombo": "",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidtipoacl": null,
               "catmodulo":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidmodulo": null,
                   "fiidsistema": null,
                   "fiidmodulopadre": null,
                   "fcactivo": null,
                   "fcdescmodulo": null,
                   "fcnomcortomodulo": null,
                   "fcobservaciones": null
               },
               "catcaso":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": 7,
                   "descCombo": "RETIRO DUPLICADO ",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidcaso": 7,
                   "fcdesccaso": "RETIRO DUPLICADO ",
                   "fcnomcortocaso": null,
                   "fcobservaciones": null,
                   "fccodigorazon": null
               },
               "cattipodias":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidtipodias": null,
                   "fcdesctipodias": null
               },
               "catproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidproducto": null,
                   "fcdescproducto": null,
                   "fcnomcortoproducto": null,
                   "fcobservaciones": null,
                   "lstProdTipoClientes":
                   [
                   ]
               },
               "catsubproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidsubproducto": null,
                   "fcdescsubproducto": null,
                   "fcnomcortosubproducto": null,
                   "fcobservaciones": null,
                   "fcdescproducto": "",
                   "totalproducto": "",
                   "totalsubproducto": "",
                   "totalaclaraciones": "",
                   "colUsuarios":
                   [
                   ]
               },
               "catclasificacion":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidclasificacion": null,
                   "fcdescclasificacion": null,
                   "fcnomcortoclasificacion": null,
                   "fcobservaciones": null
               },
               "fitiempoestresol": null,
               "fccontaauto": null,
               "fcsolicitamonto": null,
               "fcactivo": null,
               "fccodigo": null,
               "fncomision": null,
               "lstDocSoporteTipoAcls":
               [
               ],
               "lstRespuestaTipoAcls":
               [
               ],
               "lstDespTipoAclaracions":
               [
               ],
               "lstTipoDatoProdTipoAcls":
               [
               ],
               "lstArchivoProsaAcl":
               [
               ]
           },
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": null,
               "descCombo": "",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidtipoacl": null,
               "catmodulo":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidmodulo": null,
                   "fiidsistema": null,
                   "fiidmodulopadre": null,
                   "fcactivo": null,
                   "fcdescmodulo": null,
                   "fcnomcortomodulo": null,
                   "fcobservaciones": null
               },
               "catcaso":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": 7,
                   "descCombo": "RETIRO DUPLICADO ",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidcaso": 7,
                   "fcdesccaso": "RETIRO DUPLICADO ",
                   "fcnomcortocaso": null,
                   "fcobservaciones": null,
                   "fccodigorazon": null
               },
               "cattipodias":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidtipodias": null,
                   "fcdesctipodias": null
               },
               "catproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidproducto": null,
                   "fcdescproducto": null,
                   "fcnomcortoproducto": null,
                   "fcobservaciones": null,
                   "lstProdTipoClientes":
                   [
                   ]
               },
               "catsubproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidsubproducto": null,
                   "fcdescsubproducto": null,
                   "fcnomcortosubproducto": null,
                   "fcobservaciones": null,
                   "fcdescproducto": "",
                   "totalproducto": "",
                   "totalsubproducto": "",
                   "totalaclaraciones": "",
                   "colUsuarios":
                   [
                   ]
               },
               "catclasificacion":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidclasificacion": null,
                   "fcdescclasificacion": null,
                   "fcnomcortoclasificacion": null,
                   "fcobservaciones": null
               },
               "fitiempoestresol": null,
               "fccontaauto": null,
               "fcsolicitamonto": null,
               "fcactivo": null,
               "fccodigo": null,
               "fncomision": null,
               "lstDocSoporteTipoAcls":
               [
               ],
               "lstRespuestaTipoAcls":
               [
               ],
               "lstDespTipoAclaracions":
               [
               ],
               "lstTipoDatoProdTipoAcls":
               [
               ],
               "lstArchivoProsaAcl":
               [
               ]
           },
           {
               "mensaje": null,
               "query": "",
               "parametros": null,
               "estatusBD": null,
               "tipoOperacion": 0,
               "commitEnbd": 0,
               "idCombo": null,
               "descCombo": "",
               "visibilidadCheck": null,
               "descComboCats": "",
               "usuario_modifico": null,
               "fiidtipoacl": null,
               "catmodulo":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidmodulo": null,
                   "fiidsistema": null,
                   "fiidmodulopadre": null,
                   "fcactivo": null,
                   "fcdescmodulo": null,
                   "fcnomcortomodulo": null,
                   "fcobservaciones": null
               },
               "catcaso":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": 7,
                   "descCombo": "RETIRO DUPLICADO ",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidcaso": 7,
                   "fcdesccaso": "RETIRO DUPLICADO ",
                   "fcnomcortocaso": null,
                   "fcobservaciones": null,
                   "fccodigorazon": null
               },
               "cattipodias":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidtipodias": null,
                   "fcdesctipodias": null
               },
               "catproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidproducto": null,
                   "fcdescproducto": null,
                   "fcnomcortoproducto": null,
                   "fcobservaciones": null,
                   "lstProdTipoClientes":
                   [
                   ]
               },
               "catsubproducto":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidsubproducto": null,
                   "fcdescsubproducto": null,
                   "fcnomcortosubproducto": null,
                   "fcobservaciones": null,
                   "fcdescproducto": "",
                   "totalproducto": "",
                   "totalsubproducto": "",
                   "totalaclaraciones": "",
                   "colUsuarios":
                   [
                   ]
               },
               "catclasificacion":
               {
                   "mensaje": null,
                   "query": "",
                   "parametros": null,
                   "estatusBD": null,
                   "tipoOperacion": 0,
                   "commitEnbd": 0,
                   "idCombo": null,
                   "descCombo": "",
                   "visibilidadCheck": null,
                   "descComboCats": "",
                   "usuario_modifico": null,
                   "fiidclasificacion": null,
                   "fcdescclasificacion": null,
                   "fcnomcortoclasificacion": null,
                   "fcobservaciones": null
               },
               "fitiempoestresol": null,
               "fccontaauto": null,
               "fcsolicitamonto": null,
               "fcactivo": null,
               "fccodigo": null,
               "fncomision": null,
               "lstDocSoporteTipoAcls":
               [
               ],
               "lstRespuestaTipoAcls":
               [
               ],
               "lstDespTipoAclaracions":
               [
               ],
               "lstTipoDatoProdTipoAcls":
               [
               ],
               "lstArchivoProsaAcl":
               [
               ]
           }
       ]
    }

', '2014-09-05 11:08:30.206', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (105, 29, 'Issue', 1, 'Se requiere actualización en los servicios de aclaraciones. Existe un conflicto con el tipo del arreglo que genera respecto al tipo de arreglo que se espera devolver:
Se espera *ArrayList<Tipoaclaracion>* pero internamente se genera un *ArrayList<Catcaso>*. Al intentar mapear el objeto *Tipoaclaracion* ocurre un error debido a que el JSON de respuesta es el equivalente a objetos *Catcaso*', '2014-09-05 11:09:47.963', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (106, 44, 'Issue', 9, 'Cadena de entrada

{
"tipoOperacion":2,
"idPais":1,
"idProducto":0,
"numTarjeta":"5512380304869601",
"bin":"",
"activo":"1"
}

Cadena de salida




    {
       "idError": "1",
       "descError": "CONSULTA EJECUTADA CORRECTAMENTE",
       "activo": "1",
       "idProducto": 24,
       "bin": "55123803",
       "descProducto": "TARJETA DE DEBITO / CUENTA SELECTA"
    }


', '2014-09-05 11:13:03.368', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (107, 35, 'Issue', 9, 'Cadena entrada

{
"idPais":"1",
"idPreacl":676051,
"tipoPreacl":"N",
"usuario":"777777"
}


cadena de salida

 {
       "idError": "1",
       "descError": "OPERACIONES EJECUTADA CON EXITO",
       "idAcl": 634296
    }


', '2014-09-05 12:22:52.432', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (108, 20, 'Issue', 9, '
Se agrega lista de historial aclaración y el campo de modulo en el servicio de consultar detalle aclaracion


    {
       "success": true,
       "errorCode": 0,
       "estatusAclaracion":
       {
           "fallo": "PROCEDE",
           "estatus": "FINALIZADA",
           "fechaResolucion": "02/09/2014",
           "prioridad": 2
       },
       "datosCliente":
       {
           "nombre": "SILVIA GOMEZ ESQUIVEL",
           "numCuenta": "66761320894760",
           "numTarjeta": "5512380305111961",
           "calle": "C MIRAVALLE",
           "numero": "MZ32",
           "colonia": "AMPLIACION TEPEPAN",
           "estado": "DISTRITO FEDERAL",
           "delegacionMunicipio": "XOCHIMILCO",
           "cp": "16060",
           "telefono": "55-0",
           "extension": "55-0"
       },
       "datosCanalCaptura":
       {
           "canal": "ELEKTRA",
           "nombreFuncionario": "ISSAC BAUTISTA BAUTISTA",
           "numSucursal": "9999",
           "sucursal": "CALL CENTER"
       },
       "datosAclaracion":
       {
           "idPreFolio": 676029,
           "idFolio": 634286,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CONSUMO NO RECONOCIDO ",
           "idTipoacl": 929,
           "montoReclamado": 199,
           "fechaCaptura": "02/09/2014",
           "tiempoEstimadoResolucion": "45 Dias NATURALES",
           "fechaEstimadaResolucion": "17/10/2014",
           "modulo": "MODULO AHORRO"
       },
       "lstMovimientos":
       [
           {
               "subFolio": "0001",
               "numeroOperacion": 2,
               "fecha": "01/08/2014",
               "descripcion": "SANBORN S P CUICUILCO , MEXICO DF ",
               "importe": 199,
               "tipoOperacion": "COMPRA",
               "canalOperacion": "NA",
               "fallo": "SIN FALLO",
               "montoReclamo": 199,
               "caso": "CONSUMO NO RECONOCIDO "
           }
       ],
       "lstHistAclaracionResponse":
       [
           {
               "descRol": "ANALISTA",
               "nomUsuario": "ISSAC BAUTISTA BAUTISTA",
               "fechaUsuario": "02/09/2014",
               "descAccion": "COMENTARIO",
               "comentario": "COMENTARIO DE FINALIZACION"
           },
           {
               "descRol": "ANALISTA",
               "nomUsuario": "ISSAC BAUTISTA BAUTISTA",
               "fechaUsuario": "02/09/2014",
               "descAccion": "FINALIZACION",
               "comentario": "FINALIZADO PARA PRUEBAS"
           }
       ],
       "obsGenerales": "COMENTARIO"
    }

', '2014-09-08 10:34:42.452', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (109, 35, 'Issue', 1, 'Inserción de aclaracion (considerando historial y actualización a preaclaración)

URL:
(POST) http://localhost:8080/bocrw-atn-clientes/rs/aclaraciones/aclaracion/flow', '2014-09-08 11:43:38.542', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (110, 57, 'Issue', 3, 'intNegocio\ci\BITACORAS\PKMXBT_ACCIONES\ConInterfaz_SPMXUPDCIERREAC', '2014-09-08 17:33:19.875', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (125, 3, 'Issue', 8, '', '2014-09-15 09:51:49.387', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (126, 64, 'Issue', 19, '', '2014-09-15 16:40:44.804', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (127, 64, 'Issue', 1, 'Cancelación de tarjeta

URL:
(PUT) http://localhost:8080/bocrw-atn-clientes/rs/tarjeta/cancelacion/{numTarjeta}', '2014-09-15 16:43:12.156', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (147, 20, 'Issue', 9, 'Detalle preaclaracion

    {
       "success": true,
       "errorCode": 0,
       "datosCliente":
       {
           "nombre": "DANIEL VALENCIA CONTRERAS",
           "numCuenta": "59361362175069",
           "numTarjeta": "5512380304869601",
           "calle": "FUENTE DE DIANA",
           "numero": "345",
           "colonia": "EVOLUCION",
           "estado": "MEXICO",
           "delegacionMunicipio": "NEZAHUALCOYOTL",
           "cp": "57700",
           "telefono": "00000000000",
           "extension": "000000000"
       },
       "datosCanalCaptura":
       {
           "canal": "ELEKTRA",
           "nombreFuncionario": "ALEX MAGNUM MACEDONIA",
           "numSucursal": "9999",
           "sucursal": "CALL CENTER"
       },
       "datosAclaracion":
       {
           "idPreFolio": 676148,
           "idFolio": 0,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "CUENTA",
           "clasificacion": "MODIFICACION DE DATOS",
           "caso": "MODIFICACION ",
           "idTipoacl": 1889,
           "montoReclamado": 0,
           "fechaCaptura": "08/09/2014",
           "tiempoEstimadoResolucion": "3 Dias HABILES",
           "fechaEstimadaResolucion": "10/09/2014",
           "modulo": null,
           "comisionAcl": 0
       },
       "lstModifDatos":
       [
           {
               "success": true,
               "errorCode": 0,
               "catDatoPersonal": "NOMBRE",
               "datoOriginal": "DANIEL",
               "datoModificado": "MACARIO"
           }
       ],
       "observaciones":
       {
           "observacionesGenerales": "SE CAMBIO EL NOMBRE DE MACA",
           "montoTotalReclamo": 0
       }
    }



Salida de consulta de detalle aclaracion


    {
       "success": true,
       "errorCode": 0,
       "estatusAclaracion":
       {
           "fallo": "SIN FALLO",
           "estatus": "SIN DESPACHAR",
           "fechaResolucion": "18/08/2014",
           "prioridad": 1
       },
       "datosCliente":
       {
           "nombre": "DANIEL VALENCIA CONTRERAS",
           "numCuenta": "59361362175069",
           "numTarjeta": "5512380304869601",
           "calle": "FUENTE DE DIANA",
           "numero": "345",
           "colonia": "EVOLUCION",
           "estado": "MEXICO",
           "delegacionMunicipio": "NEZAHUALCOYOTL",
           "cp": "57700",
           "telefono": "00000000000",
           "extension": "000000000"
       },
       "datosCanalCaptura":
       {
           "canal": "ELEKTRA",
           "nombreFuncionario": "ISSAC BAUTISTA BAUTISTA",
           "numSucursal": "9999",
           "sucursal": "CALL CENTER"
       },
       "datosAclaracion":
       {
           "idPreFolio": 675971,
           "idFolio": 634268,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "CUENTA",
           "clasificacion": "MODIFICACION DE DATOS",
           "caso": "MODIFICACION ",
           "idTipoacl": 1889,
           "montoReclamado": 0,
           "fechaCaptura": "18/08/2014",
           "tiempoEstimadoResolucion": "3 Dias HABILES",
           "fechaEstimadaResolucion": "21/08/2014",
           "modulo": "MODULO AHORRO",
           "comisionAcl": 0
       },
       "obsGenerales": "COMENTARIO",
       "lstModifDatos":
       [
           {
               "success": true,
               "errorCode": 0,
               "catDatoPersonal": "ESTADO",
               "datoOriginal": "MEXICO",
               "datoModificado": "MICHOACAN"
           },
           {
               "success": true,
               "errorCode": 0,
               "catDatoPersonal": "NOMBRE",
               "datoOriginal": "DANIEL",
               "datoModificado": "DANIELA"
           }
       ]
    }

', '2014-09-30 13:37:34.393', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (148, 77, 'Issue', 12, '
* Se agrego el campo de numero de intentos FNNUMINTENTOS en la tabla TAAC_BITAUTOACL
  Para este campo cuando nace el registro se inicializa en 1

    REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_BITAUTOACLARA\ConInterfaz_SPMXACBTAUTOACL

* Se genero el procedimiento SPMXUPDBTAUTACL. Este recibe los parametros:
  IDACL, IDMOVTO (Llave para encontrar el movimiento al cual se le cambiara el estatus)
  ESTATUS        (Valor del estatus por el cual se va a modificar el registro)  
  IDIOMA         (1 ó nulo para español ) 

    REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_BITAUTOACLARA\ConInterfaz_SPMXUPDBTAUTACL

Modifica el valor del estatus y en automatico incrementa uno al número de intentos

* Se modifico el procedimiento SPMXSELAUTPNCTE funcionando de la siguiente manera:
 Recibe como parametros de entrada:
        NUMERO DE CLIENTE ALNOVA
        DIVISA
        IDIOMA
 Regresa un cursor con los siguientes datos:
        
        AUTORIZACIONES PERMITIDAS
        MONTO POR ACLARACION
        DIVISA
 El contrato de interfaz se encuentra en la ruta:
  
     REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_AUTPENCTE\ConInterfaz_SPMXSELAUTPNCTE




', '2014-10-01 10:00:01.182', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (149, 80, 'Issue', 12, 'El contrato de interfaz se encuentra en la ruta:

E:\2014\REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_AUTPENCTE\ConInterfaz_SPMXSELBTACLARA', '2014-10-01 19:55:12.458', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (150, 77, 'Issue', 12, 'Consulta de oportunidades para autorizacion automatica por cliente

E:\2014\REPO_ATENCION\ci\ATN_ACLARACIONES\PKMXAC_AUTPENCTE\ConInterfaz_SPMXSELAUTPNCTE', '2014-10-02 12:36:01.396', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (151, 35, 'Issue', 9, 'parámetros de entrada

{
"pais":"1",
"idPreacl":676051,
"tipoPreacl":"N",
"usuario":"777777",
"observaciones":"comentario",
"correoCliente":"correo@elektra.com.mx",
"numCelCliente":"911",
"canalCteUnico":"1",
"sucursalCteUnico":"172",
"folioCteUnico":"1236",
"canalSucursalCaptura":1,
"sucursalCaptura":172,
"workstationCaptura":"ELEKTRA55"
}', '2014-10-02 17:16:33.397', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (152, 80, 'Issue', 4, '', '2014-10-03 09:57:51.948', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (153, 88, 'Issue', 12, '', '2014-10-06 17:24:46.672', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (154, 88, 'Issue', 9, 'se cambio el tiempo de resolucion para los tipo aclaracion del top 5', '2014-10-06 17:58:45.013', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (155, 68, 'Issue', 9, 'cadena de entrada


{
"pais":"1",
"idAcl":634840,
"usuario":"ACERTURM",
"cteUnico":"101172123",
"idPerfil":375,
"idCanalUsr":1,
"idSucursalUsr":100,
"nombreEmpleado":"EVA BRAUN",
"idPuestoUsr":2,
"idIdioma":1
}
', '2014-10-06 18:32:03.083', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (156, 20, 'Issue', 9, 'Cadena de salida 



    {
       "success": true,
       "errorCode": 0,
       "estatusAclaracion":
       {
           "fallo": "SIN FALLO",
           "estatus": "SIN DESPACHAR",
           "fechaResolucion": "06/10/2014",
           "prioridad": 1
       },
       "datosCliente":
       {
           "nombre": "FRANCISCO JAVIER JIMENEZ PEREZ",
           "numCuenta": "0",
           "numTarjeta": "5512380304869601",
           "calle": "EUDEVAS",
           "numero": "128",
           "colonia": "PEDREGAL DE SANTO DOMINGO",
           "estado": "DISTRITO FEDERAL",
           "delegacionMunicipio": "COYOACAN",
           "cp": "4369",
           "telefono": "00000558484",
           "extension": "000558484"
       },
       "datosCanalCaptura":
       {
           "canal": "ELEKTRA",
           "nombreFuncionario": "ISSAC BAUTISTA BAUTISTA",
           "numSucursal": "9999",
           "sucursal": "CALL CENTER"
       },
       "datosAclaracion":
       {
           "idPreFolio": 675990,
           "idFolio": 634849,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "RETENCIONES",
           "caso": "IMPORTE RETENIDO NO RECONOCIDO POR EL CLIENTE ",
           "idTipoacl": 936,
           "montoReclamado": 527.95,
           "fechaCaptura": "06/10/2014",
           "tiempoEstimadoResolucion": "2 Dias NATURALES",
           "fechaEstimadaResolucion": "08/10/2014",
           "modulo": "MODULO AHORRO",
           "comisionAcl": 0
       },
       "obsGenerales": "COMENTARIO",
       "lstReteciones":
       [
           {
               "success": true,
               "errorCode": 0,
               "numeroRetencion": 1,
               "comercio": "-",
               "montoRetencion": 527.95,
               "fechaOperacion": "09/07/2014",
               "tipoRetencion": "CUENTA"
           }
       ]
    }

', '2014-10-07 13:38:53.697', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (157, 64, 'Issue', 14, 'Se realiza la implementacion del servicio de cancelacion de una tarjeta

metodo POST

http://ip:puerto/bocrw-atn-clientes/rs/tarjeta/cancelarTarjeta

JsonEntrada

{
   "numeroTarjeta":"5512380388445523"
}

Json Respuesta

{
   "success":true,
   "codigo":1,
   "descripcion":"OK",
   "respuesta":{
      "dateOperation":"30-09-2014 12:16 PM",
      "descriptionCode":"Error messages:(MCE0113) TARJETA DADA DE BAJA",
      "folioEncore":"1|20140930 12:16:46|eservices",
      "inValid":"false",
      "statusCode":"-1",
      "trackingNumber":"30092014121646",
      "card":{
         "descriptionCode":"Error messages:(MCE0113) TARJETA DADA DE BAJA",
         "inValid":"false",
         "statusCode":"-1",
         "cardSent":"false",
         "existBalckList":"false",
         "existsStampedName":"false",
         "returnCode":"0",
         "tarjetasRegresadas":"0"
      }
   }
}', '2014-10-08 18:32:28.171', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (158, 94, 'Issue', 12, '', '2014-10-09 19:00:46.385', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (159, 20, 'Issue', 9, 'Se agrega el campo idClienteAcl a la salida del detalle de preaclaracion

    {
       "success": true,
       "errorCode": 0,
       "datosCliente":
       {
           "nombre": "FRANCISCO JAVIER JIMENEZ PEREZ",
           "numCuenta": "0",
           "numTarjeta": "5512380304869601",
           "calle": "EUDEVAS",
           "numero": "128",
           "colonia": "PEDREGAL DE SANTO DOMINGO",
           "estado": "DISTRITO FEDERAL",
           "delegacionMunicipio": "COYOACAN",
           "cp": "4369",
           "telefono": "00000558484",
           "extension": "000558484",
           "idClienteAcl": 120830286782
       },
       "datosCanalCaptura":
       {
           "canal": "ELEKTRA",
           "nombreFuncionario": "ISSAC BAUTISTA BAUTISTA",
           "numSucursal": "9999",
           "sucursal": "CALL CENTER"
       },
       "datosAclaracion":
       {
           "idPreFolio": 675975,
           "idFolio": 0,
           "producto": "TARJETA DE DEBITO / CUENTA SELECTA",
           "subProducto": "COMPRA EN ESTABLECIMIENTO",
           "clasificacion": "CARGO INDEBIDO",
           "caso": "CONSUMO NO RECONOCIDO ",
           "idTipoacl": 929,
           "montoReclamado": 528,
           "fechaCaptura": "20/08/2014",
           "tiempoEstimadoResolucion": "5 Dias NATURALES",
           "fechaEstimadaResolucion": "22/08/2014",
           "modulo": null,
           "comisionAcl": 0
       },
       "lstMovimientos":
       [
           {
               "subFolio": "0002",
               "numeroOperacion": 1,
               "fecha": "01/08/2014",
               "descripcion": "SANBORN S PERISUR , MEXICO DF ",
               "importe": 329,
               "tipoOperacion": "COMPRA",
               "canalOperacion": "NA",
               "fallo": "SIN FALLO",
               "montoReclamo": 0,
               "caso": null
           },
           {
               "subFolio": "0001",
               "numeroOperacion": 2,
               "fecha": "01/08/2014",
               "descripcion": "SANBORN S P CUICUILCO , MEXICO DF ",
               "importe": 199,
               "tipoOperacion": "COMPRA",
               "canalOperacion": "NA",
               "fallo": "SIN FALLO",
               "montoReclamo": 0,
               "caso": null
           }
       ],
       "observaciones":
       {
           "observacionesGenerales": "COMENTARIO",
           "montoTotalReclamo": 528
       }
    }

', '2014-10-10 11:23:45.857', false);
INSERT INTO journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) VALUES (160, 89, 'Issue', 14, 'Se realiza la implementacion de los servicios de alnova, a continuación vienen los elementos de entrada y salida para cada uno:

Metodo GET http://localhost:15080/BoCRWAtnClientes/rs/tarjeta/lastFiveMovements

Json Entrada
N/A

Json Salida
{
   "success":true,
   "codigo":0,
   "respuesta":{
      "xml":null,
      "inValid":false,
      "descriptionCode":[
         "Consulta exitosa"
      ],
      "statusCode":"0",
      "trackingNumber":"09102014184318",
      "folioEncore":"1|20141009 18:43:18|eservices",
      "linkDestiny":null,
      "dateOperation":"09-10-2014 6:43 PM",
      "returnCode":14,
      "listObjectB170":[
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"RETIRO DE EFECTIVO            ",
            "monto":"0000000000300000p",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"DEPOSITO DE EFECTIVO    0673  ",
            "monto":"00000000002000000",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"DEPOSITO DE EFECTIVO    0673  ",
            "monto":"00000000012000000",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"RETIRO DE EFECTIVO            ",
            "monto":"0000000000600000p",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"RETIRO DE EFECTIVO            ",
            "monto":"0000000000100000p",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                               \n",
            "numLibre":"00000000000000000",
            "bandlib":" "
         }
      ]
   }
}

Metodo GET http://localhost:15080/BoCRWAtnClientes/rs/tarjeta/consultaDetalleSelectaWeb

Json Entrada
N/A

Json Salida
{
   "success":true,
   "codigo":0,
   "respuesta":{
      "xml":null,
      "inValid":false,
      "descriptionCode":[
         "Consulta exitosa"
      ],
      "statusCode":"0",
      "trackingNumber":"09102014184318",
      "folioEncore":"1|20141009 18:43:18|eservices",
      "linkDestiny":null,
      "dateOperation":"09-10-2014 6:43 PM",
      "returnCode":14,
      "listObjectB170":[
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"RETIRO DE EFECTIVO            ",
            "monto":"0000000000300000p",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"DEPOSITO DE EFECTIVO    0673  ",
            "monto":"00000000002000000",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"DEPOSITO DE EFECTIVO    0673  ",
            "monto":"00000000012000000",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"RETIRO DE EFECTIVO            ",
            "monto":"0000000000600000p",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003535",
            "fechaMovimiento":"2014-08-26",
            "observaciones":"RETIRO DE EFECTIVO            ",
            "monto":"0000000000100000p",
            "producto":"13",
            "subproducto":"0024",
            "txtLibre":"                               \n",
            "numLibre":"00000000000000000",
            "bandlib":" "
         }
      ]
   }
}


Metodo POST http://localhost:15080/BoCRWAtnClientes/rs/tarjeta/consultaMovimientosWeb

Json Entrada - Las fechas deben ir en el formato (YYYY-MM-DD)
{
"fechaInicio":"2014-08-31",
"fechaFin":"2015-05-31"
}

Json Salida
{
   "success":true,
   "codigo":0,
   "respuesta":{
      "xml":null,
      "inValid":false,
      "descriptionCode":[
         "Consulta exitosa"
      ],
      "statusCode":"0",
      "trackingNumber":"09102014192334",
      "folioEncore":"7|20141009 19:23:34|eservices",
      "linkDestiny":null,
      "dateOperation":"09-10-2014 7:23 PM",
      "returnCode":14,
      "listObjectB173":[
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-05-16",
            "observaciones":"IMP. RET. A CTA IPF 0719100416",
            "monto":"0000000000000099p",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000080",
            "codigoOperacion":"683",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-05-16",
            "observaciones":"INTERES PLAZO 0055 0719100416 ",
            "monto":"00000000000007023",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000079",
            "codigoOperacion":"182",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-05-16",
            "observaciones":"ABONO LIQ. CAP. IPF 0719100416",
            "monto":"00000000000200000",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000078",
            "codigoOperacion":"972",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-02-27",
            "observaciones":"ABONO CAP. CANC. IPF0719100855",
            "monto":"00000000000305320",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000077",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-02-27",
            "observaciones":"APERT GANARE  0055 0719100855 ",
            "monto":"0000000000030532p",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000076",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-02-27",
            "observaciones":"ABONO CAP. CANC. IPF0719100700",
            "monto":"00000000000272377",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000075",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-02-26",
            "observaciones":"IMP. RET. A CTA IPF 0719100820",
            "monto":"0000000000000089x",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000074",
            "codigoOperacion":"683",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-02-26",
            "observaciones":"INTERES PLAZO 0673 0719100820 ",
            "monto":"00000000000006218",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000073",
            "codigoOperacion":"182",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2015-02-26",
            "observaciones":"ABONO LIQ. CAP. IPF 0719100820",
            "monto":"00000000000300000",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000072",
            "codigoOperacion":"972",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"ABONO CAP. CANC. IPF0719100732",
            "monto":"00000000000200139",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000071",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"APERT P FIJO  0673 0719100842 ",
            "monto":"0000000000031000p",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000070",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"APERT P FIJO  0673 0719100831 ",
            "monto":"0000000000032000p",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000069",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"APERT P FIJO  0673 0719100820 ",
            "monto":"0000000000030000p",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000068",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"ABONO CAP. CANC. IPF0719100697",
            "monto":"00000000000308118",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000067",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"ABONO CAP. CANC. IPF0719100686",
            "monto":"00000000000201924",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000066",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"ABONO CAP. CANC. IPF0719100675",
            "monto":"00000000000200938",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000065",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-28",
            "observaciones":"ABONO CAP. CANC. IPF0719100664",
            "monto":"00000000000200386",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000064",
            "codigoOperacion":"A36",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-01",
            "observaciones":"APERT GANARE  0055 0719100732 ",
            "monto":"0000000000020013y",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000063",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-01",
            "observaciones":"APERT GANARE  0055 0719100700 ",
            "monto":"0000000000027237w",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000062",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         },
         {
            "numeroCuenta":"06731300003074",
            "fechaOperacion":"2014-09-01",
            "observaciones":"APERT GANARE  0055 0719100697 ",
            "monto":"0000000000030811x",
            "producto":"13",
            "subproducto":"0024",
            "movimiento":"000000061",
            "codigoOperacion":"M78",
            "txtLibre":"                              ",
            "numLibre":"00000000000000000",
            "bandlib":" "
         }
      ]
   }
}


Metodo POST http://localhost:15080/BoCRWAtnClientes/rs/tarjeta/cancelarTarjeta

Json Entrada
{
"numeroTarjeta":"5512380344558877"
}

Json Salida
{
   "success":true,
   "codigo":0,
   "respuesta":{
      "xml":null,
      "inValid":false,
      "descriptionCode":[
         "Error messages:(MCE0113) TARJETA DADA DE BAJA"
      ],
      "statusCode":"-1",
      "trackingNumber":"09102014192640",
      "folioEncore":"8|20141009 19:26:40|eservices",
      "linkDestiny":null,
      "dateOperation":"09-10-2014 7:26 PM",
      "cardResponseTO":{
         "xml":null,
         "inValid":false,
         "descriptionCode":[
            "Error messages:(MCE0113) TARJETA DADA DE BAJA"
         ],
         "statusCode":"-1",
         "trackingNumber":null,
         "folioEncore":null,
         "linkDestiny":null,
         "dateOperation":null,
         "existBalckList":false,
         "cardSent":false,
         "existsStampedName":false,
         "stampedName":null,
         "cardNumber":null,
         "codeResponse":null,
         "cardType":null,
         "cardTextType":null,
         "expirationDate":null,
         "holderName":null,
         "reason":null,
         "clienteUnico":null,
         "capacidadPago":null,
         "capacidadPagoUsada":null,
         "numeroTarjetaPrima":null,
         "entidad":null,
         "folio":null,
         "numeroCuenta":null,
         "numeroCliente":null,
         "numeroContrato":null,
         "oficina":null,
         "producto":null,
         "subproducto":null,
         "tipoTarjeta":null,
         "numeroRemesa":null,
         "estatus":null,
         "fechaRemesa":null,
         "tarjetasRegresadas":0,
         "numTarjetas":null,
         "fechaRegreso":null,
         "numeroSucursal":null,
         "numeroExcepcion":null,
         "fechaCierreEmbarque":null,
         "list":null,
         "transactionDate":null,
         "time":null,
         "description":null,
         "country":null,
         "documents":null,
         "dateReport":null,
         "recivePhoto":null,
         "newCard":null,
         "returnCode":0
      },
      "linkingCardResponseTO":null,
      "activacionTazResponseTO":null
   }
}', '2014-10-10 11:45:31.818', false);


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 209
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('journals_id_seq', 160, true);


--
-- TOC entry 2640 (class 0 OID 16601)
-- Dependencies: 210
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (1, 1, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (3, 3, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (4, 4, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (6, 6, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (7, 7, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (8, 8, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (9, 9, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (11, 11, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (12, 12, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (13, 13, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (14, 14, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (16, 16, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (19, 19, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (20, 20, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (23, 23, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (25, 24, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (26, 25, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (27, 26, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (28, 27, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (29, 28, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (30, 29, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (31, 30, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (32, 31, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (33, 18, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (34, 32, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (35, 33, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (36, 34, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (37, 35, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (38, 36, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (39, 37, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (40, 38, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (41, 39, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (42, 40, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (43, 41, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (44, 42, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (45, 43, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (46, 44, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (47, 45, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (48, 43, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (49, 44, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (50, 46, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (51, 47, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (52, 48, 4, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (53, 49, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (54, 50, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (55, 51, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (56, 52, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (57, 53, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (58, 54, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (59, 55, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (60, 56, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (61, 57, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (62, 58, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (63, 59, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (64, 60, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (65, 61, 4, 52);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (66, 50, 3, NULL);
INSERT INTO member_roles (id, member_id, role_id, inherited_from) VALUES (67, 49, 3, NULL);


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 211
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('member_roles_id_seq', 67, true);


--
-- TOC entry 2642 (class 0 OID 16606)
-- Dependencies: 212
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (3, 10, 1, '2014-07-25 13:34:48.822', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (6, 1, 1, '2014-07-25 13:35:10.673', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (7, 4, 1, '2014-07-25 13:35:10.701', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (8, 8, 1, '2014-07-25 13:35:10.736', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (9, 9, 1, '2014-07-25 13:35:10.765', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (11, 3, 1, '2014-07-25 13:35:14.345', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (13, 3, 4, '2014-07-25 13:40:21.241', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (18, 1, 4, '2014-07-25 13:40:29.047', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (19, 4, 4, '2014-07-25 13:40:29.074', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (20, 8, 4, '2014-07-25 13:40:29.104', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (23, 3, 5, '2014-07-25 13:41:46.352', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (24, 9, 5, '2014-07-25 13:41:58.815', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (25, 3, 3, '2014-07-25 13:42:39.464', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (4, 5, 1, '2014-07-25 13:35:10.61', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (16, 5, 4, '2014-07-25 13:40:28.986', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (1, 6, 3, '2014-07-25 13:34:14.787', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (12, 6, 1, '2014-07-25 13:35:24.1', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (26, 14, 4, '2014-08-06 18:29:23.913', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (27, 14, 1, '2014-08-06 18:29:42.022', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (14, 12, 4, '2014-07-25 13:40:21.27', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (28, 12, 6, '2014-08-07 13:37:08.446', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (31, 18, 4, '2014-08-18 19:58:12.45', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (32, 19, 4, '2014-08-22 17:41:31.702', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (33, 9, 4, '2014-08-25 12:49:01.103', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (34, 20, 1, '2014-08-25 18:38:55.037', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (35, 19, 1, '2014-09-01 10:37:40.99', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (36, 18, 1, '2014-09-01 10:37:41.028', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (37, 13, 1, '2014-09-01 10:37:41.04', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (39, 22, 1, '2014-09-02 16:27:33.594', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (41, 22, 4, '2014-09-02 16:28:00.785', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (38, 21, 1, '2014-09-02 16:24:36.223', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (40, 21, 4, '2014-09-02 16:28:00.77', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (42, 21, 7, '2014-09-17 12:04:48.642', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (43, 1, 7, '2014-09-17 12:04:48.767', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (44, 3, 7, '2014-09-17 12:04:48.783', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (45, 22, 7, '2014-09-17 12:04:48.798', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (46, 23, 4, '2014-09-17 19:04:02.404', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (47, 23, 1, '2014-09-17 19:04:22.092', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (29, 15, 6, '2014-08-07 17:34:43.915', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (30, 16, 6, '2014-08-07 17:43:05.531', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (48, 25, 8, '2014-10-13 12:11:14.387', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (49, 3, 8, '2014-10-13 12:11:14.808', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (50, 1, 8, '2014-10-13 12:11:14.886', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (51, 4, 8, '2014-10-13 12:11:14.933', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (52, 5, 8, '2014-10-13 12:11:14.964', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (53, 21, 8, '2014-10-13 12:11:14.98', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (54, 8, 8, '2014-10-13 12:11:14.996', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (55, 14, 8, '2014-10-13 12:11:15.011', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (56, 19, 8, '2014-10-13 12:11:15.042', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (57, 18, 8, '2014-10-13 12:11:15.074', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (58, 22, 8, '2014-10-13 12:11:15.354', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (59, 24, 8, '2014-10-13 12:11:15.37', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (60, 9, 8, '2014-10-13 12:11:15.386', false);
INSERT INTO members (id, user_id, project_id, created_on, mail_notification) VALUES (61, 23, 8, '2014-10-13 12:11:15.401', false);


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 213
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('members_id_seq', 61, true);


--
-- TOC entry 2644 (class 0 OID 16614)
-- Dependencies: 214
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 215
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('messages_id_seq', 1, false);


--
-- TOC entry 2646 (class 0 OID 16626)
-- Dependencies: 216
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 217
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('news_id_seq', 1, false);


--
-- TOC entry 2648 (class 0 OID 16638)
-- Dependencies: 218
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 219
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('open_id_authentication_associations_id_seq', 1, false);


--
-- TOC entry 2650 (class 0 OID 16646)
-- Dependencies: 220
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 221
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('open_id_authentication_nonces_id_seq', 1, false);


--
-- TOC entry 2652 (class 0 OID 16654)
-- Dependencies: 222
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (3, 'Caja', '', '', true, NULL, '2014-07-25 13:23:20.13', '2014-07-25 13:23:20.13', 'caja', 1, 5, 6, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (4, 'Atn Clientes', 'Portal de atención a clientes', '', true, NULL, '2014-07-25 13:39:57.409', '2014-07-25 13:39:57.409', 'atn-clientes', 1, 3, 4, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (5, 'Aclaraciones', 'Aclaraciones Acertum', '', true, NULL, '2014-07-25 13:41:11.114', '2014-07-25 13:41:11.114', 'aclaraciones', 1, 1, 2, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (1, 'Gerencia', 'información general relacionado al desarrollo.', '', true, NULL, '2014-07-25 12:01:25.832', '2014-07-25 12:01:25.832', 'gerencia', 1, 9, 10, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (6, 'Portal base de datos', '', '', true, NULL, '2014-08-07 13:37:08.094', '2014-08-07 13:37:08.094', 'portal-base-de-datos', 1, 11, 12, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (7, 'Catalog Manager', 'Administrador de catálogo con soporte por Stored Procedures', '', false, NULL, '2014-09-17 12:04:13.9', '2014-09-17 12:04:13.9', 'catalog-manager', 1, 7, 8, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (2, 'Test1', 'as', '', true, NULL, '2014-07-25 12:13:43.16', '2014-07-25 12:13:43.16', 'test1', 5, 15, 16, false);
INSERT INTO projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members) VALUES (8, 'Sistemas Centralizados de Caja', '', '', false, NULL, '2014-10-13 11:16:29.695', '2014-10-13 11:16:29.695', 'sistemas-centralizados-de-caja', 1, 13, 14, false);


--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 223
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('projects_id_seq', 8, true);


--
-- TOC entry 2654 (class 0 OID 16667)
-- Dependencies: 224
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO projects_trackers (project_id, tracker_id) VALUES (1, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (1, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (1, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (2, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (2, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (2, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (3, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (3, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (3, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (4, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (4, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (4, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (5, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (5, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (5, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (6, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (6, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (6, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (7, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (7, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (7, 3);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (8, 1);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (8, 2);
INSERT INTO projects_trackers (project_id, tracker_id) VALUES (8, 3);


--
-- TOC entry 2655 (class 0 OID 16672)
-- Dependencies: 225
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 226
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('queries_id_seq', 1, false);


--
-- TOC entry 2657 (class 0 OID 16683)
-- Dependencies: 227
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2658 (class 0 OID 16686)
-- Dependencies: 228
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 229
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('repositories_id_seq', 1, false);


--
-- TOC entry 2660 (class 0 OID 16702)
-- Dependencies: 230
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO roles (id, name, "position", assignable, builtin, permissions, issues_visibility) VALUES (3, 'Manager', 3, true, 0, '---
- :add_project
- :edit_project
- :close_project
- :select_project_modules
- :manage_members
- :manage_versions
- :add_subprojects
- :manage_categories
- :view_issues
- :add_issues
- :edit_issues
- :manage_issue_relations
- :manage_subtasks
- :set_issues_private
- :set_own_issues_private
- :add_issue_notes
- :edit_issue_notes
- :edit_own_issue_notes
- :view_private_notes
- :set_notes_private
- :move_issues
- :delete_issues
- :manage_public_queries
- :save_queries
- :view_issue_watchers
- :add_issue_watchers
- :delete_issue_watchers
- :log_time
- :view_time_entries
- :edit_time_entries
- :edit_own_time_entries
- :manage_project_activities
- :manage_news
- :comment_news
- :add_documents
- :edit_documents
- :delete_documents
- :view_documents
- :manage_files
- :view_files
- :manage_wiki
- :rename_wiki_pages
- :delete_wiki_pages
- :view_wiki_pages
- :export_wiki_pages
- :view_wiki_edits
- :edit_wiki_pages
- :delete_wiki_pages_attachments
- :protect_wiki_pages
- :manage_repository
- :browse_repository
- :view_changesets
- :commit_access
- :manage_related_issues
- :manage_boards
- :add_messages
- :edit_messages
- :edit_own_messages
- :delete_messages
- :delete_own_messages
- :view_calendar
- :view_gantt
', 'all');
INSERT INTO roles (id, name, "position", assignable, builtin, permissions, issues_visibility) VALUES (5, 'Reporter', 5, true, 0, '---
- :view_issues
- :add_issues
- :add_issue_notes
- :save_queries
- :view_gantt
- :view_calendar
- :log_time
- :view_time_entries
- :comment_news
- :view_documents
- :view_wiki_pages
- :view_wiki_edits
- :add_messages
- :edit_own_messages
- :view_files
- :browse_repository
- :view_changesets
', 'default');
INSERT INTO roles (id, name, "position", assignable, builtin, permissions, issues_visibility) VALUES (1, 'Non member', 1, true, 1, '---
- :view_issues
- :add_issues
- :add_issue_notes
- :save_queries
- :view_gantt
- :view_calendar
- :view_time_entries
- :comment_news
- :view_documents
- :view_wiki_pages
- :view_wiki_edits
- :add_messages
- :view_files
- :browse_repository
- :view_changesets
', 'default');
INSERT INTO roles (id, name, "position", assignable, builtin, permissions, issues_visibility) VALUES (2, 'Anonymous', 2, true, 2, '---
- :view_changesets
', 'default');
INSERT INTO roles (id, name, "position", assignable, builtin, permissions, issues_visibility) VALUES (4, 'Developer', 4, true, 0, '---
- :manage_versions
- :add_messages
- :edit_own_messages
- :view_calendar
- :view_documents
- :manage_files
- :view_files
- :view_gantt
- :manage_categories
- :view_issues
- :add_issues
- :edit_issues
- :manage_issue_relations
- :manage_subtasks
- :add_issue_notes
- :edit_issue_notes
- :view_private_notes
- :set_notes_private
- :save_queries
- :view_issue_watchers
- :add_issue_watchers
- :delete_issue_watchers
- :comment_news
- :browse_repository
- :view_changesets
- :commit_access
- :manage_related_issues
- :log_time
- :view_time_entries
- :delete_wiki_pages
- :view_wiki_pages
- :view_wiki_edits
- :edit_wiki_pages
', 'default');


--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 231
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- TOC entry 2662 (class 0 OID 16715)
-- Dependencies: 232
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO schema_migrations (version) VALUES ('1');
INSERT INTO schema_migrations (version) VALUES ('2');
INSERT INTO schema_migrations (version) VALUES ('3');
INSERT INTO schema_migrations (version) VALUES ('4');
INSERT INTO schema_migrations (version) VALUES ('5');
INSERT INTO schema_migrations (version) VALUES ('6');
INSERT INTO schema_migrations (version) VALUES ('7');
INSERT INTO schema_migrations (version) VALUES ('8');
INSERT INTO schema_migrations (version) VALUES ('9');
INSERT INTO schema_migrations (version) VALUES ('10');
INSERT INTO schema_migrations (version) VALUES ('11');
INSERT INTO schema_migrations (version) VALUES ('12');
INSERT INTO schema_migrations (version) VALUES ('13');
INSERT INTO schema_migrations (version) VALUES ('14');
INSERT INTO schema_migrations (version) VALUES ('15');
INSERT INTO schema_migrations (version) VALUES ('16');
INSERT INTO schema_migrations (version) VALUES ('17');
INSERT INTO schema_migrations (version) VALUES ('18');
INSERT INTO schema_migrations (version) VALUES ('19');
INSERT INTO schema_migrations (version) VALUES ('20');
INSERT INTO schema_migrations (version) VALUES ('21');
INSERT INTO schema_migrations (version) VALUES ('22');
INSERT INTO schema_migrations (version) VALUES ('23');
INSERT INTO schema_migrations (version) VALUES ('24');
INSERT INTO schema_migrations (version) VALUES ('25');
INSERT INTO schema_migrations (version) VALUES ('26');
INSERT INTO schema_migrations (version) VALUES ('27');
INSERT INTO schema_migrations (version) VALUES ('28');
INSERT INTO schema_migrations (version) VALUES ('29');
INSERT INTO schema_migrations (version) VALUES ('30');
INSERT INTO schema_migrations (version) VALUES ('31');
INSERT INTO schema_migrations (version) VALUES ('32');
INSERT INTO schema_migrations (version) VALUES ('33');
INSERT INTO schema_migrations (version) VALUES ('34');
INSERT INTO schema_migrations (version) VALUES ('35');
INSERT INTO schema_migrations (version) VALUES ('36');
INSERT INTO schema_migrations (version) VALUES ('37');
INSERT INTO schema_migrations (version) VALUES ('38');
INSERT INTO schema_migrations (version) VALUES ('39');
INSERT INTO schema_migrations (version) VALUES ('40');
INSERT INTO schema_migrations (version) VALUES ('41');
INSERT INTO schema_migrations (version) VALUES ('42');
INSERT INTO schema_migrations (version) VALUES ('43');
INSERT INTO schema_migrations (version) VALUES ('44');
INSERT INTO schema_migrations (version) VALUES ('45');
INSERT INTO schema_migrations (version) VALUES ('46');
INSERT INTO schema_migrations (version) VALUES ('47');
INSERT INTO schema_migrations (version) VALUES ('48');
INSERT INTO schema_migrations (version) VALUES ('49');
INSERT INTO schema_migrations (version) VALUES ('50');
INSERT INTO schema_migrations (version) VALUES ('51');
INSERT INTO schema_migrations (version) VALUES ('52');
INSERT INTO schema_migrations (version) VALUES ('53');
INSERT INTO schema_migrations (version) VALUES ('54');
INSERT INTO schema_migrations (version) VALUES ('55');
INSERT INTO schema_migrations (version) VALUES ('56');
INSERT INTO schema_migrations (version) VALUES ('57');
INSERT INTO schema_migrations (version) VALUES ('58');
INSERT INTO schema_migrations (version) VALUES ('59');
INSERT INTO schema_migrations (version) VALUES ('60');
INSERT INTO schema_migrations (version) VALUES ('61');
INSERT INTO schema_migrations (version) VALUES ('62');
INSERT INTO schema_migrations (version) VALUES ('63');
INSERT INTO schema_migrations (version) VALUES ('64');
INSERT INTO schema_migrations (version) VALUES ('65');
INSERT INTO schema_migrations (version) VALUES ('66');
INSERT INTO schema_migrations (version) VALUES ('67');
INSERT INTO schema_migrations (version) VALUES ('68');
INSERT INTO schema_migrations (version) VALUES ('69');
INSERT INTO schema_migrations (version) VALUES ('70');
INSERT INTO schema_migrations (version) VALUES ('71');
INSERT INTO schema_migrations (version) VALUES ('72');
INSERT INTO schema_migrations (version) VALUES ('73');
INSERT INTO schema_migrations (version) VALUES ('74');
INSERT INTO schema_migrations (version) VALUES ('75');
INSERT INTO schema_migrations (version) VALUES ('76');
INSERT INTO schema_migrations (version) VALUES ('77');
INSERT INTO schema_migrations (version) VALUES ('78');
INSERT INTO schema_migrations (version) VALUES ('79');
INSERT INTO schema_migrations (version) VALUES ('80');
INSERT INTO schema_migrations (version) VALUES ('81');
INSERT INTO schema_migrations (version) VALUES ('82');
INSERT INTO schema_migrations (version) VALUES ('83');
INSERT INTO schema_migrations (version) VALUES ('84');
INSERT INTO schema_migrations (version) VALUES ('85');
INSERT INTO schema_migrations (version) VALUES ('86');
INSERT INTO schema_migrations (version) VALUES ('87');
INSERT INTO schema_migrations (version) VALUES ('88');
INSERT INTO schema_migrations (version) VALUES ('89');
INSERT INTO schema_migrations (version) VALUES ('90');
INSERT INTO schema_migrations (version) VALUES ('91');
INSERT INTO schema_migrations (version) VALUES ('92');
INSERT INTO schema_migrations (version) VALUES ('93');
INSERT INTO schema_migrations (version) VALUES ('94');
INSERT INTO schema_migrations (version) VALUES ('95');
INSERT INTO schema_migrations (version) VALUES ('96');
INSERT INTO schema_migrations (version) VALUES ('97');
INSERT INTO schema_migrations (version) VALUES ('98');
INSERT INTO schema_migrations (version) VALUES ('99');
INSERT INTO schema_migrations (version) VALUES ('100');
INSERT INTO schema_migrations (version) VALUES ('101');
INSERT INTO schema_migrations (version) VALUES ('102');
INSERT INTO schema_migrations (version) VALUES ('103');
INSERT INTO schema_migrations (version) VALUES ('104');
INSERT INTO schema_migrations (version) VALUES ('105');
INSERT INTO schema_migrations (version) VALUES ('106');
INSERT INTO schema_migrations (version) VALUES ('107');
INSERT INTO schema_migrations (version) VALUES ('108');
INSERT INTO schema_migrations (version) VALUES ('20090214190337');
INSERT INTO schema_migrations (version) VALUES ('20090312172426');
INSERT INTO schema_migrations (version) VALUES ('20090312194159');
INSERT INTO schema_migrations (version) VALUES ('20090318181151');
INSERT INTO schema_migrations (version) VALUES ('20090323224724');
INSERT INTO schema_migrations (version) VALUES ('20090401221305');
INSERT INTO schema_migrations (version) VALUES ('20090401231134');
INSERT INTO schema_migrations (version) VALUES ('20090403001910');
INSERT INTO schema_migrations (version) VALUES ('20090406161854');
INSERT INTO schema_migrations (version) VALUES ('20090425161243');
INSERT INTO schema_migrations (version) VALUES ('20090503121501');
INSERT INTO schema_migrations (version) VALUES ('20090503121505');
INSERT INTO schema_migrations (version) VALUES ('20090503121510');
INSERT INTO schema_migrations (version) VALUES ('20090614091200');
INSERT INTO schema_migrations (version) VALUES ('20090704172350');
INSERT INTO schema_migrations (version) VALUES ('20090704172355');
INSERT INTO schema_migrations (version) VALUES ('20090704172358');
INSERT INTO schema_migrations (version) VALUES ('20091010093521');
INSERT INTO schema_migrations (version) VALUES ('20091017212227');
INSERT INTO schema_migrations (version) VALUES ('20091017212457');
INSERT INTO schema_migrations (version) VALUES ('20091017212644');
INSERT INTO schema_migrations (version) VALUES ('20091017212938');
INSERT INTO schema_migrations (version) VALUES ('20091017213027');
INSERT INTO schema_migrations (version) VALUES ('20091017213113');
INSERT INTO schema_migrations (version) VALUES ('20091017213151');
INSERT INTO schema_migrations (version) VALUES ('20091017213228');
INSERT INTO schema_migrations (version) VALUES ('20091017213257');
INSERT INTO schema_migrations (version) VALUES ('20091017213332');
INSERT INTO schema_migrations (version) VALUES ('20091017213444');
INSERT INTO schema_migrations (version) VALUES ('20091017213536');
INSERT INTO schema_migrations (version) VALUES ('20091017213642');
INSERT INTO schema_migrations (version) VALUES ('20091017213716');
INSERT INTO schema_migrations (version) VALUES ('20091017213757');
INSERT INTO schema_migrations (version) VALUES ('20091017213835');
INSERT INTO schema_migrations (version) VALUES ('20091017213910');
INSERT INTO schema_migrations (version) VALUES ('20091017214015');
INSERT INTO schema_migrations (version) VALUES ('20091017214107');
INSERT INTO schema_migrations (version) VALUES ('20091017214136');
INSERT INTO schema_migrations (version) VALUES ('20091017214236');
INSERT INTO schema_migrations (version) VALUES ('20091017214308');
INSERT INTO schema_migrations (version) VALUES ('20091017214336');
INSERT INTO schema_migrations (version) VALUES ('20091017214406');
INSERT INTO schema_migrations (version) VALUES ('20091017214440');
INSERT INTO schema_migrations (version) VALUES ('20091017214519');
INSERT INTO schema_migrations (version) VALUES ('20091017214611');
INSERT INTO schema_migrations (version) VALUES ('20091017214644');
INSERT INTO schema_migrations (version) VALUES ('20091017214720');
INSERT INTO schema_migrations (version) VALUES ('20091017214750');
INSERT INTO schema_migrations (version) VALUES ('20091025163651');
INSERT INTO schema_migrations (version) VALUES ('20091108092559');
INSERT INTO schema_migrations (version) VALUES ('20091114105931');
INSERT INTO schema_migrations (version) VALUES ('20091123212029');
INSERT INTO schema_migrations (version) VALUES ('20091205124427');
INSERT INTO schema_migrations (version) VALUES ('20091220183509');
INSERT INTO schema_migrations (version) VALUES ('20091220183727');
INSERT INTO schema_migrations (version) VALUES ('20091220184736');
INSERT INTO schema_migrations (version) VALUES ('20091225164732');
INSERT INTO schema_migrations (version) VALUES ('20091227112908');
INSERT INTO schema_migrations (version) VALUES ('20100129193402');
INSERT INTO schema_migrations (version) VALUES ('20100129193813');
INSERT INTO schema_migrations (version) VALUES ('20100221100219');
INSERT INTO schema_migrations (version) VALUES ('20100313132032');
INSERT INTO schema_migrations (version) VALUES ('20100313171051');
INSERT INTO schema_migrations (version) VALUES ('20100705164950');
INSERT INTO schema_migrations (version) VALUES ('20100819172912');
INSERT INTO schema_migrations (version) VALUES ('20101104182107');
INSERT INTO schema_migrations (version) VALUES ('20101107130441');
INSERT INTO schema_migrations (version) VALUES ('20101114115114');
INSERT INTO schema_migrations (version) VALUES ('20101114115359');
INSERT INTO schema_migrations (version) VALUES ('20110220160626');
INSERT INTO schema_migrations (version) VALUES ('20110223180944');
INSERT INTO schema_migrations (version) VALUES ('20110223180953');
INSERT INTO schema_migrations (version) VALUES ('20110224000000');
INSERT INTO schema_migrations (version) VALUES ('20110226120112');
INSERT INTO schema_migrations (version) VALUES ('20110226120132');
INSERT INTO schema_migrations (version) VALUES ('20110227125750');
INSERT INTO schema_migrations (version) VALUES ('20110228000000');
INSERT INTO schema_migrations (version) VALUES ('20110228000100');
INSERT INTO schema_migrations (version) VALUES ('20110401192910');
INSERT INTO schema_migrations (version) VALUES ('20110408103312');
INSERT INTO schema_migrations (version) VALUES ('20110412065600');
INSERT INTO schema_migrations (version) VALUES ('20110511000000');
INSERT INTO schema_migrations (version) VALUES ('20110902000000');
INSERT INTO schema_migrations (version) VALUES ('20111201201315');
INSERT INTO schema_migrations (version) VALUES ('20120115143024');
INSERT INTO schema_migrations (version) VALUES ('20120115143100');
INSERT INTO schema_migrations (version) VALUES ('20120115143126');
INSERT INTO schema_migrations (version) VALUES ('20120127174243');
INSERT INTO schema_migrations (version) VALUES ('20120205111326');
INSERT INTO schema_migrations (version) VALUES ('20120223110929');
INSERT INTO schema_migrations (version) VALUES ('20120301153455');
INSERT INTO schema_migrations (version) VALUES ('20120422150750');
INSERT INTO schema_migrations (version) VALUES ('20120705074331');
INSERT INTO schema_migrations (version) VALUES ('20120707064544');
INSERT INTO schema_migrations (version) VALUES ('20120714122000');
INSERT INTO schema_migrations (version) VALUES ('20120714122100');
INSERT INTO schema_migrations (version) VALUES ('20120714122200');
INSERT INTO schema_migrations (version) VALUES ('20120731164049');
INSERT INTO schema_migrations (version) VALUES ('20120930112914');
INSERT INTO schema_migrations (version) VALUES ('20121026002032');
INSERT INTO schema_migrations (version) VALUES ('20121026003537');
INSERT INTO schema_migrations (version) VALUES ('20121209123234');
INSERT INTO schema_migrations (version) VALUES ('20121209123358');
INSERT INTO schema_migrations (version) VALUES ('20121213084931');
INSERT INTO schema_migrations (version) VALUES ('20130110122628');
INSERT INTO schema_migrations (version) VALUES ('20130201184705');
INSERT INTO schema_migrations (version) VALUES ('20130202090625');
INSERT INTO schema_migrations (version) VALUES ('20130207175206');
INSERT INTO schema_migrations (version) VALUES ('20130207181455');
INSERT INTO schema_migrations (version) VALUES ('20130215073721');
INSERT INTO schema_migrations (version) VALUES ('20130215111127');
INSERT INTO schema_migrations (version) VALUES ('20130215111141');
INSERT INTO schema_migrations (version) VALUES ('20130217094251');
INSERT INTO schema_migrations (version) VALUES ('20130602092539');
INSERT INTO schema_migrations (version) VALUES ('20130710182539');
INSERT INTO schema_migrations (version) VALUES ('20130713104233');
INSERT INTO schema_migrations (version) VALUES ('20130713111657');
INSERT INTO schema_migrations (version) VALUES ('20130729070143');
INSERT INTO schema_migrations (version) VALUES ('20130911193200');
INSERT INTO schema_migrations (version) VALUES ('20131004113137');
INSERT INTO schema_migrations (version) VALUES ('20131005100610');
INSERT INTO schema_migrations (version) VALUES ('20131124175346');
INSERT INTO schema_migrations (version) VALUES ('20131210180802');
INSERT INTO schema_migrations (version) VALUES ('20131214094309');
INSERT INTO schema_migrations (version) VALUES ('20131215104612');
INSERT INTO schema_migrations (version) VALUES ('20131218183023');
INSERT INTO schema_migrations (version) VALUES ('20140228130325');


--
-- TOC entry 2663 (class 0 OID 16718)
-- Dependencies: 233
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO settings (id, name, value, updated_on) VALUES (2, 'welcome_text', '', '2014-07-18 11:02:11.656');
INSERT INTO settings (id, name, value, updated_on) VALUES (3, 'attachment_max_size', '10240', '2014-07-18 11:02:11.669');
INSERT INTO settings (id, name, value, updated_on) VALUES (4, 'per_page_options', '25,50,100', '2014-07-18 11:02:11.681');
INSERT INTO settings (id, name, value, updated_on) VALUES (5, 'activity_days_default', '30', '2014-07-18 11:02:11.694');
INSERT INTO settings (id, name, value, updated_on) VALUES (7, 'protocol', 'http', '2014-07-18 11:02:11.722');
INSERT INTO settings (id, name, value, updated_on) VALUES (8, 'text_formatting', 'textile', '2014-07-18 11:02:11.734');
INSERT INTO settings (id, name, value, updated_on) VALUES (9, 'cache_formatted_text', '0', '2014-07-18 11:02:11.748');
INSERT INTO settings (id, name, value, updated_on) VALUES (10, 'wiki_compression', '', '2014-07-18 11:02:11.763');
INSERT INTO settings (id, name, value, updated_on) VALUES (11, 'feeds_limit', '15', '2014-07-18 11:02:11.777');
INSERT INTO settings (id, name, value, updated_on) VALUES (12, 'file_max_size_displayed', '512', '2014-07-18 11:02:11.79');
INSERT INTO settings (id, name, value, updated_on) VALUES (13, 'diff_max_lines_displayed', '1500', '2014-07-18 11:02:11.803');
INSERT INTO settings (id, name, value, updated_on) VALUES (14, 'repositories_encodings', '', '2014-07-18 11:02:11.818');
INSERT INTO settings (id, name, value, updated_on) VALUES (15, 'ui_theme', 'alternate', '2014-07-18 11:02:22.211');
INSERT INTO settings (id, name, value, updated_on) VALUES (16, 'default_language', 'en', '2014-07-18 11:02:22.225');
INSERT INTO settings (id, name, value, updated_on) VALUES (17, 'force_default_language_for_anonymous', '0', '2014-07-18 11:02:22.238');
INSERT INTO settings (id, name, value, updated_on) VALUES (18, 'force_default_language_for_loggedin', '0', '2014-07-18 11:02:22.253');
INSERT INTO settings (id, name, value, updated_on) VALUES (22, 'user_format', 'firstname_lastname', '2014-07-18 11:02:22.345');
INSERT INTO settings (id, name, value, updated_on) VALUES (23, 'gravatar_enabled', '0', '2014-07-18 11:02:22.363');
INSERT INTO settings (id, name, value, updated_on) VALUES (24, 'gravatar_default', '', '2014-07-18 11:02:22.38');
INSERT INTO settings (id, name, value, updated_on) VALUES (25, 'thumbnails_enabled', '0', '2014-07-18 11:02:22.394');
INSERT INTO settings (id, name, value, updated_on) VALUES (26, 'thumbnails_size', '100', '2014-07-18 11:02:22.418');
INSERT INTO settings (id, name, value, updated_on) VALUES (19, 'start_of_week', '1', '2014-07-18 11:02:41.664');
INSERT INTO settings (id, name, value, updated_on) VALUES (20, 'date_format', '%d.%m.%Y', '2014-07-18 11:02:41.68');
INSERT INTO settings (id, name, value, updated_on) VALUES (21, 'time_format', '%I:%M %p', '2014-07-18 11:02:41.694');
INSERT INTO settings (id, name, value, updated_on) VALUES (27, 'login_required', '0', '2014-07-18 11:02:58.8');
INSERT INTO settings (id, name, value, updated_on) VALUES (28, 'autologin', '0', '2014-07-18 11:02:58.822');
INSERT INTO settings (id, name, value, updated_on) VALUES (29, 'self_registration', '2', '2014-07-18 11:02:58.834');
INSERT INTO settings (id, name, value, updated_on) VALUES (30, 'unsubscribe', '1', '2014-07-18 11:02:58.854');
INSERT INTO settings (id, name, value, updated_on) VALUES (31, 'password_min_length', '4', '2014-07-18 11:02:58.869');
INSERT INTO settings (id, name, value, updated_on) VALUES (32, 'lost_password', '1', '2014-07-18 11:02:58.88');
INSERT INTO settings (id, name, value, updated_on) VALUES (33, 'openid', '0', '2014-07-18 11:02:58.891');
INSERT INTO settings (id, name, value, updated_on) VALUES (34, 'rest_api_enabled', '1', '2014-07-18 11:02:58.901');
INSERT INTO settings (id, name, value, updated_on) VALUES (35, 'jsonp_enabled', '0', '2014-07-18 11:02:58.915');
INSERT INTO settings (id, name, value, updated_on) VALUES (36, 'session_lifetime', '0', '2014-07-18 11:02:58.928');
INSERT INTO settings (id, name, value, updated_on) VALUES (37, 'session_timeout', '0', '2014-07-18 11:02:58.94');
INSERT INTO settings (id, name, value, updated_on) VALUES (39, 'default_projects_modules', '---
- issue_tracking
- time_tracking
- news
- documents
- files
- wiki
- repository
- boards
- calendar
- gantt
', '2014-07-18 11:03:12.358');
INSERT INTO settings (id, name, value, updated_on) VALUES (40, 'default_projects_tracker_ids', '---
- ''1''
- ''2''
- ''3''
', '2014-07-18 11:03:12.385');
INSERT INTO settings (id, name, value, updated_on) VALUES (41, 'sequential_project_identifiers', '0', '2014-07-18 11:03:12.399');
INSERT INTO settings (id, name, value, updated_on) VALUES (42, 'cross_project_issue_relations', '1', '2014-07-18 11:03:47.781');
INSERT INTO settings (id, name, value, updated_on) VALUES (43, 'cross_project_subtasks', 'tree', '2014-07-18 11:03:47.793');
INSERT INTO settings (id, name, value, updated_on) VALUES (44, 'issue_group_assignment', '1', '2014-07-18 11:03:47.804');
INSERT INTO settings (id, name, value, updated_on) VALUES (45, 'default_issue_start_date_to_creation_date', '1', '2014-07-18 11:03:47.815');
INSERT INTO settings (id, name, value, updated_on) VALUES (46, 'display_subprojects_issues', '1', '2014-07-18 11:03:47.825');
INSERT INTO settings (id, name, value, updated_on) VALUES (47, 'issue_done_ratio', 'issue_field', '2014-07-18 11:03:47.834');
INSERT INTO settings (id, name, value, updated_on) VALUES (48, 'non_working_week_days', '---
- ''6''
- ''7''
', '2014-07-18 11:03:47.852');
INSERT INTO settings (id, name, value, updated_on) VALUES (49, 'issues_export_limit', '500', '2014-07-18 11:03:47.876');
INSERT INTO settings (id, name, value, updated_on) VALUES (50, 'gantt_items_limit', '500', '2014-07-18 11:03:47.903');
INSERT INTO settings (id, name, value, updated_on) VALUES (51, 'issue_list_default_columns', '---
- tracker
- status
- priority
- category
- subject
- assigned_to
- updated_on
', '2014-07-18 11:03:47.927');
INSERT INTO settings (id, name, value, updated_on) VALUES (53, 'autofetch_changesets', '1', '2014-07-18 11:04:41.524');
INSERT INTO settings (id, name, value, updated_on) VALUES (54, 'sys_api_enabled', '1', '2014-07-18 11:04:41.535');
INSERT INTO settings (id, name, value, updated_on) VALUES (55, 'sys_api_key', '3Cqlvx5IeBdcS4ltZgX8', '2014-07-18 11:04:41.547');
INSERT INTO settings (id, name, value, updated_on) VALUES (56, 'repository_log_display_limit', '100', '2014-07-18 11:04:41.558');
INSERT INTO settings (id, name, value, updated_on) VALUES (57, 'commit_ref_keywords', 'refs,references,IssueID', '2014-07-18 11:04:41.571');
INSERT INTO settings (id, name, value, updated_on) VALUES (58, 'commit_cross_project_ref', '0', '2014-07-18 11:04:41.581');
INSERT INTO settings (id, name, value, updated_on) VALUES (59, 'commit_logtime_enabled', '0', '2014-07-18 11:04:41.591');
INSERT INTO settings (id, name, value, updated_on) VALUES (60, 'commit_update_keywords', '--- []
', '2014-07-18 11:04:41.604');
INSERT INTO settings (id, name, value, updated_on) VALUES (61, 'mail_from', 'redmine@newbank.com', '2014-08-08 09:35:33.342');
INSERT INTO settings (id, name, value, updated_on) VALUES (63, 'plain_text_mail', '0', '2014-08-08 09:35:33.471');
INSERT INTO settings (id, name, value, updated_on) VALUES (64, 'default_notification_option', 'only_my_events', '2014-08-08 09:35:33.488');
INSERT INTO settings (id, name, value, updated_on) VALUES (65, 'notified_events', '---
- issue_added
- issue_updated
- news_added
- document_added
- file_added
- wiki_content_added
', '2014-08-08 09:35:33.507');
INSERT INTO settings (id, name, value, updated_on) VALUES (66, 'emails_header', '', '2014-08-08 09:35:33.525');
INSERT INTO settings (id, name, value, updated_on) VALUES (67, 'emails_footer', 'Sistemas New Bank | Project Management', '2014-08-08 09:35:33.545');
INSERT INTO settings (id, name, value, updated_on) VALUES (62, 'bcc_recipients', '0', '2014-08-08 09:37:10.426');
INSERT INTO settings (id, name, value, updated_on) VALUES (1, 'app_title', 'Sistemas New Bank | Project Management', '2014-08-11 09:33:49.152');
INSERT INTO settings (id, name, value, updated_on) VALUES (6, 'host_name', '10.51.215.38:18060', '2014-08-14 16:50:06.536');
INSERT INTO settings (id, name, value, updated_on) VALUES (52, 'enabled_scm', '---
- Subversion
- Git
', '2014-08-29 12:50:27.761');
INSERT INTO settings (id, name, value, updated_on) VALUES (38, 'default_projects_public', '0', '2014-08-29 12:51:11.49');


--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 234
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('settings_id_seq', 67, true);


--
-- TOC entry 2665 (class 0 OID 16727)
-- Dependencies: 235
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (1, 4, 4, 2, 0.5, 'Diseño de la aplicación', 8, '2014-07-29', 2014, 7, 31, '2014-07-29 14:00:21.593', '2014-07-29 14:00:21.593');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (2, 4, 4, 2, 0.5, 'Diseño de la aplicación.', 8, '2014-07-28', 2014, 7, 31, '2014-07-29 14:02:12.83', '2014-07-29 14:02:12.83');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (3, 4, 4, 2, 0.5, 'Creación de arquetipo back-end.', 8, '2014-07-28', 2014, 7, 31, '2014-07-29 16:03:50.569', '2014-07-29 16:03:50.569');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (4, 4, 4, 2, 0.40000000000000002, 'Creación de arquetipo front-end.', 8, '2014-07-29', 2014, 7, 31, '2014-07-29 16:04:21.909', '2014-07-29 16:04:21.909');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (5, 4, 1, 20, 2, 'Agregación de servicio de historial de pre-aclaraciones y aclaraciones', 9, '2014-08-26', 2014, 8, 35, '2014-08-26 11:38:32.32', '2014-08-26 11:38:32.32');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (6, 4, 1, 20, 2, 'Agregación de servicio de detalle de pre-aclaración', 9, '2014-08-26', 2014, 8, 35, '2014-08-26 11:56:56.931', '2014-08-26 11:56:56.931');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (7, 4, 1, 20, 2, 'Agregación de servicio de detalle de aclaración', 9, '2014-08-26', 2014, 8, 35, '2014-08-26 12:01:17.884', '2014-08-26 12:01:17.884');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (8, 4, 1, 20, 2, 'Agregación de servicio de consulta, inserción y actualizacion de datos de captura de canal', 9, '2014-08-26', 2014, 8, 35, '2014-08-26 16:49:00.338', '2014-08-26 16:49:00.338');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (9, 4, 1, 20, 0.5, 'Agregación de servicio de consulta de cliente Alnova', 9, '2014-08-26', 2014, 8, 35, '2014-08-26 17:48:26.897', '2014-08-26 17:48:26.897');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (10, 4, 1, 20, 2, 'Agregación de servicio de consulta de retenciones', 9, '2014-08-27', 2014, 8, 35, '2014-08-27 13:59:01.058', '2014-08-27 13:59:01.058');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (11, 4, 1, 20, 2, 'Agregación de servicio de consulta, inserción y actualización de cliente', 9, '2014-08-27', 2014, 8, 35, '2014-08-27 17:42:15.062', '2014-08-27 17:42:15.062');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (12, 4, 14, 29, 1, 'Se cambian las propiedades del objeto regresado por el servicio para regresar listas en vez de los Sets', 9, '2014-08-28', 2014, 8, 35, '2014-08-28 13:12:09.478', '2014-08-28 13:12:09.478');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (13, 4, 14, 30, 1, 'Se cambian las propiedades del objeto regresado por el servicio para regresar listas en vez de los Sets', 9, '2014-08-28', 2014, 8, 35, '2014-08-28 13:14:23.294', '2014-08-28 13:14:23.294');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (15, 4, 1, 20, 2, 'Agregación de servicio de consulta de tipo de aclaración y tipo de operación', 9, '2014-08-28', 2014, 8, 35, '2014-08-28 18:43:11.558', '2014-08-28 18:43:11.558');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (16, 4, 1, 20, 1, 'Agregación de servicio de consulta de movimientos ', 9, '2014-08-28', 2014, 8, 35, '2014-08-28 19:38:36.981', '2014-08-28 19:38:36.981');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (17, 4, 14, 27, 1, 'Se agrega servicio para modificar una lista de datos', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 11:32:17.935', '2014-08-29 11:32:17.935');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (18, 4, 1, 29, 2, 'Agregación de servicio de consulta de tipo de aclaración', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:22:10.092', '2014-08-29 18:22:10.092');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (19, 4, 1, 30, 2, 'Agregación de servicio de consulta de tipo de aclaración app', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:22:56.222', '2014-08-29 18:22:56.222');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (20, 4, 1, 28, 1, 'Agregación de servicio de consulta de tipo de operación', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:24:06.016', '2014-08-29 18:24:06.016');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (21, 4, 1, 35, 1, 'Agregación de servicio de consulta, inserción y actualización de aclaración', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:24:47.44', '2014-08-29 18:24:47.44');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (22, 4, 1, 31, 1, 'Agregación de servicio de consulta de movimientos', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:25:28.173', '2014-08-29 18:25:28.173');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (23, 4, 1, 21, 2, 'Agregación de servicio de consulta, inserción y actualización de cliente', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:27:22.401', '2014-08-29 18:27:22.401');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (24, 4, 1, 22, 1, 'Agregación de servicio de consulta de retenciones', 9, '2014-08-29', 2014, 8, 35, '2014-08-29 18:28:53.614', '2014-08-29 18:28:53.614');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (25, 4, 1, 37, 1, 'Agregación de servicio de inserción y actualización de movimiento y movimiento CNBV', 9, '2014-09-01', 2014, 9, 36, '2014-09-01 11:03:51.288', '2014-09-01 11:03:51.288');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (26, 4, 1, 34, 1, 'Agregación de servicio de inserción y actualización de retención', 9, '2014-09-01', 2014, 9, 36, '2014-09-01 11:17:09.155', '2014-09-01 11:17:09.155');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (27, 4, 1, 40, 1, 'Agregación de servicio de consulta de catálogo de datos personales', 9, '2014-09-01', 2014, 9, 36, '2014-09-01 11:41:02.228', '2014-09-01 11:41:02.228');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (28, 4, 1, 20, 1, 'Agregación de servicios en los respectivos Issues,', 9, '2014-09-01', 2014, 9, 36, '2014-09-01 11:42:09.097', '2014-09-01 11:42:09.097');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (30, 4, 1, 43, 2, 'Agregación de servicio de inserción y actualización de preaclaracion y preaclaracion con resumen', 9, '2014-09-02', 2014, 9, 36, '2014-09-02 19:18:23.438', '2014-09-02 19:18:23.438');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (31, 4, 1, 44, 1, 'Agregación de servicio de consulta de bin de tarjeta por producto', 9, '2014-09-02', 2014, 9, 36, '2014-09-02 19:46:07.87', '2014-09-02 19:46:07.87');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (32, 4, 1, 44, 1, 'Agregación de servicio de consulta de catálogo de clasificación Alnova', 9, '2014-09-02', 2014, 9, 36, '2014-09-02 20:05:18.908', '2014-09-02 20:05:18.908');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (33, 4, 1, 44, 1, 'Agregación de servicio de consulta de documentos de pre-aclaración', 9, '2014-09-02', 2014, 9, 36, '2014-09-02 20:29:03.006', '2014-09-02 20:29:03.006');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (34, 4, 14, 45, 0.5, 'Estandares programación', 9, '2014-09-03', 2014, 9, 36, '2014-09-03 10:53:13.758', '2014-09-03 10:53:13.758');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (35, 4, 1, 45, 1, 'Actualización de definición de servicio REST de inserción', 9, '2014-09-03', 2014, 9, 36, '2014-09-03 12:01:36.168', '2014-09-03 12:01:36.168');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (36, 4, 1, 44, 0.5, 'Modificación de capa de servicio para asignación de valores de consulta en consumo de servicio de catálogo de clasificación Alnova', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 12:45:15.264', '2014-09-04 12:45:15.264');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (37, 4, 1, 54, 1, 'Implementación de servicio de obtención de datos de cliente (datos dummy)', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 17:16:39.55', '2014-09-04 17:16:39.55');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (38, 4, 1, 44, 0.5, 'Solicitud de actualización de valor de idError en respuesta de servicio', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 17:41:42.829', '2014-09-04 17:41:42.829');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (39, 4, 1, 29, 0.5, 'Actualización de servicio, lógica para envío de tipo de operación', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 17:51:40.483', '2014-09-04 17:51:40.483');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (40, 4, 1, 29, 0.5, 'Actualización en salida para tipos de aclaración', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 18:06:12.49', '2014-09-04 18:06:12.49');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (41, 4, 1, 56, 2, 'Agreación de servicios de consulta de catálogo de nacionalidad', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 19:12:41.133', '2014-09-04 19:12:41.133');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (42, 4, 14, 55, 2, 'Se realiza la implementacion del SP que realiza la inserción de una acción relacionada a una bitacora', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 20:03:12.289', '2014-09-04 20:03:12.289');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (43, 4, 14, 55, 2, 'Se realiza la implementación del cierre de acción', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 20:06:14.68', '2014-09-04 20:06:14.68');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (45, 4, 1, 30, 0.5, 'Agregación de lógica para tipo de operación en consulta de tipo de aclaración app', 9, '2014-09-04', 2014, 9, 36, '2014-09-04 20:20:06.746', '2014-09-04 20:20:06.746');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (46, 4, 9, 44, 0.5, 'Se agrega campo de descripcion de producto a la respuesta del servicio y se cambia la consulta en la entrada por la opcion 2', 9, '2014-09-05', 2014, 9, 36, '2014-09-05 11:13:03.201', '2014-09-05 11:13:03.201');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (47, 4, 9, 35, 1, 'Se agrega el servicio para guardar aclaracion junto con el historial de la aclaracion', 9, '2014-09-05', 2014, 9, 36, '2014-09-05 12:22:52.412', '2014-09-05 12:22:52.412');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (48, 4, 9, 20, 1, 'modificacion a datos de consultar detalle aclaracion', 9, '2014-09-08', 2014, 9, 37, '2014-09-08 10:34:42.255', '2014-09-08 10:34:42.255');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (49, 4, 1, 35, 0.5, 'Agregación de servicio de inserción de aclaración con historial y preaclaración', 9, '2014-09-08', 2014, 9, 37, '2014-09-08 11:43:38.394', '2014-09-08 11:43:38.394');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (50, 4, 9, 35, 2, 'Servicio para guardar aclaracion, historial, actualizacion de preaclaracion y guardar movimientos CNBV', 9, '2014-09-08', 2014, 9, 37, '2014-09-08 20:01:21.96', '2014-09-08 20:01:21.96');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (51, 4, 9, 35, 0.29999999999999999, 'se corrige la cadena de entrada para el servicio de guardar aclaracion completo', 9, '2014-09-09', 2014, 9, 37, '2014-09-09 09:34:06.192', '2014-09-09 09:34:06.192');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (52, 4, 14, 55, 1, 'Se agregan parametros de entrada para el SP', 9, '2014-09-09', 2014, 9, 37, '2014-09-09 10:44:06.029', '2014-09-09 10:44:06.029');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (53, 4, 1, 35, 0.5, 'Agregación de servicio de inserción de aclaración con flujo completo', 9, '2014-09-09', 2014, 9, 37, '2014-09-09 11:55:03.022', '2014-09-09 11:55:03.022');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (54, 4, 9, 20, 1, 'Se agrega el campo de comisionAcl en el objeto datosAclaracion a la salida del servicio de consultar detalle preaclaracion y detalle aclaracion', 9, '2014-09-09', 2014, 9, 37, '2014-09-09 13:33:03.853', '2014-09-09 13:33:03.853');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (55, 4, 1, 54, 0.5, 'Actualización de modelo de cliente', 9, '2014-09-09', 2014, 9, 37, '2014-09-09 18:58:18.786', '2014-09-09 18:58:18.786');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (56, 4, 1, 30, 0.5, 'Actualzación de servicio de obtención de tipo de aclaración (app)', 9, '2014-09-10', 2014, 9, 37, '2014-09-10 12:12:00.4', '2014-09-10 12:12:00.4');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (57, 4, 1, 60, 1, 'Agregación de servicio de consulta de catálogo de casos', 9, '2014-09-11', 2014, 9, 37, '2014-09-11 11:15:17.159', '2014-09-11 11:15:17.159');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (58, 4, 1, 61, 1, 'Agregación de servicio de consulta de movimientos por producto', 9, '2014-09-11', 2014, 9, 37, '2014-09-11 11:17:26.615', '2014-09-11 11:17:26.615');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (59, 4, 1, 61, 0.5, 'Actualización de firma en consulta de movimientos por producto', 9, '2014-09-11', 2014, 9, 37, '2014-09-11 12:22:56.266', '2014-09-11 12:22:56.266');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (60, 4, 1, 41, 1, 'Agregación de URLs para servicios de documentos', 9, '2014-09-12', 2014, 9, 37, '2014-09-12 13:20:43.487', '2014-09-12 13:20:43.487');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (61, 4, 19, 64, 4, 'Servicio para cancelar tarjeta', 9, '2014-09-15', 2014, 9, 38, '2014-09-15 16:40:44.554', '2014-09-15 16:40:44.554');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (62, 4, 1, 64, 0.5, 'Recurso para cancelación de tarjeta', 9, '2014-09-15', 2014, 9, 38, '2014-09-15 16:43:12.117', '2014-09-15 16:43:12.117');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (63, 7, 1, 65, 0.5, 'URL de repositorio', 9, '2014-09-17', 2014, 9, 38, '2014-09-17 13:15:45.651', '2014-09-17 13:15:45.651');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (64, 4, 9, 20, 1, 'se agrega campos de fechacaptura y dias resolucion a los objetos de lstAclaraciones en el servicio de consultarPreAclaracionesAclaraciones', 9, '2014-09-17', 2014, 9, 38, '2014-09-17 17:51:01.571', '2014-09-17 17:51:01.571');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (65, 4, 14, 66, 2.5, 'Implementacion del servicio de consulta de acciones por cliente (Consulta principal de acciones)', 9, '2014-09-18', 2014, 9, 38, '2014-09-18 17:40:51.304', '2014-09-18 17:40:51.304');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (66, 4, 14, 66, 2.5, 'Implementacion del servicio de consulta de codificacion', 9, '2014-09-18', 2014, 9, 38, '2014-09-18 18:38:45.03', '2014-09-18 18:38:45.03');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (67, 4, 1, 68, 0.5, 'Agregacion de servicio de devolución automática de aclaración', 9, '2014-09-19', 2014, 9, 38, '2014-09-19 12:15:07.388', '2014-09-19 12:15:07.388');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (68, 4, 14, 67, 3, 'Se realiza la implementacion del servicio REST consultar folio atencion clientes', 9, '2014-09-19', 2014, 9, 38, '2014-09-19 12:48:20.28', '2014-09-19 12:48:20.28');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (69, 4, 14, 67, 2.5, 'Se implementa servicio REST de consulta de acciones por numero de folio de atencion', 9, '2014-09-19', 2014, 9, 38, '2014-09-19 16:39:41.822', '2014-09-19 16:39:41.822');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (70, 4, 9, 31, 1, 'se agrega como parámetro de entrada una fecha inicial y fecha fin al servicio de consulta de movimientos de tarjeta.', 9, '2014-09-22', 2014, 9, 39, '2014-09-22 13:44:21.265', '2014-09-22 13:44:21.265');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (71, 4, 14, 69, 5, 'Se implementa funcionalidad para el manejo de catalogos de codificacion en objetos a nivel aplicacion', 9, '2014-09-22', 2014, 9, 39, '2014-09-22 15:58:37.536', '2014-09-22 15:58:37.536');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (72, 4, 9, 20, 1, 'Se agrega campo fecha de captura (fechaCapturaPreacl) en los objetos de la lista de preaclaraciones', 9, '2014-09-26', 2014, 9, 39, '2014-09-26 18:53:30.609', '2014-09-26 18:53:30.609');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (73, 4, 9, 20, 2, 'Se agrega fragmento de modificacion de modificacion de datos al detalle de preaclaracion y aclaracion', 9, '2014-09-30', 2014, 9, 40, '2014-09-30 13:37:34.206', '2014-09-30 13:37:34.206');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (74, 4, 9, 35, 1, 'Se agregan campos de entrada al servicio de guardarAclaracionCompleta', 9, '2014-10-02', 2014, 10, 40, '2014-10-02 17:16:33.351', '2014-10-02 17:16:33.351');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (75, 4, 9, 88, 0.5, 'se cambio el tiempo de resolucion para los tipo aclaracion del top 5', 9, '2014-10-06', 2014, 10, 41, '2014-10-06 17:58:44.85', '2014-10-06 17:58:44.85');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (76, 4, 9, 68, 1, 'Se agregan campos al abono automatico debido a cambios en base de datos', 9, '2014-10-06', 2014, 10, 41, '2014-10-06 18:32:03.005', '2014-10-06 18:32:03.005');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (77, 4, 9, 20, 1, 'Se agrega la lista de retenciones para la consulta de detalle de aclaracion', 9, '2014-10-07', 2014, 10, 41, '2014-10-07 13:38:52.974', '2014-10-07 13:38:52.974');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (78, 4, 9, 20, 1, 'Se agrega campo id cliente  a la consulta del detalle de preaclaracion', 9, '2014-10-10', 2014, 10, 41, '2014-10-10 11:23:44.686', '2014-10-10 11:23:44.686');
INSERT INTO time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) VALUES (79, 4, 14, 89, 8, 'Implementacion de servicios Alnova', 9, '2014-10-10', 2014, 10, 41, '2014-10-10 11:45:31.802', '2014-10-10 11:45:31.802');


--
-- TOC entry 2768 (class 0 OID 0)
-- Dependencies: 236
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('time_entries_id_seq', 79, true);


--
-- TOC entry 2667 (class 0 OID 16732)
-- Dependencies: 237
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (1, 1, 'feeds', '38ae5eb2dc4f56fada645965eb4711f4fb93e2c6', '2014-07-18 10:54:09.508');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (2, 3, 'feeds', '5316bb9743959c22aed1c509f7ea1031e0770c03', '2014-07-24 11:38:23.398');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (5, 8, 'api', '55eb29b29bdbe9e365a3abdfba78116c56d66f5b', '2014-07-25 13:12:05.866');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (6, 8, 'feeds', '191cf60858d853f0e9bc34898e8e79092051add1', '2014-07-25 13:12:17.92');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (7, 9, 'api', 'c3535dc91d6904f20103e8ebc3c1782bf20499b7', '2014-07-25 13:27:29.624');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (8, 9, 'feeds', '82f6d5899fbd5efd48dfcf1c3a7b548deb142f8a', '2014-07-25 13:28:49.06');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (9, 6, 'api', 'f2a86448f39d2b992af4da7d2a11c19a9f23f47f', '2014-07-25 13:30:27.232');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (10, 6, 'feeds', '4459154d99494c768710e9336bb7e2943cd0fcda', '2014-07-25 13:30:44.821');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (11, 4, 'api', 'e31cf3b982fa5732cd0c3c9a72a7eae3312b13b5', '2014-07-25 17:06:03.907');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (12, 4, 'feeds', '595a48b6d92ce5cc5dce7159db6670fc1a1c32d9', '2014-07-25 17:06:43.594');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (13, 5, 'api', '6b44c3e44bf5eae85f6b6bdf45a7f430f8d04c50', '2014-07-25 17:06:49.905');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (14, 5, 'feeds', '2b95e4aebf7a0d46d1b7b2f1f260379228cf4930', '2014-07-25 17:07:03.52');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (15, 6, 'recovery', '4bfeca446309424a0875525846e915b4623eda75', '2014-07-31 11:54:41.707');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (16, 12, 'api', '34713916ea848f0784c9720bab187441072fee55', '2014-08-07 13:31:42.746');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (17, 12, 'feeds', '2647d2de8d588bbac44a1e4ac4726ec3f63559b7', '2014-08-07 13:31:50.081');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (18, 14, 'api', '281acda4ae50eef498ee0758d6908efd69fae002', '2014-08-08 10:29:21.54');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (19, 14, 'feeds', '8fd62444260cf7507ccf4a500dfefab0009e8d42', '2014-08-08 10:29:30.006');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (20, 18, 'api', '00dc6da050d88151be2fb6b09def20d7447c7456', '2014-08-19 09:29:26.295');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (21, 18, 'feeds', 'f08ca85a240c4cf795692994acdddd113a9db12e', '2014-08-19 09:29:41.625');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (22, 19, 'api', '0d9d78c84e59b59ad2244eed006ed27ff3316783', '2014-08-22 17:49:18.368');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (23, 19, 'feeds', '3b23d88e75102d5624553d466b2c6ac46e8ee81d', '2014-08-22 17:49:47.351');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (24, 20, 'api', '785b9586540d37de035084370bdd61385b45ad94', '2014-08-25 18:42:32.653');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (25, 20, 'feeds', '078e72c181080238d6114b56e3ae79cb098e1327', '2014-08-25 18:43:14.15');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (26, 22, 'api', 'bddb46be0fae19ef8738dee85776cd502911f363', '2014-09-02 16:31:05.42');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (27, 22, 'feeds', '557beb2d7d6983e08b9ff48a13995aea60e378c5', '2014-09-02 16:31:27.616');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (28, 21, 'api', '7d78225e0cb7b35e92fc22daae300387cefcf3ea', '2014-09-02 16:32:32.197');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (29, 21, 'feeds', '594141d074898411f3524fa16aac46d06898c4d3', '2014-09-02 16:33:30.314');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (30, 15, 'api', '0bd1f85b4bfccecbb4f4b80a2fffcd3bb2e39344', '2014-09-12 10:05:47.174');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (31, 15, 'feeds', 'e6145c6b5018fe10789d0c1fd5fe070d069c78ae', '2014-09-12 10:06:42.769');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (32, 23, 'api', '9d74d508948857cbd307c97b453fc0d1c82cb5a5', '2014-09-18 16:31:39.804');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (33, 23, 'feeds', '85102e14b155c77c2d1129750ad947ff678e84bb', '2014-09-18 16:32:22.856');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (35, 16, 'api', '31654f26b028cd1eb9f2695a9b8842152072ca4a', '2014-09-29 12:30:48.654');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (37, 16, 'feeds', '40241325ed20f483857467a10339fc49506c4ad4', '2014-10-06 12:36:18.271');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (38, 24, 'api', '2460605e8a708a22c8577896e89eea999c829b46', '2014-10-09 16:28:33.672');
INSERT INTO tokens (id, user_id, action, value, created_on) VALUES (39, 24, 'feeds', '0a0cf52b291a903a4dcab81ac711fb4aac5b3b40', '2014-10-09 16:29:34.563');


--
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 238
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('tokens_id_seq', 39, true);


--
-- TOC entry 2669 (class 0 OID 16740)
-- Dependencies: 239
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits) VALUES (1, 'Bug', true, 1, false, 0);
INSERT INTO trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits) VALUES (2, 'Feature', true, 2, true, 0);
INSERT INTO trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits) VALUES (3, 'Support', false, 3, false, 0);


--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 240
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('trackers_id_seq', 3, true);


--
-- TOC entry 2671 (class 0 OID 16750)
-- Dependencies: 241
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (2, 3, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (7, 8, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, 'Mexico City');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (9, 10, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (10, 12, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (8, 9, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, 'Mexico City');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (12, 14, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (4, 5, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (3, 4, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (5, 6, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (11, 13, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (16, 18, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (17, 19, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (18, 20, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (1, 1, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:my_page_layout:
  top: []
  left:
  - issuesassignedtome
  - issueswatched
  - issuesreportedbyme
  right:
  - documents
  - news
:gantt_zoom: 2
:gantt_months: 6
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (20, 22, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
:my_page_layout:
  top: []
  left:
  - issuesassignedtome
  right:
  - issueswatched
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (19, 21, '---
:no_self_notified: ''1''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
:gantt_zoom: 2
:gantt_months: 6
', false, 'Mexico City');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (21, 23, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (13, 15, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (14, 16, '---
:no_self_notified: ''0''
:comments_sorting: asc
:warn_on_leaving_unsaved: ''1''
', false, '');
INSERT INTO user_preferences (id, user_id, others, hide_mail, time_zone) VALUES (22, 24, '---
:no_self_notified: ''0''
:comments_sorting: desc
:warn_on_leaving_unsaved: ''1''
', false, 'Mexico City');


--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 242
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('user_preferences_id_seq', 22, true);


--
-- TOC entry 2673 (class 0 OID 16760)
-- Dependencies: 243
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (6, 'esaldanam', 'b0d398300dce5036eab87e00d67ee9738da95c5e', 'Elizabeth', 'Saldana', 'esaldanam@elektra.com.mx', false, 1, '2014-07-31 12:51:21.053', 'en', NULL, '2014-07-25 11:51:12.705', '2014-07-31 12:51:39.507', 'User', NULL, 'only_my_events', '2f35847bb1806a4072ab0ac34766216a', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (2, '', '', '', 'Anonymous', '', false, 0, NULL, '', NULL, '2014-07-18 10:54:01.45', '2014-07-18 10:54:01.45', 'AnonymousUser', NULL, 'only_my_events', NULL, false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (13, 'ecuevasz', 'd58f9a976869b5af7aa495591ef411d719c10b81', 'Mauricio', 'Cuevas', 'ecuevasz@bancoazteca.com.mx', false, 1, NULL, 'en', NULL, '2014-08-05 13:33:58.946', '2014-08-05 13:33:58.946', 'User', NULL, 'only_my_events', '9e38335e77511c52e14a3f2b9145f6d4', true);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (10, 'dbaez', 'd94ff3b4c48a7efb5d614fd36896e4004e018edf', 'David', 'Baez', 'dbaez@bancoazteca.com.mx', false, 1, NULL, 'en', NULL, '2014-07-25 13:28:07.6', '2014-07-25 13:28:07.6', 'User', NULL, 'only_my_events', '62463f7aa099367b72fb88eca92cb120', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (11, '', '', '', 'Caja', '', false, 1, NULL, '', NULL, '2014-07-25 13:33:28.108', '2014-07-25 13:33:28.108', 'Group', NULL, '', NULL, false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (20, 'aanconab', 'd1fb450f2b40eeb95988159118ef8c751bf918c3', 'Misael', 'Ancona', 'aanconab@elektra.com.mx', false, 1, '2014-09-01 16:46:46.093', 'en', NULL, '2014-08-25 18:37:27.578', '2014-08-25 18:42:32.446', 'User', NULL, 'only_my_events', '1c925e90a8bc52ec4b53e44b491d4f45', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (3, 'jgonzalezt', 'b56cc35e2e2a3ff184b42be653081d44155c8ac8', 'Julián', 'González', 'jgonzalezt@bancoazteca.com.mx', true, 1, '2014-10-10 13:17:47.61', 'en', NULL, '2014-07-24 11:37:30.835', '2014-07-24 11:37:30.835', 'User', NULL, 'only_my_events', 'ad87c9cc09c1ff5e6aecf89cec00e613', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (23, 'laperezs', '73f90e77267e68aac6c7740adfb0a82adf139be2', 'LUIS ALBERTO', 'PEREZ SUAREZ', 'laperezs@elektra.com.mx', false, 1, '2014-10-13 12:11:47.273', 'en', NULL, '2014-09-17 19:03:17.492', '2014-09-18 16:31:39.384', 'User', NULL, 'only_my_events', 'c8f3b1c9ce0b9706875f757cc9d8fac3', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (1, 'admin', '05954145ea64fde4f11915f7098dd93b6dd57cc5', 'Giovanni', 'Farfán', 'gfarfan@elektra.com.mx', true, 1, '2014-10-13 17:55:24.594', '', NULL, '2014-07-18 10:24:11.572', '2014-07-18 10:55:03.538', 'User', NULL, 'all', '1ad1aeae7e7d9da5e9d3e0284db7ffb6', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (4, 'jadiazc', '41365d6d4c652a55eb7241dfcf1bd4d8b19c74cf', 'Jose Antonio', 'Diaz', 'jadiazc@elektra.com.mx', false, 1, '2014-10-07 18:44:35.615', 'en', NULL, '2014-07-25 11:47:34.864', '2014-07-25 17:06:35.783', 'User', NULL, 'only_my_events', '1fc23da34f335f7924124d52a3725f3c', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (5, 'edgarciaso', '0d9208c71eacf2f17d63f770a725d91ed62c4298', 'Eduardo', 'Garcia', 'edgarciaso@elektra.com.mx', false, 1, '2014-08-27 14:31:27.892', 'es', NULL, '2014-07-25 11:48:22.893', '2014-07-25 17:06:55.758', 'User', NULL, 'only_my_events', '29e243140251557cdae4c67e12cef7e9', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (21, 'ccuaya', '4b33b33ef7eaf48d002de8045c1a535121bfadab', 'Carlos Alfonso', 'Cuaya Xinto', 'ccuaya@elektra.com.mx', false, 1, '2014-09-30 19:52:11.826', 'en', NULL, '2014-09-02 16:23:58.864', '2014-09-02 17:09:02.339', 'User', NULL, 'only_my_events', 'e7f46f39faedfc6eebf7f8c77e188858', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (8, 'jjimenezf', 'b27ac6a15cd26c2da32d48c866969f52e316c743', 'José Isabel', 'Jiménez', 'jjimenezf@elektra.com.mx', false, 1, '2014-10-14 11:46:39.211', 'es', NULL, '2014-07-25 11:58:03.619', '2014-07-25 13:17:15.328', 'User', NULL, 'only_my_events', 'c67b2853583ac3fe26524c07f47adfde', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (25, '', '', '', 'Java', '', false, 1, NULL, '', NULL, '2014-10-09 16:27:57.484', '2014-10-09 16:27:57.484', 'Group', NULL, '', NULL, false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (14, 'vbriseno', 'ff41b70d6f0a372a8ba414259983d2ed2c8abfd8', 'Victor', 'Briseño', 'vbriseno@elektra.com.mx', false, 1, '2014-10-13 09:12:12.499', 'en', NULL, '2014-08-06 18:29:02.944', '2014-08-08 10:29:18.351', 'User', NULL, 'only_my_events', '8077412f6a49a3161a379062eeca9b29', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (19, 'esalasm', 'b04c4e055946c9e1fd4d01be6ca59f12006e71cc', 'Edgar Alonso', 'Salas Martinez', 'esalasm@elektra.com.mx', false, 1, '2014-10-13 10:34:21.273', 'en', NULL, '2014-08-22 17:41:09.716', '2014-08-22 17:50:23.32', 'User', NULL, 'only_my_events', '5aec4cade9fa7610fa95fe4330dae026', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (18, 'lalonsos', '53bedd29d0ef80cde5965213089b22284907a88f', 'Lucio Ramon', 'Alonso Sanchez', 'lalonsos@elektra.com.mx', false, 1, '2014-10-06 12:23:18.068', 'en', NULL, '2014-08-18 19:57:44.448', '2014-08-19 09:29:25.717', 'User', NULL, 'only_my_events', '863fed80beca18f14cb0e3ce9f7c45b5', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (15, 'hsanchezga', '24a61750c057ee26d2b09407a4f53803109ce0a6', 'Hugo', 'Sanchez ', 'hsanchezga@elektra.com.mx', false, 1, '2014-10-06 13:09:53.653', 'es', NULL, '2014-08-07 17:34:23.842', '2014-09-29 12:31:22.741', 'User', NULL, 'only_my_events', '80522199f91053099d4f29dfe0231ec4', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (16, 'bcampos', '8bbebcd61882038177b2325e725aa6d70479d395', 'Bianca ', 'Campos', 'bcampos@elektra.com.mx', false, 1, '2014-10-13 10:45:07.256', 'en', NULL, '2014-08-07 17:42:42.395', '2014-10-06 12:59:18.241', 'User', NULL, 'only_my_events', 'df98f5afe56b06326ff93f71d4361da1', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (24, 'lgarzam', '53829c59be62aac23c5e77e38cf0402d0e8ee036', 'Luis Hiram', 'Garza Martínez', 'lgarzam@elektra.com.mx', false, 1, '2014-10-14 12:13:17.579', 'es', NULL, '2014-10-09 16:26:54.465', '2014-10-09 16:28:33.312', 'User', NULL, 'only_my_events', '2a20b2970826a9ef7c942cf8632a0234', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (22, 'mandradeh', '33148c8d068c919e3cb7bd6cba271813b7e9b87d', 'Miguel Eliseo', 'Andrade Hernández', 'mandradeh@elektra.com.mx', false, 1, '2014-10-08 11:22:38.592', 'en', NULL, '2014-09-02 16:27:05.707', '2014-09-02 16:31:04.92', 'User', NULL, 'only_my_events', 'dbc04c8acf194ca3cf17be067018b671', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (12, 'kmartinezb', '2f4d90c96bac0b0adc2f690debc4834cd8fc8388', 'Karina', 'Martinez', 'kmartinezb@elektra.com.mx', true, 1, '2014-10-14 17:28:45.366', 'es', NULL, '2014-07-25 13:39:15.921', '2014-08-07 17:49:25.206', 'User', NULL, 'only_my_events', 'fa0d319e8b2cbfa53077207ab0e01ffb', false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (26, '', '', '', 'Oracle', '', false, 1, NULL, '', NULL, '2014-10-09 16:29:24.458', '2014-10-09 16:29:24.458', 'Group', NULL, '', NULL, false);
INSERT INTO users (id, login, hashed_password, firstname, lastname, mail, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd) VALUES (9, 'odiazd', '403d7dcc732fc366fe271c251624e75730ca6d7d', 'Oscar Guillermo', 'Diaz', 'odiazd@elektra.com.mx', false, 1, '2014-10-10 11:20:57.204', 'es', NULL, '2014-07-25 12:17:56.966', '2014-07-25 13:28:02.688', 'User', NULL, 'only_my_events', '14c71355094b5b230f9a12a1b3fb270c', false);


--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 244
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('users_id_seq', 26, true);


--
-- TOC entry 2675 (class 0 OID 16778)
-- Dependencies: 245
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: redmine
--



--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 246
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('versions_id_seq', 1, false);


--
-- TOC entry 2677 (class 0 OID 16791)
-- Dependencies: 247
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (1, 'Issue', 2, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (2, 'Issue', 2, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (3, 'Issue', 2, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (4, 'Issue', 3, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (5, 'Issue', 3, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (6, 'Issue', 3, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (7, 'Issue', 3, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (8, 'Issue', 6, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (9, 'Issue', 6, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (10, 'Issue', 6, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (11, 'Issue', 8, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (12, 'Issue', 8, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (13, 'Issue', 8, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (14, 'Issue', 8, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (15, 'Issue', 9, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (16, 'Issue', 9, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (17, 'Issue', 10, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (18, 'Issue', 10, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (20, 'Issue', 12, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (21, 'Issue', 14, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (22, 'Issue', 15, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (23, 'Issue', 16, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (24, 'Issue', 16, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (25, 'Issue', 16, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (26, 'Issue', 15, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (27, 'Issue', 15, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (28, 'Issue', 18, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (29, 'Issue', 18, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (30, 'Issue', 20, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (31, 'Issue', 20, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (32, 'Issue', 20, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (33, 'Issue', 20, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (34, 'Issue', 20, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (35, 'Issue', 21, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (36, 'Issue', 21, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (37, 'Issue', 22, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (38, 'Issue', 22, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (39, 'Issue', 23, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (40, 'Issue', 23, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (42, 'Issue', 24, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (43, 'Issue', 24, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (44, 'Issue', 24, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (45, 'Issue', 25, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (46, 'Issue', 26, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (47, 'Issue', 26, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (48, 'Issue', 26, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (49, 'Issue', 26, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (50, 'Issue', 27, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (51, 'Issue', 27, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (52, 'Issue', 27, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (53, 'Issue', 27, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (54, 'Issue', 28, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (55, 'Issue', 28, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (56, 'Issue', 28, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (57, 'Issue', 28, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (58, 'Issue', 29, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (59, 'Issue', 29, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (60, 'Issue', 29, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (61, 'Issue', 29, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (62, 'Issue', 29, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (63, 'Issue', 30, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (64, 'Issue', 30, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (65, 'Issue', 30, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (66, 'Issue', 30, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (67, 'Issue', 31, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (68, 'Issue', 31, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (69, 'Issue', 31, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (70, 'Issue', 32, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (71, 'Issue', 32, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (72, 'Issue', 32, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (73, 'Issue', 33, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (74, 'Issue', 33, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (75, 'Issue', 33, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (76, 'Issue', 33, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (77, 'Issue', 33, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (78, 'Issue', 34, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (79, 'Issue', 34, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (80, 'Issue', 34, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (81, 'Issue', 34, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (82, 'Issue', 35, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (83, 'Issue', 35, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (84, 'Issue', 35, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (85, 'Issue', 35, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (86, 'Issue', 36, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (87, 'Issue', 36, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (88, 'Issue', 36, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (89, 'Issue', 37, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (90, 'Issue', 37, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (91, 'Issue', 37, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (92, 'Issue', 37, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (93, 'Issue', 20, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (94, 'Issue', 38, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (95, 'Issue', 38, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (96, 'Issue', 38, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (97, 'Issue', 38, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (98, 'Issue', 38, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (99, 'Issue', 38, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (100, 'Issue', 38, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (101, 'Issue', 38, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (102, 'Issue', 39, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (103, 'Issue', 40, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (104, 'Issue', 40, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (105, 'Issue', 40, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (106, 'Issue', 40, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (107, 'Issue', 41, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (108, 'Issue', 41, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (109, 'Issue', 41, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (110, 'Issue', 41, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (111, 'Issue', 44, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (112, 'Issue', 44, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (113, 'Issue', 44, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (114, 'Issue', 45, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (115, 'Issue', 46, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (116, 'Issue', 46, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (117, 'Issue', 47, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (118, 'Issue', 47, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (119, 'Issue', 47, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (120, 'Issue', 47, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (121, 'Issue', 48, 12);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (122, 'Issue', 49, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (123, 'Issue', 49, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (124, 'Issue', 49, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (125, 'Issue', 50, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (126, 'Issue', 50, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (127, 'Issue', 52, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (128, 'Issue', 52, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (129, 'Issue', 54, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (130, 'Issue', 54, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (131, 'Issue', 55, 12);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (132, 'Issue', 56, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (133, 'Issue', 56, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (134, 'Issue', 56, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (135, 'Issue', 56, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (136, 'Issue', 57, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (137, 'Issue', 58, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (138, 'Issue', 59, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (139, 'Issue', 60, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (140, 'Issue', 60, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (141, 'Issue', 61, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (142, 'Issue', 61, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (143, 'Issue', 62, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (144, 'Issue', 62, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (145, 'Issue', 63, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (146, 'Issue', 64, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (147, 'Issue', 64, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (148, 'Issue', 64, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (149, 'Issue', 65, 21);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (150, 'Issue', 65, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (151, 'Issue', 65, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (152, 'Issue', 65, 22);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (153, 'Issue', 66, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (154, 'Issue', 67, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (155, 'Issue', 68, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (156, 'Issue', 68, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (157, 'Issue', 68, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (158, 'Issue', 69, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (159, 'WikiPage', 4, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (160, 'Issue', 38, 21);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (161, 'Issue', 38, 23);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (162, 'Issue', 38, 22);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (163, 'Issue', 70, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (164, 'Issue', 70, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (165, 'Issue', 71, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (166, 'Issue', 72, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (167, 'Issue', 72, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (168, 'Issue', 72, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (169, 'Issue', 73, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (170, 'Issue', 74, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (171, 'Issue', 75, 8);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (172, 'Issue', 76, 16);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (173, 'Issue', 78, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (174, 'Issue', 78, 5);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (175, 'Issue', 78, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (176, 'Issue', 78, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (177, 'Issue', 80, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (178, 'Issue', 77, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (179, 'Issue', 77, 23);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (180, 'Issue', 77, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (181, 'Issue', 82, 15);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (182, 'Issue', 83, 16);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (183, 'Issue', 84, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (184, 'Issue', 69, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (185, 'Issue', 55, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (186, 'Issue', 88, 12);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (187, 'Issue', 89, 1);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (188, 'Issue', 89, 18);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (189, 'Issue', 89, 14);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (190, 'Issue', 90, 19);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (191, 'Issue', 91, 22);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (192, 'Issue', 92, 16);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (193, 'Issue', 93, 4);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (194, 'Issue', 93, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (195, 'Issue', 95, 15);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (196, 'Issue', 96, 3);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (197, 'Issue', 96, 9);
INSERT INTO watchers (id, watchable_type, watchable_id, user_id) VALUES (198, 'Issue', 99, 3);


--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 248
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('watchers_id_seq', 198, true);


--
-- TOC entry 2679 (class 0 OID 16798)
-- Dependencies: 249
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (2, 2, 2, 3, '\x68312e2057696b690d0a0d0a3e2a205b5b4d616e656a6f2064652056657273696f6e65735d5d', '', '', '2014-07-25 12:54:38.33', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (3, 2, 2, 3, '\x2a202a202a202a2068312e2057696b690d0a0d0a3e2a205b5b4d616e656a6f2064652056657273696f6e65735d5d', '', '', '2014-07-25 12:55:08.322', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (4, 2, 2, 3, '\x2a2068312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d', '', '', '2014-07-25 12:55:57.349', 3);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (5, 3, 3, 3, '\x68312e204e6f6d656e636c61747572612064652070726f796563746f730d0a0d0a456c20637269746572696f2070617261207265616c697a617220c3a973746120616272657669616369c3b36e2065733a2020746f6d6172206c61207072696d6572206c657472612064656c206e6f6d6272652064656c206dc3b364756c6f2079206c61207072696d657220636f6e736f6e616e7465207175652061706172657a6361206465737075c3a97320646520c3a97374612e0d0a090d0a09094dc3b364756c6f2043616a61203e20436a203c0d0a0d0a0d0a41646963696f6e616c6d656e74652073652061677265676172c3a16e203220737566696a6f732071756520636f72726573706f6e64656e2061206c612063726974696369646164207920616c206e6976656c20646520696d706163746f2064656c2061727465666163746f2c20726573706563746976616d656e74653a0d0a0d0a0d0ac2b70950617261206c6120437269746963696461640d0a4320e28093204372c3ad74696361202870617261206c6f732061727465666163746f7320636f6e736964657261646f73206372c3ad7469636f73207061726120656c2066756e63696f6e616d69656e746f206465206c612061706c6963616369c3b36e292e0d0a4e20e28093204e6f726d616c20286e6f20736f6e20636f6e736964657261646f73206372c3ad7469636f73207061726120656c2066756e63696f6e616d69656e746f206465206c612061706c6963616369c3b36e292e0d0a0d0a0d0ac2b7095061726120656c204e6976656c20646520496d706163746f0d0a5220e28093205265676c6173206465204e65676f63696f2079204261736573206465204461746f7320287469656e656e20696d706163746f20736f627265206c6173207265676c61732064656c206e65676f63696f20792f6f202020200d0a202020202020736f627265206c6173206261736573206465206461746f732c20792067656e6572616e2c206578636c75736976616d656e74652c20756e206172636869766f202e646c6c20290d0a5520e2809320496e746572666163657320286166656374616e20656c2046726f6e2c2065732064656369722c206c612070616e74616c6c6120717565206d616e6970756c6120656c207573756172696f2c20792067656e6572616e2c20200d0a2020202020206578636c75736976616d656e74652c20756e206172636869766f202e657865292e0d0a0d0a0d0a456c207369677569656e74652063756164726f206d75657374726120656c20746f74616c206465206c617320636f6d62696e6163696f6e657320706f7369626c657320746f6d616e646f20656e206375656e746120656c204dc3b364756c6f2064652043616a612c206c612043726974696369646164207920656c204e6976656c20646520496d706163746f3a0d0a0d0a216e6f6d656e636c61747572612e706e67210d0a202020202020090909090909200d0a436f6e73696465726163696f6e65733a0d0a0d0ac2b709436a20e2809320416272657669616369c3b36e207061726120656c206dc3b364756c6f2063616a612e0d0ac2b7094320e2809320437269746963696461642c2071756520707565646520736572204320286372c3ad7469636129206f204e20286e6f726d616c292e0d0ac2b7094e20e28093204e6976656c20646520496d706163746f2c207175652070756564652073657220522028736920656c20696d706163746f20657320736f627265206c6173207265676c6173206465206e65676f63696f206f206c61732020200d0a2020202020202020202020206261736573206465206461746f7329206f20552028736920616665637461206c617320696e7465726661636573292e', '', '', '2014-07-25 12:57:05.124', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (6, 2, 2, 3, '\x2a2068312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d0d0a3e2a205b5b496e7374616c616369c3b36e2052504d5d5d', '', '', '2014-07-25 13:01:50.231', 4);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (7, 4, 4, 3, '\x68312e20496e7374616c616369c3b36e2052504d0d0a0d0a4164656dc3a17320646520686163657220656c20637572736f2064652052504d20656e20706f7274616c20636f72706f72617469766f2073652064656265206861636572206c6120696e7374616c616369c3b36e206465206c612068657272616d69656e7461206465206163756572646f20616c20646f63756d656e746f20616e65786f2e', '', '', '2014-07-25 13:05:12.996', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (8, 2, 2, 3, '\x2a2068312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d0d0a3e2a205b5b496e7374616c616369c3b36e2052504d5d5d0d0a3e2a205b5b457374727563747572612064652070726f796563746f735d5d', '', '', '2014-07-25 13:23:58.242', 5);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (9, 5, 5, 3, '\x68312e20457374727563747572612064652070726f796563746f730d0a0d0a68322e2050726f796563746f204a61766120636f6e20477261646c650d0a0d0a3e2a207372630d0a3e2a2a206d61696e0d0a3e2a2a2a206a6176610d0a3e2a2a2a2a202a5b6675656e74655f6a6176615d2a0d0a3e2a2a2a207265736f75726365730d0a3e2a2a2a2a202a5b7265637572736f735d2a0d0a3e2a2a20746573740d0a3e2a2a2a206a6176610d0a3e2a2a2a2a202a5b6675656e74655f6a6176615d2a0d0a3e2a2a2a207265736f75726365730d0a3e2a2a2a2a202a5b7265637572736f735f707275656261735d2a0d0a3e2a202a6275696c642e677261646c652a0d0a3e2a202a677261646c652e70726f706572746965732a0d0a3e2a202a73657474696e67732e677261646c652a0d0a0d0a68322e2050726f796563746f202e4e45540d0a0d0a3e2a205b70726f796563746f5f615d0d0a3e2a2a2062696e0d0a3e2a2a2050726f706572746965730d0a3e2a2a20737263202a286f7267616e697a616369c3b36e206465206675656e746573292a0d0a3e2a2a205b6172636869766f5f70726f796563746f5f615d0d0a3e2a205b6172636869766f5f736f6c756369c3b36e5d0d0a3e2a205b6f7063696f6e65735f736f6c756369c3b36e5d0d0a3e2a202a736f6e61722d70726f6a6563742e70726f706572746965732a0d0a0d0a68322e2050726f796563746f2064652050656e7461686f0d0a0d0a3e4c6f73206e6f6d62726573206465206c6f73206675656e746573206465206261736573206465206461746f7320736520646566696e656e20636f6e202a5b70726566696a6f5f70726f796563746f5d2a202b202a5b70726566696a6f5f617061727461646f5d2a2028656a2e205f636a6372626a2d66696c61732d6f7065726163696f6e2e6b6a625f292e204361646120756e6f206465206c6f732070726f796563746f732064652050656e7461686f206465626520636f6e74656e6572206c61207369677569656e746520657374727563747572613a0d0a3e0d0a3e2a207372630d0a3e2a2a206a6f6273202a5b4a5d2a0d0a3e2a2a207472616e73666f726d6174696f6e73202a5b545d2a0d0a3e2a2a207265736f75726365730d0a3e2a2a2a202a5b7265637572736f735d2a0d0a3e2a2a20726573756c74730d0a3e2a2a2a202a5b726573756c7461646f735d2a0d0a3e0d0a3e7c5f2e417061727461646f7c5f2e50726566696a6f7c5f2e446573637269706369c3b36e7c0d0a3e7c6a6f62737c436a435f4a7c5461726561737c0d0a3e7c7472616e73666f726d6174696f6e737c436a435f547c5472616e73666f726d6163696f6e65737c0d0a0d0a68322e2050726f796563746f2064652062617365206465206461746f730d0a0d0a3e4c6f73206e6f6d62726573206465206c6f73206675656e746573206465206261736573206465206461746f7320736520646566696e656e20636f6e202a5b70726566696a6f5f70726f796563746f5d2a202b202a5b70726566696a6f5f617061727461646f5d2a202b202a5b70726566696a6f5f737562617061727461646f5d2a2028656a2e205f436a4350444946537563757273616c65732e73716c5f292e204361646120756e6f206465206c6f732070726f796563746f732064652062617365206465206461746f73206465626520636f6e74656e6572206c61207369677569656e746520657374727563747572613a0d0a3e0d0a3e2a207372630d0a3e2a2a2064617461202a5b445d2a200d0a3e2a2a2a2075706461746573202a5b555d2a0d0a3e2a2a2a20696e7365727473202a5b4e5d2a0d0a3e2a2a2a2064656c65746573202a5b455d2a0d0a3e2a2a20696d706c656d656e7473202a5b495d2a0d0a3e2a2a2a2066756e6374696f6e73202a5b465d2a0d0a3e2a2a2a2070726f63656475726573202a5b505d2a0d0a3e2a2a2a207472696767657273202a5b475d2a0d0a3e2a2a2a207472616e73616374696f6e73202a5b545d2a0d0a3e2a2a20736368656d6573202a5b535d2a200d0a3e2a2a2073746174656d656e7473202a5b515d2a0d0a3e2a2a2072657665727473202a5b525d2a200d0a3e0d0a3e7c5f2e417061727461646f7c5f2e5375622d617061727461646f737c5f2e50726566696a6f7c5f2e446573637269706369c3b36e7c0d0a3e7c2f332e646174617c757064617465737c436a435f44557c2f332e41646d696e69737472616369c3b36e206465206461746f737c0d0a3e7c696e73657274737c436a435f444e7c0d0a3e7c64656c657465737c436a435f44457c0d0a3e7c2f342e696d706c656d656e74737c66756e6374696f6e737c436a435f49467c2f342e496d706c656d656e74616369c3b36e206465206cc3b3676963617c0d0a3e7c70726f636564757265737c436a435f49507c0d0a3e7c74726967676572737c436a435f49477c0d0a3e7c7472616e73616374696f6e737c436a435f49547c0d0a3e7c736368656d65737c7c436a435f537c457374727563747572612064652062617365206465206461746f737c0d0a3e7c73746174656d656e74737c7c436a435f517c496d706c656d656e74616369c3b36e20646520636f6e73756c7461737c0d0a3e7c726576657274737c7c436a435f527c496d706c656d656e74616369c3b36e20646520666c756a6f732064652072656772657369c3b36e7c', '', '', '2014-07-25 13:24:10.208', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (10, 5, 5, 3, '\x68312e20457374727563747572612064652070726f796563746f730d0a0d0a68322e2050726f796563746f204a61766120636f6e20477261646c650d0a0d0a3e2a207372630d0a3e2a2a206d61696e0d0a3e2a2a2a206a6176610d0a3e2a2a2a2a202a5b6675656e74655f6a6176615d2a0d0a3e2a2a2a207265736f75726365730d0a3e2a2a2a2a202a5b7265637572736f735d2a0d0a3e2a2a20746573740d0a3e2a2a2a206a6176610d0a3e2a2a2a2a202a5b6675656e74655f6a6176615d2a0d0a3e2a2a2a207265736f75726365730d0a3e2a2a2a2a202a5b7265637572736f735f707275656261735d2a0d0a3e2a202a6275696c642e677261646c652a0d0a3e2a202a677261646c652e70726f706572746965732a0d0a3e2a202a73657474696e67732e677261646c652a', '', '', '2014-07-25 13:26:37.318', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (11, 2, 2, 3, '\x2a2068312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d0d0a3e2a205b5b496e7374616c616369c3b36e2052504d5d5d0d0a3e2a205b5b457374727563747572612064652070726f796563746f735d5d0d0a3e2a205b5b446f63756d656e746f732074c3a9636e69636f735d5d', '', '', '2014-07-25 17:44:28.411', 6);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (12, 6, 6, 3, '\x68312e20446f63756d656e746f732074c3a9636e69636f730d0a0d0a3e2a205b5b4d616e656a6f206465205479706573204f7261636c6520656e204a6176615d5d', '', '', '2014-07-25 17:44:49.117', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (13, 7, 7, 3, '\x7075626c696320526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e20636f6e73756c7461486973746f7269636f4172746963756c6f285065746963696f6e436f6e73756c7461486973746f7269636f4172746963756c6f4265616e205f7065746963696f6e290d0a097b0d0a09094f7261636c65436f6e6e656374696f6e206f436f6e6e203d206e756c6c3b0d0a09094f7261636c6543616c6c61626c6553746174656d656e74206f6373203d206e756c6c3b0d0a0909526573756c74536574206172724461746f73486973746f7269636f203d206e756c6c3b0d0a0909526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e20726573706f6e7365203d206e756c6c3b0d0a09090d0a09097472797b0d0a09090973716c203d20436f6e66696753494f4e2e6f6274656e6572506172616d6574726f2822535022293b0d0a09097d63617463682028457863657074696f6e206578297b0d0a09090973716c203d2022223b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224e6f20736520656e636f6e74726f20656c20706172616d6574726f3a20535022293b0909090d0a09097d0d0a09090d0a09097472797b0d0a090909636f6e6e203d206f6274656e6572436f6e6578696f6e28293b0d0a0909090d0a090909696620287772617070656429207b0d0a09090909696628636f6e6e2e697357726170706572466f72284f7261636c65436f6e6e656374696f6e2e636c61737329290d0a09090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e2e756e77726170284f7261636c65436f6e6e656374696f6e2e636c617373293b0d0a09090909656c73650d0a09090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e3b0d0a0909097d656c73657b0d0a090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e3b0d0a0909097d0d0a0909090d0a0909096f6373203d20284f7261636c6543616c6c61626c6553746174656d656e7429206f436f6e6e2e7072657061726543616c6c2873716c293b0d0a0909090d0a0909096f63732e7365744c6f6e6728312c205f7065746963696f6e2e6765745061697349642829293b0d0a0909096f63732e7365744c6f6e6728322c205f7065746963696f6e2e6765744172746963756c6f49642829293b0d0a0909096f63732e736574537472696e6728332c205f7065746963696f6e2e6765744665636861496e696369616c2829293b0d0a0909096f63732e736574537472696e6728342c205f7065746963696f6e2e676574466563686146696e616c2829293b0d0a0909090d0a0909096f63732e72656769737465724f7574506172616d6574657228352c204f7261636c6554797065732e41525241592c20436f6e66696753494f4e2e6f6274656e6572506172616d6574726f28224152524159484953544f5249434f4152544943554c4f22292e7472696d2829293b0d0a0909096f63732e72656769737465724f7574506172616d6574657228362c204f7261636c6554797065732e4e554d424552293b0d0a0909096f63732e72656769737465724f7574506172616d6574657228372c204f7261636c6554797065732e56415243484152293b0d0a0909090d0a0909096f63732e6578656375746528293b0d0a0909090d0a090909726573706f6e7365203d206e657720526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e28293b0d0a090909726573706f6e73652e7365744572726f72436f6465286f63732e676574496e74283629293b0d0a090909726573706f6e73652e7365744572726f7244657363286f63732e676574537472696e67283729293b0d0a0909090d0a090909696628726573706f6e73652e6765744572726f72436f64652829203d3d2030297b0d0a090909096172724461746f73486973746f7269636f203d2028284152524159296f63732e6765744152524159283529292e676574526573756c7453657428293b0d0a09090d0a090909096966286172724461746f73486973746f7269636f20213d206e756c6c297b0d0a0909090909726573706f6e73652e736574486973746f7269636f732861726d6141727265676c6f486973746f7269636f4172746963756c6f286172724461746f73486973746f7269636f292e746f4172726179286e657720486973746f7269636f4172746963756c6f4265616e5b305d29293b0d0a090909097d656c73650d0a0909090909726573706f6e73652e736574486973746f7269636f73286e756c6c293b0d0a0909097d656c73657b0d0a09090909726573706f6e73652e736574486973746f7269636f73286e756c6c293b0d0a090920202020202020204c6f67656f2e6c6f6728224c6120726573707565737461204e4f206861207369646f20657869746f73613a20222b20726573706f6e73652e746f537472696e672829293b0d0a0909097d0d0a0909090d0a09097d63617463682853514c457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220656e20424420616c20636f6e73756c74617220686973746f7269636f206465206172746963756c6f3a2022202b2073716c202b20222022202b2065782e6765744d6573736167652829293b0d0a09097d636174636828457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220616c20636f6e73756c74617220686973746f7269636f206172746963756c6f3a2022202b2065782e6765744d6573736167652829293b0d0a09097d66696e616c6c797b0d0a09090963657272617243616c6c61626c6553746174656d656e74286f6373293b0d0a090909636572726172526573756c74536574286172724461746f73486973746f7269636f293b0d0a090909636572726172436f6e6578696f6e286f436f6e6e293b0d0a090909636572726172436f6e6578696f6e28636f6e6e293b0d0a0909090d0a09090973716c203d2022223b0d0a09097d0d0a09090d0a090972657475726e20726573706f6e73653b0d0a097d0d0a090d0a0970726976617465204c6973743c486973746f7269636f4172746963756c6f4265616e3e2061726d6141727265676c6f486973746f7269636f4172746963756c6f28526573756c74536574206172724461746f73486973746f7269636f29207468726f77732053514c457863657074696f6e7b0d0a09094c6973743c486973746f7269636f4172746963756c6f4265616e3e206172746963756c6f734c697374203d206e756c6c3b200d0a09097472797b0d0a0909096172746963756c6f734c697374203d206e65772041727261794c6973743c486973746f7269636f4172746963756c6f4265616e3e28293b0d0a090909486973746f7269636f4172746963756c6f4265616e206172743b0d0a0909090d0a0909097768696c65286172724461746f73486973746f7269636f2e6e6578742829297b0d0a090d0a09090909535452554354207374203d202853545255435429206172724461746f73486973746f7269636f2e6765744f626a6563742832293b0d0a090909094f626a6563745b5d206441727473203d2073742e6765744174747269627574657328293b0d0a090909090d0a09090909617274203d206e657720486973746f7269636f4172746963756c6f4265616e28293b0d0a090909090d0a090909096172742e736574536f6c6963697475644964282828426967446563696d616c2964417274735b305d292e6c6f6e6756616c75652829293b0d0a090909096172742e7365744172746963756c6f4964282828426967446563696d616c2964417274735b315d292e6c6f6e6756616c75652829293b0d0a090909096172742e73657446656368614d6f76746f28537472696e672e76616c75654f662864417274735b325d29293b0d0a090909096172742e7365745573756172696f536f6c69636974614964282828426967446563696d616c2964417274735b335d292e6c6f6e6756616c75652829293b0d0a090909096172742e7365744e6f6d6272655573756172696f536f6c696369746128537472696e672e76616c75654f662864417274735b345d29293b0d0a090909096172742e7365745573756172696f526573706f6e7361626c654964282828426967446563696d616c2964417274735b355d292e6c6f6e6756616c75652829293b0d0a090909202020206172742e7365744e6f6d6272655573756172696f526573706f6e7361626c6528537472696e672e76616c75654f662864417274735b365d29293b0d0a090909096172742e73657446656368614175746f72697a6163696f6e28537472696e672e76616c75654f662864417274735b375d29293b0d0a090909096172742e73657445737461747573536f6c69636974756428537472696e672e76616c75654f662864417274735b385d29293b090909090d0a090909090d0a090909096172746963756c6f734c6973742e61646428617274293b0d0a0909097d0d0a09097d63617463682853514c457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220616c2061726d6172204152524159206465206172746963756c6f3a2022202b2065782e6765744d657373616765282920293b0d0a0909097468726f77206e65772053514c457863657074696f6e2865782e6765744d6573736167652829293b0d0a09097d0d0a090972657475726e206172746963756c6f734c6973743b0d0a097d', '', '', '2014-07-25 17:44:59.439', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (14, 7, 7, 3, '\x7075626c696320526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e20636f6e73756c7461486973746f7269636f4172746963756c6f285065746963696f6e436f6e73756c7461486973746f7269636f4172746963756c6f4265616e205f7065746963696f6e29207b0d0a09094f7261636c65436f6e6e656374696f6e206f436f6e6e203d206e756c6c3b0d0a09094f7261636c6543616c6c61626c6553746174656d656e74206f6373203d206e756c6c3b0d0a0909526573756c74536574206172724461746f73486973746f7269636f203d206e756c6c3b0d0a0909526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e20726573706f6e7365203d206e756c6c3b0d0a0909747279207b0d0a09090973716c203d20436f6e66696753494f4e2e6f6274656e6572506172616d6574726f2822535022293b0d0a09097d63617463682028457863657074696f6e206578297b0d0a09090973716c203d2022223b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224e6f20736520656e636f6e74726f20656c20706172616d6574726f3a20535022293b0909090d0a09097d0d0a09097472797b0d0a090909636f6e6e203d206f6274656e6572436f6e6578696f6e28293b0d0a090909696620287772617070656429207b0d0a09090909696628636f6e6e2e697357726170706572466f72284f7261636c65436f6e6e656374696f6e2e636c61737329290d0a09090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e2e756e77726170284f7261636c65436f6e6e656374696f6e2e636c617373293b0d0a09090909656c73650d0a09090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e3b0d0a0909097d656c73657b0d0a090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e3b0d0a0909097d0d0a0909090d0a0909096f6373203d20284f7261636c6543616c6c61626c6553746174656d656e7429206f436f6e6e2e7072657061726543616c6c2873716c293b0d0a0909090d0a0909096f63732e7365744c6f6e6728312c205f7065746963696f6e2e6765745061697349642829293b0d0a0909096f63732e7365744c6f6e6728322c205f7065746963696f6e2e6765744172746963756c6f49642829293b0d0a0909096f63732e736574537472696e6728332c205f7065746963696f6e2e6765744665636861496e696369616c2829293b0d0a0909096f63732e736574537472696e6728342c205f7065746963696f6e2e676574466563686146696e616c2829293b0d0a0909090d0a0909096f63732e72656769737465724f7574506172616d6574657228352c204f7261636c6554797065732e41525241592c20436f6e66696753494f4e2e6f6274656e6572506172616d6574726f28224152524159484953544f5249434f4152544943554c4f22292e7472696d2829293b0d0a0909096f63732e72656769737465724f7574506172616d6574657228362c204f7261636c6554797065732e4e554d424552293b0d0a0909096f63732e72656769737465724f7574506172616d6574657228372c204f7261636c6554797065732e56415243484152293b0d0a0909090d0a0909096f63732e6578656375746528293b0d0a0909090d0a090909726573706f6e7365203d206e657720526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e28293b0d0a090909726573706f6e73652e7365744572726f72436f6465286f63732e676574496e74283629293b0d0a090909726573706f6e73652e7365744572726f7244657363286f63732e676574537472696e67283729293b0d0a0909090d0a090909696628726573706f6e73652e6765744572726f72436f64652829203d3d2030297b0d0a090909096172724461746f73486973746f7269636f203d2028284152524159296f63732e6765744152524159283529292e676574526573756c7453657428293b0d0a09090d0a090909096966286172724461746f73486973746f7269636f20213d206e756c6c297b0d0a0909090909726573706f6e73652e736574486973746f7269636f732861726d6141727265676c6f486973746f7269636f4172746963756c6f286172724461746f73486973746f7269636f292e746f4172726179286e657720486973746f7269636f4172746963756c6f4265616e5b305d29293b0d0a090909097d656c73650d0a0909090909726573706f6e73652e736574486973746f7269636f73286e756c6c293b0d0a0909097d656c73657b0d0a09090909726573706f6e73652e736574486973746f7269636f73286e756c6c293b0d0a090920202020202020204c6f67656f2e6c6f6728224c6120726573707565737461204e4f206861207369646f20657869746f73613a20222b20726573706f6e73652e746f537472696e672829293b0d0a0909097d0d0a0909090d0a09097d63617463682853514c457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220656e20424420616c20636f6e73756c74617220686973746f7269636f206465206172746963756c6f3a2022202b2073716c202b20222022202b2065782e6765744d6573736167652829293b0d0a09097d636174636828457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220616c20636f6e73756c74617220686973746f7269636f206172746963756c6f3a2022202b2065782e6765744d6573736167652829293b0d0a09097d66696e616c6c797b0d0a09090963657272617243616c6c61626c6553746174656d656e74286f6373293b0d0a090909636572726172526573756c74536574286172724461746f73486973746f7269636f293b0d0a090909636572726172436f6e6578696f6e286f436f6e6e293b0d0a090909636572726172436f6e6578696f6e28636f6e6e293b0d0a0909090d0a09090973716c203d2022223b0d0a09097d0d0a09090d0a090972657475726e20726573706f6e73653b0d0a097d0d0a090d0a0970726976617465204c6973743c486973746f7269636f4172746963756c6f4265616e3e2061726d6141727265676c6f486973746f7269636f4172746963756c6f28526573756c74536574206172724461746f73486973746f7269636f29207468726f77732053514c457863657074696f6e7b0d0a09094c6973743c486973746f7269636f4172746963756c6f4265616e3e206172746963756c6f734c697374203d206e756c6c3b200d0a09097472797b0d0a0909096172746963756c6f734c697374203d206e65772041727261794c6973743c486973746f7269636f4172746963756c6f4265616e3e28293b0d0a090909486973746f7269636f4172746963756c6f4265616e206172743b0d0a0909090d0a0909097768696c65286172724461746f73486973746f7269636f2e6e6578742829297b0d0a090d0a09090909535452554354207374203d202853545255435429206172724461746f73486973746f7269636f2e6765744f626a6563742832293b0d0a090909094f626a6563745b5d206441727473203d2073742e6765744174747269627574657328293b0d0a090909090d0a09090909617274203d206e657720486973746f7269636f4172746963756c6f4265616e28293b0d0a090909090d0a090909096172742e736574536f6c6963697475644964282828426967446563696d616c2964417274735b305d292e6c6f6e6756616c75652829293b0d0a090909096172742e7365744172746963756c6f4964282828426967446563696d616c2964417274735b315d292e6c6f6e6756616c75652829293b0d0a090909096172742e73657446656368614d6f76746f28537472696e672e76616c75654f662864417274735b325d29293b0d0a090909096172742e7365745573756172696f536f6c69636974614964282828426967446563696d616c2964417274735b335d292e6c6f6e6756616c75652829293b0d0a090909096172742e7365744e6f6d6272655573756172696f536f6c696369746128537472696e672e76616c75654f662864417274735b345d29293b0d0a090909096172742e7365745573756172696f526573706f6e7361626c654964282828426967446563696d616c2964417274735b355d292e6c6f6e6756616c75652829293b0d0a090909202020206172742e7365744e6f6d6272655573756172696f526573706f6e7361626c6528537472696e672e76616c75654f662864417274735b365d29293b0d0a090909096172742e73657446656368614175746f72697a6163696f6e28537472696e672e76616c75654f662864417274735b375d29293b0d0a090909096172742e73657445737461747573536f6c69636974756428537472696e672e76616c75654f662864417274735b385d29293b090909090d0a090909090d0a090909096172746963756c6f734c6973742e61646428617274293b0d0a0909097d0d0a09097d63617463682853514c457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220616c2061726d6172204152524159206465206172746963756c6f3a2022202b2065782e6765744d657373616765282920293b0d0a0909097468726f77206e65772053514c457863657074696f6e2865782e6765744d6573736167652829293b0d0a09097d0d0a090972657475726e206172746963756c6f734c6973743b0d0a097d', '', '', '2014-07-25 17:46:12.042', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (15, 7, 7, 3, '\x7075626c696320526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e20636f6e73756c7461486973746f7269636f4172746963756c6f285065746963696f6e436f6e73756c7461486973746f7269636f4172746963756c6f4265616e205f7065746963696f6e29207b0d0a09094f7261636c65436f6e6e656374696f6e206f436f6e6e203d206e756c6c3b0d0a09094f7261636c6543616c6c61626c6553746174656d656e74206f6373203d206e756c6c3b0d0a0909526573756c74536574206172724461746f73486973746f7269636f203d206e756c6c3b0d0a0909526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e20726573706f6e7365203d206e756c6c3b0d0a0909747279207b0d0a09090973716c203d20436f6e66696753494f4e2e6f6274656e6572506172616d6574726f2822535022293b0d0a09097d63617463682028457863657074696f6e206578297b0d0a09090973716c203d2022223b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224e6f20736520656e636f6e74726f20656c20706172616d6574726f3a20535022293b0909090d0a09097d0d0a09097472797b0d0a090909636f6e6e203d206f6274656e6572436f6e6578696f6e28293b0d0a090909696620287772617070656429207b0d0a09090909696628636f6e6e2e697357726170706572466f72284f7261636c65436f6e6e656374696f6e2e636c61737329290d0a09090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e2e756e77726170284f7261636c65436f6e6e656374696f6e2e636c617373293b0d0a09090909656c73650d0a09090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e3b0d0a0909097d656c73657b0d0a090909096f436f6e6e203d20284f7261636c65436f6e6e656374696f6e2920636f6e6e3b0d0a0909097d0909090d0a0909096f6373203d20284f7261636c6543616c6c61626c6553746174656d656e7429206f436f6e6e2e7072657061726543616c6c2873716c293b0909090d0a0909096f63732e7365744c6f6e6728312c205f7065746963696f6e2e6765745061697349642829293b0d0a0909096f63732e7365744c6f6e6728322c205f7065746963696f6e2e6765744172746963756c6f49642829293b0d0a0909096f63732e736574537472696e6728332c205f7065746963696f6e2e6765744665636861496e696369616c2829293b0d0a0909096f63732e736574537472696e6728342c205f7065746963696f6e2e676574466563686146696e616c2829293b0909090d0a0909096f63732e72656769737465724f7574506172616d6574657228352c204f7261636c6554797065732e41525241592c20436f6e66696753494f4e2e6f6274656e6572506172616d6574726f28224152524159484953544f5249434f4152544943554c4f22292e7472696d2829293b0d0a0909096f63732e72656769737465724f7574506172616d6574657228362c204f7261636c6554797065732e4e554d424552293b0d0a0909096f63732e72656769737465724f7574506172616d6574657228372c204f7261636c6554797065732e56415243484152293b0909090d0a0909096f63732e6578656375746528293b0909090d0a090909726573706f6e7365203d206e657720526573707565737461436f6e73756c7461486973746f7269636f4172746963756c6f4265616e28293b0d0a090909726573706f6e73652e7365744572726f72436f6465286f63732e676574496e74283629293b0d0a090909726573706f6e73652e7365744572726f7244657363286f63732e676574537472696e67283729293b0909090d0a090909696628726573706f6e73652e6765744572726f72436f64652829203d3d2030297b0d0a090909096172724461746f73486973746f7269636f203d2028284152524159296f63732e6765744152524159283529292e676574526573756c7453657428293b09090d0a090909096966286172724461746f73486973746f7269636f20213d206e756c6c297b0d0a0909090909726573706f6e73652e736574486973746f7269636f732861726d6141727265676c6f486973746f7269636f4172746963756c6f286172724461746f73486973746f7269636f292e746f4172726179286e657720486973746f7269636f4172746963756c6f4265616e5b305d29293b0d0a090909097d656c73650d0a0909090909726573706f6e73652e736574486973746f7269636f73286e756c6c293b0d0a0909097d656c73657b0d0a09090909726573706f6e73652e736574486973746f7269636f73286e756c6c293b0d0a090920202020202020204c6f67656f2e6c6f6728224c6120726573707565737461204e4f206861207369646f20657869746f73613a20222b20726573706f6e73652e746f537472696e672829293b0d0a0909097d0909090d0a09097d63617463682853514c457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220656e20424420616c20636f6e73756c74617220686973746f7269636f206465206172746963756c6f3a2022202b2073716c202b20222022202b2065782e6765744d6573736167652829293b0d0a09097d636174636828457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220616c20636f6e73756c74617220686973746f7269636f206172746963756c6f3a2022202b2065782e6765744d6573736167652829293b0d0a09097d66696e616c6c797b0d0a09090963657272617243616c6c61626c6553746174656d656e74286f6373293b0d0a090909636572726172526573756c74536574286172724461746f73486973746f7269636f293b0d0a090909636572726172436f6e6578696f6e286f436f6e6e293b0d0a090909636572726172436f6e6578696f6e28636f6e6e293b0909090d0a09090973716c203d2022223b0d0a09097d09090d0a090972657475726e20726573706f6e73653b0d0a097d090d0a0970726976617465204c6973743c486973746f7269636f4172746963756c6f4265616e3e2061726d6141727265676c6f486973746f7269636f4172746963756c6f28526573756c74536574206172724461746f73486973746f7269636f29207468726f77732053514c457863657074696f6e7b0d0a09094c6973743c486973746f7269636f4172746963756c6f4265616e3e206172746963756c6f734c697374203d206e756c6c3b200d0a09097472797b0d0a0909096172746963756c6f734c697374203d206e65772041727261794c6973743c486973746f7269636f4172746963756c6f4265616e3e28293b0d0a090909486973746f7269636f4172746963756c6f4265616e206172743b0909090d0a0909097768696c65286172724461746f73486973746f7269636f2e6e6578742829297b090d0a09090909535452554354207374203d202853545255435429206172724461746f73486973746f7269636f2e6765744f626a6563742832293b0d0a090909094f626a6563745b5d206441727473203d2073742e6765744174747269627574657328293b090909090d0a09090909617274203d206e657720486973746f7269636f4172746963756c6f4265616e28293b090909090d0a090909096172742e736574536f6c6963697475644964282828426967446563696d616c2964417274735b305d292e6c6f6e6756616c75652829293b0d0a090909096172742e7365744172746963756c6f4964282828426967446563696d616c2964417274735b315d292e6c6f6e6756616c75652829293b0d0a090909096172742e73657446656368614d6f76746f28537472696e672e76616c75654f662864417274735b325d29293b0d0a090909096172742e7365745573756172696f536f6c69636974614964282828426967446563696d616c2964417274735b335d292e6c6f6e6756616c75652829293b0d0a090909096172742e7365744e6f6d6272655573756172696f536f6c696369746128537472696e672e76616c75654f662864417274735b345d29293b0d0a090909096172742e7365745573756172696f526573706f6e7361626c654964282828426967446563696d616c2964417274735b355d292e6c6f6e6756616c75652829293b0d0a090909202020206172742e7365744e6f6d6272655573756172696f526573706f6e7361626c6528537472696e672e76616c75654f662864417274735b365d29293b0d0a090909096172742e73657446656368614175746f72697a6163696f6e28537472696e672e76616c75654f662864417274735b375d29293b0d0a090909096172742e73657445737461747573536f6c69636974756428537472696e672e76616c75654f662864417274735b385d29293b0d0a090909096172746963756c6f734c6973742e61646428617274293b0d0a0909097d0d0a09097d63617463682853514c457863657074696f6e206578297b0d0a0909094c6f67656f2e6c6f67656172457863657063696f6e2865782c20224f63757272696f20756e206572726f7220616c2061726d6172204152524159206465206172746963756c6f3a2022202b2065782e6765744d657373616765282920293b0d0a0909097468726f77206e65772053514c457863657074696f6e2865782e6765744d6573736167652829293b0d0a09097d0d0a090972657475726e206172746963756c6f734c6973743b0d0a097d', '', '', '2014-07-25 17:47:02.18', 3);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (16, 6, 6, 3, '\x68312e20446f63756d656e746f732074c3a9636e69636f730d0a0d0a3e2a205b5b4d616e656a6f206465205479706573204f7261636c6520656e204a6176615d5d0d0a3e2a205b5b456a656d706c6f20636c6173652044414f5d5d', '', '', '2014-07-28 12:02:34.793', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (17, 8, 8, 3, '\x68312e20456a656d706c6f20636c6173652044414f0d0a0d0a2f2a0d0a202a20546f206368616e67652074686973206c6963656e7365206865616465722c2063686f6f7365204c6963656e7365204865616465727320696e2050726f6a6563742050726f706572746965732e0d0a202a20546f206368616e676520746869732074656d706c6174652066696c652c2063686f6f736520546f6f6c73207c2054656d706c617465730d0a202a20616e64206f70656e207468652074656d706c61746520696e2074686520656469746f722e0d0a202a2f0d0a7061636b61676520636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e7472616e7369746f2e64616f3b0d0a0d0a696d706f727420636f6d2e62617a2e7363632e636f6d6d6f6e732e7574696c2e436a435244616f5574696c733b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e7472616e7369746f2e6d6f64656c2e436a435244696e65726f5472616e7369746f446574616c6c654265616e3b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e7472616e7369746f2e6d6f64656c2e436a435246696c74726f4265616e3b0d0a696d706f7274206a6176612e73716c2e43616c6c61626c6553746174656d656e743b0d0a696d706f7274206a6176612e73716c2e526573756c745365743b0d0a696d706f7274206a6176612e73716c2e53514c457863657074696f6e3b0d0a696d706f7274206a6176612e7574696c2e41727261794c6973743b0d0a696d706f7274206a6176612e7574696c2e4c6973743b0d0a696d706f7274206f7261636c652e6a6462632e4f7261636c6554797065733b0d0a696d706f7274206f72672e6170616368652e6c6f67346a2e4c6f676765723b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6265616e732e666163746f72792e616e6e6f746174696f6e2e4175746f77697265643b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6265616e732e666163746f72792e616e6e6f746174696f6e2e5175616c69666965723b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6a6462632e636f72652e43616c6c61626c6553746174656d656e7443616c6c6261636b3b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6a6462632e636f72652e4a64626354656d706c6174653b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e73746572656f747970652e436f6d706f6e656e743b0d0a0d0a2f2a2a0d0a202a0d0a202a2040617574686f7220423635373236340d0a202a2f0d0a40436f6d706f6e656e740d0a7075626c696320636c61737320436a435244696e65726f5472616e7369746f44616f207b0d0a2020202070726976617465207374617469632066696e616c20204c6f67676572204c4f47474552203d204c6f676765722e6765744c6f6767657228436a435244696e65726f5472616e7369746f44616f2e636c617373293b0d0a0d0a20202020404175746f77697265640d0a20202020405175616c6966696572282275737263616a61536164654a64626354656d706c61746522290d0a2020202070726976617465204a64626354656d706c6174652075737263616a61536164654a64626354656d706c6174653b0d0a0d0a202020202f2a2a0d0a20202020202a204f627469656e65206c617320646f746163696f6e657320636f6e20737461747573207472616e7369746f0d0a20202020202a2040706172616d2066696c74726f0d0a20202020202a204072657475726e204c6973746120646520646f746163696f6e657320636f6e20737461747573207472616e7369746f0d0a20202020202a20407468726f7773206a6176612e6c616e672e457863657074696f6e0d0a20202020202a2f0d0a202020207075626c6963204c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e20676574496e666f44696e65726f5472616e7369746f446f746163696f6e2866696e616c20436a435246696c74726f4265616e2066696c74726f29207468726f777320457863657074696f6e207b0d0a2020202020202020537472696e67207175657279203d20227b3f203d2063616c6c2043414a412e50415f444f544143494f4e4553332e464e5452414e5349544f444f5420283f2c203f2c203f2c203f2c203f2c203f2c203f2c203f2c203f29223b0d0a202020202020202072657475726e2075737263616a61536164654a64626354656d706c6174652e657865637574652871756572792c206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e3e2829207b0d0a0d0a202020202020202020202020404f766572726964650d0a2020202020202020202020207075626c6963204c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e20646f496e43616c6c61626c6553746174656d656e742843616c6c61626c6553746174656d656e7420637329207468726f77732053514c457863657074696f6e207b0d0a202020202020202020202020202020204c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e206c69737461446574616c6c653b0d0a20202020202020202020202020202020436a435244696e65726f5472616e7369746f446574616c6c654265616e20646574616c6c653b0d0a20202020202020202020202020202020526573756c745365742072733b0d0a20202020202020202020202020202020747279207b0d0a20202020202020202020202020202020202020206c69737461446574616c6c65203d206e65772041727261794c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e28293b0d0a202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228312c204f7261636c6554797065732e435552534f52293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20322c2066696c74726f2e676574506169732829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20332c2066696c74726f2e67657447656f6772616669612829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20342c2066696c74726f2e6765744e6976656c2829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20352c2066696c74726f2e67657456616c6f722829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20362c2066696c74726f2e67657443616e616c2829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20372c2066696c74726f2e676574537563757273616c2829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20382c2066696c74726f2e6765744469766973612829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20392c2066696c74726f2e6765744665636861496e692829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c2031302c2066696c74726f2e676574466563686146696e2829293b0d0a202020202020202020202020202020202020202063732e6578656375746528293b0d0a20202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a20202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a202020202020202020202020202020202020202020202020646574616c6c65203d206e657720436a435244696e65726f5472616e7369746f446574616c6c654265616e28293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496447656f2872732e676574496e74282246494447454f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744964506c617a612872732e676574496e742822464956414c4f52312229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574506c617a612872732e676574537472696e6728224643504c415a412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657449644a656661747572612872732e676574496e742822464956414c4f52322229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744a656661747572612872732e676574537472696e67282246434a454641545552412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744964446973747269746f2872732e676574496e742822464956414c4f52332229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574446973747269746f2872732e676574537472696e6728224643444953545249544f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574506169732872732e676574496e742822464e504149532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496443616e616c2872732e676574496e742822464e43414e414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744964537563757273616c2872732e676574496e742822464e535543555253414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574537563757273616c2872732e676574537472696e67282244455343535543555253414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657449644469766973612872732e676574496e742822464e49444449564953412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744469766973612872732e676574537472696e672822444553434449564953412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574536572766963696f2872732e676574537472696e6728224643534552564943494f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365745374617475732872732e676574496e742822464e4944455354415455532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574446573635374617475732872732e676574537472696e67282244455343455354415455532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657446656368614d6f64696669636163696f6e2872732e67657454696d657374616d702822464446454348415f4d4f442229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744d6f6e746f2872732e676574426967446563696d616c2822464e4d4f4e544f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574486f72617353696e496e6772657361722872732e676574496e742822464e54494d455452414e532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744e756d536f6c6963697475642872732e676574537472696e672822464344455343342229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496450726f766565646f722872732e676574496e742822464e494450524f562229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657450726f766565646f722872732e676574537472696e67282246434445534350524f562229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496443616a6147656e6572616c2872732e676574496e742822464343414a414752414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657443616a6147656e6572616c2872732e676574537472696e67282246434445534343414a414752414c2229293b0d0a2020202020202020202020202020202020202020202020206c69737461446574616c6c652e61646428646574616c6c65293b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d206361746368202853514c457863657074696f6e206529207b0d0a20202020202020202020202020202020202020204c4f474745522e6572726f7228226572726f72206f6274656e69656e646f207472616e7369746f20646f746163696f6e65733a20222c2065293b0d0a20202020202020202020202020202020202020206c69737461446574616c6c65203d206e65772041727261794c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e28293b0d0a202020202020202020202020202020207d0d0a2020202020202020202020202020202072657475726e206c69737461446574616c6c653b0d0a2020202020202020202020207d0d0a20202020202020207d293b0d0a202020207d0d0a0d0a202020202f2a2a0d0a20202020202a204f627469656e65206c6173207265636f6c656363696f6e657320636f6e20737461747573207472616e7369746f0d0a20202020202a2040706172616d2066696c74726f0d0a20202020202a204072657475726e204c69737461206465207265636f6c656363696f6e657320636f6e20737461747573207472616e7369746f0d0a20202020202a20407468726f7773206a6176612e6c616e672e457863657074696f6e0d0a20202020202a2f0d0a202020207075626c6963204c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e20676574496e666f44696e65726f5472616e7369746f5265636f6c656363696f6e2866696e616c20436a435246696c74726f4265616e2066696c74726f29207468726f777320457863657074696f6e207b0d0a2020202020202020537472696e67207175657279203d20227b3f203d2063616c6c2043414a412e50415f5245434f4c454343494f4e4553322e464e5452414e5349544f52454320283f2c203f2c203f2c203f2c203f2c203f2c203f2c203f2c203f29223b0d0a202020202020202072657475726e2075737263616a61536164654a64626354656d706c6174652e657865637574652871756572792c206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e3e2829207b0d0a202020202020202020202020404f766572726964650d0a2020202020202020202020207075626c6963204c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e20646f496e43616c6c61626c6553746174656d656e742843616c6c61626c6553746174656d656e7420637329207468726f77732053514c457863657074696f6e207b0d0a202020202020202020202020202020204c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e206c69737461446574616c6c653b0d0a20202020202020202020202020202020436a435244696e65726f5472616e7369746f446574616c6c654265616e20646574616c6c653b0d0a20202020202020202020202020202020526573756c745365742072733b0d0a20202020202020202020202020202020747279207b0d0a20202020202020202020202020202020202020206c69737461446574616c6c65203d206e65772041727261794c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e28293b0d0a202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228312c204f7261636c6554797065732e435552534f52293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20322c2066696c74726f2e676574506169732829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20332c2066696c74726f2e67657447656f6772616669612829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20342c2066696c74726f2e6765744e6976656c2829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20352c2066696c74726f2e67657456616c6f722829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20362c2066696c74726f2e67657443616e616c2829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20372c2066696c74726f2e676574537563757273616c2829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20382c2066696c74726f2e6765744469766973612829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20392c2066696c74726f2e6765744665636861496e692829293b0d0a2020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c2031302c2066696c74726f2e676574466563686146696e2829293b0d0a202020202020202020202020202020202020202063732e6578656375746528293b0d0a20202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a20202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a202020202020202020202020202020202020202020202020646574616c6c65203d206e657720436a435244696e65726f5472616e7369746f446574616c6c654265616e28293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496447656f2872732e676574496e74282246494447454f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744964506c617a612872732e676574496e742822464956414c4f52312229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574506c617a612872732e676574537472696e6728224643504c415a412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657449644a656661747572612872732e676574496e742822464956414c4f52322229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744a656661747572612872732e676574537472696e67282246434a454641545552412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744964446973747269746f2872732e676574496e742822464956414c4f52332229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574446973747269746f2872732e676574537472696e6728224643444953545249544f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574506169732872732e676574496e742822464e504149532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496443616e616c2872732e676574496e742822464e43414e414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744964537563757273616c2872732e676574496e742822464e535543555253414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574537563757273616c2872732e676574537472696e67282244455343535543555253414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657449644469766973612872732e676574496e742822464e49444449564953412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744469766973612872732e676574537472696e672822444553434449564953412229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574536572766963696f2872732e676574537472696e6728224643534552564943494f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365745374617475732872732e676574496e742822464e4944455354415455532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574446573635374617475732872732e676574537472696e67282244455343455354415455532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657446656368614d6f64696669636163696f6e2872732e67657454696d657374616d702822464446454348415f4d4f442229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744d6f6e746f2872732e676574426967446563696d616c2822464e4d4f4e544f2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574486f72617353696e496e6772657361722872732e676574496e742822464e54494d455452414e532229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e7365744e756d536f6c6963697475642872732e676574537472696e672822464344455343342229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496450726f766565646f722872732e676574496e742822464e494450524f562229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657450726f766565646f722872732e676574537472696e67282246434445534350524f562229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e736574496443616a6147656e6572616c2872732e676574496e742822464343414a414752414c2229293b0d0a202020202020202020202020202020202020202020202020646574616c6c652e73657443616a6147656e6572616c2872732e676574537472696e67282246434445534343414a414752414c2229293b0d0a2020202020202020202020202020202020202020202020206c69737461446574616c6c652e61646428646574616c6c65293b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d206361746368202853514c457863657074696f6e206529207b0d0a20202020202020202020202020202020202020204c4f474745522e6572726f7228226572726f72206f6274656e69656e646f207472616e7369746f207265636f6c656363696f6e65733a20222c2065293b0d0a20202020202020202020202020202020202020206c69737461446574616c6c65203d206e65772041727261794c6973743c436a435244696e65726f5472616e7369746f446574616c6c654265616e3e28293b0d0a202020202020202020202020202020207d0d0a2020202020202020202020202020202072657475726e206c69737461446574616c6c653b0d0a2020202020202020202020207d0d0a20202020202020207d0d0a2020202020202020293b0d0a0d0a202020207d0d0a0d0a7d0d0a', '', '', '2014-07-28 12:02:47.2', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (18, 6, 6, 3, '\x68312e20446f63756d656e746f732074c3a9636e69636f730d0a0d0a3e2a205b5b4d616e656a6f206465205479706573204f7261636c6520656e204a6176615d5d0d0a3e2a205b5b456a656d706c6f20636c6173652044414f5d5d0d0a3e2a205b5b4172636869766f7320477261646c655d5d', '', '', '2014-07-28 17:41:23.522', 3);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (19, 9, 9, 3, '\x68312e204172636869766f7320477261646c65', '', '', '2014-07-28 17:41:39.002', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (20, 9, 9, 3, '\x68312e204172636869766f7320477261646c650d0a0d0a456c206172636869766f202a677261646c652e70726f706572746965732a20656e20646f6e646520736520646566696e6520656c2070726f787920657320656c2071756520736520656e6375656e7472612066c3ad736963616d656e746520656e206c612063617270657461202e677261646c652064656c20686f6d65206465206c61206dc3a17175696e61206c6f63616c2e', '', '', '2014-07-28 17:51:48.608', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (22, 6, 6, 3, '\x68312e20446f63756d656e746f732074c3a9636e69636f730d0a0d0a3e2a205b5b4d616e656a6f206465205479706573204f7261636c6520656e204a6176615d5d0d0a3e2a205b5b456a656d706c6f20636c6173652044414f5d5d0d0a3e2a205b5b4172636869766f7320477261646c655d5d0d0a3e2a205b5b436f6c6c656374696f6e53747275637475726541727261795d5d', '', '', '2014-07-31 18:54:06.404', 4);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (23, 11, 11, 3, '\x68312e20436f6c6c656374696f6e53747275637475726541727261790d0a0d0a2f2a2a0d0a202a2044414f207061726120656c206d616e656a6f206465206c61206675656e7465206465206461746f73206465206c6120626974c3a1636f72612e205065726d697465206f6274656e657220790d0a202a20726567697374726172206f62736572766163696f6e65732e0d0a202a2f0d0a7061636b61676520636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e64616f3b0d0a0d0a696d706f727420636f6d2e62617a2e7363632e636f6d6d6f6e732e737570706f72742e436a435244616f436f6e6669673b0d0a696d706f727420636f6d2e62617a2e7363632e636f6d6d6f6e732e7574696c2e436a435244616f5574696c733b0d0a696d706f727420636f6d2e62617a2e7363632e636f6d6d6f6e732e7574696c2e436a4352506172736544616f5574696c733b0d0a696d706f727420636f6d2e62617a2e7363632e636f6d6d6f6e732e7574696c2e436a435250726f70657274795574696c733b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e6d6f64656c2e436a435242697461636f726142616e646572613b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e6d6f64656c2e436a435242697461636f7261446574616c6c653b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e6d6f64656c2e436a435242697461636f7261477561726461723b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e6d6f64656c2e436a435242697461636f72614d6f64756c6f3b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e6d6f64656c2e436a43525072696f726964616442697461636f72613b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e62697461636f72612e6d6f64656c2e436a565242697461636f72614d6f64756c6f506172616d3b0d0a696d706f727420636f6d2e62617a2e7363632e6d6f6e69746f7263616a612e636f6d6d6f6e2e6d6f64656c2e436a4352436f6e7374616e7465733b0d0a696d706f7274206a6176612e6d6174682e426967446563696d616c3b0d0a696d706f7274206a6176612e73716c2e43616c6c61626c6553746174656d656e743b0d0a696d706f7274206a6176612e73716c2e526573756c745365743b0d0a696d706f7274206a6176612e73716c2e53514c457863657074696f6e3b0d0a696d706f7274206a6176612e746578742e53696d706c6544617465466f726d61743b0d0a696d706f7274206a6176612e7574696c2e41727261794c6973743b0d0a696d706f7274206a6176612e7574696c2e436f6c6c656374696f6e3b0d0a696d706f7274206a6176612e7574696c2e436f6c6c656374696f6e733b0d0a696d706f7274206a6176612e7574696c2e486173684d61703b0d0a696d706f7274206a6176612e7574696c2e4c6973743b0d0a696d706f7274206a6176612e7574696c2e4d61703b0d0a696d706f7274206f7261636c652e6a6462632e4f7261636c6554797065733b0d0a696d706f7274206f72672e6170616368652e6c6f67346a2e4c6f676765723b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6265616e732e666163746f72792e616e6e6f746174696f6e2e4175746f77697265643b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6265616e732e666163746f72792e616e6e6f746174696f6e2e5175616c69666965723b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e64616f2e44617461416363657373457863657074696f6e3b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6a6462632e636f72652e43616c6c61626c6553746174656d656e7443616c6c6261636b3b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e6a6462632e636f72652e4a64626354656d706c6174653b0d0a696d706f7274206f72672e737072696e676672616d65776f726b2e73746572656f747970652e5265706f7369746f72793b0d0a0d0a2f2a2a0d0a202a2040617574686f722046726f696cc3a16e204cc3b370657a20504c4f4c383930310d0a202a2f0d0a405265706f7369746f72790d0a7075626c696320636c61737320436a435242697461636f726144616f207b0d0a0d0a2020202070726976617465207374617469632066696e616c204c6f67676572204c4f47474552203d204c6f676765722e6765744c6f6767657228436a435242697461636f726144616f2e636c617373293b0d0a0d0a2020202070726976617465207374617469632066696e616c20436a435244616f5574696c732e436f6c6c656374696f6e53747275637475726541727261793c436a435242697461636f726142616e646572613e205354525543545552453b0d0a0d0a20202020737461746963207b0d0a2020202020202020535452554354555245203d206e657720436a435244616f5574696c732e436f6c6c656374696f6e53747275637475726541727261793c436a435242697461636f726142616e646572613e2829207b0d0a0d0a202020202020202020202020404f766572726964650d0a2020202020202020202020207075626c6963204f626a656374206765744f626a65637428436a435242697461636f726142616e64657261207429207b0d0a202020202020202020202020202020204f626a6563745b5d206c696e65203d206e6577204f626a6563745b355d3b0d0a0d0a202020202020202020202020202020206c696e655b305d203d20742e67657449644d6f64756c6f28293b0d0a202020202020202020202020202020206c696e655b315d203d20742e67657449645061697328293b0d0a202020202020202020202020202020206c696e655b325d203d20742e676574496443616e616c28293b0d0a202020202020202020202020202020206c696e655b335d203d20742e6765744964537563727573616c28293b0d0a202020202020202020202020202020206c696e655b345d203d20742e67657446656368614f62736572766163696f6e28293b0d0a0d0a2020202020202020202020202020202072657475726e206c696e653b0d0a2020202020202020202020207d0d0a20202020202020207d3b0d0a202020207d0d0a0d0a20202020404175746f77697265640d0a202020207072697661746520436a435244616f436f6e666967207573756172696f43616a613b0d0a0d0a20202020404175746f77697265640d0a20202020405175616c6966696572282275737263616a614a64626354656d706c61746522290d0a2020202070726976617465204a64626354656d706c6174652075737263616a614a64626354656d706c6174653b0d0a0d0a202020202f2a2a0d0a20202020202a205265746f726e61206c6173206f62736572766163696f6e657320646520756e2064c3ad6120656e20746f646f73206c6f73206dc3b364756c6f73207061726120756e610d0a20202020202a20737563757273616c2e0d0a20202020202a0d0a20202020202a2040706172616d206964506169730d0a20202020202a2040706172616d20696453656c6563746564537563757273616c0d0a20202020202a2040706172616d20666563686142697461636f72610d0a20202020202a204072657475726e204c6973743c436a435242697461636f7261446574616c6c653e0d0a20202020202a2f0d0a202020207075626c6963204c6973743c436a435242697461636f7261446574616c6c653e2067657442697461636f7261446574616c6c65584469612866696e616c20696e74206964506169732c0d0a202020202020202066696e616c20696e7420696453656c6563746564537563757273616c2c2066696e616c20537472696e6720666563686142697461636f726129207b0d0a20202020202020204c6973743c436a435242697461636f7261446574616c6c653e206c69737452657475726e3b0d0a0d0a2020202020202020747279207b0d0a202020202020202020202020537472696e67207175657279203d20227b203f203d2063616c6c2025732e5051434a4d43303030332e464e434a4d4330303033283f2c3f2c3f2c3f2c3f297d223b0d0a0d0a20202020202020202020202072657475726e2075737263616a614a64626354656d706c6174652e65786563757465287573756172696f43616a612e67657453656e74656e6365287175657279292c0d0a202020202020202020202020202020206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4c6973743c436a435242697461636f7261446574616c6c653e3e2829207b0d0a0d0a2020202020202020202020202020202020202020404f766572726964650d0a20202020202020202020202020202020202020207075626c6963204c6973743c436a435242697461636f7261446574616c6c653e20646f496e43616c6c61626c6553746174656d656e742843616c6c61626c6553746174656d656e74206373290d0a20202020202020202020202020202020202020207468726f77732053514c457863657074696f6e2c2044617461416363657373457863657074696f6e207b0d0a20202020202020202020202020202020202020202020202053696d706c6544617465466f726d617420736466203d206e65772053696d706c6544617465466f726d6174282264642f4d4d2f797979792048483a6d6d22293b0d0a202020202020202020202020202020202020202020202020526573756c745365742072733b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228312c204f7261636c6554797065732e435552534f52293b0d0a0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20322c20696450616973293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20332c20696453656c6563746564537563757273616c293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20342c20666563686142697461636f7261293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228352c204f7261636c6554797065732e4e554d424552293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228362c204f7261636c6554797065732e56415243484152293b0d0a0d0a20202020202020202020202020202020202020202020202063732e6578656375746528293b0d0a2020202020202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a0d0a2020202020202020202020202020202020202020202020204c6973743c436a435242697461636f7261446574616c6c653e206c69737452657475726e203d206e65772041727261794c6973743c436a435242697461636f7261446574616c6c653e28293b0d0a202020202020202020202020202020202020202020202020436a435242697461636f7261446574616c6c652063757272656e7442697461636f7261446574616c6c653b0d0a0d0a2020202020202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c65203d206e657720436a435242697461636f7261446574616c6c6528293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e7365744964456d706c6561646f2872732e676574496e7428224643454d504e4f2229293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e7365744f62736572766163696f6e2872732e676574537472696e67282246434f42534552564143494f4e45532229293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e73657449644d6f64756c6f2872732e676574496e74282246494d4f44554c4f49442229293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e7365745072696f72696461642872732e676574537472696e6728224643444553435052494f52494441442229293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e736574546974756c6f2872732e676574537472696e672822464344455343544954554c4f2229293b0d0a202020202020202020202020202020202020202020202020202020202f2f2074656d706f72616c2c20656e206c6f2071756520737562656e20656c2063616d62696f20612070726f6475636369c3b36e2e0d0a20202020202020202020202020202020202020202020202020202020747279207b0d0a202020202020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e7365744665636861280d0a2020202020202020202020202020202020202020202020202020202020202020202020207364662e666f726d61742872732e67657454696d657374616d702822464446454348414f4253455256222929202b20222068727322293b0d0a202020202020202020202020202020202020202020202020202020207d2063617463682028457863657074696f6e206529207b0d0a202020202020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e736574466563686128666563686142697461636f7261202b20222030303a30302068727322293b0d0a202020202020202020202020202020202020202020202020202020207d0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e7365744964537563757273616c28696453656c6563746564537563757273616c293b0d0a202020202020202020202020202020202020202020202020202020200d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e7365744d6f64756c6f280d0a2020202020202020202020202020202020202020202020202020202020202020436a4352436f6e7374616e7465732e6765744d6f64756c6f4e6f6d627265280d0a20202020202020202020202020202020202020202020202020202020202020202020202063757272656e7442697461636f7261446574616c6c652e67657449644d6f64756c6f282929293b0d0a0d0a202020202020202020202020202020202020202020202020202020206c69737452657475726e2e6164642863757272656e7442697461636f7261446574616c6c65293b0d0a2020202020202020202020202020202020202020202020207d0d0a20202020202020202020202020202020202020202020202072657475726e206c69737452657475726e3b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d293b0d0a20202020202020207d2063617463682028457863657074696f6e206529207b0d0a2020202020202020202020206c69737452657475726e203d206e65772041727261794c6973743c436a435242697461636f7261446574616c6c653e28293b0d0a2020202020202020202020204c4f474745522e6572726f7228436a435250726f70657274795574696c732e67657450726f706572747928226572726f722e73656e74656e63652e657865637574696f6e22292c2065293b0d0a20202020202020207d0d0a202020202020202072657475726e206c69737452657475726e3b0d0a202020207d0d0a0d0a202020207075626c6963204c6973743c537472696e673e2067657446656368617342697461636f726158537563757273616c2866696e616c20696e74206964506169732c0d0a202020202020202066696e616c20696e74206964537563757273616c2c2066696e616c20537472696e67206665636861496e692c2066696e616c20537472696e6720666563686146696e29207b0d0a20202020202020204c6973743c537472696e673e206c69737452657475726e3b0d0a2020202020202020747279207b0d0a202020202020202020202020537472696e67207175657279203d20227b203f203d2063616c6c2025732e5051434a4d43303030332e464e434a4d4330303032283f2c3f2c3f2c3f2c3f2c3f297d223b0d0a0d0a20202020202020202020202072657475726e2075737263616a614a64626354656d706c6174652e65786563757465287573756172696f43616a612e67657453656e74656e6365287175657279292c0d0a202020202020202020202020202020206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4c6973743c537472696e673e3e2829207b0d0a0d0a2020202020202020202020202020202020202020404f766572726964650d0a20202020202020202020202020202020202020207075626c6963204c6973743c537472696e673e20646f496e43616c6c61626c6553746174656d656e742843616c6c61626c6553746174656d656e74206373290d0a20202020202020202020202020202020202020207468726f77732053514c457863657074696f6e2c2044617461416363657373457863657074696f6e207b0d0a202020202020202020202020202020202020202020202020526573756c745365742072733b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228312c204f7261636c6554797065732e435552534f52293b0d0a0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20322c20696450616973293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20332c206964537563757273616c293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20342c206665636861496e69293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20352c20666563686146696e293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228362c204f7261636c6554797065732e4e554d424552293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228372c204f7261636c6554797065732e56415243484152293b0d0a0d0a20202020202020202020202020202020202020202020202063732e6578656375746528293b0d0a2020202020202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a0d0a2020202020202020202020202020202020202020202020204c6973743c537472696e673e206c69737452657475726e203d206e65772041727261794c6973743c537472696e673e28293b0d0a20202020202020202020202020202020202020202020202053696d706c6544617465466f726d617420736466203d206e65772053696d706c6544617465466f726d6174282264642f4d4d2f7979797922293b0d0a0d0a2020202020202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a202020202020202020202020202020202020202020202020202020206c69737452657475726e2e616464287364662e666f726d61742872732e67657454696d657374616d702822464446454348414f4253455256222929293b0d0a2020202020202020202020202020202020202020202020207d0d0a0d0a20202020202020202020202020202020202020202020202072657475726e206c69737452657475726e3b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d293b0d0a20202020202020207d2063617463682028457863657074696f6e206529207b0d0a2020202020202020202020206c69737452657475726e203d206e65772041727261794c6973743c537472696e673e28293b0d0a2020202020202020202020204c4f474745522e6572726f7228436a435250726f70657274795574696c732e67657450726f706572747928226572726f722e73656e74656e63652e657865637574696f6e22292c2065293b0d0a20202020202020207d0d0a202020202020202072657475726e206c69737452657475726e3b0d0a202020207d0d0a0d0a202020202f2a2a0d0a20202020202a204dc3a9746f646f20717565207265746f726e61206c612062616e64657261206465206f62736572766163696f6e65732e0d0a20202020202a205265636962652069736420646520737563757273616c65732079207265746f726e61207369207469656e6520636f6e656d746172696f73200d0a20202020202a20656e2065737465206dc3b364756c6f2c20656e206f74726f206f207369206e6f207469656e65206f62736572766163696f6e657320656e0d0a20202020202a20756e2064c3ad612e0d0a20202020202a2040706172616d20696473537563757273616c0d0a20202020202a204072657475726e204d61703c496e74656765722c20436a435242697461636f726142616e646572613e0d0a20202020202a2f0d0a202020207075626c6963204d61703c496e74656765722c20436a435242697461636f726142616e646572613e2067657442697461636f726142616e646572612866696e616c204c6973743c436a435242697461636f726142616e646572613e20696473537563757273616c29207b0d0a20202020202020204d61703c496e74656765722c20436a435242697461636f726142616e646572613e206d617052657475726e3b0d0a0d0a2020202020202020747279207b0d0a202020202020202020202020537472696e67207175657279203d20227b203f203d2063616c6c2025732e5051434a4d43303030332e464e434a4d4330303031283f2c3f2c3f297d223b0d0a0d0a20202020202020202020202072657475726e2075737263616a614a64626354656d706c6174652e65786563757465280d0a202020202020202020202020202020207573756172696f43616a612e67657453656e74656e6365287175657279292c206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4d61703c496e74656765722c20436a435242697461636f726142616e646572613e3e2829207b0d0a0d0a2020202020202020202020202020202020202020404f766572726964650d0a20202020202020202020202020202020202020207075626c6963204d61703c496e74656765722c20436a435242697461636f726142616e646572613e20646f496e43616c6c61626c6553746174656d656e74280d0a2020202020202020202020202020202020202020202020202020202043616c6c61626c6553746174656d656e7420637329207468726f77732053514c457863657074696f6e2c2044617461416363657373457863657074696f6e207b0d0a202020202020202020202020202020202020202020202020526573756c745365742072733b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228312c204f7261636c6554797065732e435552534f52293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e61646441727261792863732c20322c200d0a202020202020202020202020202020202020202020202020202020207573756172696f43616a612e67657453656e74656e6365282225732e545950434a4d4330303031544122292c200d0a202020202020202020202020202020202020202020202020202020205354525543545552452e676574417272617928696473537563757273616c29293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228332c204f7261636c6554797065732e4e554d424552293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228342c204f7261636c6554797065732e56415243484152293b0d0a0d0a20202020202020202020202020202020202020202020202063732e6578656375746528293b0d0a2020202020202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a0d0a2020202020202020202020202020202020202020202020204d61703c496e74656765722c20436a435242697461636f726142616e646572613e206d617052657475726e200d0a202020202020202020202020202020202020202020202020202020203d206e657720486173684d61703c496e74656765722c20436a435242697461636f726142616e646572613e28293b0d0a202020202020202020202020202020202020202020202020436a435242697461636f726142616e646572612063757272656e7442697461636f726142616e646572613b0d0a0d0a2020202020202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f726142616e64657261203d206e657720436a435242697461636f726142616e6465726128293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f726142616e646572612e7365744964537563727573616c2872732e676574496e7428224649535543555253414c49442229293b0d0a2020202020202020202020202020202020202020202020202020202063757272656e7442697461636f726142616e646572612e73657442616e646572612872732e676574496e742822464942414e444552412229293b0d0a202020202020202020202020202020202020202020202020202020206d617052657475726e2e707574280d0a202020202020202020202020202020202020202020202020202020202020202063757272656e7442697461636f726142616e646572612e6765744964537563727573616c28292c200d0a202020202020202020202020202020202020202020202020202020202020202063757272656e7442697461636f726142616e64657261293b0d0a2020202020202020202020202020202020202020202020207d0d0a20202020202020202020202020202020202020202020202072657475726e206d617052657475726e3b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d293b0d0a20202020202020207d2063617463682028457863657074696f6e206529207b0d0a2020202020202020202020206d617052657475726e203d206e657720486173684d61703c496e74656765722c20436a435242697461636f726142616e646572613e28293b0d0a2020202020202020202020204c4f474745522e6572726f7228436a435250726f70657274795574696c732e67657450726f706572747928226572726f722e73656e74656e63652e657865637574696f6e22292c2065293b0d0a20202020202020207d0d0a202020202020202072657475726e206d617052657475726e3b0d0a202020207d0d0a0d0a202020202f2a2a0d0a20202020202a20526567697374726120656e206c61206675656e7465206465206461746f732c20756e20726567697374726f20646520626974c3a1636f72612e0d0a20202020202a2040706172616d206964506169730d0a20202020202a2040706172616d206964537563757273616c0d0a20202020202a2040706172616d2069644d6f64756c6f0d0a20202020202a2040706172616d206964456d706c6561646f0d0a20202020202a2040706172616d2066656368610d0a20202020202a2040706172616d20746974756c6f0d0a20202020202a2040706172616d207072696f72696461640d0a20202020202a2040706172616d206f62736572766163696f6e65730d0a20202020202a204072657475726e20436a435242697461636f7261477561726461720d0a20202020202a2f0d0a202020207075626c696320436a435242697461636f72614775617264617220677561726461724f62736572766163696f6e2866696e616c20696e74206964506169732c200d0a20202020202020202020202066696e616c20696e74206964537563757273616c2c2066696e616c20696e742069644d6f64756c6f2c2066696e616c20696e74206964456d706c6561646f2c200d0a20202020202020202020202066696e616c20537472696e672066656368612c2066696e616c20696e74206964546974756c6f2c2066696e616c20537472696e6720746974756c6f2c200d0a20202020202020202020202066696e616c20696e74207072696f72696461642c2066696e616c20537472696e67206f62736572766163696f6e657329207b0d0a2020202020202020436a435242697461636f72614775617264617220726573756c7452657475726e3b0d0a0d0a2020202020202020747279207b0d0a202020202020202020202020537472696e67207175657279203d20227b2063616c6c2025732e5051434a4d43303030332e5041434a4d4330303031283f2c3f2c3f2c3f2c3f2c3f2c3f2c3f2c3f2c3f297d223b0d0a0d0a20202020202020202020202072657475726e2075737263616a614a64626354656d706c6174652e65786563757465287573756172696f43616a612e67657453656e74656e6365287175657279292c200d0a202020202020202020202020202020206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c436a435242697461636f7261477561726461723e2829207b0d0a0d0a2020202020202020202020202020202020202020404f766572726964650d0a20202020202020202020202020202020202020207075626c696320436a435242697461636f72614775617264617220646f496e43616c6c61626c6553746174656d656e742843616c6c61626c6553746174656d656e7420637329200d0a202020202020202020202020202020202020202020202020202020207468726f77732053514c457863657074696f6e2c2044617461416363657373457863657074696f6e207b0d0a202020202020202020202020202020202020202020202020436a435242697461636f72614775617264617220726573756c7442697461636f7261477561726461723b0d0a202020202020202020202020202020202020202020202020426967446563696d616c20636f64655374617475733b0d0a202020202020202020202020202020202020202020202020537472696e67206d6573736167655374617475733b0d0a2020202020202020202020202020202020202020202020200d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20312c20696450616973293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20322c206964537563757273616c293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20332c2069644d6f64756c6f293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20342c206964456d706c6561646f293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20352c206f62736572766163696f6e6573293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20362c207072696f7269646164293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20372c206964546974756c6f293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20382c20746974756c6f293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228392c204f7261636c6554797065732e4e554d424552293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d657465722831302c204f7261636c6554797065732e56415243484152293b0d0a0d0a20202020202020202020202020202020202020202020202063732e6578656375746528293b0d0a0d0a202020202020202020202020202020202020202020202020636f6465537461747573203d2028426967446563696d616c292063732e6765744f626a6563742839293b0d0a2020202020202020202020202020202020202020202020206d657373616765537461747573203d2028537472696e67292063732e6765744f626a656374283130293b0d0a0d0a202020202020202020202020202020202020202020202020726573756c7442697461636f726147756172646172203d206e657720436a435242697461636f72614775617264617228293b0d0a202020202020202020202020202020202020202020202020726573756c7442697461636f7261477561726461722e736574436f646528636f64655374617475732e696e7456616c75652829293b0d0a202020202020202020202020202020202020202020202020726573756c7442697461636f7261477561726461722e7365744d657373616765286d657373616765537461747573293b0d0a0d0a20202020202020202020202020202020202020202020202072657475726e20726573756c7442697461636f7261477561726461723b0d0a20202020202020202020202020202020202020207d0d0a2020202020202020202020207d293b0d0a20202020202020207d2063617463682028457863657074696f6e206529207b0d0a202020202020202020202020726573756c7452657475726e203d206e657720436a435242697461636f72614775617264617228293b0d0a2020202020202020202020204c4f474745522e6572726f7228436a435250726f70657274795574696c732e67657450726f706572747928226572726f722e73656e74656e63652e657865637574696f6e22292c2065293b0d0a20202020202020207d0d0a202020202020202072657475726e20726573756c7452657475726e3b0d0a202020207d0d0a202020200d0a202020202f2a2a0d0a20202020202a205265746f726e61206c6f73206974656d206465207072696f72696461642070617261206c6173206f62736572766163696f6e65732e0d0a20202020202a204072657475726e204c6973743c436a43525072696f726964616442697461636f72613e0d0a20202020202a2f0d0a202020207075626c6963204c6973743c436a43525072696f726964616442697461636f72613e206765745072696f72696461644974656d7328297b0d0a20202020202020204c6973743c436a43525072696f726964616442697461636f72613e206c69737452657475726e203d20206e65772041727261794c6973743c436a43525072696f726964616442697461636f72613e28293b0d0a2020202020202020747279207b0d0a202020202020202020202020537472696e67207175657279203d20227b203f203d2063616c6c2025732e5051434a4d43303030332e464e434a4d433030303428297d223b0d0a0d0a20202020202020202020202072657475726e2075737263616a614a64626354656d706c6174652e65786563757465280d0a202020202020202020202020202020207573756172696f43616a612e67657453656e74656e6365287175657279292c206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4c6973743c436a43525072696f726964616442697461636f72613e3e2829207b0d0a0d0a2020202020202020202020202020202020202020404f766572726964650d0a20202020202020202020202020202020202020207075626c6963204c6973743c436a43525072696f726964616442697461636f72613e20646f496e43616c6c61626c6553746174656d656e74280d0a2020202020202020202020202020202020202020202020202020202043616c6c61626c6553746174656d656e7420637329207468726f77732053514c457863657074696f6e2c2044617461416363657373457863657074696f6e207b0d0a202020202020202020202020202020202020202020202020526573756c745365742072733b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228312c204f7261636c6554797065732e435552534f52293b0d0a2020202020202020202020202020202020202020202020202f2f63732e72656769737465724f7574506172616d6574657228322c204f7261636c6554797065732e4e554d424552293b0d0a2020202020202020202020202020202020202020202020202f2f63732e72656769737465724f7574506172616d6574657228332c204f7261636c6554797065732e56415243484152293b0d0a0d0a20202020202020202020202020202020202020202020202063732e6578656375746528293b0d0a2020202020202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a0d0a202020202020202020202020202020202020202020202020436a43525072696f726964616442697461636f726120637572725072696f72696461643b0d0a2020202020202020202020202020202020202020202020204c6973743c436a43525072696f726964616442697461636f72613e206c69737452657475726e200d0a202020202020202020202020202020202020202020202020202020203d206e65772041727261794c6973743c436a43525072696f726964616442697461636f72613e28293b0d0a2020202020202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a20202020202020202020202020202020202020202020202020202020637572725072696f7269646164203d206e657720436a43525072696f726964616442697461636f7261280d0a20202020202020202020202020202020202020202020202020202020202020202020202072732e676574496e742822464e5052494f5249444144494422292c200d0a20202020202020202020202020202020202020202020202020202020202020202020202072732e676574537472696e6728224643444553435052494f5249444144222920293b0d0a202020202020202020202020202020202020202020202020202020206c69737452657475726e2e61646428637572725072696f7269646164293b0d0a2020202020202020202020202020202020202020202020207d0d0a202020202020202020202020202020202020202020202020436f6c6c656374696f6e732e736f7274286c69737452657475726e293b0d0a20202020202020202020202020202020202020202020202072657475726e206c69737452657475726e3b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d293b0d0a20202020202020207d2063617463682028457863657074696f6e206529207b0d0a2020202020202020202020206c69737452657475726e203d206e65772041727261794c6973743c436a43525072696f726964616442697461636f72613e28293b0d0a2020202020202020202020204c4f474745522e6572726f7228436a435250726f70657274795574696c732e67657450726f706572747928226572726f722e73656e74656e63652e657865637574696f6e22292c2065293b0d0a20202020202020207d0d0a202020202020202072657475726e206c69737452657475726e3b0d0a202020207d0d0a202020200d0a202020200d0a202020200d0a202020207075626c6963204d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e206765744d6f64756c6f42697461636f7261280d0a20202020202020202020202066696e616c20436a565242697461636f72614d6f64756c6f506172616d20706172616d29207b0d0a20202020202020204d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e206d617052657475726e3b0d0a0d0a2020202020202020747279207b0d0a202020202020202020202020537472696e67207175657279203d20227b203f203d2063616c6c2025732e5051434a4d43303030332e464e434a4d4330303035283f2c3f2c3f2c3f2c3f2c3f2c3f2c3f2c3f2c3f297d223b0d0a0d0a20202020202020202020202072657475726e2075737263616a614a64626354656d706c6174652e65786563757465280d0a202020202020202020202020202020207573756172696f43616a612e67657453656e74656e6365287175657279292c206e65772043616c6c61626c6553746174656d656e7443616c6c6261636b3c4d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e3e2829207b0d0a0d0a2020202020202020202020202020202020202020404f766572726964650d0a20202020202020202020202020202020202020207075626c6963204d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e20646f496e43616c6c61626c6553746174656d656e74280d0a2020202020202020202020202020202020202020202020202020202043616c6c61626c6553746174656d656e7420637329207468726f77732053514c457863657074696f6e2c2044617461416363657373457863657074696f6e207b0d0a202020202020202020202020202020202020202020202020526573756c745365742072733b0d0a202020202020202020202020202020202020202020202020696e742069203d20313b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228692b2b2c204f7261636c6554797065732e435552534f52293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20692b2b2c20706172616d2e6765744964537563757273616c2829203c20303f206e756c6c203a20706172616d2e6765744964537563757273616c2829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20692b2b2c20706172616d2e67657449644d6f64756c6f2829203c20303f206e756c6c203a20706172616d2e67657449644d6f64756c6f2829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20692b2b2c20706172616d2e6765744665636861496e6928292e6973456d70747928293f206e756c6c3a20706172616d2e6765744665636861496e692829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464537472696e672863732c20692b2b2c20706172616d2e676574466563686146696e28292e6973456d70747928293f206e756c6c203a20706172616d2e676574466563686146696e2829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20692b2b2c20706172616d2e6765744964506169732829203c20303f206e756c6c203a20706172616d2e6765744964506169732829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20692b2b2c20706172616d2e676574496447656f6772616669612829203c20303f206e756c6c203a20706172616d2e676574496447656f6772616669612829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20692b2b2c20706172616d2e67657449644e6976656c2829203c20303f206e756c6c203a20706172616d2e67657449644e6976656c2829293b0d0a202020202020202020202020202020202020202020202020436a435244616f5574696c732e616464496e742863732c20692b2b2c20706172616d2e67657456616c75652829203c20303f206e756c6c203a20706172616d2e67657456616c75652829293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228692b2b2c204f7261636c6554797065732e4e554d424552293b0d0a20202020202020202020202020202020202020202020202063732e72656769737465724f7574506172616d6574657228692b2b2c204f7261636c6554797065732e56415243484152293b0d0a0d0a20202020202020202020202020202020202020202020202063732e6578656375746528293b0d0a2020202020202020202020202020202020202020202020207273203d2028526573756c74536574292063732e6765744f626a6563742831293b0d0a0d0a2020202020202020202020202020202020202020202020204d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e206d617052657475726e200d0a202020202020202020202020202020202020202020202020202020203d206e657720486173684d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e28293b0d0a202020202020202020202020202020202020202020202020436a435242697461636f72614d6f64756c6f206375727242697461636f72614d6f64756c6f3b0d0a20202020202020202020202020202020202020202020202053696d706c6544617465466f726d6174207364664665636861203d206e65772053696d706c6544617465466f726d6174282264642f4d4d2f797979792048483a6d6d22293b0d0a2020202020202020202020202020202020202020202020200d0a0d0a2020202020202020202020202020202020202020202020207768696c65202872732e6e657874282929207b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f203d206e657720436a435242697461636f72614d6f64756c6f28293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e736574496442697461636f72612872732e676574496e742822464942495441434f524149442229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e7365744964506169732872732e676574496e74282246495041495349442229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e7365744964537563757273616c2872732e676574496e7428224649535543555253414c49442229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e73657449644d6f64756c6f2872732e676574496e74282246494d4f44554c4f49442229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e7365745072696f72696461642872732e676574537472696e6728224643444553435052494f52494441442229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e7365744e6f456d706c6561646f2872732e676574496e7428224643454d504e4f2229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e736574546974756c6f2872732e676574537472696e672822464344455343544954554c4f2229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e7365744f62736572766163696f6e2872732e676574537472696e67282246434f42534552564143494f4e45532229293b0d0a202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e73657446656368612873646646656368612e666f726d61742872732e67657454696d657374616d702822464446454348414f4253455256222929202b20222068727322293b0d0a202020202020202020202020202020202020202020202020202020200d0a202020202020202020202020202020202020202020202020202020206d617052657475726e2e707574280d0a20202020202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f2e6765744964537563757273616c28292c200d0a20202020202020202020202020202020202020202020202020202020202020206375727242697461636f72614d6f64756c6f293b0d0a2020202020202020202020202020202020202020202020207d0d0a20202020202020202020202020202020202020202020202072657475726e206d617052657475726e3b0d0a20202020202020202020202020202020202020207d0d0a202020202020202020202020202020207d293b0d0a20202020202020207d2063617463682028457863657074696f6e206529207b0d0a2020202020202020202020206d617052657475726e203d206e657720486173684d61703c496e74656765722c20436a435242697461636f72614d6f64756c6f3e28293b0d0a2020202020202020202020204c4f474745522e6572726f7228436a435250726f70657274795574696c732e67657450726f706572747928226572726f722e73656e74656e63652e657865637574696f6e22292c2065293b0d0a20202020202020207d0d0a202020202020202072657475726e206d617052657475726e3b0d0a202020207d0d0a0d0a2020200d0a7d0d0a', '', '', '2014-07-31 18:54:23.999', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (24, 2, 2, 3, '\x2a2068312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d0d0a3e2a205b5b496e7374616c616369c3b36e2052504d5d5d0d0a3e2a205b5b457374727563747572612064652070726f796563746f735d5d0d0a3e2a205b5b446f63756d656e746f732074c3a9636e69636f735d5d0d0a3e2a205b5b436f6e74726f6c206465206173697374656e636961735d5d', '', '', '2014-08-01 13:20:16.963', 7);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (25, 12, 12, 3, '\x68312e20436f6e74726f6c206465206173697374656e636961730d0a0d0a50617261207265616c697a617220656c20636f6e74726f6c206465206173697374656e63696173207920706f646572206a757374696669636172207265746172646f73206f20726567697374726f7320667565726120646520686f726172696f2064656265206c6c656e6172736520656c20666f726d61746f20616e65786f2e2045732065737472c3ad6374616d656e7465206e656365736172696f20717565207365207265737065746520656c20666f726d61746f206f726967696e616c2064656c206172636869766f2c20656e206361736f20646520717565206e6f2074656e676120656c20666f726d61746f206e6f20736572c3a120746f6d61646f20656e206375656e746120706f7220656c20c3a172656120656e63617267616461206465206573746520636f6e74726f6c2e', '', '', '2014-08-01 13:30:26.128', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (26, 12, 12, 3, '\x68312e20436f6e74726f6c206465206173697374656e636961730d0a0d0a50617261207265616c697a617220656c20636f6e74726f6c206465206173697374656e63696173207920706f646572206a757374696669636172207265746172646f73206f20726567697374726f7320667565726120646520686f726172696f2064656265206c6c656e6172736520656c20666f726d61746f20616e65786f2e2045732065737472c3ad6374616d656e7465206e656365736172696f20717565207365207265737065746520656c20666f726d61746f206f726967696e616c2064656c206172636869766f2c20656e206361736f20646520717565206e6f2074656e676120656c20666f726d61746f206e6f20736572c3a120746f6d61646f20656e206375656e746120706f7220656c20c3a172656120656e63617267616461206465206573746520636f6e74726f6c2e0d0a0d0a527574612070617261206465706f7369746172206173697374656e63696173206465736172726f6c6c61646f726573204a6176610d0a5c5c42415a3630323036365c436f6d7061727469646132', '', '', '2014-08-01 16:51:27.864', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (27, 12, 12, 3, '\x68312e20436f6e74726f6c206465206173697374656e636961730d0a0d0a50617261207265616c697a617220656c20636f6e74726f6c206465206173697374656e63696173207920706f646572206a757374696669636172207265746172646f73206f20726567697374726f7320667565726120646520686f726172696f2064656265206c6c656e6172736520656c20666f726d61746f20616e65786f2e2045732065737472c3ad6374616d656e7465206e656365736172696f20717565207365207265737065746520656c20666f726d61746f206f726967696e616c2064656c206172636869766f2c20656e206361736f20646520717565206e6f2074656e676120656c20666f726d61746f206e6f20736572c3a120746f6d61646f20656e206375656e746120706f7220656c20c3a172656120656e63617267616461206465206573746520636f6e74726f6c2e0d0a0d0a527574612070617261206465706f7369746172206173697374656e63696173206465736172726f6c6c61646f726573204a6176610d0a5c5c42415a3630323036365c436f6d70617274696461325c4173697374656e63696173204163657274756d', '', '', '2014-08-01 16:57:13.569', 3);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (45, 19, 19, 1, '\x68312e20506c7567696e204772657474790d0a0d0a68322e204772657474790d0a0d0a68747470733a2f2f6769746875622e636f6d2f616b68696b686c2f6772657474790d0a0d0a68322e205363726970747320646520636f6e6669677572616369c3b36e0d0a0d0a6275696c642e677261646c650d0a677261646c652e70726f706572746965730d0a73657474696e67732e677261646c650d0a0d0a68322e2054617265617320477261646c65202d2047726574747920284e65744265616e73290d0a0d0a2850726f6a656374203e2050726f70657274696573203e204d616e6167652054616b732029200d0a416464204e6577202e2e2e0d0a0d0a0d0a68332e204275696c640d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a6275696c640d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e206275696c64200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a746573740d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a3c2f7072653e0d0a0d0a0d0a68332e2044656275670d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a64656275670d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e206275696c642061707052756e4465627567200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a746573740d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a2d783a7761720d0a3c2f7072653e0d0a0d0a45736375636861646f72207061726120646562756720284465627567203e204174746163682044656275676765722e2e2e293a0d0a3c7072653e0d0a636f6e6e6563746f723a20536f63636b65744174746163682028417474616368657320627920736f636b657420746f206f7468657220564d73290d0a5472616e73706f72743a2064745f736f636b65740d0a486f73743a203c3c54555f45515549504f3e3e2028706f722064656661756c7420636172676120656c206e6f6d627265290d0a506f72743a20353030350d0a3c2f7072653e0d0a0d0a0d0a68332e2052756e0d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a72756e0d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e206275696c642061707052756e200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a746573740d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a2d783a7761720d0a3c2f7072653e0d0a0d0a0d0a68332e20546573740d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a746573740d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e546573742074657374200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a2d783a7761720d0a3c2f7072653e0d0a0d0a4a564d20617267756d656e74733a0d0a3c7072653e0d0a2d5864656275670d0a2d5872756e6a6477703a7472616e73706f72743d64745f736f636b65742c616464726573733d393939392c7365727665723d792c73757370656e643d6e0d0a3c2f7072653e0d0a0d0a45736375636861646f72207061726120646562756720284465627567203e204174746163682044656275676765722e2e2e293a0d0a3c7072653e0d0a636f6e6e6563746f723a20536f63636b65744174746163682028417474616368657320627920736f636b657420746f206f7468657220564d73290d0a5472616e73706f72743a2064745f736f636b65740d0a486f73743a203c3c54555f45515549504f3e3e2028706f722064656661756c7420636172676120656c206e6f6d627265290d0a506f72743a20393939390d0a3c2f7072653e0d0a', '', '', '2014-10-06 19:33:21.008', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (29, 14, 14, 4, '\x68312e2057696b69', '', '', '2014-08-18 13:40:11.449', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (30, 6, 6, 3, '\x68312e20446f63756d656e746f732074c3a9636e69636f730d0a0d0a3e2a205b5b4d616e656a6f206465205479706573204f7261636c6520656e204a6176615d5d0d0a3e2a205b5b456a656d706c6f20636c6173652044414f5d5d0d0a3e2a205b5b4172636869766f7320477261646c655d5d0d0a3e2a205b5b436f6c6c656374696f6e53747275637475726541727261795d5d0d0a3e2a205b5b54617265617320477261646c655d5d', '', '', '2014-08-27 19:33:39.548', 5);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (31, 15, 15, 3, '\x68312e2054617265617320477261646c650d0a0d0a2a4c657320636f6d706172746f206c617320746172656173207175652047696f76616e6e69206e6f732061797564c3b3206120636f6e666967757261722070617261204e65746265616e733a2a0d0a0d0a2850726f6a656374203e2050726f70657274696573203e204d616e6167652054616b732029200d0a416464204e6577202e2e2e0d0a0d0a2b44656275672b0d0a09646973706c6179206e616d653a206a6574747944656275670d0a0d0a097461736b733a206a6574747953746f7020636c65616e206275696c64206a6574747952756e0d0a090d0a09617267756d656e74733a202d2d737461636b74726163650d0a0d0a094a564d20617267756d656e74733a2d586465627567202d5872756e6a6477703a7472616e73706f72743d64745f736f636b65742c616464726573733d393939392c7365727665723d792c73757370656e643d6e0d0a0d0a0d0a0945736375636861646f72207061726120646562756720284465627567203e204174746163682044656275676765722e2e2e293a0d0a0909636f6e6e6563746f723a20536f63636b65744174746163682028417474616368657320627920736f636b657420746f206f7468657220564d73290d0a09095472616e73706f72743a2064745f736f636b65740d0a0909486f73743a203c3c54555f45515549504f3e3e2028706f722064656661756c7420636172676120656c206e6f6d627265290d0a0909506f72743a20393939390d0a0d0a0d0a2b52756e2b0d0a0d0a09646973706c6179206e616d653a206a6574747952756e0d0a0d0a097461736b733a206a6574747953746f7020636c65616e206275696c64206a6574747952756e0d0a0d0a09617267756d656e74733a202d2d737461636b74726163650d0a0d0a0d0a2b53746f702b0d0a0d0a09646973706c6179206e616d653a206a6574747953746f700d0a0d0a097461736b733a206a6574747953746f700d0a0d0a09617267756d656e74733a202d2d737461636b7472616365', '', '', '2014-08-27 19:40:02.105', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (32, 6, 6, 3, '\x68312e20446f63756d656e746f732074c3a9636e69636f730d0a0d0a3e2a205b5b4d616e656a6f206465205479706573204f7261636c6520656e204a6176615d5d0d0a3e2a205b5b456a656d706c6f20636c6173652044414f5d5d0d0a3e2a205b5b4172636869766f7320477261646c655d5d0d0a3e2a205b5b436f6c6c656374696f6e53747275637475726541727261795d5d0d0a3e2a205b5b54617265617320477261646c655d5d0d0a3e2a205b5b53756276657273696f6e5d5d', '', '', '2014-08-29 11:07:47.84', 6);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (33, 16, 16, 3, '\x68312e2053756276657273696f6e0d0a0d0a2a496e7374616c61722053756276657273696f6e2a0d0a0d0a2a55524c207265706f3a2a0d0a687474703a2f2f31302e35312e3231342e39363a393838302f61746e63437465732f7472756e6b2f706f7274616c2f0d0a0d0a2a4461746f732064652073657369c3b36e2a0d0a5573756172696f3a206e756d65726f20646520656d706c6561646f2028656a2e20313233343536290d0a50617373776f72643a206e756d20646520656d706c6561646f20656e2073656e7469646f20696e766572736f2028656a2e2036353433323129', '', '', '2014-08-29 11:14:41.551', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (34, 16, 16, 3, '\x68312e2053756276657273696f6e0d0a0d0a2a53756276657273696f6e2a0d0a496e7374616c617220546f72746f6973652053564e206f20656c20636c69656e74652053564e2071756520757374656465732070726566696572616e2e0d0a0d0a2a55524c207265706f3a2a0d0a687474703a2f2f31302e35312e3231342e39363a393838302f61746e63437465732f7472756e6b2f706f7274616c2f0d0a0d0a2a4461746f732064652073657369c3b36e2a0d0a5573756172696f3a206e756d65726f20646520656d706c6561646f2028656a2e20313233343536290d0a50617373776f72643a206e756d20646520656d706c6561646f20656e2073656e7469646f20696e766572736f2028656a2e2036353433323129', '', '', '2014-08-29 12:26:18.121', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (35, 14, 14, 1, '\x68312e2057696b690d0a0d0a2a205b5b53502054797065735d5d', '', '', '2014-09-11 19:02:36.451', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (36, 17, 17, 1, '\x68322e2053502054797065730d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f0d0a0d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e545259204153204f424a454354200d0a280d0a202046494944204e554d4245522c0d0a2020464356414c5545205641524348415232283235292c0d0a202046434445534352495054494f4e205641524348415232283235292c0d0a20204649535441545553204e554d4245522c0d0a202046494d494e204e554d4245522c0d0a202046494d4158204e554d4245522c0d0a20204644444154452054494d455354414d500d0a293b0d0a3c2f7072653e0d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f207461626c610d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e5452595441200d0a4153205441424c45204f46205459454e5452593b0d0a3c2f7072653e', '', '', '2014-09-11 19:04:16.977', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (37, 17, 17, 1, '\x68322e2053502054797065730d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f0d0a0d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e545259204153204f424a454354200d0a280d0a202046494944204e554d4245522c0d0a2020464356414c5545205641524348415232283235292c0d0a20204649535441545553204e554d4245522c0d0a20204644444154452054494d455354414d500d0a293b0d0a3c2f7072653e0d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f207461626c610d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e5452595441200d0a4153205441424c45204f46205459454e5452593b0d0a3c2f7072653e0d0a0d0a68332e20436f6e747261746f206465205350730d0a3c7072653e0d0a637265617465206f72207265706c616365205041434b414745202020202020202020202020504b47505241435449434530310d0a41530d0a0d0a50524f43454455524520535047454e4552415445444154412870614e554d202020202020202020202020202020494e204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f434544555245205350494e53455254444154412870614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c706149442020202020202020202020202020204f55542055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f434544555245205350555044415445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c70614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f43454455524520535044454c455445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a46554e4354494f4e20464e53454c4543544441544128706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e504154595045532e435552545950453b0d0a0d0a46554e4354494f4e20464e53454c454354454e54525928706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e5459454e54525954413b0d0a0d0a454e4420504b47505241435449434530313b0d0a3c2f7072653e0d0a0d0a68332e2043756572706f206465205350730d0a3c7072653e0d0a637265617465206f72207265706c616365205041434b41474520424f4459202020202020202020202020504b47505241435449434530310d0a4153200d0a202050524f43454455524520535047454e4552415445444154412870614e554d202020202020202020202020202020494e204e554d4245520d0a20202020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a20202020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f555420564152434841523229200d0a2020495320200d0a20202020766149444241534520202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020202076614944544d502020202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020202076614e4f454c454d454e545320202020202020204e554d4245523b0d0a202020207661444154452020202020202020202020202020444154453b202020200d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a2020202020200d0a2020202053454c454354204445434f4445284d41582846494944292c204e554c4c2c203029200d0a202020202020494e544f2076614944424153450d0a20202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a202020200d0a20202020464f52206920494e20312e2e70614e554d204c4f4f500d0a20202020202076614e4f454c454d454e5453203a3d20524f554e442844424d535f52414e444f4d2e76616c756528312c20313029293b0d0a20202020202076614944544d50203a3d20287661494442415345202b2069293b0d0a2020202020200d0a202020202020494e5345525420494e544f205441505241434441544128464949440d0a202020202020202020202020202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202020202020202020202020202c46494d415829200d0a2020202020202020202020202020202020202020202020202020202056414c5545532876614944544d500d0a202020202020202020202020202020202020202020202020202020202020202020202c44424d535f52414e444f4d2e737472696e67282755272c203130290d0a202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c203529290d0a202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c2032352929293b0d0a2020202020200d0a202020202020464f52206a20494e20312e2e76614e4f454c454d454e5453204c4f4f500d0a202020202020202053454c4543542043555252454e545f44415445202b2028524f554e442844424d535f52414e444f4d2e76616c7565282d32352c203235292929200d0a20202020202020202020494e544f207661444154450d0a2020202020202020202046524f4d204455414c3b0d0a20202020202020200d0a2020202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a202020202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a202020202020202020202020202020202020202020202020202020202020202c464356414c55450d0a202020202020202020202020202020202020202020202020202020202020202c46495354415455530d0a202020202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202020202056414c5545532876614944544d500d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c6a0d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c44424d535f52414e444f4d2e737472696e6728274c272c203130290d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c203529290d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c766144415445293b0d0a202020202020454e44204c4f4f503b0d0a20202020454e44204c4f4f503b0d0a20202020202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e4420535047454e4552415445444154413b0d0a20200d0a20200d0a202050524f434544555245205350494e53455254444154412870614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a2020202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a2020202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c706149442020202020202020202020202020204f55542055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232290d0a202049532020200d0a20202020766149444241534520202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a202020200d0a2020202053454c454354204445434f4445284d41582846494944292c204e554c4c2c203029202b20310d0a202020202020494e544f2076614944424153450d0a20202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a2020202020200d0a20202020494e5345525420494e544f205441505241434441544128464949440d0a20202020202020202020202020202020202020202020202020202c46434445534352495054494f4e0d0a20202020202020202020202020202020202020202020202020202c46494d494e0d0a20202020202020202020202020202020202020202020202020202c46494d415829200d0a202020202020202020202020202020202020202020202020202056414c5545532876614944424153450d0a20202020202020202020202020202020202020202020202020202020202020202c70614445534352495054494f4e0d0a20202020202020202020202020202020202020202020202020202020202020202c70614d494e0d0a20202020202020202020202020202020202020202020202020202020202020202c70614d4158293b0d0a20202020202020200d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a20202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202056414c5545532876614944424153450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464949440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464444415445293b0d0a20202020454e44204c4f4f503b0d0a202020200d0a20202020455843455054494f4e0d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b200d0a2020454e44205350494e53455254444154413b2020200d0a0d0a0d0a202050524f434544555245205350555044415445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c70614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a2020202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a2020202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232290d0a202049532020200d0a2020202076614944202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b2020200d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a202020200d0a202020205550444154452055535243414a414445532e544150524143444154410d0a2020202020205345542046434445534352495054494f4e203d2070614445534352495054494f4e2c0d0a2020202020202020202046494d494e203d2070614d494e2c0d0a2020202020202020202046494d4158203d2070614d41580d0a20202020202057484552452046494944203d20706149443b0d0a202020200d0a2020202044454c455445200d0a20202020202046524f4d2055535243414a414445532e544150524143454e5452590d0a2020202020205748455245204649494444415441203d20706149443b0d0a202020200d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a20202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202056414c55455328706149440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464949440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464444415445293b0d0a20202020454e44204c4f4f503b0d0a202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e44205350555044415445444154413b0d0a0d0a0d0a202050524f43454455524520535044454c455445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f555420564152434841523229200d0a202049530d0a2020200d0a2020424547494e0d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a20202020202044454c455445200d0a202020202020202046524f4d2055535243414a414445532e544150524143454e545259200d0a20202020202020205748455245204649494444415441203d20706149440d0a20202020202020202020414e442046494944454e545259203d207061454e54524945532869292e464949443b0d0a20202020454e44204c4f4f503b0d0a202020200d0a2020202044454c455445200d0a20202020202046524f4d2055535243414a414445532e544150524143444154410d0a20202020202057484552452046494944203d20706149443b0d0a20202020202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e4420535044454c455445444154413b0d0a0d0a0d0a202046554e4354494f4e20464e53454c4543544441544128706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a20202020202052455455524e2055535243414a414445532e504154595045532e43555254595045200d0a202049532020200d0a202020206375725245535452494343202020202020202055535243414a414445532e504154595045532e435552545950453b0d0a2020202076614f5043494f4e2020202020202020202020494e54454745523b0d0a2020424547494e0d0a2020202053454c454354204445434f444528706149442c204e554c4c2c2030290d0a2020202020202020494e544f2076614f5043494f4e0d0a202020202020202046524f4d204455414c3b0d0a20202020202020200d0a20202020434153452076614f5043494f4e0d0a2020202020205748454e2030205448454e0d0a20202020202020204f50454e20637572524553545249434320464f522020202020200d0a2020202020202020202053454c45435420464949440d0a202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202c46494d41580d0a202020202020202020202020202020202c464e53454c454354454e5452592846494944290d0a20202020202020202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a202020202020454c53450d0a20202020202020204f50454e20637572524553545249434320464f522020202020200d0a2020202020202020202053454c45435420464949440d0a202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202c46494d41580d0a202020202020202020202020202020202c464e53454c454354454e5452592846494944290d0a20202020202020202020202046524f4d2055535243414a414445532e544150524143444154410d0a20202020202020202020202057484552452046494944203d20706149443b0d0a20202020454e4420434153453b0d0a0d0a2020202052455455524e2063757252455354524943433b0d0a202020454e4420464e53454c454354444154413b0d0a2020200d0a2020200d0a20202046554e4354494f4e20464e53454c454354454e54525928706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e5459454e54525954410d0a202049532020200d0a202020207661454e54524945532055535243414a414445532e5459454e54525954413b0d0a2020424547494e0d0a2020202053454c4543542055535243414a414445532e5459454e54525928524f57454e5452592e46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e46444441544529200d0a2020202020202020202042554c4b20434f4c4c45435420494e544f207661454e54524945530d0a202020202020202046524f4d2055535243414a414445532e544150524143454e54525920524f57454e5452590d0a20202020202020205748455245204649494444415441203d20706149443b0d0a0d0a2020202052455455524e207661454e54524945533b0d0a202020454e4420464e53454c454354454e5452593b0d0a454e4420504b47505241435449434530313b0d0a3c2f7072653e', '', '', '2014-09-11 20:33:35.659', 2);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (38, 14, 14, 1, '\x68312e2057696b690d0a0d0a2a205b5b5350205479706573204f7261636c655d5d', '', '', '2014-09-11 20:35:44.493', 3);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (39, 17, 17, 1, '\x68322e205350205479706573204f7261636c650d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f0d0a0d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e545259204153204f424a454354200d0a280d0a202046494944204e554d4245522c0d0a2020464356414c5545205641524348415232283235292c0d0a20204649535441545553204e554d4245522c0d0a20204644444154452054494d455354414d500d0a293b0d0a3c2f7072653e0d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f207461626c610d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e5452595441200d0a4153205441424c45204f46205459454e5452593b0d0a3c2f7072653e0d0a0d0a68332e20436f6e747261746f206465205350730d0a3c7072653e0d0a637265617465206f72207265706c616365205041434b414745202020202020202020202020504b47505241435449434530310d0a41530d0a0d0a50524f43454455524520535047454e4552415445444154412870614e554d202020202020202020202020202020494e204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f434544555245205350494e53455254444154412870614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c706149442020202020202020202020202020204f55542055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f434544555245205350555044415445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c70614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f43454455524520535044454c455445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a46554e4354494f4e20464e53454c4543544441544128706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e504154595045532e435552545950453b0d0a0d0a46554e4354494f4e20464e53454c454354454e54525928706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e5459454e54525954413b0d0a0d0a454e4420504b47505241435449434530313b0d0a3c2f7072653e0d0a0d0a68332e2043756572706f206465205350730d0a3c7072653e0d0a637265617465206f72207265706c616365205041434b41474520424f4459202020202020202020202020504b47505241435449434530310d0a4153200d0a202050524f43454455524520535047454e4552415445444154412870614e554d202020202020202020202020202020494e204e554d4245520d0a20202020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a20202020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f555420564152434841523229200d0a2020495320200d0a20202020766149444241534520202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020202076614944544d502020202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020202076614e4f454c454d454e545320202020202020204e554d4245523b0d0a202020207661444154452020202020202020202020202020444154453b202020200d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a2020202020200d0a2020202053454c454354204445434f4445284d41582846494944292c204e554c4c2c203029200d0a202020202020494e544f2076614944424153450d0a20202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a202020200d0a20202020464f52206920494e20312e2e70614e554d204c4f4f500d0a20202020202076614e4f454c454d454e5453203a3d20524f554e442844424d535f52414e444f4d2e76616c756528312c20313029293b0d0a20202020202076614944544d50203a3d20287661494442415345202b2069293b0d0a2020202020200d0a202020202020494e5345525420494e544f205441505241434441544128464949440d0a202020202020202020202020202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202020202020202020202020202c46494d415829200d0a2020202020202020202020202020202020202020202020202020202056414c5545532876614944544d500d0a202020202020202020202020202020202020202020202020202020202020202020202c44424d535f52414e444f4d2e737472696e67282755272c203130290d0a202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c203529290d0a202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c2032352929293b0d0a2020202020200d0a202020202020464f52206a20494e20312e2e76614e4f454c454d454e5453204c4f4f500d0a202020202020202053454c4543542043555252454e545f44415445202b2028524f554e442844424d535f52414e444f4d2e76616c7565282d32352c203235292929200d0a20202020202020202020494e544f207661444154450d0a2020202020202020202046524f4d204455414c3b0d0a20202020202020200d0a2020202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a202020202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a202020202020202020202020202020202020202020202020202020202020202c464356414c55450d0a202020202020202020202020202020202020202020202020202020202020202c46495354415455530d0a202020202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202020202056414c5545532876614944544d500d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c6a0d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c44424d535f52414e444f4d2e737472696e6728274c272c203130290d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c203529290d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c766144415445293b0d0a202020202020454e44204c4f4f503b0d0a20202020454e44204c4f4f503b0d0a20202020202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e4420535047454e4552415445444154413b0d0a20200d0a20200d0a202050524f434544555245205350494e53455254444154412870614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a2020202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a2020202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c706149442020202020202020202020202020204f55542055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232290d0a202049532020200d0a20202020766149444241534520202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a202020200d0a2020202053454c454354204445434f4445284d41582846494944292c204e554c4c2c203029202b20310d0a202020202020494e544f2076614944424153450d0a20202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a2020202020200d0a20202020494e5345525420494e544f205441505241434441544128464949440d0a20202020202020202020202020202020202020202020202020202c46434445534352495054494f4e0d0a20202020202020202020202020202020202020202020202020202c46494d494e0d0a20202020202020202020202020202020202020202020202020202c46494d415829200d0a202020202020202020202020202020202020202020202020202056414c5545532876614944424153450d0a20202020202020202020202020202020202020202020202020202020202020202c70614445534352495054494f4e0d0a20202020202020202020202020202020202020202020202020202020202020202c70614d494e0d0a20202020202020202020202020202020202020202020202020202020202020202c70614d4158293b0d0a20202020202020200d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a20202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202056414c5545532876614944424153450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464949440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464444415445293b0d0a20202020454e44204c4f4f503b0d0a202020200d0a20202020455843455054494f4e0d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b200d0a2020454e44205350494e53455254444154413b2020200d0a0d0a0d0a202050524f434544555245205350555044415445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c70614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a2020202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a2020202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232290d0a202049532020200d0a2020202076614944202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b2020200d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a202020200d0a202020205550444154452055535243414a414445532e544150524143444154410d0a2020202020205345542046434445534352495054494f4e203d2070614445534352495054494f4e2c0d0a2020202020202020202046494d494e203d2070614d494e2c0d0a2020202020202020202046494d4158203d2070614d41580d0a20202020202057484552452046494944203d20706149443b0d0a202020200d0a2020202044454c455445200d0a20202020202046524f4d2055535243414a414445532e544150524143454e5452590d0a2020202020205748455245204649494444415441203d20706149443b0d0a202020200d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a20202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202056414c55455328706149440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464949440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464444415445293b0d0a20202020454e44204c4f4f503b0d0a202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e44205350555044415445444154413b0d0a0d0a0d0a202050524f43454455524520535044454c455445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f555420564152434841523229200d0a202049530d0a2020200d0a2020424547494e0d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a20202020202044454c455445200d0a202020202020202046524f4d2055535243414a414445532e544150524143454e545259200d0a20202020202020205748455245204649494444415441203d20706149440d0a20202020202020202020414e442046494944454e545259203d207061454e54524945532869292e464949443b0d0a20202020454e44204c4f4f503b0d0a202020200d0a2020202044454c455445200d0a20202020202046524f4d2055535243414a414445532e544150524143444154410d0a20202020202057484552452046494944203d20706149443b0d0a20202020202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e4420535044454c455445444154413b0d0a0d0a0d0a202046554e4354494f4e20464e53454c4543544441544128706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a20202020202052455455524e2055535243414a414445532e504154595045532e43555254595045200d0a202049532020200d0a202020206375725245535452494343202020202020202055535243414a414445532e504154595045532e435552545950453b0d0a2020202076614f5043494f4e2020202020202020202020494e54454745523b0d0a2020424547494e0d0a2020202053454c454354204445434f444528706149442c204e554c4c2c2030290d0a2020202020202020494e544f2076614f5043494f4e0d0a202020202020202046524f4d204455414c3b0d0a20202020202020200d0a20202020434153452076614f5043494f4e0d0a2020202020205748454e2030205448454e0d0a20202020202020204f50454e20637572524553545249434320464f522020202020200d0a2020202020202020202053454c45435420464949440d0a202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202c46494d41580d0a202020202020202020202020202020202c464e53454c454354454e5452592846494944290d0a20202020202020202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a202020202020454c53450d0a20202020202020204f50454e20637572524553545249434320464f522020202020200d0a2020202020202020202053454c45435420464949440d0a202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202c46494d41580d0a202020202020202020202020202020202c464e53454c454354454e5452592846494944290d0a20202020202020202020202046524f4d2055535243414a414445532e544150524143444154410d0a20202020202020202020202057484552452046494944203d20706149443b0d0a20202020454e4420434153453b0d0a0d0a2020202052455455524e2063757252455354524943433b0d0a202020454e4420464e53454c454354444154413b0d0a2020200d0a2020200d0a20202046554e4354494f4e20464e53454c454354454e54525928706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e5459454e54525954410d0a202049532020200d0a202020207661454e54524945532055535243414a414445532e5459454e54525954413b0d0a2020424547494e0d0a2020202053454c4543542055535243414a414445532e5459454e54525928524f57454e5452592e46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e46444441544529200d0a2020202020202020202042554c4b20434f4c4c45435420494e544f207661454e54524945530d0a202020202020202046524f4d2055535243414a414445532e544150524143454e54525920524f57454e5452590d0a20202020202020205748455245204649494444415441203d20706149443b0d0a0d0a2020202052455455524e207661454e54524945533b0d0a202020454e4420464e53454c454354454e5452593b0d0a454e4420504b47505241435449434530313b0d0a3c2f7072653e', '', '', '2014-09-11 20:35:56.78', 3);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (41, 18, 18, 12, '\x68312e205350205479706573204f7261636c650d0a0d0a68322e205350205479706573204f7261636c650d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f0d0a0d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e545259204153204f424a454354200d0a280d0a202046494944204e554d4245522c0d0a2020464356414c5545205641524348415232283235292c0d0a20204649535441545553204e554d4245522c0d0a20204644444154452054494d455354414d500d0a293b0d0a3c2f7072653e0d0a0d0a68332e2047656e6572616369c3b36e206465207469706f206f626a65746f207461626c610d0a3c7072653e0d0a637265617465206f72207265706c6163652054595045205459454e5452595441200d0a4153205441424c45204f46205459454e5452593b0d0a3c2f7072653e0d0a0d0a68332e20436f6e747261746f206465205350730d0a3c7072653e0d0a637265617465206f72207265706c616365205041434b414745202020202020202020202020504b47505241435449434530310d0a41530d0a0d0a50524f43454455524520535047454e4552415445444154412870614e554d202020202020202020202020202020494e204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f434544555245205350494e53455254444154412870614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c706149442020202020202020202020202020204f55542055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f434544555245205350555044415445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c70614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a50524f43454455524520535044454c455445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232293b0d0a0d0a46554e4354494f4e20464e53454c4543544441544128706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e504154595045532e435552545950453b0d0a0d0a46554e4354494f4e20464e53454c454354454e54525928706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e5459454e54525954413b0d0a0d0a454e4420504b47505241435449434530313b0d0a3c2f7072653e0d0a0d0a68332e2043756572706f206465205350730d0a3c7072653e0d0a637265617465206f72207265706c616365205041434b41474520424f4459202020202020202020202020504b47505241435449434530310d0a4153200d0a202050524f43454455524520535047454e4552415445444154412870614e554d202020202020202020202020202020494e204e554d4245520d0a20202020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a20202020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f555420564152434841523229200d0a2020495320200d0a20202020766149444241534520202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020202076614944544d502020202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020202076614e4f454c454d454e545320202020202020204e554d4245523b0d0a202020207661444154452020202020202020202020202020444154453b202020200d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a2020202020200d0a2020202053454c454354204445434f4445284d41582846494944292c204e554c4c2c203029200d0a202020202020494e544f2076614944424153450d0a20202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a202020200d0a20202020464f52206920494e20312e2e70614e554d204c4f4f500d0a20202020202076614e4f454c454d454e5453203a3d20524f554e442844424d535f52414e444f4d2e76616c756528312c20313029293b0d0a20202020202076614944544d50203a3d20287661494442415345202b2069293b0d0a2020202020200d0a202020202020494e5345525420494e544f205441505241434441544128464949440d0a202020202020202020202020202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202020202020202020202020202c46494d415829200d0a2020202020202020202020202020202020202020202020202020202056414c5545532876614944544d500d0a202020202020202020202020202020202020202020202020202020202020202020202c44424d535f52414e444f4d2e737472696e67282755272c203130290d0a202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c203529290d0a202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c2032352929293b0d0a2020202020200d0a202020202020464f52206a20494e20312e2e76614e4f454c454d454e5453204c4f4f500d0a202020202020202053454c4543542043555252454e545f44415445202b2028524f554e442844424d535f52414e444f4d2e76616c7565282d32352c203235292929200d0a20202020202020202020494e544f207661444154450d0a2020202020202020202046524f4d204455414c3b0d0a20202020202020200d0a2020202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a202020202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a202020202020202020202020202020202020202020202020202020202020202c464356414c55450d0a202020202020202020202020202020202020202020202020202020202020202c46495354415455530d0a202020202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202020202056414c5545532876614944544d500d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c6a0d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c44424d535f52414e444f4d2e737472696e6728274c272c203130290d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c524f554e442844424d535f52414e444f4d2e76616c756528312c203529290d0a20202020202020202020202020202020202020202020202020202020202020202020202020202c766144415445293b0d0a202020202020454e44204c4f4f503b0d0a20202020454e44204c4f4f503b0d0a20202020202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e4420535047454e4552415445444154413b0d0a20200d0a20200d0a202050524f434544555245205350494e53455254444154412870614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a2020202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a2020202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c706149442020202020202020202020202020204f55542055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232290d0a202049532020200d0a20202020766149444241534520202020202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b0d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a202020200d0a2020202053454c454354204445434f4445284d41582846494944292c204e554c4c2c203029202b20310d0a202020202020494e544f2076614944424153450d0a20202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a2020202020200d0a20202020494e5345525420494e544f205441505241434441544128464949440d0a20202020202020202020202020202020202020202020202020202c46434445534352495054494f4e0d0a20202020202020202020202020202020202020202020202020202c46494d494e0d0a20202020202020202020202020202020202020202020202020202c46494d415829200d0a202020202020202020202020202020202020202020202020202056414c5545532876614944424153450d0a20202020202020202020202020202020202020202020202020202020202020202c70614445534352495054494f4e0d0a20202020202020202020202020202020202020202020202020202020202020202c70614d494e0d0a20202020202020202020202020202020202020202020202020202020202020202c70614d4158293b0d0a20202020202020200d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a20202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202056414c5545532876614944424153450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464949440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464444415445293b0d0a20202020454e44204c4f4f503b0d0a202020200d0a20202020455843455054494f4e0d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b200d0a2020454e44205350494e53455254444154413b2020200d0a0d0a0d0a202050524f434544555245205350555044415445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c70614445534352495054494f4e202020202020494e2055535243414a414445532e544150524143444154412e46434445534352495054494f4e25545950450d0a2020202020202020202020202020202020202020202020202c70614d494e2020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d494e25545950450d0a2020202020202020202020202020202020202020202020202c70614d41582020202020202020202020202020494e2055535243414a414445532e544150524143444154412e46494d415825545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f5554205641524348415232290d0a202049532020200d0a2020202076614944202020202020202055535243414a414445532e544150524143444154412e4649494425545950453b2020200d0a2020424547494e0d0a202020207061434f44454552524f52203a3d20313b200d0a202020207061444553434552524f52203a3d204e554c4c3b0d0a202020200d0a202020205550444154452055535243414a414445532e544150524143444154410d0a2020202020205345542046434445534352495054494f4e203d2070614445534352495054494f4e2c0d0a2020202020202020202046494d494e203d2070614d494e2c0d0a2020202020202020202046494d4158203d2070614d41580d0a20202020202057484552452046494944203d20706149443b0d0a202020200d0a2020202044454c455445200d0a20202020202046524f4d2055535243414a414445532e544150524143454e5452590d0a2020202020205748455245204649494444415441203d20706149443b0d0a202020200d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a202020202020494e5345525420494e544f20544150524143454e5452592846494944444154410d0a20202020202020202020202020202020202020202020202020202020202c46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c46444441544529200d0a202020202020202020202020202020202020202020202020202020202056414c55455328706149440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464949440d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202020202020202c7061454e54524945532869292e464444415445293b0d0a20202020454e44204c4f4f503b0d0a202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e44205350555044415445444154413b0d0a0d0a0d0a202050524f43454455524520535044454c455445444154412870614944202020202020202020202020202020494e2055535243414a414445532e544150524143444154412e4649494425545950450d0a2020202020202020202020202020202020202020202020202c7061454e545249455320202020202020202020494e2055535243414a414445532e5459454e54525954410d0a2020202020202020202020202020202020202020202020202c7061434f44454552524f5220202020202020204f5554204e554d4245520d0a2020202020202020202020202020202020202020202020202c7061444553434552524f5220202020202020204f555420564152434841523229200d0a202049530d0a2020200d0a2020424547494e0d0a20202020464f52206920494e207061454e54524945532e4649525354202e2e207061454e54524945532e4c415354204c4f4f500d0a20202020202044454c455445200d0a202020202020202046524f4d2055535243414a414445532e544150524143454e545259200d0a20202020202020205748455245204649494444415441203d20706149440d0a20202020202020202020414e442046494944454e545259203d207061454e54524945532869292e464949443b0d0a20202020454e44204c4f4f503b0d0a202020200d0a2020202044454c455445200d0a20202020202046524f4d2055535243414a414445532e544150524143444154410d0a20202020202057484552452046494944203d20706149443b0d0a20202020202020200d0a20202020455843455054494f4e2020200d0a2020202020205748454e204f5448455253205448454e0d0a20202020202020207061434f44454552524f52203a3d2053514c434f44453b200d0a20202020202020207061444553434552524f52203a3d2053514c4552524d3b20200d0a2020454e4420535044454c455445444154413b0d0a0d0a0d0a202046554e4354494f4e20464e53454c4543544441544128706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a20202020202052455455524e2055535243414a414445532e504154595045532e43555254595045200d0a202049532020200d0a202020206375725245535452494343202020202020202055535243414a414445532e504154595045532e435552545950453b0d0a2020202076614f5043494f4e2020202020202020202020494e54454745523b0d0a2020424547494e0d0a2020202053454c454354204445434f444528706149442c204e554c4c2c2030290d0a2020202020202020494e544f2076614f5043494f4e0d0a202020202020202046524f4d204455414c3b0d0a20202020202020200d0a20202020434153452076614f5043494f4e0d0a2020202020205748454e2030205448454e0d0a20202020202020204f50454e20637572524553545249434320464f522020202020200d0a2020202020202020202053454c45435420464949440d0a202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202c46494d41580d0a202020202020202020202020202020202c464e53454c454354454e5452592846494944290d0a20202020202020202020202046524f4d2055535243414a414445532e544150524143444154413b0d0a202020202020454c53450d0a20202020202020204f50454e20637572524553545249434320464f522020202020200d0a2020202020202020202053454c45435420464949440d0a202020202020202020202020202020202c46434445534352495054494f4e0d0a202020202020202020202020202020202c46494d494e0d0a202020202020202020202020202020202c46494d41580d0a202020202020202020202020202020202c464e53454c454354454e5452592846494944290d0a20202020202020202020202046524f4d2055535243414a414445532e544150524143444154410d0a20202020202020202020202057484552452046494944203d20706149443b0d0a20202020454e4420434153453b0d0a0d0a2020202052455455524e2063757252455354524943433b0d0a202020454e4420464e53454c454354444154413b0d0a2020200d0a2020200d0a20202046554e4354494f4e20464e53454c454354454e54525928706149442020202020202020494e2055535243414a414445532e544150524143444154412e464949442554595045290d0a2020202052455455524e2055535243414a414445532e5459454e54525954410d0a202049532020200d0a202020207661454e54524945532055535243414a414445532e5459454e54525954413b0d0a2020424547494e0d0a2020202053454c4543542055535243414a414445532e5459454e54525928524f57454e5452592e46494944454e5452590d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e464356414c55450d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e46495354415455530d0a20202020202020202020202020202020202020202020202020202020202c524f57454e5452592e46444441544529200d0a2020202020202020202042554c4b20434f4c4c45435420494e544f207661454e54524945530d0a202020202020202046524f4d2055535243414a414445532e544150524143454e54525920524f57454e5452590d0a20202020202020205748455245204649494444415441203d20706149443b0d0a0d0a2020202052455455524e207661454e54524945533b0d0a202020454e4420464e53454c454354454e5452593b0d0a454e4420504b47505241435449434530313b0d0a3c2f7072653e', '', '', '2014-09-12 09:58:56.95', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (43, 14, 14, 1, '\x68312e2057696b690d0a0d0a2a205b5b5350205479706573204f7261636c655d5d0d0a2a205b5b506c7567696e204772657474795d5d', '', '', '2014-09-23 11:26:07.383', 4);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (44, 19, 19, 1, '\x68312e20506c7567696e204772657474790d0a0d0a68322e204772657474790d0a0d0a68747470733a2f2f6769746875622e636f6d2f616b68696b686c2f6772657474790d0a0d0a68322e2054617265617320477261646c65202d2047726574747920284e65744265616e73290d0a0d0a2850726f6a656374203e2050726f70657274696573203e204d616e6167652054616b732029200d0a416464204e6577202e2e2e0d0a0d0a0d0a68332e204275696c640d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a6275696c640d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e206275696c64200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a746573740d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a3c2f7072653e0d0a0d0a0d0a68332e2044656275670d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a64656275670d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e206275696c642061707052756e4465627567200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a746573740d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a2d783a7761720d0a3c2f7072653e0d0a0d0a45736375636861646f72207061726120646562756720284465627567203e204174746163682044656275676765722e2e2e293a0d0a3c7072653e0d0a636f6e6e6563746f723a20536f63636b65744174746163682028417474616368657320627920736f636b657420746f206f7468657220564d73290d0a5472616e73706f72743a2064745f736f636b65740d0a486f73743a203c3c54555f45515549504f3e3e2028706f722064656661756c7420636172676120656c206e6f6d627265290d0a506f72743a20353030350d0a3c2f7072653e0d0a0d0a0d0a68332e2052756e0d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a72756e0d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e206275696c642061707052756e200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a746573740d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a2d783a7761720d0a3c2f7072653e0d0a0d0a0d0a68332e20546573740d0a0d0a646973706c6179206e616d653a0d0a3c7072653e0d0a746573740d0a3c2f7072653e0d0a0d0a7461736b733a0d0a3c7072653e0d0a636c65616e546573742074657374200d0a3c2f7072653e0d0a0d0a617267756d656e74733a0d0a3c7072653e0d0a2d2d737461636b74726163650d0a2d783a6a617661646f634a61720d0a2d783a736f75726365734a61720d0a2d783a7761720d0a3c2f7072653e0d0a0d0a4a564d20617267756d656e74733a0d0a3c7072653e0d0a2d5864656275670d0a2d5872756e6a6477703a7472616e73706f72743d64745f736f636b65742c616464726573733d393939392c7365727665723d792c73757370656e643d6e0d0a3c2f7072653e0d0a0d0a45736375636861646f72207061726120646562756720284465627567203e204174746163682044656275676765722e2e2e293a0d0a3c7072653e0d0a636f6e6e6563746f723a20536f63636b65744174746163682028417474616368657320627920736f636b657420746f206f7468657220564d73290d0a5472616e73706f72743a2064745f736f636b65740d0a486f73743a203c3c54555f45515549504f3e3e2028706f722064656661756c7420636172676120656c206e6f6d627265290d0a506f72743a20393939390d0a3c2f7072653e0d0a', '', '', '2014-09-23 11:36:06.332', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (46, 2, 2, 1, '\x68312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d0d0a3e2a205b5b496e7374616c616369c3b36e2052504d5d5d0d0a3e2a205b5b457374727563747572612064652070726f796563746f735d5d0d0a3e2a205b5b446f63756d656e746f732074c3a9636e69636f735d5d0d0a3e2a205b5b436f6e74726f6c206465206173697374656e636961735d5d0d0a3e2a205b5b5461736b204d616e616765725d5d', '', '', '2014-10-13 11:13:43.317', 8);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (47, 20, 20, 1, '\x68312e2057696b690d0a0d0a3e2a205b5b5461736b204d616e616765725d5d', '', '', '2014-10-13 11:17:47.635', 1);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (48, 2, 2, 1, '\x68312e2057696b690d0a0d0a3e2a205b5b4e6f6d656e636c61747572612064652070726f796563746f735d5d0d0a3e2a205b5b496e7374616c616369c3b36e2052504d5d5d0d0a3e2a205b5b457374727563747572612064652070726f796563746f735d5d0d0a3e2a205b5b446f63756d656e746f732074c3a9636e69636f735d5d0d0a3e2a205b5b436f6e74726f6c206465206173697374656e636961735d5d', '', '', '2014-10-13 11:36:41.964', 9);
INSERT INTO wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) VALUES (49, 21, 21, 1, '\x68312e205461736b204d616e616765720d0a0d0a457374652070726f796563746f20657320656c20726573706f6e7361626c65206465206c612063616c656e646172697a616369c3b36e207920656a6563756369c3b36e2064652070726f6365736f7320656e206c6f73207365727669646f7265732064652053697374656d61732043656e7472616c697a61646f732064652043616a612e0d0a0d0a68322e204d616e75616c20646520436f6e6669677572616369c3b36e0d0a0d0a612920456c20726567697374726f206465206c6f732070726f6365736f73207365207265616c697a6120656e206c61207461626c61205441434a544d54415245412079206c617320636f6e66696775726163696f6e657320656e205441434a544d434f4e4649472e20536f6e20636f6e736964657261646f732070726f6365736f732061637469766f7320617175656c6c6f73207175652074656e67616e2073746174757320312c20706f72206c6f2074616e746f2c20617175656c6c6f732070726f6365736f732071756520796120686179616e207369646f207265676973747261646f7320656e20656c207363686564756c65722c20736920656e20737520726567697374726f20706173616e206120756e20737461747573206469666572656e746520646520312c20736520656c696d696e6172c3a16e2064656c207363686564756c65722e20456e206573746120c3ba6c74696d6120706172746520736520646562652064652074656e6572206375696461646f206465206e6f206465736163746976617220656c2070726f6365736f2061646d696e6973747261646f722c207075657320746f646f73206c6f732064656dc3a1732070726f6365736f732073692073652070756564656e2072656375706572617220636f6e20736f6c6f2061637475616c697a617220656c20737461747573206120312e0d0a0d0a4c61207265666572656e63696120616c2070726f6365736f2064652061646d696e6973747261646f7220736520656e6375656e74726120656e20656c206170706c69636174696f6e2e70726f706572746965733a0d0a0d0a6d616e616765722e6e616d653d4d616e616765720d0a0d0a6d616e616765722e67726f75703d61646d696e0d0a0d0a456c2070726f6365736f2061646d696e6973747261646f7220736520636f6e66696775726120616c20696e6963696172206c612061706c6963616369c3b36e207920736520656e63617267612064652061637475616c697a6172206c6120616374697669646164206465206c6f73204a6f62732079206c617320636f6e66696775726163696f6e65732072657370656374697661732e0d0a0d0a6229204c6f7320726567697374726f73206465205441434a544d434f4e46494720636f6e7469656e656e206c617320636f6e66696775726163696f6e6573206465206c6f73207472696767657273206465206c6f73204a6f62732c207920756e204a6f622070756564652074656e6572204e20636f6e66696775726163696f6e657320616374697661732062616a6f206c6173207369677569656e74657320636f6e646963696f6e65733a200d0a0d0a2a20446562656e2074656e65722073746174757320310d0a0d0a2a204c617320636f6e66696775726163696f6e6573207175652073652061637475616c6963656e20656e20737520636164656e6120646520636164656e612063726f6e206f20706172c3a16d6574726f7320646520656a6563756369c3b36e2c2072657175696572656e206465206c612061637475616c697a616369c3b36e20646520464956455253494f4e20706172612071756520736520707565646120726567697374726172206c6120636f6e6669677572616369c3b36e3b20756e6120636f6e6669677572616369c3b36e20717565206e6f2074656e676120756e206ec3ba6d65726f206465207665727369c3b36e2064697374696e746120646520756e61207665727369c3b36e2079612072656769737472616461206e6f20736572c3a120636f6e73696465726164612e0d0a0d0a632920457320706f7369626c65206c61207265616e7564616369c3b36e2061206e6976656c2064652074617265617320792061206e6976656c20646520636f6e66696775726163696f6e65732e204c61207265616e7564616369c3b36e2061206e6976656c206465207461726561732061706c696361206375616e646f20756e61207461726561206578697374656e74652071756520736520656e6375656e74726520636f6e20737461747573206469666572656e7465206465203120286f706572616369c3b36e206465206465736163746976616369c3b36e29207675656c766520612074656e65722073746174757320312c20736520617369676e6120616c207363686564756c657220636f6e206c617320636f6e66696775726163696f6e65732072657370656374697661732e20446520696775616c206d616e6572612c206375616e646f20756e6120636f6e6669677572616369c3b36e206578697374656e74652071756520736520656e6375656e74726520636f6e20756e20737461747573206469666572656e7465206465203120286f706572616369c3b36e206465206465736163746976616369c3b36e29207675656c766520612074656e65722073746174757320312c20736520617369676e6120616c206c69737461646f20646520636f6e66696775726163696f6e6573206465206c6120746172656120286c612074617265612064656265206573746172206163746976612c206465206c6f20636f6e74726172696f206e6f206465207265666c656a6172c3ad6120656c2063616d62696f292e2050617261206c61206465736163746976616369c3b36e2079207265616e7564616369c3b36e20646520636f6e6669677572616369c3b36e206465207461726561206e6f206573206e656365736172696f2063616d62696172206465207665727369c3b36e2e204c6120c3ba6e69636120746172656120717565206e6f20707565646520736572207265616e7564616461206e692061206e6976656c206465207461726561206e692061206e6976656c20646520636f6e6669677572616369c3b36e2c20657320656c2070726f6365736f2061646d696e6973747261646f722e0d0a0d0a6429204375616c71756965722070726f6365736f206465207265616e7564616369c3b36e20706f736962696c69746120656c207265696e6963696f206465206c61732076657273696f6e657320656e206c617320636f6e66696775726163696f6e65732e205061726120756e6120746172656120646573616374697661646120657320706f7369626c652061637475616c697a617220746f646173206c61732076657273696f6e65732064652073757320636f6e66696775726163696f6e6573207920647572616e7465206c61207265616e7564616369c3b36e2c206c617320636f6e66696775726163696f6e657320736520636f6e73696465726172c3a16e20636f6e20726573706563746f2061207375207665727369c3b36e2061637475616c697a6164612e205061726120756e6120636f6e6669677572616369c3b36e20646573616374697661646120657320706f7369626c652061637475616c697a6172207375207665727369c3b36e207920647572616e7465207375207265616e7564616369c3b36e2c206c6120636f6e6669677572616369c3b36e20736520636f6e73696465726172c3a120636f6e207375207665727369c3b36e2061637475616c697a6164612e200d0a0d0a6529204c6120636f6e6669677572616369c3b36e2070617261206c6120656a6563756369c3b36e206465206c6f732070726f6365736f732062617361646f7320656e206cc3ad6e656120646520636f6d616e646f73206573206c61207369677569656e74653a0d0a0d0a5441434a544d54415245412e666372757461203d20527574612064656c206469726563746f72696f2064652074726162616a6f2028656a2e202f55736572732f6766617266616e622f446f776e6c6f6164732f74656d702f290d0a0d0a5441434a544d54415245412e6663636f6d6d616e64203d20436f6d616e646f20646520656a6563756369c3b36e2028656a2e206a617661290d0a0d0a5441434a544d434f4e4649472e666363726f6e203d20436f6e6669677572616369c3b36e206465206c612063616c656e646172697a616369c3b36e2064656c2070726f6365736f2028656a2e203020302f31202a20312f31202a203f202a290d0a0d0a5441434a544d434f4e4649472e6663706172616d6574726f73203d20506172c3a16d6574726f732070617261206c6120656a6563756369c3b36e2064656c20636f6d616e646f2028656a2e202d6a617220636a6372702d67616d732d70726f636573732e6a617229200d0a0d0a662920546f646f73206c6f732070726f6365736f73207265616c697a616e20656c207369677569656e746520666c756a6f3a0d0a0d0a2a20496e696369616c697a616369c3b36e20646520636f6d706f6e656e746573202861736f6369616369c3b36e20636f6e20636c617365732064656c20636f6e746578746f20646520537072696e672079207265666572656e6369612061206d6f64656c6f2062617361646f20656e2062617365206465206461746f73290d0a0d0a2a2041637475616c697a616369c3b36e2064656c206c6120666563686120656e20656c20726567697374726f2064652062617365206465206461746f7320287461626c61205441434a544d5441524541290d0a0d0a2a205061757361206465206c6f732070726f6365736f7320646570656e6469656e7465730d0a0d0a2a204cc3b3676963612064656c2070726f6365736f206465206163756572646f2061207375207469706f2028656a2e2041646d696e6973747261646f722c20656a6563756369c3b36e206465736465206cc3ad6e656120646520636f6d616e646f73290d0a0d0a2a205265616e7564616369c3b36e2064652070726f6365736f7320646570656e6469656e7465730d0a0d0a6729204c6120646570656e64656e636961207365207265616c697a612061206e6976656c206465204a6f622079206e6f207061726563652068616265722070726f626c656d6120647572616e7465206c61207265616e7564616369c3b36e3b20656c20636f6e74726f6c206465206c6120646570656e64656e636961207469656e652073656e7469646f207061726120656c207265747261736f20656e206c6f732070726f6365736f732c20736572c3ad61207265636f6d656e6461626c6520756e612063616c656e646172697a616369c3b36e20706c616e656164612070617261206e6f2063617573617220616c67756e6120636c61736520646520636f6e666c6963746f20717565206e6f207365207075646965726120636f6e74726f6c61722e0d0a0d0a6829205365207265636f6d69656e646120646566696e697220636f6e66696775726163696f6e657320636f6e207469656d706f20646520686f6c6775726120646520616c206d656e6f7320646f73206d696e75746f732c2070617261207065726d6974697220656c20726567697374726f206465206c6120636f6e6669677572616369c3b36e2073696e20696e746572666572697220636f6e20656c207469656d706f2063616c656e646172697a61646f2070617261206c6120656a6563756369c3b36e2e0d0a0d0a68322e20437265616369c3b36e20646520436164656e61732043726f6e0d0a0d0a536520656e636f6e7472c3b3206c61207369677569656e74652061706c6963616369c3b36e20776562207061726120706f6465722067656e6572617220636164656e61732063726f6e20656e2062617365206120756e20666f726d756c6172696f2062617374616e746520616d696761626c652e0d0a0d0a687474703a2f2f7777772e63726f6e6d616b65722e636f6d2f0d0a0d0a68322e205363726970747320706172612042440d0a0d0a68332e205469706f73206465207461726561730d0a0d0a436f6e206c6f73207369677569656e746573207363726970747320736520646965726f6e20646520616c7461206c6f73207469706f73206465207461726561733a0d0a0d0a3c7072653e0d0a494e5345525420494e544f2043414a412e5443434a544d5449504f5441524541202846495449504f49442c46434445534352495043494f4e2c464355534552494e535449504f542c46444645434841494e535449504f542c4643555345524d4f4449462c464446454348414d4f444946292056414c55455328312c2750726f6365736f2064652061646d696e69737472616369c3b36e20696e7465726e6f272c27373032363030272c737973646174652c27373032363030272c7379736461746520293b0d0a494e5345525420494e544f2043414a412e5443434a544d5449504f5441524541202846495449504f49442c46434445534352495043494f4e2c464355534552494e535449504f542c46444645434841494e535449504f542c4643555345524d4f4449462c464446454348414d4f444946292056414c55455328322c2750726f6365736f20646520656a6563757461626c65732062617361646f20656e20636f6d616e646f73272c27373032363030272c737973646174652c27373032363030272c7379736461746520293b0d0a3c2f7072653e0d0a0d0a68332e205461726561730d0a0d0a436f6e206c6f73207369677569656e746573207363726970747320736520646965726f6e20646520616c7461206c6173207461726561733a0d0a0d0a3c7072653e0d0a494e5345525420494e544f2063616a612e5441434a544d54415245412846434e4f4d4252452c204643475255504f2c2046495449504f49442c2046434445534352495043494f4e2c204643525554412c204643434f4d4d414e442c2046495354415455532c464355534552494e5354415245412c46444645434841494e5354415245412c4643555345524d4f4449462c464446454348414d4f44494629202056414c55455328274d616e61676572272c202761646d696e272c20312c202741646d696e6973747261646f722064652070726f6365736f73272c206e756c6c2c206e756c6c2c20312c202737303236303027202c20737973646174652c2737303236303027202c2073797364617465293b0d0a494e5345525420494e544f2063616a612e5441434a544d54415245412846434e4f4d4252452c204643475255504f2c2046495449504f49442c2046434445534352495043494f4e2c204643525554412c204643434f4d4d414e442c2046495354415455532c464355534552494e5354415245412c46444645434841494e5354415245412c4643555345524d4f4449462c464446454348414d4f44494629202056414c554553282747656f67726166696173272c202747454f272c20322c202750726f6365736f2047656f67726166696173272c2027433a5c5343435c50524f4345534f53272c20276a617661272c20312c202737303236303027202c20737973646174652c2737303236303027202c2073797364617465293b0d0a494e5345525420494e544f2063616a612e5441434a544d54415245412846434e4f4d4252452c204643475255504f2c2046495449504f49442c2046434445534352495043494f4e2c204643525554412c204643434f4d4d414e442c2046495354415455532c464355534552494e5354415245412c46444645434841494e5354415245412c4643555345524d4f4449462c464446454348414d4f44494629202056414c5545532827436f73746f787472616e73616363696f6e272c2027435854272c20322c202750726f6365736f20436f73746f20706f72207472616e73616363696f6e272c2027433a5c5343435c50524f4345534f53272c20276a617661272c20312c202737303236303027202c20737973646174652c2737303236303027202c2073797364617465293b0d0a0d0a2d2d205275746120706172612070726f6365736f733a20433a5c5343435c50524f4345534f530d0a2d2d20527574612064652061706c69636163696f6e65732077696e646f77733a20433a5c53797374656d33325c57696e646f77730d0a3c2f7072653e0d0a0d0a68332e20436f6e66696775726163696f6e65730d0a0d0a436f6e206c6f73207369677569656e746573207363726970747320736520646965726f6e20646520616c7461206c6173207072696d6572617320636f6e66696775726163696f6e6573206465207072756562613a0d0a0d0a3c7072653e0d0a494e5345525420494e544f2063616a612e5441434a544d434f4e464947284649434f4e46494749442c46434e4f4d4252452c204643475255504f202c464956455253494f4e2c20464343524f4e2c204643504152414d4554524f532c2046495354415455532c20464355534552494e53434f4e4649472c46444645434841494e53434f4e4649472c4643555345524d4f4449462c464446454348414d4f444946292056414c55455328312c274d616e61676572272c202761646d696e272c312c20273020302f31202a20312f31202a203f202a272c206e756c6c2c20312c202737303236303027202c20737973646174652c2737303236303027202c2073797364617465293b0d0a494e5345525420494e544f2063616a612e5441434a544d434f4e464947284649434f4e46494749442c46434e4f4d4252452c204643475255504f202c464956455253494f4e2c20464343524f4e2c204643504152414d4554524f532c2046495354415455532c20464355534552494e53434f4e4649472c46444645434841494e53434f4e4649472c4643555345524d4f4449462c464446454348414d4f444946292056414c55455328322c2747656f67726166696173272c202747454f272c312c20273020313120313720312f31202a203f202a272c20272d6a617220636a6372702d67656f6772616669612d312e302e6a6172272c20312c202737303236303027202c20737973646174652c2737303236303027202c2073797364617465293b0d0a494e5345525420494e544f2063616a612e5441434a544d434f4e464947284649434f4e46494749442c46434e4f4d4252452c204643475255504f202c464956455253494f4e2c20464343524f4e2c204643504152414d4554524f532c2046495354415455532c20464355534552494e53434f4e4649472c46444645434841494e53434f4e4649472c4643555345524d4f4449462c464446454348414d4f444946292056414c55455328332c27436f73746f787472616e73616363696f6e272c2027435854272c312c20273020323220313720312f31202a203f202a272c20272d4470726f6365736f2e6d6f646f3d6175746f6d617469636f202d6a617220636a6372702d63616c63756c6f4378542d312e302e6a6172272c20312c202737303236303027202c20737973646174652c2737303236303027202c2073797364617465293b0d0a3c2f7072653e0d0a0d0a68332e2041637475616c697a616369c3b36e20646520636f6e6669677572616369c3b36e0d0a0d0a5365207075656465207574696c697a617220656c207369677569656e74652073637269707420706172612061637475616c697a617220756e6120636f6e6669677572616369c3b36e3a0d0a4e6f7461733a20457320696d706f7274616e74652061637475616c697a6172206c61207665727369c3b36e206465206c6120636f6e6669677572616369c3b36e206f206e6f20736520746f6d6172c3a120656c2063616d62696f2e0d0a4e6f7461733a20506f722073656775726964616420736520696e636c75796520656e20656c2066696c74726f20656c2070726f796563746f2c2061756e717565206e6f206573206e656365736172696f2e0d0a0d0a3c7072653e0d0a5550444154452043414a412e5441434a544d434f4e4649472053455420464343524f4e203d20273020343320313720312f31202a203f202a272c20464956455253494f4e203d20464956455253494f4e202b2031205748455245204649434f4e4649474944203d203220414e44204643475255504f203d202747454f273b0d0a3c2f7072653e0d0a0d0a0d0a', '', '', '2014-10-13 12:08:24.077', 1);


--
-- TOC entry 2775 (class 0 OID 0)
-- Dependencies: 250
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('wiki_content_versions_id_seq', 49, true);


--
-- TOC entry 2681 (class 0 OID 16808)
-- Dependencies: 251
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (7, 7, 3, 'public RespuestaConsultaHistoricoArticuloBean consultaHistoricoArticulo(PeticionConsultaHistoricoArticuloBean _peticion) {
		OracleConnection oConn = null;
		OracleCallableStatement ocs = null;
		ResultSet arrDatosHistorico = null;
		RespuestaConsultaHistoricoArticuloBean response = null;
		try {
			sql = ConfigSION.obtenerParametro("SP");
		}catch (Exception ex){
			sql = "";
			Logeo.logearExcepcion(ex, "No se encontro el parametro: SP");			
		}
		try{
			conn = obtenerConexion();
			if (wrapped) {
				if(conn.isWrapperFor(OracleConnection.class))
					oConn = (OracleConnection) conn.unwrap(OracleConnection.class);
				else
					oConn = (OracleConnection) conn;
			}else{
				oConn = (OracleConnection) conn;
			}			
			ocs = (OracleCallableStatement) oConn.prepareCall(sql);			
			ocs.setLong(1, _peticion.getPaisId());
			ocs.setLong(2, _peticion.getArticuloId());
			ocs.setString(3, _peticion.getFechaInicial());
			ocs.setString(4, _peticion.getFechaFinal());			
			ocs.registerOutParameter(5, OracleTypes.ARRAY, ConfigSION.obtenerParametro("ARRAYHISTORICOARTICULO").trim());
			ocs.registerOutParameter(6, OracleTypes.NUMBER);
			ocs.registerOutParameter(7, OracleTypes.VARCHAR);			
			ocs.execute();			
			response = new RespuestaConsultaHistoricoArticuloBean();
			response.setErrorCode(ocs.getInt(6));
			response.setErrorDesc(ocs.getString(7));			
			if(response.getErrorCode() == 0){
				arrDatosHistorico = ((ARRAY)ocs.getARRAY(5)).getResultSet();		
				if(arrDatosHistorico != null){
					response.setHistoricos(armaArregloHistoricoArticulo(arrDatosHistorico).toArray(new HistoricoArticuloBean[0]));
				}else
					response.setHistoricos(null);
			}else{
				response.setHistoricos(null);
		        Logeo.log("La respuesta NO ha sido exitosa: "+ response.toString());
			}			
		}catch(SQLException ex){
			Logeo.logearExcepcion(ex, "Ocurrio un error en BD al consultar historico de articulo: " + sql + " " + ex.getMessage());
		}catch(Exception ex){
			Logeo.logearExcepcion(ex, "Ocurrio un error al consultar historico articulo: " + ex.getMessage());
		}finally{
			cerrarCallableStatement(ocs);
			cerrarResultSet(arrDatosHistorico);
			cerrarConexion(oConn);
			cerrarConexion(conn);			
			sql = "";
		}		
		return response;
	}	
	private List<HistoricoArticuloBean> armaArregloHistoricoArticulo(ResultSet arrDatosHistorico) throws SQLException{
		List<HistoricoArticuloBean> articulosList = null; 
		try{
			articulosList = new ArrayList<HistoricoArticuloBean>();
			HistoricoArticuloBean art;			
			while(arrDatosHistorico.next()){	
				STRUCT st = (STRUCT) arrDatosHistorico.getObject(2);
				Object[] dArts = st.getAttributes();				
				art = new HistoricoArticuloBean();				
				art.setSolicitudId(((BigDecimal)dArts[0]).longValue());
				art.setArticuloId(((BigDecimal)dArts[1]).longValue());
				art.setFechaMovto(String.valueOf(dArts[2]));
				art.setUsuarioSolicitaId(((BigDecimal)dArts[3]).longValue());
				art.setNombreUsuarioSolicita(String.valueOf(dArts[4]));
				art.setUsuarioResponsableId(((BigDecimal)dArts[5]).longValue());
			    art.setNombreUsuarioResponsable(String.valueOf(dArts[6]));
				art.setFechaAutorizacion(String.valueOf(dArts[7]));
				art.setEstatusSolicitud(String.valueOf(dArts[8]));
				articulosList.add(art);
			}
		}catch(SQLException ex){
			Logeo.logearExcepcion(ex, "Ocurrio un error al armar ARRAY de articulo: " + ex.getMessage() );
			throw new SQLException(ex.getMessage());
		}
		return articulosList;
	}', '', '2014-07-25 17:47:02.18', 3);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (3, 3, 3, 'h1. Nomenclatura de proyectos

El criterio para realizar ésta abreviación es:  tomar la primer letra del nombre del módulo y la primer consonante que aparezca después de ésta.
	
		Módulo Caja > Cj <


Adicionalmente se agregarán 2 sufijos que corresponden a la criticidad y al nivel de impacto del artefacto, respectivamente:


·	Para la Criticidad
C – Crítica (para los artefactos considerados críticos para el funcionamiento de la aplicación).
N – Normal (no son considerados críticos para el funcionamiento de la aplicación).


·	Para el Nivel de Impacto
R – Reglas de Negocio y Bases de Datos (tienen impacto sobre las reglas del negocio y/o    
      sobre las bases de datos, y generan, exclusivamente, un archivo .dll )
U – Interfaces (afectan el Fron, es decir, la pantalla que manipula el usuario, y generan,  
      exclusivamente, un archivo .exe).


El siguiente cuadro muestra el total de las combinaciones posibles tomando en cuenta el Módulo de Caja, la Criticidad y el Nivel de Impacto:

!nomenclatura.png!
      						 
Consideraciones:

·	Cj – Abreviación para el módulo caja.
·	C – Criticidad, que puede ser C (crítica) o N (normal).
·	N – Nivel de Impacto, que puede ser R (si el impacto es sobre las reglas de negocio o las   
            bases de datos) o U (si afecta las interfaces).', '', '2014-07-25 12:57:05.124', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (4, 4, 3, 'h1. Instalación RPM

Además de hacer el curso de RPM en portal corporativo se debe hacer la instalación de la herramienta de acuerdo al documento anexo.', '', '2014-07-25 13:05:12.996', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (5, 5, 3, 'h1. Estructura de proyectos

h2. Proyecto Java con Gradle

>* src
>** main
>*** java
>**** *[fuente_java]*
>*** resources
>**** *[recursos]*
>** test
>*** java
>**** *[fuente_java]*
>*** resources
>**** *[recursos_pruebas]*
>* *build.gradle*
>* *gradle.properties*
>* *settings.gradle*', '', '2014-07-25 13:26:37.318', 2);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (8, 8, 3, 'h1. Ejemplo clase DAO

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.baz.scc.monitorcaja.transito.dao;

import com.baz.scc.commons.util.CjCRDaoUtils;
import com.baz.scc.monitorcaja.transito.model.CjCRDineroTransitoDetalleBean;
import com.baz.scc.monitorcaja.transito.model.CjCRFiltroBean;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.OracleTypes;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 *
 * @author B657264
 */
@Component
public class CjCRDineroTransitoDao {
    private static final  Logger LOGGER = Logger.getLogger(CjCRDineroTransitoDao.class);

    @Autowired
    @Qualifier("usrcajaSadeJdbcTemplate")
    private JdbcTemplate usrcajaSadeJdbcTemplate;

    /**
     * Obtiene las dotaciones con status transito
     * @param filtro
     * @return Lista de dotaciones con status transito
     * @throws java.lang.Exception
     */
    public List<CjCRDineroTransitoDetalleBean> getInfoDineroTransitoDotacion(final CjCRFiltroBean filtro) throws Exception {
        String query = "{? = call CAJA.PA_DOTACIONES3.FNTRANSITODOT (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return usrcajaSadeJdbcTemplate.execute(query, new CallableStatementCallback<List<CjCRDineroTransitoDetalleBean>>() {

            @Override
            public List<CjCRDineroTransitoDetalleBean> doInCallableStatement(CallableStatement cs) throws SQLException {
                List<CjCRDineroTransitoDetalleBean> listaDetalle;
                CjCRDineroTransitoDetalleBean detalle;
                ResultSet rs;
                try {
                    listaDetalle = new ArrayList<CjCRDineroTransitoDetalleBean>();
                    cs.registerOutParameter(1, OracleTypes.CURSOR);
                    CjCRDaoUtils.addInt(cs, 2, filtro.getPais());
                    CjCRDaoUtils.addInt(cs, 3, filtro.getGeografia());
                    CjCRDaoUtils.addInt(cs, 4, filtro.getNivel());
                    CjCRDaoUtils.addInt(cs, 5, filtro.getValor());
                    CjCRDaoUtils.addInt(cs, 6, filtro.getCanal());
                    CjCRDaoUtils.addInt(cs, 7, filtro.getSucursal());
                    CjCRDaoUtils.addInt(cs, 8, filtro.getDivisa());
                    CjCRDaoUtils.addString(cs, 9, filtro.getFechaIni());
                    CjCRDaoUtils.addString(cs, 10, filtro.getFechaFin());
                    cs.execute();
                    rs = (ResultSet) cs.getObject(1);
                    while (rs.next()) {
                        detalle = new CjCRDineroTransitoDetalleBean();
                        detalle.setIdGeo(rs.getInt("FIDGEO"));
                        detalle.setIdPlaza(rs.getInt("FIVALOR1"));
                        detalle.setPlaza(rs.getString("FCPLAZA"));
                        detalle.setIdJefatura(rs.getInt("FIVALOR2"));
                        detalle.setJefatura(rs.getString("FCJEFATURA"));
                        detalle.setIdDistrito(rs.getInt("FIVALOR3"));
                        detalle.setDistrito(rs.getString("FCDISTRITO"));
                        detalle.setPais(rs.getInt("FNPAIS"));
                        detalle.setIdCanal(rs.getInt("FNCANAL"));
                        detalle.setIdSucursal(rs.getInt("FNSUCURSAL"));
                        detalle.setSucursal(rs.getString("DESCSUCURSAL"));
                        detalle.setIdDivisa(rs.getInt("FNIDDIVISA"));
                        detalle.setDivisa(rs.getString("DESCDIVISA"));
                        detalle.setServicio(rs.getString("FCSERVICIO"));
                        detalle.setStatus(rs.getInt("FNIDESTATUS"));
                        detalle.setDescStatus(rs.getString("DESCESTATUS"));
                        detalle.setFechaModificacion(rs.getTimestamp("FDFECHA_MOD"));
                        detalle.setMonto(rs.getBigDecimal("FNMONTO"));
                        detalle.setHorasSinIngresar(rs.getInt("FNTIMETRANS"));
                        detalle.setNumSolicitud(rs.getString("FCDESC4"));
                        detalle.setIdProveedor(rs.getInt("FNIDPROV"));
                        detalle.setProveedor(rs.getString("FCDESCPROV"));
                        detalle.setIdCajaGeneral(rs.getInt("FCCAJAGRAL"));
                        detalle.setCajaGeneral(rs.getString("FCDESCCAJAGRAL"));
                        listaDetalle.add(detalle);
                    }
                } catch (SQLException e) {
                    LOGGER.error("error obteniendo transito dotaciones: ", e);
                    listaDetalle = new ArrayList<CjCRDineroTransitoDetalleBean>();
                }
                return listaDetalle;
            }
        });
    }

    /**
     * Obtiene las recolecciones con status transito
     * @param filtro
     * @return Lista de recolecciones con status transito
     * @throws java.lang.Exception
     */
    public List<CjCRDineroTransitoDetalleBean> getInfoDineroTransitoRecoleccion(final CjCRFiltroBean filtro) throws Exception {
        String query = "{? = call CAJA.PA_RECOLECCIONES2.FNTRANSITOREC (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return usrcajaSadeJdbcTemplate.execute(query, new CallableStatementCallback<List<CjCRDineroTransitoDetalleBean>>() {
            @Override
            public List<CjCRDineroTransitoDetalleBean> doInCallableStatement(CallableStatement cs) throws SQLException {
                List<CjCRDineroTransitoDetalleBean> listaDetalle;
                CjCRDineroTransitoDetalleBean detalle;
                ResultSet rs;
                try {
                    listaDetalle = new ArrayList<CjCRDineroTransitoDetalleBean>();
                    cs.registerOutParameter(1, OracleTypes.CURSOR);
                    CjCRDaoUtils.addInt(cs, 2, filtro.getPais());
                    CjCRDaoUtils.addInt(cs, 3, filtro.getGeografia());
                    CjCRDaoUtils.addInt(cs, 4, filtro.getNivel());
                    CjCRDaoUtils.addInt(cs, 5, filtro.getValor());
                    CjCRDaoUtils.addInt(cs, 6, filtro.getCanal());
                    CjCRDaoUtils.addInt(cs, 7, filtro.getSucursal());
                    CjCRDaoUtils.addInt(cs, 8, filtro.getDivisa());
                    CjCRDaoUtils.addString(cs, 9, filtro.getFechaIni());
                    CjCRDaoUtils.addString(cs, 10, filtro.getFechaFin());
                    cs.execute();
                    rs = (ResultSet) cs.getObject(1);
                    while (rs.next()) {
                        detalle = new CjCRDineroTransitoDetalleBean();
                        detalle.setIdGeo(rs.getInt("FIDGEO"));
                        detalle.setIdPlaza(rs.getInt("FIVALOR1"));
                        detalle.setPlaza(rs.getString("FCPLAZA"));
                        detalle.setIdJefatura(rs.getInt("FIVALOR2"));
                        detalle.setJefatura(rs.getString("FCJEFATURA"));
                        detalle.setIdDistrito(rs.getInt("FIVALOR3"));
                        detalle.setDistrito(rs.getString("FCDISTRITO"));
                        detalle.setPais(rs.getInt("FNPAIS"));
                        detalle.setIdCanal(rs.getInt("FNCANAL"));
                        detalle.setIdSucursal(rs.getInt("FNSUCURSAL"));
                        detalle.setSucursal(rs.getString("DESCSUCURSAL"));
                        detalle.setIdDivisa(rs.getInt("FNIDDIVISA"));
                        detalle.setDivisa(rs.getString("DESCDIVISA"));
                        detalle.setServicio(rs.getString("FCSERVICIO"));
                        detalle.setStatus(rs.getInt("FNIDESTATUS"));
                        detalle.setDescStatus(rs.getString("DESCESTATUS"));
                        detalle.setFechaModificacion(rs.getTimestamp("FDFECHA_MOD"));
                        detalle.setMonto(rs.getBigDecimal("FNMONTO"));
                        detalle.setHorasSinIngresar(rs.getInt("FNTIMETRANS"));
                        detalle.setNumSolicitud(rs.getString("FCDESC4"));
                        detalle.setIdProveedor(rs.getInt("FNIDPROV"));
                        detalle.setProveedor(rs.getString("FCDESCPROV"));
                        detalle.setIdCajaGeneral(rs.getInt("FCCAJAGRAL"));
                        detalle.setCajaGeneral(rs.getString("FCDESCCAJAGRAL"));
                        listaDetalle.add(detalle);
                    }
                } catch (SQLException e) {
                    LOGGER.error("error obteniendo transito recolecciones: ", e);
                    listaDetalle = new ArrayList<CjCRDineroTransitoDetalleBean>();
                }
                return listaDetalle;
            }
        }
        );

    }

}
', '', '2014-07-28 12:02:47.2', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (9, 9, 3, 'h1. Archivos Gradle

El archivo *gradle.properties* en donde se define el proxy es el que se encuentra físicamente en la carpeta .gradle del home de la máquina local.', '', '2014-07-28 17:51:48.608', 2);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (11, 11, 3, 'h1. CollectionStructureArray

/**
 * DAO para el manejo de la fuente de datos de la bitácora. Permite obtener y
 * registrar observaciones.
 */
package com.baz.scc.monitorcaja.bitacora.dao;

import com.baz.scc.commons.support.CjCRDaoConfig;
import com.baz.scc.commons.util.CjCRDaoUtils;
import com.baz.scc.commons.util.CjCRParseDaoUtils;
import com.baz.scc.commons.util.CjCRPropertyUtils;
import com.baz.scc.monitorcaja.bitacora.model.CjCRBitacoraBandera;
import com.baz.scc.monitorcaja.bitacora.model.CjCRBitacoraDetalle;
import com.baz.scc.monitorcaja.bitacora.model.CjCRBitacoraGuardar;
import com.baz.scc.monitorcaja.bitacora.model.CjCRBitacoraModulo;
import com.baz.scc.monitorcaja.bitacora.model.CjCRPrioridadBitacora;
import com.baz.scc.monitorcaja.bitacora.model.CjVRBitacoraModuloParam;
import com.baz.scc.monitorcaja.common.model.CjCRConstantes;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import oracle.jdbc.OracleTypes;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * @author Froilán López PLOL8901
 */
@Repository
public class CjCRBitacoraDao {

    private static final Logger LOGGER = Logger.getLogger(CjCRBitacoraDao.class);

    private static final CjCRDaoUtils.CollectionStructureArray<CjCRBitacoraBandera> STRUCTURE;

    static {
        STRUCTURE = new CjCRDaoUtils.CollectionStructureArray<CjCRBitacoraBandera>() {

            @Override
            public Object getObject(CjCRBitacoraBandera t) {
                Object[] line = new Object[5];

                line[0] = t.getIdModulo();
                line[1] = t.getIdPais();
                line[2] = t.getIdCanal();
                line[3] = t.getIdSucrusal();
                line[4] = t.getFechaObservacion();

                return line;
            }
        };
    }

    @Autowired
    private CjCRDaoConfig usuarioCaja;

    @Autowired
    @Qualifier("usrcajaJdbcTemplate")
    private JdbcTemplate usrcajaJdbcTemplate;

    /**
     * Retorna las observaciones de un día en todos los módulos para una
     * sucursal.
     *
     * @param idPais
     * @param idSelectedSucursal
     * @param fechaBitacora
     * @return List<CjCRBitacoraDetalle>
     */
    public List<CjCRBitacoraDetalle> getBitacoraDetalleXDia(final int idPais,
        final int idSelectedSucursal, final String fechaBitacora) {
        List<CjCRBitacoraDetalle> listReturn;

        try {
            String query = "{ ? = call %s.PQCJMC0003.FNCJMC0003(?,?,?,?,?)}";

            return usrcajaJdbcTemplate.execute(usuarioCaja.getSentence(query),
                new CallableStatementCallback<List<CjCRBitacoraDetalle>>() {

                    @Override
                    public List<CjCRBitacoraDetalle> doInCallableStatement(CallableStatement cs)
                    throws SQLException, DataAccessException {
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                        ResultSet rs;
                        cs.registerOutParameter(1, OracleTypes.CURSOR);

                        CjCRDaoUtils.addInt(cs, 2, idPais);
                        CjCRDaoUtils.addInt(cs, 3, idSelectedSucursal);
                        CjCRDaoUtils.addString(cs, 4, fechaBitacora);
                        cs.registerOutParameter(5, OracleTypes.NUMBER);
                        cs.registerOutParameter(6, OracleTypes.VARCHAR);

                        cs.execute();
                        rs = (ResultSet) cs.getObject(1);

                        List<CjCRBitacoraDetalle> listReturn = new ArrayList<CjCRBitacoraDetalle>();
                        CjCRBitacoraDetalle currentBitacoraDetalle;

                        while (rs.next()) {
                            currentBitacoraDetalle = new CjCRBitacoraDetalle();
                            currentBitacoraDetalle.setIdEmpleado(rs.getInt("FCEMPNO"));
                            currentBitacoraDetalle.setObservacion(rs.getString("FCOBSERVACIONES"));
                            currentBitacoraDetalle.setIdModulo(rs.getInt("FIMODULOID"));
                            currentBitacoraDetalle.setPrioridad(rs.getString("FCDESCPRIORIDAD"));
                            currentBitacoraDetalle.setTitulo(rs.getString("FCDESCTITULO"));
                            // temporal, en lo que suben el cambio a producción.
                            try {
                                currentBitacoraDetalle.setFecha(
                                    sdf.format(rs.getTimestamp("FDFECHAOBSERV")) + " hrs");
                            } catch (Exception e) {
                                currentBitacoraDetalle.setFecha(fechaBitacora + " 00:00 hrs");
                            }
                            currentBitacoraDetalle.setIdSucursal(idSelectedSucursal);
                            
                            currentBitacoraDetalle.setModulo(
                                CjCRConstantes.getModuloNombre(
                                    currentBitacoraDetalle.getIdModulo()));

                            listReturn.add(currentBitacoraDetalle);
                        }
                        return listReturn;
                    }
                });
        } catch (Exception e) {
            listReturn = new ArrayList<CjCRBitacoraDetalle>();
            LOGGER.error(CjCRPropertyUtils.getProperty("error.sentence.execution"), e);
        }
        return listReturn;
    }

    public List<String> getFechasBitacoraXSucursal(final int idPais,
        final int idSucursal, final String fechaIni, final String fechaFin) {
        List<String> listReturn;
        try {
            String query = "{ ? = call %s.PQCJMC0003.FNCJMC0002(?,?,?,?,?,?)}";

            return usrcajaJdbcTemplate.execute(usuarioCaja.getSentence(query),
                new CallableStatementCallback<List<String>>() {

                    @Override
                    public List<String> doInCallableStatement(CallableStatement cs)
                    throws SQLException, DataAccessException {
                        ResultSet rs;
                        cs.registerOutParameter(1, OracleTypes.CURSOR);

                        CjCRDaoUtils.addInt(cs, 2, idPais);
                        CjCRDaoUtils.addInt(cs, 3, idSucursal);
                        CjCRDaoUtils.addString(cs, 4, fechaIni);
                        CjCRDaoUtils.addString(cs, 5, fechaFin);
                        cs.registerOutParameter(6, OracleTypes.NUMBER);
                        cs.registerOutParameter(7, OracleTypes.VARCHAR);

                        cs.execute();
                        rs = (ResultSet) cs.getObject(1);

                        List<String> listReturn = new ArrayList<String>();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

                        while (rs.next()) {
                            listReturn.add(sdf.format(rs.getTimestamp("FDFECHAOBSERV")));
                        }

                        return listReturn;
                    }
                });
        } catch (Exception e) {
            listReturn = new ArrayList<String>();
            LOGGER.error(CjCRPropertyUtils.getProperty("error.sentence.execution"), e);
        }
        return listReturn;
    }

    /**
     * Método que retorna la bandera de observaciones.
     * Recibe isd de sucursales y retorna si tiene conemtarios 
     * en este módulo, en otro o si no tiene observaciones en
     * un día.
     * @param idsSucursal
     * @return Map<Integer, CjCRBitacoraBandera>
     */
    public Map<Integer, CjCRBitacoraBandera> getBitacoraBandera(final List<CjCRBitacoraBandera> idsSucursal) {
        Map<Integer, CjCRBitacoraBandera> mapReturn;

        try {
            String query = "{ ? = call %s.PQCJMC0003.FNCJMC0001(?,?,?)}";

            return usrcajaJdbcTemplate.execute(
                usuarioCaja.getSentence(query), new CallableStatementCallback<Map<Integer, CjCRBitacoraBandera>>() {

                    @Override
                    public Map<Integer, CjCRBitacoraBandera> doInCallableStatement(
                            CallableStatement cs) throws SQLException, DataAccessException {
                        ResultSet rs;
                        cs.registerOutParameter(1, OracleTypes.CURSOR);
                        CjCRDaoUtils.addArray(cs, 2, 
                            usuarioCaja.getSentence("%s.TYPCJMC0001TA"), 
                            STRUCTURE.getArray(idsSucursal));
                        cs.registerOutParameter(3, OracleTypes.NUMBER);
                        cs.registerOutParameter(4, OracleTypes.VARCHAR);

                        cs.execute();
                        rs = (ResultSet) cs.getObject(1);

                        Map<Integer, CjCRBitacoraBandera> mapReturn 
                            = new HashMap<Integer, CjCRBitacoraBandera>();
                        CjCRBitacoraBandera currentBitacoraBandera;

                        while (rs.next()) {
                            currentBitacoraBandera = new CjCRBitacoraBandera();
                            currentBitacoraBandera.setIdSucrusal(rs.getInt("FISUCURSALID"));
                            currentBitacoraBandera.setBandera(rs.getInt("FIBANDERA"));
                            mapReturn.put(
                                currentBitacoraBandera.getIdSucrusal(), 
                                currentBitacoraBandera);
                        }
                        return mapReturn;
                    }
                });
        } catch (Exception e) {
            mapReturn = new HashMap<Integer, CjCRBitacoraBandera>();
            LOGGER.error(CjCRPropertyUtils.getProperty("error.sentence.execution"), e);
        }
        return mapReturn;
    }

    /**
     * Registra en la fuente de datos, un registro de bitácora.
     * @param idPais
     * @param idSucursal
     * @param idModulo
     * @param idEmpleado
     * @param fecha
     * @param titulo
     * @param prioridad
     * @param observaciones
     * @return CjCRBitacoraGuardar
     */
    public CjCRBitacoraGuardar guardarObservacion(final int idPais, 
            final int idSucursal, final int idModulo, final int idEmpleado, 
            final String fecha, final int idTitulo, final String titulo, 
            final int prioridad, final String observaciones) {
        CjCRBitacoraGuardar resultReturn;

        try {
            String query = "{ call %s.PQCJMC0003.PACJMC0001(?,?,?,?,?,?,?,?,?,?)}";

            return usrcajaJdbcTemplate.execute(usuarioCaja.getSentence(query), 
                new CallableStatementCallback<CjCRBitacoraGuardar>() {

                    @Override
                    public CjCRBitacoraGuardar doInCallableStatement(CallableStatement cs) 
                            throws SQLException, DataAccessException {
                        CjCRBitacoraGuardar resultBitacoraGuardar;
                        BigDecimal codeStatus;
                        String messageStatus;
                        
                        CjCRDaoUtils.addInt(cs, 1, idPais);
                        CjCRDaoUtils.addInt(cs, 2, idSucursal);
                        CjCRDaoUtils.addInt(cs, 3, idModulo);
                        CjCRDaoUtils.addInt(cs, 4, idEmpleado);
                        CjCRDaoUtils.addString(cs, 5, observaciones);
                        CjCRDaoUtils.addInt(cs, 6, prioridad);
                        CjCRDaoUtils.addInt(cs, 7, idTitulo);
                        CjCRDaoUtils.addString(cs, 8, titulo);
                        cs.registerOutParameter(9, OracleTypes.NUMBER);
                        cs.registerOutParameter(10, OracleTypes.VARCHAR);

                        cs.execute();

                        codeStatus = (BigDecimal) cs.getObject(9);
                        messageStatus = (String) cs.getObject(10);

                        resultBitacoraGuardar = new CjCRBitacoraGuardar();
                        resultBitacoraGuardar.setCode(codeStatus.intValue());
                        resultBitacoraGuardar.setMessage(messageStatus);

                        return resultBitacoraGuardar;
                    }
            });
        } catch (Exception e) {
            resultReturn = new CjCRBitacoraGuardar();
            LOGGER.error(CjCRPropertyUtils.getProperty("error.sentence.execution"), e);
        }
        return resultReturn;
    }
    
    /**
     * Retorna los item de prioridad para las observaciones.
     * @return List<CjCRPrioridadBitacora>
     */
    public List<CjCRPrioridadBitacora> getPrioridadItems(){
        List<CjCRPrioridadBitacora> listReturn =  new ArrayList<CjCRPrioridadBitacora>();
        try {
            String query = "{ ? = call %s.PQCJMC0003.FNCJMC0004()}";

            return usrcajaJdbcTemplate.execute(
                usuarioCaja.getSentence(query), new CallableStatementCallback<List<CjCRPrioridadBitacora>>() {

                    @Override
                    public List<CjCRPrioridadBitacora> doInCallableStatement(
                            CallableStatement cs) throws SQLException, DataAccessException {
                        ResultSet rs;
                        cs.registerOutParameter(1, OracleTypes.CURSOR);
                        //cs.registerOutParameter(2, OracleTypes.NUMBER);
                        //cs.registerOutParameter(3, OracleTypes.VARCHAR);

                        cs.execute();
                        rs = (ResultSet) cs.getObject(1);

                        CjCRPrioridadBitacora currPrioridad;
                        List<CjCRPrioridadBitacora> listReturn 
                            = new ArrayList<CjCRPrioridadBitacora>();
                        while (rs.next()) {
                            currPrioridad = new CjCRPrioridadBitacora(
                                    rs.getInt("FNPRIORIDADID"), 
                                    rs.getString("FCDESCPRIORIDAD") );
                            listReturn.add(currPrioridad);
                        }
                        Collections.sort(listReturn);
                        return listReturn;
                    }
                });
        } catch (Exception e) {
            listReturn = new ArrayList<CjCRPrioridadBitacora>();
            LOGGER.error(CjCRPropertyUtils.getProperty("error.sentence.execution"), e);
        }
        return listReturn;
    }
    
    
    
    public Map<Integer, CjCRBitacoraModulo> getModuloBitacora(
            final CjVRBitacoraModuloParam param) {
        Map<Integer, CjCRBitacoraModulo> mapReturn;

        try {
            String query = "{ ? = call %s.PQCJMC0003.FNCJMC0005(?,?,?,?,?,?,?,?,?,?)}";

            return usrcajaJdbcTemplate.execute(
                usuarioCaja.getSentence(query), new CallableStatementCallback<Map<Integer, CjCRBitacoraModulo>>() {

                    @Override
                    public Map<Integer, CjCRBitacoraModulo> doInCallableStatement(
                            CallableStatement cs) throws SQLException, DataAccessException {
                        ResultSet rs;
                        int i = 1;
                        cs.registerOutParameter(i++, OracleTypes.CURSOR);
                        CjCRDaoUtils.addInt(cs, i++, param.getIdSucursal() < 0? null : param.getIdSucursal());
                        CjCRDaoUtils.addInt(cs, i++, param.getIdModulo() < 0? null : param.getIdModulo());
                        CjCRDaoUtils.addString(cs, i++, param.getFechaIni().isEmpty()? null: param.getFechaIni());
                        CjCRDaoUtils.addString(cs, i++, param.getFechaFin().isEmpty()? null : param.getFechaFin());
                        CjCRDaoUtils.addInt(cs, i++, param.getIdPais() < 0? null : param.getIdPais());
                        CjCRDaoUtils.addInt(cs, i++, param.getIdGeografia() < 0? null : param.getIdGeografia());
                        CjCRDaoUtils.addInt(cs, i++, param.getIdNivel() < 0? null : param.getIdNivel());
                        CjCRDaoUtils.addInt(cs, i++, param.getValue() < 0? null : param.getValue());
                        cs.registerOutParameter(i++, OracleTypes.NUMBER);
                        cs.registerOutParameter(i++, OracleTypes.VARCHAR);

                        cs.execute();
                        rs = (ResultSet) cs.getObject(1);

                        Map<Integer, CjCRBitacoraModulo> mapReturn 
                            = new HashMap<Integer, CjCRBitacoraModulo>();
                        CjCRBitacoraModulo currBitacoraModulo;
                        SimpleDateFormat sdfFecha = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                        

                        while (rs.next()) {
                            currBitacoraModulo = new CjCRBitacoraModulo();
                            currBitacoraModulo.setIdBitacora(rs.getInt("FIBITACORAID"));
                            currBitacoraModulo.setIdPais(rs.getInt("FIPAISID"));
                            currBitacoraModulo.setIdSucursal(rs.getInt("FISUCURSALID"));
                            currBitacoraModulo.setIdModulo(rs.getInt("FIMODULOID"));
                            currBitacoraModulo.setPrioridad(rs.getString("FCDESCPRIORIDAD"));
                            currBitacoraModulo.setNoEmpleado(rs.getInt("FCEMPNO"));
                            currBitacoraModulo.setTitulo(rs.getString("FCDESCTITULO"));
                            currBitacoraModulo.setObservacion(rs.getString("FCOBSERVACIONES"));
                            currBitacoraModulo.setFecha(sdfFecha.format(rs.getTimestamp("FDFECHAOBSERV")) + " hrs");
                            
                            mapReturn.put(
                                currBitacoraModulo.getIdSucursal(), 
                                currBitacoraModulo);
                        }
                        return mapReturn;
                    }
                });
        } catch (Exception e) {
            mapReturn = new HashMap<Integer, CjCRBitacoraModulo>();
            LOGGER.error(CjCRPropertyUtils.getProperty("error.sentence.execution"), e);
        }
        return mapReturn;
    }

   
}
', '', '2014-07-31 18:54:23.999', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (12, 12, 3, 'h1. Control de asistencias

Para realizar el control de asistencias y poder justificar retardos o registros fuera de horario debe llenarse el formato anexo. Es estríctamente necesario que se respete el formato original del archivo, en caso de que no tenga el formato no será tomado en cuenta por el área encargada de este control.

Ruta para depositar asistencias desarrolladores Java
\\BAZ602066\Compartida2\Asistencias Acertum', '', '2014-08-01 16:57:13.569', 3);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (6, 6, 3, 'h1. Documentos técnicos

>* [[Manejo de Types Oracle en Java]]
>* [[Ejemplo clase DAO]]
>* [[Archivos Gradle]]
>* [[CollectionStructureArray]]
>* [[Tareas Gradle]]
>* [[Subversion]]', '', '2014-08-29 11:07:47.84', 6);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (16, 16, 3, 'h1. Subversion

*Subversion*
Instalar Tortoise SVN o el cliente SVN que ustedes prefieran.

*URL repo:*
http://10.51.214.96:9880/atncCtes/trunk/portal/

*Datos de sesión*
Usuario: numero de empleado (ej. 123456)
Password: num de empleado en sentido inverso (ej. 654321)', '', '2014-08-29 12:26:18.121', 2);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (2, 2, 1, 'h1. Wiki

>* [[Nomenclatura de proyectos]]
>* [[Instalación RPM]]
>* [[Estructura de proyectos]]
>* [[Documentos técnicos]]
>* [[Control de asistencias]]', '', '2014-10-13 11:36:41.964', 9);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (15, 15, 3, 'h1. Tareas Gradle

*Les comparto las tareas que Giovanni nos ayudó a configurar para Netbeans:*

(Project > Properties > Manage Taks ) 
Add New ...

+Debug+
	display name: jettyDebug

	tasks: jettyStop clean build jettyRun
	
	arguments: --stacktrace

	JVM arguments:-Xdebug -Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=n


	Escuchador para debug (Debug > Attach Debugger...):
		connector: SoccketAttach (Attaches by socket to other VMs)
		Transport: dt_socket
		Host: <<TU_EQUIPO>> (por default carga el nombre)
		Port: 9999


+Run+

	display name: jettyRun

	tasks: jettyStop clean build jettyRun

	arguments: --stacktrace


+Stop+

	display name: jettyStop

	tasks: jettyStop

	arguments: --stacktrace', '', '2014-08-27 19:40:02.105', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (17, 17, 1, 'h2. SP Types Oracle

h3. Generación de tipo objeto

<pre>
create or replace TYPE TYENTRY AS OBJECT 
(
  FIID NUMBER,
  FCVALUE VARCHAR2(25),
  FISTATUS NUMBER,
  FDDATE TIMESTAMP
);
</pre>

h3. Generación de tipo objeto tabla
<pre>
create or replace TYPE TYENTRYTA 
AS TABLE OF TYENTRY;
</pre>

h3. Contrato de SPs
<pre>
create or replace PACKAGE            PKGPRACTICE01
AS

PROCEDURE SPGENERATEDATA(paNUM               IN NUMBER
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2);

PROCEDURE SPINSERTDATA(paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                      ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                      ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                      ,paENTRIES          IN USRCAJADES.TYENTRYTA
                      ,paID               OUT USRCAJADES.TAPRACDATA.FIID%TYPE
                      ,paCODEERROR        OUT NUMBER
                      ,paDESCERROR        OUT VARCHAR2);

PROCEDURE SPUPDATEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                      ,paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                      ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                      ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                      ,paENTRIES          IN USRCAJADES.TYENTRYTA
                      ,paCODEERROR        OUT NUMBER
                      ,paDESCERROR        OUT VARCHAR2);

PROCEDURE SPDELETEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                      ,paENTRIES          IN USRCAJADES.TYENTRYTA
                      ,paCODEERROR        OUT NUMBER
                      ,paDESCERROR        OUT VARCHAR2);

FUNCTION FNSELECTDATA(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
    RETURN USRCAJADES.PATYPES.CURTYPE;

FUNCTION FNSELECTENTRY(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
    RETURN USRCAJADES.TYENTRYTA;

END PKGPRACTICE01;
</pre>

h3. Cuerpo de SPs
<pre>
create or replace PACKAGE BODY            PKGPRACTICE01
AS 
  PROCEDURE SPGENERATEDATA(paNUM               IN NUMBER
                          ,paCODEERROR        OUT NUMBER
                          ,paDESCERROR        OUT VARCHAR2) 
  IS  
    vaIDBASE            USRCAJADES.TAPRACDATA.FIID%TYPE;
    vaIDTMP             USRCAJADES.TAPRACDATA.FIID%TYPE;
    vaNOELEMENTS        NUMBER;
    vaDATE              DATE;    
  BEGIN
    paCODEERROR := 1; 
    paDESCERROR := NULL;
      
    SELECT DECODE(MAX(FIID), NULL, 0) 
      INTO vaIDBASE
      FROM USRCAJADES.TAPRACDATA;
    
    FOR i IN 1..paNUM LOOP
      vaNOELEMENTS := ROUND(DBMS_RANDOM.value(1, 10));
      vaIDTMP := (vaIDBASE + i);
      
      INSERT INTO TAPRACDATA(FIID
                            ,FCDESCRIPTION
                            ,FIMIN
                            ,FIMAX) 
                            VALUES(vaIDTMP
                                  ,DBMS_RANDOM.string(''U'', 10)
                                  ,ROUND(DBMS_RANDOM.value(1, 5))
                                  ,ROUND(DBMS_RANDOM.value(1, 25)));
      
      FOR j IN 1..vaNOELEMENTS LOOP
        SELECT CURRENT_DATE + (ROUND(DBMS_RANDOM.value(-25, 25))) 
          INTO vaDATE
          FROM DUAL;
        
        INSERT INTO TAPRACENTRY(FIIDDATA
                               ,FIIDENTRY
                               ,FCVALUE
                               ,FISTATUS
                               ,FDDATE) 
                                VALUES(vaIDTMP
                                      ,j
                                      ,DBMS_RANDOM.string(''L'', 10)
                                      ,ROUND(DBMS_RANDOM.value(1, 5))
                                      ,vaDATE);
      END LOOP;
    END LOOP;
        
    EXCEPTION   
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM;  
  END SPGENERATEDATA;
  
  
  PROCEDURE SPINSERTDATA(paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                        ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                        ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                        ,paENTRIES          IN USRCAJADES.TYENTRYTA
                        ,paID               OUT USRCAJADES.TAPRACDATA.FIID%TYPE
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2)
  IS   
    vaIDBASE            USRCAJADES.TAPRACDATA.FIID%TYPE;
  BEGIN
    paCODEERROR := 1; 
    paDESCERROR := NULL;
    
    SELECT DECODE(MAX(FIID), NULL, 0) + 1
      INTO vaIDBASE
      FROM USRCAJADES.TAPRACDATA;
      
    INSERT INTO TAPRACDATA(FIID
                          ,FCDESCRIPTION
                          ,FIMIN
                          ,FIMAX) 
                          VALUES(vaIDBASE
                                ,paDESCRIPTION
                                ,paMIN
                                ,paMAX);
        
    FOR i IN paENTRIES.FIRST .. paENTRIES.LAST LOOP
      INSERT INTO TAPRACENTRY(FIIDDATA
                             ,FIIDENTRY
                             ,FCVALUE
                             ,FISTATUS
                             ,FDDATE) 
                             VALUES(vaIDBASE
                                   ,paENTRIES(i).FIID
                                   ,paENTRIES(i).FCVALUE
                                   ,paENTRIES(i).FISTATUS
                                   ,paENTRIES(i).FDDATE);
    END LOOP;
    
    EXCEPTION
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM; 
  END SPINSERTDATA;   


  PROCEDURE SPUPDATEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                        ,paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                        ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                        ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                        ,paENTRIES          IN USRCAJADES.TYENTRYTA
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2)
  IS   
    vaID        USRCAJADES.TAPRACDATA.FIID%TYPE;   
  BEGIN
    paCODEERROR := 1; 
    paDESCERROR := NULL;
    
    UPDATE USRCAJADES.TAPRACDATA
      SET FCDESCRIPTION = paDESCRIPTION,
          FIMIN = paMIN,
          FIMAX = paMAX
      WHERE FIID = paID;
    
    DELETE 
      FROM USRCAJADES.TAPRACENTRY
      WHERE FIIDDATA = paID;
    
    FOR i IN paENTRIES.FIRST .. paENTRIES.LAST LOOP
      INSERT INTO TAPRACENTRY(FIIDDATA
                             ,FIIDENTRY
                             ,FCVALUE
                             ,FISTATUS
                             ,FDDATE) 
                             VALUES(paID
                                   ,paENTRIES(i).FIID
                                   ,paENTRIES(i).FCVALUE
                                   ,paENTRIES(i).FISTATUS
                                   ,paENTRIES(i).FDDATE);
    END LOOP;
    
    EXCEPTION   
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM;  
  END SPUPDATEDATA;


  PROCEDURE SPDELETEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                        ,paENTRIES          IN USRCAJADES.TYENTRYTA
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2) 
  IS
   
  BEGIN
    FOR i IN paENTRIES.FIRST .. paENTRIES.LAST LOOP
      DELETE 
        FROM USRCAJADES.TAPRACENTRY 
        WHERE FIIDDATA = paID
          AND FIIDENTRY = paENTRIES(i).FIID;
    END LOOP;
    
    DELETE 
      FROM USRCAJADES.TAPRACDATA
      WHERE FIID = paID;
        
    EXCEPTION   
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM;  
  END SPDELETEDATA;


  FUNCTION FNSELECTDATA(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
      RETURN USRCAJADES.PATYPES.CURTYPE 
  IS   
    curRESTRICC        USRCAJADES.PATYPES.CURTYPE;
    vaOPCION           INTEGER;
  BEGIN
    SELECT DECODE(paID, NULL, 0)
        INTO vaOPCION
        FROM DUAL;
        
    CASE vaOPCION
      WHEN 0 THEN
        OPEN curRESTRICC FOR      
          SELECT FIID
                ,FCDESCRIPTION
                ,FIMIN
                ,FIMAX
                ,FNSELECTENTRY(FIID)
            FROM USRCAJADES.TAPRACDATA;
      ELSE
        OPEN curRESTRICC FOR      
          SELECT FIID
                ,FCDESCRIPTION
                ,FIMIN
                ,FIMAX
                ,FNSELECTENTRY(FIID)
            FROM USRCAJADES.TAPRACDATA
            WHERE FIID = paID;
    END CASE;

    RETURN curRESTRICC;
   END FNSELECTDATA;
   
   
   FUNCTION FNSELECTENTRY(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
    RETURN USRCAJADES.TYENTRYTA
  IS   
    vaENTRIES USRCAJADES.TYENTRYTA;
  BEGIN
    SELECT USRCAJADES.TYENTRY(ROWENTRY.FIIDENTRY
                             ,ROWENTRY.FCVALUE
                             ,ROWENTRY.FISTATUS
                             ,ROWENTRY.FDDATE) 
          BULK COLLECT INTO vaENTRIES
        FROM USRCAJADES.TAPRACENTRY ROWENTRY
        WHERE FIIDDATA = paID;

    RETURN vaENTRIES;
   END FNSELECTENTRY;
END PKGPRACTICE01;
</pre>', '', '2014-09-11 20:35:56.78', 3);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (18, 18, 12, 'h1. SP Types Oracle

h2. SP Types Oracle

h3. Generación de tipo objeto

<pre>
create or replace TYPE TYENTRY AS OBJECT 
(
  FIID NUMBER,
  FCVALUE VARCHAR2(25),
  FISTATUS NUMBER,
  FDDATE TIMESTAMP
);
</pre>

h3. Generación de tipo objeto tabla
<pre>
create or replace TYPE TYENTRYTA 
AS TABLE OF TYENTRY;
</pre>

h3. Contrato de SPs
<pre>
create or replace PACKAGE            PKGPRACTICE01
AS

PROCEDURE SPGENERATEDATA(paNUM               IN NUMBER
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2);

PROCEDURE SPINSERTDATA(paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                      ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                      ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                      ,paENTRIES          IN USRCAJADES.TYENTRYTA
                      ,paID               OUT USRCAJADES.TAPRACDATA.FIID%TYPE
                      ,paCODEERROR        OUT NUMBER
                      ,paDESCERROR        OUT VARCHAR2);

PROCEDURE SPUPDATEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                      ,paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                      ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                      ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                      ,paENTRIES          IN USRCAJADES.TYENTRYTA
                      ,paCODEERROR        OUT NUMBER
                      ,paDESCERROR        OUT VARCHAR2);

PROCEDURE SPDELETEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                      ,paENTRIES          IN USRCAJADES.TYENTRYTA
                      ,paCODEERROR        OUT NUMBER
                      ,paDESCERROR        OUT VARCHAR2);

FUNCTION FNSELECTDATA(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
    RETURN USRCAJADES.PATYPES.CURTYPE;

FUNCTION FNSELECTENTRY(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
    RETURN USRCAJADES.TYENTRYTA;

END PKGPRACTICE01;
</pre>

h3. Cuerpo de SPs
<pre>
create or replace PACKAGE BODY            PKGPRACTICE01
AS 
  PROCEDURE SPGENERATEDATA(paNUM               IN NUMBER
                          ,paCODEERROR        OUT NUMBER
                          ,paDESCERROR        OUT VARCHAR2) 
  IS  
    vaIDBASE            USRCAJADES.TAPRACDATA.FIID%TYPE;
    vaIDTMP             USRCAJADES.TAPRACDATA.FIID%TYPE;
    vaNOELEMENTS        NUMBER;
    vaDATE              DATE;    
  BEGIN
    paCODEERROR := 1; 
    paDESCERROR := NULL;
      
    SELECT DECODE(MAX(FIID), NULL, 0) 
      INTO vaIDBASE
      FROM USRCAJADES.TAPRACDATA;
    
    FOR i IN 1..paNUM LOOP
      vaNOELEMENTS := ROUND(DBMS_RANDOM.value(1, 10));
      vaIDTMP := (vaIDBASE + i);
      
      INSERT INTO TAPRACDATA(FIID
                            ,FCDESCRIPTION
                            ,FIMIN
                            ,FIMAX) 
                            VALUES(vaIDTMP
                                  ,DBMS_RANDOM.string(''U'', 10)
                                  ,ROUND(DBMS_RANDOM.value(1, 5))
                                  ,ROUND(DBMS_RANDOM.value(1, 25)));
      
      FOR j IN 1..vaNOELEMENTS LOOP
        SELECT CURRENT_DATE + (ROUND(DBMS_RANDOM.value(-25, 25))) 
          INTO vaDATE
          FROM DUAL;
        
        INSERT INTO TAPRACENTRY(FIIDDATA
                               ,FIIDENTRY
                               ,FCVALUE
                               ,FISTATUS
                               ,FDDATE) 
                                VALUES(vaIDTMP
                                      ,j
                                      ,DBMS_RANDOM.string(''L'', 10)
                                      ,ROUND(DBMS_RANDOM.value(1, 5))
                                      ,vaDATE);
      END LOOP;
    END LOOP;
        
    EXCEPTION   
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM;  
  END SPGENERATEDATA;
  
  
  PROCEDURE SPINSERTDATA(paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                        ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                        ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                        ,paENTRIES          IN USRCAJADES.TYENTRYTA
                        ,paID               OUT USRCAJADES.TAPRACDATA.FIID%TYPE
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2)
  IS   
    vaIDBASE            USRCAJADES.TAPRACDATA.FIID%TYPE;
  BEGIN
    paCODEERROR := 1; 
    paDESCERROR := NULL;
    
    SELECT DECODE(MAX(FIID), NULL, 0) + 1
      INTO vaIDBASE
      FROM USRCAJADES.TAPRACDATA;
      
    INSERT INTO TAPRACDATA(FIID
                          ,FCDESCRIPTION
                          ,FIMIN
                          ,FIMAX) 
                          VALUES(vaIDBASE
                                ,paDESCRIPTION
                                ,paMIN
                                ,paMAX);
        
    FOR i IN paENTRIES.FIRST .. paENTRIES.LAST LOOP
      INSERT INTO TAPRACENTRY(FIIDDATA
                             ,FIIDENTRY
                             ,FCVALUE
                             ,FISTATUS
                             ,FDDATE) 
                             VALUES(vaIDBASE
                                   ,paENTRIES(i).FIID
                                   ,paENTRIES(i).FCVALUE
                                   ,paENTRIES(i).FISTATUS
                                   ,paENTRIES(i).FDDATE);
    END LOOP;
    
    EXCEPTION
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM; 
  END SPINSERTDATA;   


  PROCEDURE SPUPDATEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                        ,paDESCRIPTION      IN USRCAJADES.TAPRACDATA.FCDESCRIPTION%TYPE
                        ,paMIN              IN USRCAJADES.TAPRACDATA.FIMIN%TYPE
                        ,paMAX              IN USRCAJADES.TAPRACDATA.FIMAX%TYPE
                        ,paENTRIES          IN USRCAJADES.TYENTRYTA
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2)
  IS   
    vaID        USRCAJADES.TAPRACDATA.FIID%TYPE;   
  BEGIN
    paCODEERROR := 1; 
    paDESCERROR := NULL;
    
    UPDATE USRCAJADES.TAPRACDATA
      SET FCDESCRIPTION = paDESCRIPTION,
          FIMIN = paMIN,
          FIMAX = paMAX
      WHERE FIID = paID;
    
    DELETE 
      FROM USRCAJADES.TAPRACENTRY
      WHERE FIIDDATA = paID;
    
    FOR i IN paENTRIES.FIRST .. paENTRIES.LAST LOOP
      INSERT INTO TAPRACENTRY(FIIDDATA
                             ,FIIDENTRY
                             ,FCVALUE
                             ,FISTATUS
                             ,FDDATE) 
                             VALUES(paID
                                   ,paENTRIES(i).FIID
                                   ,paENTRIES(i).FCVALUE
                                   ,paENTRIES(i).FISTATUS
                                   ,paENTRIES(i).FDDATE);
    END LOOP;
    
    EXCEPTION   
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM;  
  END SPUPDATEDATA;


  PROCEDURE SPDELETEDATA(paID               IN USRCAJADES.TAPRACDATA.FIID%TYPE
                        ,paENTRIES          IN USRCAJADES.TYENTRYTA
                        ,paCODEERROR        OUT NUMBER
                        ,paDESCERROR        OUT VARCHAR2) 
  IS
   
  BEGIN
    FOR i IN paENTRIES.FIRST .. paENTRIES.LAST LOOP
      DELETE 
        FROM USRCAJADES.TAPRACENTRY 
        WHERE FIIDDATA = paID
          AND FIIDENTRY = paENTRIES(i).FIID;
    END LOOP;
    
    DELETE 
      FROM USRCAJADES.TAPRACDATA
      WHERE FIID = paID;
        
    EXCEPTION   
      WHEN OTHERS THEN
        paCODEERROR := SQLCODE; 
        paDESCERROR := SQLERRM;  
  END SPDELETEDATA;


  FUNCTION FNSELECTDATA(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
      RETURN USRCAJADES.PATYPES.CURTYPE 
  IS   
    curRESTRICC        USRCAJADES.PATYPES.CURTYPE;
    vaOPCION           INTEGER;
  BEGIN
    SELECT DECODE(paID, NULL, 0)
        INTO vaOPCION
        FROM DUAL;
        
    CASE vaOPCION
      WHEN 0 THEN
        OPEN curRESTRICC FOR      
          SELECT FIID
                ,FCDESCRIPTION
                ,FIMIN
                ,FIMAX
                ,FNSELECTENTRY(FIID)
            FROM USRCAJADES.TAPRACDATA;
      ELSE
        OPEN curRESTRICC FOR      
          SELECT FIID
                ,FCDESCRIPTION
                ,FIMIN
                ,FIMAX
                ,FNSELECTENTRY(FIID)
            FROM USRCAJADES.TAPRACDATA
            WHERE FIID = paID;
    END CASE;

    RETURN curRESTRICC;
   END FNSELECTDATA;
   
   
   FUNCTION FNSELECTENTRY(paID        IN USRCAJADES.TAPRACDATA.FIID%TYPE)
    RETURN USRCAJADES.TYENTRYTA
  IS   
    vaENTRIES USRCAJADES.TYENTRYTA;
  BEGIN
    SELECT USRCAJADES.TYENTRY(ROWENTRY.FIIDENTRY
                             ,ROWENTRY.FCVALUE
                             ,ROWENTRY.FISTATUS
                             ,ROWENTRY.FDDATE) 
          BULK COLLECT INTO vaENTRIES
        FROM USRCAJADES.TAPRACENTRY ROWENTRY
        WHERE FIIDDATA = paID;

    RETURN vaENTRIES;
   END FNSELECTENTRY;
END PKGPRACTICE01;
</pre>', '', '2014-09-12 09:58:56.95', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (14, 14, 1, 'h1. Wiki

* [[SP Types Oracle]]
* [[Plugin Gretty]]', '', '2014-09-23 11:26:07.383', 4);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (19, 19, 1, 'h1. Plugin Gretty

h2. Gretty

https://github.com/akhikhl/gretty

h2. Scripts de configuración

build.gradle
gradle.properties
settings.gradle

h2. Tareas Gradle - Gretty (NetBeans)

(Project > Properties > Manage Taks ) 
Add New ...


h3. Build

display name:
<pre>
build
</pre>

tasks:
<pre>
clean build 
</pre>

arguments:
<pre>
--stacktrace
-x:test
-x:javadocJar
-x:sourcesJar
</pre>


h3. Debug

display name:
<pre>
debug
</pre>

tasks:
<pre>
clean build appRunDebug 
</pre>

arguments:
<pre>
--stacktrace
-x:test
-x:javadocJar
-x:sourcesJar
-x:war
</pre>

Escuchador para debug (Debug > Attach Debugger...):
<pre>
connector: SoccketAttach (Attaches by socket to other VMs)
Transport: dt_socket
Host: <<TU_EQUIPO>> (por default carga el nombre)
Port: 5005
</pre>


h3. Run

display name:
<pre>
run
</pre>

tasks:
<pre>
clean build appRun 
</pre>

arguments:
<pre>
--stacktrace
-x:test
-x:javadocJar
-x:sourcesJar
-x:war
</pre>


h3. Test

display name:
<pre>
test
</pre>

tasks:
<pre>
cleanTest test 
</pre>

arguments:
<pre>
--stacktrace
-x:javadocJar
-x:sourcesJar
-x:war
</pre>

JVM arguments:
<pre>
-Xdebug
-Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=n
</pre>

Escuchador para debug (Debug > Attach Debugger...):
<pre>
connector: SoccketAttach (Attaches by socket to other VMs)
Transport: dt_socket
Host: <<TU_EQUIPO>> (por default carga el nombre)
Port: 9999
</pre>
', '', '2014-10-06 19:33:21.008', 2);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (20, 20, 1, 'h1. Wiki

>* [[Task Manager]]', '', '2014-10-13 11:17:47.635', 1);
INSERT INTO wiki_contents (id, page_id, author_id, text, comments, updated_on, version) VALUES (21, 21, 1, 'h1. Task Manager

Este proyecto es el responsable de la calendarización y ejecución de procesos en los servidores de Sistemas Centralizados de Caja.

h2. Manual de Configuración

a) El registro de los procesos se realiza en la tabla TACJTMTAREA y las configuraciones en TACJTMCONFIG. Son considerados procesos activos aquellos que tengan status 1, por lo tanto, aquellos procesos que ya hayan sido registrados en el scheduler, si en su registro pasan a un status diferente de 1, se eliminarán del scheduler. En esta última parte se debe de tener cuidado de no desactivar el proceso administrador, pues todos los demás procesos si se pueden recuperar con solo actualizar el status a 1.

La referencia al proceso de administrador se encuentra en el application.properties:

manager.name=Manager

manager.group=admin

El proceso administrador se configura al iniciar la aplicación y se encarga de actualizar la actividad de los Jobs y las configuraciones respectivas.

b) Los registros de TACJTMCONFIG contienen las configuraciones de los triggers de los Jobs, y un Job puede tener N configuraciones activas bajo las siguientes condiciones: 

* Deben tener status 1

* Las configuraciones que se actualicen en su cadena de cadena cron o parámetros de ejecución, requieren de la actualización de FIVERSION para que se pueda registrar la configuración; una configuración que no tenga un número de versión distinta de una versión ya registrada no será considerada.

c) Es posible la reanudación a nivel de tareas y a nivel de configuraciones. La reanudación a nivel de tareas aplica cuando una tarea existente que se encuentre con status diferente de 1 (operación de desactivación) vuelve a tener status 1, se asigna al scheduler con las configuraciones respectivas. De igual manera, cuando una configuración existente que se encuentre con un status diferente de 1 (operación de desactivación) vuelve a tener status 1, se asigna al listado de configuraciones de la tarea (la tarea debe estar activa, de lo contrario no de reflejaría el cambio). Para la desactivación y reanudación de configuración de tarea no es necesario cambiar de versión. La única tarea que no puede ser reanudada ni a nivel de tarea ni a nivel de configuración, es el proceso administrador.

d) Cualquier proceso de reanudación posibilita el reinicio de las versiones en las configuraciones. Para una tarea desactivada es posible actualizar todas las versiones de sus configuraciones y durante la reanudación, las configuraciones se considerarán con respecto a su versión actualizada. Para una configuración desactivada es posible actualizar su versión y durante su reanudación, la configuración se considerará con su versión actualizada. 

e) La configuración para la ejecución de los procesos basados en línea de comandos es la siguiente:

TACJTMTAREA.fcruta = Ruta del directorio de trabajo (ej. /Users/gfarfanb/Downloads/temp/)

TACJTMTAREA.fccommand = Comando de ejecución (ej. java)

TACJTMCONFIG.fccron = Configuración de la calendarización del proceso (ej. 0 0/1 * 1/1 * ? *)

TACJTMCONFIG.fcparametros = Parámetros para la ejecución del comando (ej. -jar cjcrp-gams-process.jar) 

f) Todos los procesos realizan el siguiente flujo:

* Inicialización de componentes (asociación con clases del contexto de Spring y referencia a modelo basado en base de datos)

* Actualización del la fecha en el registro de base de datos (tabla TACJTMTAREA)

* Pausa de los procesos dependientes

* Lógica del proceso de acuerdo a su tipo (ej. Administrador, ejecución desde línea de comandos)

* Reanudación de procesos dependientes

g) La dependencia se realiza a nivel de Job y no parece haber problema durante la reanudación; el control de la dependencia tiene sentido para el retraso en los procesos, sería recomendable una calendarización planeada para no causar alguna clase de conflicto que no se pudiera controlar.

h) Se recomienda definir configuraciones con tiempo de holgura de al menos dos minutos, para permitir el registro de la configuración sin interferir con el tiempo calendarizado para la ejecución.

h2. Creación de Cadenas Cron

Se encontró la siguiente aplicación web para poder generar cadenas cron en base a un formulario bastante amigable.

http://www.cronmaker.com/

h2. Scripts para BD

h3. Tipos de tareas

Con los siguientes scripts se dieron de alta los tipos de tareas:

<pre>
INSERT INTO CAJA.TCCJTMTIPOTAREA (FITIPOID,FCDESCRIPCION,FCUSERINSTIPOT,FDFECHAINSTIPOT,FCUSERMODIF,FDFECHAMODIF) VALUES(1,''Proceso de administración interno'',''702600'',sysdate,''702600'',sysdate );
INSERT INTO CAJA.TCCJTMTIPOTAREA (FITIPOID,FCDESCRIPCION,FCUSERINSTIPOT,FDFECHAINSTIPOT,FCUSERMODIF,FDFECHAMODIF) VALUES(2,''Proceso de ejecutables basado en comandos'',''702600'',sysdate,''702600'',sysdate );
</pre>

h3. Tareas

Con los siguientes scripts se dieron de alta las tareas:

<pre>
INSERT INTO caja.TACJTMTAREA(FCNOMBRE, FCGRUPO, FITIPOID, FCDESCRIPCION, FCRUTA, FCCOMMAND, FISTATUS,FCUSERINSTAREA,FDFECHAINSTAREA,FCUSERMODIF,FDFECHAMODIF)  VALUES(''Manager'', ''admin'', 1, ''Administrador de procesos'', null, null, 1, ''702600'' , sysdate,''702600'' , sysdate);
INSERT INTO caja.TACJTMTAREA(FCNOMBRE, FCGRUPO, FITIPOID, FCDESCRIPCION, FCRUTA, FCCOMMAND, FISTATUS,FCUSERINSTAREA,FDFECHAINSTAREA,FCUSERMODIF,FDFECHAMODIF)  VALUES(''Geografias'', ''GEO'', 2, ''Proceso Geografias'', ''C:\SCC\PROCESOS'', ''java'', 1, ''702600'' , sysdate,''702600'' , sysdate);
INSERT INTO caja.TACJTMTAREA(FCNOMBRE, FCGRUPO, FITIPOID, FCDESCRIPCION, FCRUTA, FCCOMMAND, FISTATUS,FCUSERINSTAREA,FDFECHAINSTAREA,FCUSERMODIF,FDFECHAMODIF)  VALUES(''Costoxtransaccion'', ''CXT'', 2, ''Proceso Costo por transaccion'', ''C:\SCC\PROCESOS'', ''java'', 1, ''702600'' , sysdate,''702600'' , sysdate);

-- Ruta para procesos: C:\SCC\PROCESOS
-- Ruta de aplicaciones windows: C:\System32\Windows
</pre>

h3. Configuraciones

Con los siguientes scripts se dieron de alta las primeras configuraciones de prueba:

<pre>
INSERT INTO caja.TACJTMCONFIG(FICONFIGID,FCNOMBRE, FCGRUPO ,FIVERSION, FCCRON, FCPARAMETROS, FISTATUS, FCUSERINSCONFIG,FDFECHAINSCONFIG,FCUSERMODIF,FDFECHAMODIF) VALUES(1,''Manager'', ''admin'',1, ''0 0/1 * 1/1 * ? *'', null, 1, ''702600'' , sysdate,''702600'' , sysdate);
INSERT INTO caja.TACJTMCONFIG(FICONFIGID,FCNOMBRE, FCGRUPO ,FIVERSION, FCCRON, FCPARAMETROS, FISTATUS, FCUSERINSCONFIG,FDFECHAINSCONFIG,FCUSERMODIF,FDFECHAMODIF) VALUES(2,''Geografias'', ''GEO'',1, ''0 11 17 1/1 * ? *'', ''-jar cjcrp-geografia-1.0.jar'', 1, ''702600'' , sysdate,''702600'' , sysdate);
INSERT INTO caja.TACJTMCONFIG(FICONFIGID,FCNOMBRE, FCGRUPO ,FIVERSION, FCCRON, FCPARAMETROS, FISTATUS, FCUSERINSCONFIG,FDFECHAINSCONFIG,FCUSERMODIF,FDFECHAMODIF) VALUES(3,''Costoxtransaccion'', ''CXT'',1, ''0 22 17 1/1 * ? *'', ''-Dproceso.modo=automatico -jar cjcrp-calculoCxT-1.0.jar'', 1, ''702600'' , sysdate,''702600'' , sysdate);
</pre>

h3. Actualización de configuración

Se puede utilizar el siguiente script para actualizar una configuración:
Notas: Es importante actualizar la versión de la configuración o no se tomará el cambio.
Notas: Por seguridad se incluye en el filtro el proyecto, aunque no es necesario.

<pre>
UPDATE CAJA.TACJTMCONFIG SET FCCRON = ''0 43 17 1/1 * ? *'', FIVERSION = FIVERSION + 1 WHERE FICONFIGID = 2 AND FCGRUPO = ''GEO'';
</pre>


', '', '2014-10-13 12:08:24.077', 1);


--
-- TOC entry 2776 (class 0 OID 0)
-- Dependencies: 252
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('wiki_contents_id_seq', 21, true);


--
-- TOC entry 2683 (class 0 OID 16817)
-- Dependencies: 253
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (2, 1, 'Wiki', '2014-07-25 12:54:38.323', false, NULL);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (3, 1, 'Nomenclatura_de_proyectos', '2014-07-25 12:57:05.118', false, 2);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (4, 1, 'Instalación_RPM', '2014-07-25 13:05:12.991', false, 2);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (5, 1, 'Estructura_de_proyectos', '2014-07-25 13:24:10.173', false, 2);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (6, 1, 'Documentos_técnicos', '2014-07-25 17:44:49.113', false, 2);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (7, 1, 'Manejo_de_Types_Oracle_en_Java', '2014-07-25 17:44:59.435', false, 6);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (8, 1, 'Ejemplo_clase_DAO', '2014-07-28 12:02:47.171', false, 6);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (9, 1, 'Archivos_Gradle', '2014-07-28 17:41:38.997', false, 6);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (11, 1, 'CollectionStructureArray', '2014-07-31 18:54:23.995', false, 6);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (12, 1, 'Control_de_asistencias', '2014-08-01 13:30:26.123', false, 2);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (14, 4, 'Wiki', '2014-08-18 13:40:11.427', false, NULL);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (15, 1, 'Tareas_Gradle', '2014-08-27 19:40:02.028', false, 6);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (16, 1, 'Subversion', '2014-08-29 11:14:41.549', false, 6);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (17, 4, 'SP_Types_Oracle', '2014-09-11 19:04:16.91', false, 14);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (19, 4, 'Plugin_Gretty', '2014-09-23 11:36:06.262', false, 14);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (18, 6, 'SP_Types_Oracle', '2014-09-12 09:58:56.947', false, NULL);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (20, 8, 'Wiki', '2014-10-13 11:17:47.573', false, NULL);
INSERT INTO wiki_pages (id, wiki_id, title, created_on, protected, parent_id) VALUES (21, 8, 'Task_Manager', '2014-10-13 12:08:24.061', false, 20);


--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 254
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('wiki_pages_id_seq', 21, true);


--
-- TOC entry 2685 (class 0 OID 16823)
-- Dependencies: 255
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO wiki_redirects (id, wiki_id, title, redirects_to, created_on) VALUES (1, 4, 'SP_Types', 'SP_Types_Oracle', '2014-09-11 20:35:19.463');


--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 256
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('wiki_redirects_id_seq', 1, true);


--
-- TOC entry 2687 (class 0 OID 16831)
-- Dependencies: 257
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO wikis (id, project_id, start_page, status) VALUES (1, 1, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (2, 2, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (3, 3, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (4, 4, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (5, 5, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (6, 6, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (7, 7, 'Wiki', 1);
INSERT INTO wikis (id, project_id, start_page, status) VALUES (8, 8, 'Wiki', 1);


--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 258
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('wikis_id_seq', 8, true);


--
-- TOC entry 2689 (class 0 OID 16837)
-- Dependencies: 259
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: redmine
--

INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (1, 1, 1, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (2, 1, 1, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (3, 1, 1, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (4, 1, 1, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (5, 1, 1, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (6, 1, 2, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (7, 1, 2, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (8, 1, 2, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (9, 1, 2, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (10, 1, 2, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (11, 1, 3, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (12, 1, 3, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (13, 1, 3, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (14, 1, 3, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (15, 1, 3, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (16, 1, 4, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (17, 1, 4, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (18, 1, 4, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (19, 1, 4, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (20, 1, 4, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (21, 1, 5, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (22, 1, 5, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (23, 1, 5, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (24, 1, 5, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (25, 1, 5, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (26, 1, 6, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (27, 1, 6, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (28, 1, 6, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (29, 1, 6, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (30, 1, 6, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (31, 2, 1, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (32, 2, 1, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (33, 2, 1, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (34, 2, 1, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (35, 2, 1, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (36, 2, 2, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (37, 2, 2, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (38, 2, 2, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (39, 2, 2, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (40, 2, 2, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (41, 2, 3, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (42, 2, 3, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (43, 2, 3, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (44, 2, 3, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (45, 2, 3, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (46, 2, 4, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (47, 2, 4, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (48, 2, 4, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (49, 2, 4, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (50, 2, 4, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (51, 2, 5, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (52, 2, 5, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (53, 2, 5, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (54, 2, 5, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (55, 2, 5, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (56, 2, 6, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (57, 2, 6, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (58, 2, 6, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (59, 2, 6, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (60, 2, 6, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (61, 3, 1, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (62, 3, 1, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (63, 3, 1, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (64, 3, 1, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (65, 3, 1, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (66, 3, 2, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (67, 3, 2, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (68, 3, 2, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (69, 3, 2, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (70, 3, 2, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (71, 3, 3, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (72, 3, 3, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (73, 3, 3, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (74, 3, 3, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (75, 3, 3, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (76, 3, 4, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (77, 3, 4, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (78, 3, 4, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (79, 3, 4, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (80, 3, 4, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (81, 3, 5, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (82, 3, 5, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (83, 3, 5, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (84, 3, 5, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (85, 3, 5, 6, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (86, 3, 6, 1, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (87, 3, 6, 2, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (88, 3, 6, 3, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (89, 3, 6, 4, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (90, 3, 6, 5, 3, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (91, 1, 1, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (92, 1, 1, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (93, 1, 1, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (94, 1, 1, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (95, 1, 2, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (96, 1, 2, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (97, 1, 2, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (98, 1, 3, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (99, 1, 3, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (100, 1, 3, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (101, 1, 4, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (102, 1, 4, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (103, 1, 4, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (104, 2, 1, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (105, 2, 1, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (106, 2, 1, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (107, 2, 1, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (108, 2, 2, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (109, 2, 2, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (110, 2, 2, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (111, 2, 3, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (112, 2, 3, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (113, 2, 3, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (114, 2, 4, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (115, 2, 4, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (116, 2, 4, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (117, 3, 1, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (118, 3, 1, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (119, 3, 1, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (120, 3, 1, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (121, 3, 2, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (122, 3, 2, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (123, 3, 2, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (124, 3, 3, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (125, 3, 3, 4, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (126, 3, 3, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (127, 3, 4, 2, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (128, 3, 4, 3, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (129, 3, 4, 5, 4, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (130, 1, 1, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (131, 1, 2, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (132, 1, 3, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (133, 1, 4, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (134, 1, 3, 4, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (135, 2, 1, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (136, 2, 2, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (137, 2, 3, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (138, 2, 4, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (139, 2, 3, 4, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (140, 3, 1, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (141, 3, 2, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (142, 3, 3, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (143, 3, 4, 5, 5, false, false, 'WorkflowTransition', NULL, NULL);
INSERT INTO workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) VALUES (144, 3, 3, 4, 5, false, false, 'WorkflowTransition', NULL, NULL);


--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 260
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('workflows_id_seq', 144, true);


--
-- TOC entry 2306 (class 2606 OID 16892)
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 16894)
-- Name: auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 16896)
-- Name: boards_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 16898)
-- Name: changes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 16900)
-- Name: changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 16902)
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 16904)
-- Name: custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 16906)
-- Name: custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 16908)
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 16910)
-- Name: enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 16912)
-- Name: enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 16914)
-- Name: issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 16916)
-- Name: issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 16918)
-- Name: issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 16920)
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 16922)
-- Name: journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 16924)
-- Name: journals_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 16926)
-- Name: member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 16928)
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 16930)
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 16932)
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 16934)
-- Name: open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 16936)
-- Name: open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 16938)
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 16940)
-- Name: queries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 16942)
-- Name: repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 16944)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 16946)
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 16948)
-- Name: time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 16950)
-- Name: tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 16952)
-- Name: trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 16954)
-- Name: user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 16956)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 16958)
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 16960)
-- Name: watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 16962)
-- Name: wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 16964)
-- Name: wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 16966)
-- Name: wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 16968)
-- Name: wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 16970)
-- Name: wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 16972)
-- Name: workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine; Tablespace: 
--

ALTER TABLE ONLY workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 1259 OID 16973)
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX boards_project_id ON boards USING btree (project_id);


--
-- TOC entry 2320 (class 1259 OID 16974)
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX changeset_parents_changeset_ids ON changeset_parents USING btree (changeset_id);


--
-- TOC entry 2321 (class 1259 OID 16975)
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX changeset_parents_parent_ids ON changeset_parents USING btree (parent_id);


--
-- TOC entry 2319 (class 1259 OID 16976)
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX changesets_changeset_id ON changes USING btree (changeset_id);


--
-- TOC entry 2329 (class 1259 OID 16977)
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX changesets_issues_ids ON changesets_issues USING btree (changeset_id, issue_id);


--
-- TOC entry 2324 (class 1259 OID 16978)
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX changesets_repos_rev ON changesets USING btree (repository_id, revision);


--
-- TOC entry 2325 (class 1259 OID 16979)
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX changesets_repos_scmid ON changesets USING btree (repository_id, scmid);


--
-- TOC entry 2338 (class 1259 OID 16980)
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON custom_fields_roles USING btree (custom_field_id, role_id);


--
-- TOC entry 2340 (class 1259 OID 16981)
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX custom_values_customized ON custom_values USING btree (customized_type, customized_id);


--
-- TOC entry 2346 (class 1259 OID 16982)
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX documents_project_id ON documents USING btree (project_id);


--
-- TOC entry 2351 (class 1259 OID 16983)
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX enabled_modules_project_id ON enabled_modules USING btree (project_id);


--
-- TOC entry 2356 (class 1259 OID 16984)
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX groups_users_ids ON groups_users USING btree (group_id, user_id);


--
-- TOC entry 2307 (class 1259 OID 16985)
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_attachments_on_author_id ON attachments USING btree (author_id);


--
-- TOC entry 2308 (class 1259 OID 16986)
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON attachments USING btree (container_id, container_type);


--
-- TOC entry 2309 (class 1259 OID 16987)
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_attachments_on_created_on ON attachments USING btree (created_on);


--
-- TOC entry 2312 (class 1259 OID 16988)
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_auth_sources_on_id_and_type ON auth_sources USING btree (id, type);


--
-- TOC entry 2316 (class 1259 OID 16989)
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_boards_on_last_message_id ON boards USING btree (last_message_id);


--
-- TOC entry 2326 (class 1259 OID 16990)
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_changesets_on_committed_on ON changesets USING btree (committed_on);


--
-- TOC entry 2327 (class 1259 OID 16991)
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_changesets_on_repository_id ON changesets USING btree (repository_id);


--
-- TOC entry 2328 (class 1259 OID 16992)
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_changesets_on_user_id ON changesets USING btree (user_id);


--
-- TOC entry 2332 (class 1259 OID 16993)
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_comments_on_author_id ON comments USING btree (author_id);


--
-- TOC entry 2333 (class 1259 OID 16994)
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON comments USING btree (commented_id, commented_type);


--
-- TOC entry 2336 (class 1259 OID 16995)
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_custom_fields_on_id_and_type ON custom_fields USING btree (id, type);


--
-- TOC entry 2337 (class 1259 OID 16996)
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON custom_fields_projects USING btree (custom_field_id, project_id);


--
-- TOC entry 2339 (class 1259 OID 16997)
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- TOC entry 2343 (class 1259 OID 16998)
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_custom_values_on_custom_field_id ON custom_values USING btree (custom_field_id);


--
-- TOC entry 2347 (class 1259 OID 16999)
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_documents_on_category_id ON documents USING btree (category_id);


--
-- TOC entry 2348 (class 1259 OID 17000)
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_documents_on_created_on ON documents USING btree (created_on);


--
-- TOC entry 2354 (class 1259 OID 17001)
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_enumerations_on_id_and_type ON enumerations USING btree (id, type);


--
-- TOC entry 2355 (class 1259 OID 17002)
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_enumerations_on_project_id ON enumerations USING btree (project_id);


--
-- TOC entry 2357 (class 1259 OID 17003)
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON issue_categories USING btree (assigned_to_id);


--
-- TOC entry 2361 (class 1259 OID 17004)
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issue_relations_on_issue_from_id ON issue_relations USING btree (issue_from_id);


--
-- TOC entry 2362 (class 1259 OID 17005)
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON issue_relations USING btree (issue_from_id, issue_to_id);


--
-- TOC entry 2363 (class 1259 OID 17006)
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issue_relations_on_issue_to_id ON issue_relations USING btree (issue_to_id);


--
-- TOC entry 2366 (class 1259 OID 17007)
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issue_statuses_on_is_closed ON issue_statuses USING btree (is_closed);


--
-- TOC entry 2367 (class 1259 OID 17008)
-- Name: index_issue_statuses_on_is_default; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issue_statuses_on_is_default ON issue_statuses USING btree (is_default);


--
-- TOC entry 2368 (class 1259 OID 17009)
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issue_statuses_on_position ON issue_statuses USING btree ("position");


--
-- TOC entry 2371 (class 1259 OID 17010)
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_assigned_to_id ON issues USING btree (assigned_to_id);


--
-- TOC entry 2372 (class 1259 OID 17011)
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_author_id ON issues USING btree (author_id);


--
-- TOC entry 2373 (class 1259 OID 17012)
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_category_id ON issues USING btree (category_id);


--
-- TOC entry 2374 (class 1259 OID 17013)
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_created_on ON issues USING btree (created_on);


--
-- TOC entry 2375 (class 1259 OID 17014)
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_fixed_version_id ON issues USING btree (fixed_version_id);


--
-- TOC entry 2376 (class 1259 OID 17015)
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_priority_id ON issues USING btree (priority_id);


--
-- TOC entry 2377 (class 1259 OID 17016)
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON issues USING btree (root_id, lft, rgt);


--
-- TOC entry 2378 (class 1259 OID 17017)
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_status_id ON issues USING btree (status_id);


--
-- TOC entry 2379 (class 1259 OID 17018)
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_issues_on_tracker_id ON issues USING btree (tracker_id);


--
-- TOC entry 2386 (class 1259 OID 17019)
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_journals_on_created_on ON journals USING btree (created_on);


--
-- TOC entry 2387 (class 1259 OID 17020)
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_journals_on_journalized_id ON journals USING btree (journalized_id);


--
-- TOC entry 2388 (class 1259 OID 17021)
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_journals_on_user_id ON journals USING btree (user_id);


--
-- TOC entry 2392 (class 1259 OID 17022)
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_member_roles_on_member_id ON member_roles USING btree (member_id);


--
-- TOC entry 2393 (class 1259 OID 17023)
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_member_roles_on_role_id ON member_roles USING btree (role_id);


--
-- TOC entry 2396 (class 1259 OID 17024)
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_members_on_project_id ON members USING btree (project_id);


--
-- TOC entry 2397 (class 1259 OID 17025)
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_members_on_user_id ON members USING btree (user_id);


--
-- TOC entry 2398 (class 1259 OID 17026)
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON members USING btree (user_id, project_id);


--
-- TOC entry 2401 (class 1259 OID 17027)
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_messages_on_author_id ON messages USING btree (author_id);


--
-- TOC entry 2402 (class 1259 OID 17028)
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_messages_on_created_on ON messages USING btree (created_on);


--
-- TOC entry 2403 (class 1259 OID 17029)
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_messages_on_last_reply_id ON messages USING btree (last_reply_id);


--
-- TOC entry 2408 (class 1259 OID 17030)
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_news_on_author_id ON news USING btree (author_id);


--
-- TOC entry 2409 (class 1259 OID 17031)
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_news_on_created_on ON news USING btree (created_on);


--
-- TOC entry 2417 (class 1259 OID 17032)
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_projects_on_lft ON projects USING btree (lft);


--
-- TOC entry 2418 (class 1259 OID 17033)
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_projects_on_rgt ON projects USING btree (rgt);


--
-- TOC entry 2423 (class 1259 OID 17034)
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_queries_on_project_id ON queries USING btree (project_id);


--
-- TOC entry 2424 (class 1259 OID 17035)
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_queries_on_user_id ON queries USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 17036)
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_repositories_on_project_id ON repositories USING btree (project_id);


--
-- TOC entry 2434 (class 1259 OID 17037)
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_settings_on_name ON settings USING btree (name);


--
-- TOC entry 2437 (class 1259 OID 17038)
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_time_entries_on_activity_id ON time_entries USING btree (activity_id);


--
-- TOC entry 2438 (class 1259 OID 17039)
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_time_entries_on_created_on ON time_entries USING btree (created_on);


--
-- TOC entry 2439 (class 1259 OID 17040)
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_time_entries_on_user_id ON time_entries USING btree (user_id);


--
-- TOC entry 2444 (class 1259 OID 17041)
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_tokens_on_user_id ON tokens USING btree (user_id);


--
-- TOC entry 2450 (class 1259 OID 17042)
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_user_preferences_on_user_id ON user_preferences USING btree (user_id);


--
-- TOC entry 2453 (class 1259 OID 17043)
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_users_on_auth_source_id ON users USING btree (auth_source_id);


--
-- TOC entry 2454 (class 1259 OID 17044)
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_users_on_id_and_type ON users USING btree (id, type);


--
-- TOC entry 2455 (class 1259 OID 17045)
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_users_on_type ON users USING btree (type);


--
-- TOC entry 2458 (class 1259 OID 17046)
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_versions_on_sharing ON versions USING btree (sharing);


--
-- TOC entry 2462 (class 1259 OID 17047)
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_watchers_on_user_id ON watchers USING btree (user_id);


--
-- TOC entry 2463 (class 1259 OID 17048)
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON watchers USING btree (watchable_id, watchable_type);


--
-- TOC entry 2467 (class 1259 OID 17049)
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON wiki_content_versions USING btree (updated_on);


--
-- TOC entry 2471 (class 1259 OID 17050)
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_wiki_contents_on_author_id ON wiki_contents USING btree (author_id);


--
-- TOC entry 2475 (class 1259 OID 17051)
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_wiki_pages_on_parent_id ON wiki_pages USING btree (parent_id);


--
-- TOC entry 2476 (class 1259 OID 17052)
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_wiki_pages_on_wiki_id ON wiki_pages USING btree (wiki_id);


--
-- TOC entry 2480 (class 1259 OID 17053)
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON wiki_redirects USING btree (wiki_id);


--
-- TOC entry 2487 (class 1259 OID 17054)
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_workflows_on_new_status_id ON workflows USING btree (new_status_id);


--
-- TOC entry 2488 (class 1259 OID 17055)
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_workflows_on_old_status_id ON workflows USING btree (old_status_id);


--
-- TOC entry 2489 (class 1259 OID 17056)
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX index_workflows_on_role_id ON workflows USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 17057)
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX issue_categories_project_id ON issue_categories USING btree (project_id);


--
-- TOC entry 2382 (class 1259 OID 17058)
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX issues_project_id ON issues USING btree (project_id);


--
-- TOC entry 2383 (class 1259 OID 17059)
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX journal_details_journal_id ON journal_details USING btree (journal_id);


--
-- TOC entry 2389 (class 1259 OID 17060)
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX journals_journalized_id ON journals USING btree (journalized_id, journalized_type);


--
-- TOC entry 2404 (class 1259 OID 17061)
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX messages_board_id ON messages USING btree (board_id);


--
-- TOC entry 2405 (class 1259 OID 17062)
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX messages_parent_id ON messages USING btree (parent_id);


--
-- TOC entry 2412 (class 1259 OID 17063)
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX news_project_id ON news USING btree (project_id);


--
-- TOC entry 2421 (class 1259 OID 17064)
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX projects_trackers_project_id ON projects_trackers USING btree (project_id);


--
-- TOC entry 2422 (class 1259 OID 17065)
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX projects_trackers_unique ON projects_trackers USING btree (project_id, tracker_id);


--
-- TOC entry 2427 (class 1259 OID 17066)
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX queries_roles_ids ON queries_roles USING btree (query_id, role_id);


--
-- TOC entry 2440 (class 1259 OID 17067)
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX time_entries_issue_id ON time_entries USING btree (issue_id);


--
-- TOC entry 2443 (class 1259 OID 17068)
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX time_entries_project_id ON time_entries USING btree (project_id);


--
-- TOC entry 2447 (class 1259 OID 17069)
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX tokens_value ON tokens USING btree (value);


--
-- TOC entry 2433 (class 1259 OID 17070)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- TOC entry 2461 (class 1259 OID 17071)
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX versions_project_id ON versions USING btree (project_id);


--
-- TOC entry 2466 (class 1259 OID 17072)
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX watchers_user_id_type ON watchers USING btree (user_id, watchable_type);


--
-- TOC entry 2470 (class 1259 OID 17073)
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX wiki_content_versions_wcid ON wiki_content_versions USING btree (wiki_content_id);


--
-- TOC entry 2472 (class 1259 OID 17074)
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX wiki_contents_page_id ON wiki_contents USING btree (page_id);


--
-- TOC entry 2479 (class 1259 OID 17075)
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX wiki_pages_wiki_id_title ON wiki_pages USING btree (wiki_id, title);


--
-- TOC entry 2483 (class 1259 OID 17076)
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX wiki_redirects_wiki_id_title ON wiki_redirects USING btree (wiki_id, title);


--
-- TOC entry 2486 (class 1259 OID 17077)
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX wikis_project_id ON wikis USING btree (project_id);


--
-- TOC entry 2490 (class 1259 OID 17078)
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: redmine; Tablespace: 
--

CREATE INDEX wkfs_role_tracker_old_status ON workflows USING btree (role_id, tracker_id, old_status_id);


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-10-15 11:04:52

--
-- PostgreSQL database dump complete
--

