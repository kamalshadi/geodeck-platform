alter table "public"."geometric_objects" alter column "id" set default nextval('geometric_objects_id_seq'::regclass);
