alter table "public"."plots" alter column "id" set default nextval('plots_id_seq'::regclass);
