ALTER TABLE ONLY userschema.leaves ALTER COLUMN "leaveId" SET DEFAULT nextval('userschema."leaves_leaveId_seq"'::regclass);
