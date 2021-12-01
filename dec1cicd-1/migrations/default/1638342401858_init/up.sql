SET check_function_bodies = false;
CREATE SCHEMA teamplus;
CREATE SCHEMA usermanagmentdb;
CREATE TABLE teamplus."ContactUs" (
    "requestId" uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "organizationId" uuid NOT NULL,
    "employeeId" uuid NOT NULL,
    title text,
    description text,
    severity text,
    "isBugPresent" boolean DEFAULT true NOT NULL,
    date date DEFAULT now() NOT NULL
);
CREATE TABLE teamplus."Invites" (
    "orgId" uuid NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    "teamId" uuid NOT NULL
);
CREATE TABLE teamplus."Leaves" (
    leaveid uuid DEFAULT gen_random_uuid() NOT NULL,
    category text NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    orgid uuid
);
CREATE TABLE usermanagmentdb.emp (
    empid uuid NOT NULL,
    orgid uuid NOT NULL
);
CREATE TABLE usermanagmentdb.org (
    orgid uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL
);
CREATE TABLE usermanagmentdb.team (
    teamid integer NOT NULL,
    teamname text NOT NULL
);
ALTER TABLE ONLY teamplus."Invites"
    ADD CONSTRAINT "Invites_pkey" PRIMARY KEY (email, "orgId");
ALTER TABLE ONLY teamplus."Leaves"
    ADD CONSTRAINT "Leaves_pkey" PRIMARY KEY (leaveid);
ALTER TABLE ONLY usermanagmentdb.emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empid);
ALTER TABLE ONLY usermanagmentdb.org
    ADD CONSTRAINT org_pkey PRIMARY KEY (orgid);
ALTER TABLE ONLY usermanagmentdb.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (teamid);
ALTER TABLE ONLY teamplus."Leaves"
    ADD CONSTRAINT "Leaves_orgid_fkey" FOREIGN KEY (orgid) REFERENCES usermanagmentdb.org(orgid) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY usermanagmentdb.emp
    ADD CONSTRAINT emp_orgid_fkey FOREIGN KEY (orgid) REFERENCES usermanagmentdb.org(orgid) ON UPDATE RESTRICT ON DELETE RESTRICT;
