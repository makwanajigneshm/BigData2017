create database student;
use student;
 --CITY
create table if not exists city ( city_id int(11) auto_increment primary key, city_name varchar(100) not null);

describe city;
/*
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| city_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| city_name | varchar(100) | NO   | UNI | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)
*/

--CINEMA
create table if not exists cinema ( cinema_id int(11) auto_increment primary key, city_id int(11)  not null, num_theatres int(11) not null, cinema_name varchar(100) not null );
describe cinema;
/*
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| cinema_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| city_id      | int(11)      | NO   |     | NULL    |                |
| num_theatres | int(11)      | NO   |     | NULL    |                |
| cinema_name  | varchar(100) | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
*/

--MOVIE
create table if not exists movie ( movie_id int(11) auto_increment primary key, movie_name varchar(100)  not null, release_date date not null, director_name varchar(100),cost decimal(14,2), genre varchar( 20), pg_certificate varchar(10) );
mysql> describe movie;
/*
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| movie_id       | int(11)       | NO   | PRI | NULL    | auto_increment |
| movie_name     | varchar(100)  | NO   |     | NULL    |                |
| release_date   | date          | NO   |     | NULL    |                |
| director_name  | varchar(100)  | YES  |     | NULL    |                |
| cost           | decimal(14,2) | YES  |     | NULL    |                |
| genre          | varchar(20)   | YES  |     | NULL    |                |
| pg_certificate | varchar(10)   | YES  |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)
*/
--ACTOR
create table if not exists actor ( actor_id int(11) auto_increment primary key, actor_name varchar(100) not null,dob  date  );
describe actor;
/*
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| actor_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| actor_name | varchar(100) | NO   |     | NULL    |                |
| dob        | date         | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
*/
--MOVIE_CAST
create table if not exists movie_cast ( cast_id int(11) auto_increment primary key, movie_id int(11)  not null, actor_id int(11)  not null, actor_role varchar(100));
alter table movie_cast add constraint fk_movie_cast_movie_id foreign key ( movie_id) references movie(movie_id);
alter table movie_cast add constraint fk_movie_cast_actor_id foreign key ( actor_id) references actor(actor_id);
describe movie_cast;
/*
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| cast_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| movie_id   | int(11)      | NO   | MUL | NULL    |                |
| actor_id   | int(11)      | NO   | MUL | NULL    |                |
| actor_role | varchar(100) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
*/

--MOVIE_SHOW
create table if not exists movie_show ( show_id int(11) auto_increment primary key, movie_id int(11)  not null, cinema_id int(11)  not null, show_datetime datetime not null);
alter table movie_show add constraint fk_show_movie_id foreign key ( movie_id) references movie(movie_id);
alter table movie_show add constraint fk_show_cinema_id foreign key ( cinema_id) references cinema(cinema_id);
describe movie_show;
/*
+---------------+----------+------+-----+---------+----------------+
| Field         | Type     | Null | Key | Default | Extra          |
+---------------+----------+------+-----+---------+----------------+
| show_id       | int(11)  | NO   | PRI | NULL    | auto_increment |
| movie_id      | int(11)  | NO   | MUL | NULL    |                |
| cinema_id     | int(11)  | NO   | MUL | NULL    |                |
| show_datetime | datetime | NO   |     | NULL    |                |
+---------------+----------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
*/
--Cities  
insert into city (city_name) values ('Toronto'	);
insert into city (city_name) values ('Montreal'	);
insert into city (city_name) values ('Mumbai'	);
insert into city (city_name) values ('Ottawa'	);
insert into city (city_name) values ('Ahmedabad');
insert into city (city_name) values ('Rajkot'	);
insert into city (city_name) values ('Jamnagar'	);
--Cinema
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Toronto'), 3,'Albion Cinema');
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Montreal'), 4,'Rainbow Cinema');
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Mumbai'), 5,'Maratha Cinema');
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Ottawa'), 6,'Cineplex Ottawa');
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Ahmedabad'), 7,'Drivein Cinema');
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Rajkot'), 8,'Galaxy Cinema');
insert into cinema (city_id,num_theatres,cinema_name ) Values ((Select city_id from city where city_name ='Jamnagar'), 99,'Deepak Talkies');
/* ********************************************************** 
RUN RAW DATA.SQL
*********************************************************** */

--ACTOR
insert into actor (actor_name, dob) SELECT distinct actor_name, STR_TO_DATE(dob, '%d %M %Y') FROM  raw_data;

insert into movie(movie_name, release_date) select distinct  movie_name , max(STR_TO_DATE(rel_date, '%d %M %Y')) from raw_data group by movie_name;

insert into movie_cast(movie_id, actor_id) select movie_id, actor_id from raw_data r join movie m on  m.movie_name = r.movie_name join actor a on   a.actor_name = r.actor_name;


insert into movie_show (movie_id, cinema_id, show_datetime)select movie_id, cinema_id, concat(release_date, " ", '13:00:00.0') from movie join cinema on 1=1;

insert into movie_show (movie_id, cinema_id, show_datetime)select movie_id, cinema_id, concat(release_date, " ", '16:00:00.0') from movie join cinema on 1=1 where cinema_name in ('Albion Cinema', 'Rainbow Cinema', 'Cineplex Ottawa');
