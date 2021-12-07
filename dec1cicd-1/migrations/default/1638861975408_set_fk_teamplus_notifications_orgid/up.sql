alter table "teamplus"."notifications"
  add constraint "notifications_orgid_fkey"
  foreign key ("orgid")
  references "usermanagmentdb"."org"
  ("orgid") on update restrict on delete restrict;
