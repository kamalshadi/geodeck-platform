--
-- Name: set_current_timestamp_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;


ALTER FUNCTION public.set_current_timestamp_updated_at() OWNER TO postgres;

CREATE TABLE public.containers (
    id integer NOT NULL,
    name text,
    project_id integer,
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.containers OWNER TO postgres;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    original_name text NOT NULL,
    type text NOT NULL,
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    key text NOT NULL,
    extension text,
    title text,
    varying character varying
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: gallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gallery (
    id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.gallery OWNER TO postgres;

--
-- Name: gallery_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gallery_file (
    file_id integer NOT NULL,
    gallery_id integer NOT NULL,
    description text
);


ALTER TABLE public.gallery_file OWNER TO postgres;

--
-- Name: gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gallery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gallery_id_seq OWNER TO postgres;

--
-- Name: gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gallery_id_seq OWNED BY public.gallery.id;


--
-- Name: geometric_objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geometric_objects (
    id integer NOT NULL,
    name text,
    mesh jsonb,
    type character varying,
    project_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.geometric_objects OWNER TO postgres;

--
-- Name: geometric_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geometric_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geometric_objects_id_seq OWNER TO postgres;

--
-- Name: geometric_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geometric_objects_id_seq OWNED BY public.geometric_objects.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    file_id integer NOT NULL,
    id integer NOT NULL,
    type character varying NOT NULL,
    frames integer
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.models_id_seq OWNER TO postgres;

--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.models_id_seq OWNED BY public.models.id;


--
-- Name: plot_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plot_object (
    plot_id integer NOT NULL,
    variable_object_id integer NOT NULL
);


ALTER TABLE public.plot_object OWNER TO postgres;

--
-- Name: plots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plots (
    id integer NOT NULL,
    type text NOT NULL,
    name text NOT NULL,
    project_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    variable_id integer
);


ALTER TABLE public.plots OWNER TO postgres;

--
-- Name: plots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plots_id_seq OWNER TO postgres;

--
-- Name: plots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plots_id_seq OWNED BY public.plots.id;


--
-- Name: project_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_user (
    project_id integer NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public.project_user OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    title text NOT NULL,
    url text,
    description text,
    id integer NOT NULL,
    project_owner text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    gltf_model_id integer,
    project_status character varying DEFAULT 'initialized'::character varying NOT NULL,
    hdf5_model_id integer,
    message text,
    interpolated boolean
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: samples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.samples (
    id integer NOT NULL,
    data jsonb,
    errors jsonb
);


ALTER TABLE public.samples OWNER TO postgres;

--
-- Name: samples_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.samples_id_seq OWNER TO postgres;

--
-- Name: samples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.samples_id_seq OWNED BY public.samples.id;


--
-- Name: simulations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.simulations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.simulations_id_seq OWNER TO postgres;

--
-- Name: simulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.simulations_id_seq OWNED BY public.containers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    email text NOT NULL,
    activated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: variables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variables (
    id integer NOT NULL,
    name text NOT NULL,
    container_id integer NOT NULL,
    unit character varying,
    stats jsonb,
    uncertainty boolean,
    dimensions integer
);


ALTER TABLE public.variables OWNER TO postgres;

--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variable_id_seq OWNER TO postgres;

--
-- Name: variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variable_id_seq OWNED BY public.variables.id;


--
-- Name: variable_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variable_object (
    variable_id integer NOT NULL,
    object_id integer NOT NULL,
    sample_id integer,
    id integer NOT NULL
);


ALTER TABLE public.variable_object OWNER TO postgres;

--
-- Name: variable_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variable_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variable_object_id_seq OWNER TO postgres;

--
-- Name: variable_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variable_object_id_seq OWNED BY public.variable_object.id;

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: gallery_file gallery_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery_file
    ADD CONSTRAINT gallery_files_pkey PRIMARY KEY (file_id, gallery_id);


--
-- Name: gallery gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_pkey PRIMARY KEY (id);


--
-- Name: gallery gallery_project_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_project_id_key UNIQUE (project_id);


--
-- Name: geometric_objects geometric_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometric_objects
    ADD CONSTRAINT geometric_objects_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: plot_object plot_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plot_object
    ADD CONSTRAINT plot_objects_pkey PRIMARY KEY (plot_id, variable_object_id);


--
-- Name: plots plots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plots
    ADD CONSTRAINT plots_pkey PRIMARY KEY (id);


--
-- Name: project_user project_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: projects projects_gltf_model_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_gltf_model_id_key UNIQUE (gltf_model_id);


--
-- Name: projects projects_hdf5_model_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_hdf5_model_id_key UNIQUE (hdf5_model_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: samples samples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT samples_pkey PRIMARY KEY (id);


--
-- Name: containers simulations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT simulations_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variable_object variable_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_object
    ADD CONSTRAINT variable_object_pkey PRIMARY KEY (id);


--
-- Name: variable_object variable_object_sample_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_object
    ADD CONSTRAINT variable_object_sample_id_key UNIQUE (sample_id);


--
-- Name: variable_object variable_object_variable_id_object_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_object
    ADD CONSTRAINT variable_object_variable_id_object_id_key UNIQUE (variable_id, object_id);


--
-- Name: variables variable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);

--
-- Name: containers set_public_containers_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_public_containers_updated_at BEFORE UPDATE ON public.containers FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_containers_updated_at ON containers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER set_public_containers_updated_at ON public.containers IS 'trigger to set value of column "updated_at" to current timestamp on row update';


--
-- Name: files set_public_files_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_public_files_updated_at BEFORE UPDATE ON public.files FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_files_updated_at ON files; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER set_public_files_updated_at ON public.files IS 'trigger to set value of column "updated_at" to current timestamp on row update';


--
-- Name: geometric_objects set_public_geometric_objects_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_public_geometric_objects_updated_at BEFORE UPDATE ON public.geometric_objects FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_geometric_objects_updated_at ON geometric_objects; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER set_public_geometric_objects_updated_at ON public.geometric_objects IS 'trigger to set value of column "updated_at" to current timestamp on row update';


--
-- Name: plots set_public_plots_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_public_plots_updated_at BEFORE UPDATE ON public.plots FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_plots_updated_at ON plots; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER set_public_plots_updated_at ON public.plots IS 'trigger to set value of column "updated_at" to current timestamp on row update';


--
-- Name: projects set_public_projects_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_public_projects_updated_at BEFORE UPDATE ON public.projects FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_projects_updated_at ON projects; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER set_public_projects_updated_at ON public.projects IS 'trigger to set value of column "updated_at" to current timestamp on row update';


--
-- Name: users set_public_users_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_public_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();


--
-- Name: TRIGGER set_public_users_updated_at ON users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TRIGGER set_public_users_updated_at ON public.users IS 'trigger to set value of column "updated_at" to current timestamp on row update';

--
-- Name: containers containers_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT containers_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: gallery_file gallery_file_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery_file
    ADD CONSTRAINT gallery_file_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: gallery_file gallery_files_gallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery_file
    ADD CONSTRAINT gallery_files_gallery_id_fkey FOREIGN KEY (gallery_id) REFERENCES public.gallery(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: gallery gallery_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: geometric_objects geometric_objects_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometric_objects
    ADD CONSTRAINT geometric_objects_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: models models_glTF_file_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT "models_glTF_file_fkey" FOREIGN KEY (file_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plot_object plot_object_variable_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plot_object
    ADD CONSTRAINT plot_object_variable_object_id_fkey FOREIGN KEY (variable_object_id) REFERENCES public.variable_object(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plot_object plot_objects_plot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plot_object
    ADD CONSTRAINT plot_objects_plot_id_fkey FOREIGN KEY (plot_id) REFERENCES public.plots(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plots plots_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plots
    ADD CONSTRAINT plots_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plots plots_variable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plots
    ADD CONSTRAINT plots_variable_id_fkey FOREIGN KEY (variable_id) REFERENCES public.variables(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_user project_user_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_user project_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects projects_hdf5_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_hdf5_model_id_fkey FOREIGN KEY (hdf5_model_id) REFERENCES public.models(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects projects_model_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_model_fkey FOREIGN KEY (gltf_model_id) REFERENCES public.models(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects projects_project_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_project_owner_fkey FOREIGN KEY (project_owner) REFERENCES public.users(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: variable_object variable_object_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_object
    ADD CONSTRAINT variable_object_object_id_fkey FOREIGN KEY (object_id) REFERENCES public.geometric_objects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: variable_object variable_object_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_object
    ADD CONSTRAINT variable_object_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.samples(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: variable_object variable_object_variable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_object
    ADD CONSTRAINT variable_object_variable_id_fkey FOREIGN KEY (variable_id) REFERENCES public.variables(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: variables variables_container_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_container_id_fkey FOREIGN KEY (container_id) REFERENCES public.containers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--



REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

