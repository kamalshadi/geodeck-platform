alter table "public"."models" alter column "id" set default nextval('models_id_seq'::regclass);
