SET check_function_bodies = false;
CREATE TABLE public."user" (
    "userId" integer NOT NULL,
    name text
);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userId");
