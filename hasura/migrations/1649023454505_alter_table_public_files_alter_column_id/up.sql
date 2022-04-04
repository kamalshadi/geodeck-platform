alter table "public"."files" alter column "id" set default nextval('files_id_seq'::regclass);
