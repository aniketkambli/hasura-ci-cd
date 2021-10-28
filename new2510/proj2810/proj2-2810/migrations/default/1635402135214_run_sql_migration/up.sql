SET check_function_bodies = false;
CREATE SCHEMA userschema;
CREATE TABLE userschema.leaves (
    "leaveId" integer NOT NULL,
    type text NOT NULL,
    date date
);
CREATE SEQUENCE userschema."leaves_leaveId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE userschema."leaves_leaveId_seq" OWNED BY userschema.leaves."leaveId";
CREATE TABLE userschema."user" (
    "userId" integer NOT NULL,
    name text NOT NULL
);
ALTER TABLE ONLY userschema.leaves ALTER COLUMN "leaveId" SET DEFAULT nextval('userschema."leaves_leaveId_seq"'::regclass);
ALTER TABLE ONLY userschema.leaves
    ADD CONSTRAINT leaves_pkey PRIMARY KEY ("leaveId");
ALTER TABLE ONLY userschema."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userId");
