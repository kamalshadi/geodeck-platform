alter table "public"."gallery" alter column "id" set default nextval('gallery_id_seq'::regclass);
