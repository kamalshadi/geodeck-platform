alter table "public"."projects" alter column "id" set default nextval('projects_id_seq'::regclass);
