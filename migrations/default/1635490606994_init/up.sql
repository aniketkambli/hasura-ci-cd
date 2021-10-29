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
CREATE TABLE teamplus."Leaves" (
    leaveid uuid DEFAULT gen_random_uuid() NOT NULL,
    category text NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    orgid uuid
);
CREATE TABLE usermanagmentdb.org (
    orgid uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL
);
ALTER TABLE ONLY teamplus."Leaves"
    ADD CONSTRAINT "Leaves_pkey" PRIMARY KEY (leaveid);
ALTER TABLE ONLY usermanagmentdb.org
    ADD CONSTRAINT org_pkey PRIMARY KEY (orgid);
ALTER TABLE ONLY teamplus."Leaves"
    ADD CONSTRAINT "Leaves_orgid_fkey" FOREIGN KEY (orgid) REFERENCES usermanagmentdb.org(orgid) ON UPDATE RESTRICT ON DELETE RESTRICT;
