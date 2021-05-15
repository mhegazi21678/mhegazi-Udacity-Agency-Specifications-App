GET https://hij-fsnd.eu.auth0.com/authorize?
  audience=API_IDENTIFIER&
  response_type=code&
  client_id=SecWtYHGlbQtw5GgffJ25KEPAYJFOBsz&
  redirect_uri=undefined
  

GET:
https://hij-fsnd.eu.auth0.com/authorize?audience=Agency_Specifications&response_type=token&client_id=yENoy6uO91hJVbLWNOKEzuPyDi3ysDbX&redirect_uri=http://localhost:8080/login-results


Client ID = yENoy6uO91hJVbLWNOKEzuPyDi3ysDbX

LogOut:

https://hij-fsnd.eu.auth0.com/v2/logout?client_id=yENoy6uO91hJVbLWNOKEzuPyDi3ysDbX&returnTo=http://localhost:8080/logout



************************************************************************************************************************

Roles:
Casting Assistant
	Can view actors and movies

Casting Director
	All permissions a Casting Assistant has and…
	Add or delete an actor from the database
	Modify actors or movies

Executive Producer
	All permissions a Casting Director has and…
	Add or delete a movie from the database


GET /actors and /movies
DELETE /actors/ and /movies/
POST /actors and /movies and
PATCH /actors/ and /movies/


***********************************************************************************************************************

Users: 

CastingAssistant@gmail.com
CastingAssistant!


CastingDirector@gmail.com
CastingDirector!

executiveproducer@gmail.com
ExecutiveProducer!

**********************************************************************************************************************
class Movie(db.Model):
    __tablename__ = 'Movie'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    release_date = db.Column(db.DateTime)

release_date timestamp without time zone NOT NULL,

-- SEQUENCE: public.Movie_id_seq

-- DROP SEQUENCE public.Movie_id_seq;

CREATE SEQUENCE public.Movie_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.Movie_id_seq
    OWNER TO postgres;
	
	

-- Table: public.Movie

-- DROP TABLE public.Movie;

CREATE TABLE public.Movie
(
    id integer NOT NULL DEFAULT nextval('Movie_id_seq'::regclass),
    title character varying COLLATE pg_catalog."default",
    release_date timestamp without time zone NOT NULL,
    CONSTRAINT Movie_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.Movie
    OWNER to postgres;
	
---------------------------------------------------------------------------------------------
class Actor(db.Model):
    __tablename__ = 'Actor'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    age = db.Column(db.Integer)
    gender = db.Column(db.String)

-- SEQUENCE: public.Actor_id_seq

-- DROP SEQUENCE public.Actor_id_seq;

CREATE SEQUENCE public.Actor_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.Actor_id_seq
    OWNER TO postgres;
	
	

-- Table: public.Actor

-- DROP TABLE public.Actor;

CREATE TABLE public.Actor
(
    id integer NOT NULL DEFAULT nextval('Actor_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default"  NOT NULL,
	age integer,
	gender character varying COLLATE pg_catalog."default",
    CONSTRAINT Actor_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.Actor
    OWNER to postgres;



-------------------------------------------------

python -m unittest test_my_app_02.py

pg_dump -U postgres agencyspecifications > agencyspecifications_test.pgsql

DROP DATABASE [IF EXISTS] agencyspecifications_test;

psql -U postgres agencyspecifications_test < agencyspecifications_test.pgsql
	
	
--*****************************************************************************************

heroku create agencyspecificationsmasterapp	

$ heroku create agencyspecificationsmasterapp
 »   Warning: heroku update available from 7.52.0 to 7.53.0.
Creating agencyspecificationsmasterapp... done
https://agencyspecificationsmasterapp.herokuapp.com/ | https://git.heroku.com/agencyspecificationsmasterapp.git


-------------------------------
first need to make the directory repository in git:


https://github.com/mhegazi21678/mhegazi-Agency-Specifications-App.git

echo "#mhegazi-Agency-Specifications-App" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/mhegazi21678/mhegazi-Agency-Specifications-App.git
git push -u origin master




git remote add heroku https://git.heroku.com/agencyspecificationsmasterapp.git

heroku addons:create heroku-postgresql:hobby-dev --app agencyspecificationsmasterapp

$ heroku addons:create heroku-postgresql:hobby-dev --app agencyspecificationsmasterapp
 »   Warning: heroku update available from 7.52.0 to 7.53.0.
Creating heroku-postgresql:hobby-dev on agencyspecificationsmasterapp... free
Database has been created and is available
 ! This database is empty. If upgrading, you can transfer
 ! data from another database with pg:copy
Created postgresql-colorful-83319 as DATABASE_URL
Use heroku addons:docs heroku-postgresql to view documentation


heroku config --app agencyspecificationsmasterapp	

$ heroku config --app agencyspecificationsmasterapp
 »   Warning: heroku update available from 7.52.0 to 7.53.0.
=== agencyspecificationsmasterapp Config Vars
DATABASE_URL: postgres://favpshoflbrgzh:ff522fe5ad5dfed12bd5ebfb9f2936a9b847272eaa1d0b38292af9a0fe2e7d96@ec2-54-167-152-185.compute-1.amazonaws.com:5432/d63ic5odq2rei8


git push heroku master



