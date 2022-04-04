alter table "public"."files" alter column "key" set default nextval('files_id_seq'::regclass);
