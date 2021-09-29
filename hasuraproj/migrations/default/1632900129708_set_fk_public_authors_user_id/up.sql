alter table "public"."authors"
  add constraint "authors_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("userId") on update restrict on delete restrict;
