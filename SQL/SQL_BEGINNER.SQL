 --CITY
create table if not exists city ( city_id int(11) auto_increment primary key, name varchar(40) not null);
alter table city add constraint unq_city_name unique(name);
alter table city change name  city_name varchar(100);
alter table city modify  city_id int(11) auto_increment;

mysql> describe city;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| city_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| city_name | varchar(100) | YES  | UNI | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+

2 rows in set (0.00 sec)
--CINEMA
create table if not exists cinema ( id int(11) auto_increment primary key, city_id int(11), num_theatres int(11), cinema_name varchar(100) not null );
alter table cinema change id cinema_id int(11);
alter table cinema modify  cinema_id int(11) auto_increment;
mysql> describe cinema;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| cinema_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| city_id      | int(11)      | YES  | MUL | NULL    |                |
| num_theatres | int(11)      | YES  |     | NULL    |                |
| cinema_name  | varchar(100) | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

--MOVIE
create table if not exists movie ( movie_id int(11) auto_increment primary key, movie_name varchar(100), release_date date, director_name varchar(100),cost decimal(14,2), genre varchar( 20), pg_certificate varchar(10) );
alter table movie  modify movie_name  varchar(100) not null;
alter table movie  modify release_date date not null;
mysql> describe movie;
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
--ACTOR
create table if not exists actor ( actor_id int(11) auto_increment primary key, actor_name varchar(100),dob  date  );
alter table actor  modify actor_name varchar(100) not null;
alter table actor  modify dob date not null;
mysql> describe actor;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| actor_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| actor_name | varchar(100) | NO   |     | NULL    |                |
| dob        | date         | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
--MOVIE_CAST
create table if not exists movie_cast ( cast_id int(11) auto_increment primary key, movie_id int(11), actor_id int(11), actor_role varchar(100));
alter table movie_cast add constraint fk_movie_cast_movie_id foreign key ( movie_id) references movie(movie_id);
alter table movie_cast add constraint fk_movie_cast_actor_id foreign key ( actor_id) references actor(actor_id);
mysql> describe movie_cast;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| cast_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| movie_id   | int(11)      | YES  | MUL | NULL    |                |
| actor_id   | int(11)      | YES  | MUL | NULL    |                |
| actor_role | varchar(100) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

--MOVIE_SHOW
create table if not exists movie_show ( show_id int(11) auto_increment primary key, movie_id int(11), cinema_id int(11), show_date date);
alter table movie_show add constraint fk_show_movie_id foreign key ( movie_id) references movie(movie_id);
alter table movie_show add constraint fk_show_cinema_id foreign key ( cinema_id) references cinema(cinema_id);
mysql> describe movie_show;
+-----------+---------+------+-----+---------+----------------+
| Field     | Type    | Null | Key | Default | Extra          |
+-----------+---------+------+-----+---------+----------------+
| show_id   | int(11) | NO   | PRI | NULL    | auto_increment |
| movie_id  | int(11) | YES  | MUL | NULL    |                |
| cinema_id | int(11) | YES  | MUL | NULL    |                |
| show_date | date    | YES  |     | NULL    |                |
+-----------+---------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

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
--ACTOR
insert into actor (actor_name, dob) SELECT name, STR_TO_DATE(dob, '%d %M %Y') FROM (
SELECT '1.','Jack Nicholson' AS NAME ,'Actor, The Shining','22 April 1937' AS DOB,'15 Feb 2011' union
SELECT '2.','Ralph Fiennes','Actor, Harry Potter and the Deathly Hallows: Part 2','22 December 1962','14 Feb 2011' union
SELECT '3.','Daniel Day-Lewis','Actor, There Will Be Blood','29 April 1957','15 Feb 2011' union
SELECT '4.','Robert De Niro','Actor, Goodfellas','17 August 1943','15 Feb 2011' union
SELECT '5.','Al Pacino','Actor, The Godfather','25 April 1940','15 Feb 2011' union
SELECT '6.','Dustin Hoffman','Actor, Kramer vs. Kramer','8 August 1937','15 Feb 2011' union
SELECT '7.','Tom Hanks','Actor, The Da Vinci Code','9 July 1956','15 Feb 2011' union
SELECT '8.','Brad Pitt','Actor, Inglourious Basterds','18 December 1963','15 Feb 2011' union
SELECT '9.','Anthony Hopkins','Actor, Hannibal','31 December 1937','15 Feb 2011' union
SELECT '10.','Marlon Brando','Actor, The Godfather','3 April 1924','10 Oct 2010' union
SELECT '11.','Jeremy Irons','Actor, The Lion King','19 September 1948','16 Feb 2011' union
SELECT '12.','Denzel Washington','Actor, Training Day','28 December 1954','10 Oct 2010' union
SELECT '13.','Gene Hackman','Actor, Unforgiven','30 January 1930','10 Oct 2010' union
SELECT '14.','Jeff Bridges','Actor, The Big Lebowski','4 December 1949','10 Oct 2010' union
SELECT '15.','Tim Robbins','Actor, The Shawshank Redemption','16 October 1958','10 Oct 2010' union
SELECT '16.','Henry Fonda','Actor, 12 Angry Men','16 May 1905','10 Oct 2010' union
SELECT '17.','William Hurt','Actor, Into the Wild','20 March 1950','15 Feb 2011' union
SELECT '18.','Kevin Costner','Actor, Dances with Wolves','18 January 1955','15 Feb 2011' union
SELECT '19.','Clint Eastwood','Actor, Million Dollar Baby','31 May 1930','10 Oct 2010' union
SELECT '20.','Leonardo DiCaprio','Actor, Inception','11 November 1974','10 Oct 2010' union
SELECT '21.','Mel Gibson','Actor, Braveheart','3 January 1956','13 Feb 2011' union
SELECT '22.','Robert Duvall','Actor, The Godfather: Part II','5 January 1931','11 Oct 2010' union
SELECT '23.','Samuel L. Jackson','Actor, Pulp Fiction','21 December 1948','10 Oct 2010' union
SELECT '24.','Tommy Lee Jones','Actor, No Country for Old Men','15 September 1946','11 Oct 2010' union
SELECT '25.','Kevin Spacey','Actor, American Beauty','26 July 1959','11 Oct 2010') AS A;

insert into actor (actor_name, dob) SELECT name, STR_TO_DATE(dob, '%d %M %Y') FROM (
SELECT '26.','Nicolas Cage' Name,'Actor, Leaving Las Vegas','7 January 1964' DOB ,'15 Feb 2011' union
SELECT '27.','Kevin Kline','Actor, A Fish Called Wanda','24 October 1947','15 Feb 2011' union
SELECT '28.','Morgan Freeman','Actor, The Shawshank Redemption','1 June 1937','16 Feb 2011' union
SELECT '29.','Michael Caine','Actor, The Dark Knight','14 March 1933','10 Oct 2010' union
SELECT '30.','Russell Crowe','Actor, Gladiator','7 April 1964','10 Oct 2010' union
SELECT '31.','Bruce Willis','Actor, The Sixth Sense','19 March 1955','20 Oct 2010' union
SELECT '32.','Johnny Depp','Actor, Edward Scissorhands','9 June 1963','13 Feb 2011' union
SELECT '33.','Ben Kingsley','Actor, Schindlers List','31 December 1943','10 Oct 2010' union
SELECT '34.','Steve McQueen','Actor, The Great Escape','24 March 1930','11 Oct 2010' union
SELECT '35.','Tom Cruise','Actor, Top Gun','3 July 1962','14 Feb 2011' ) AS A;

insert into actor (actor_name, dob) SELECT name, STR_TO_DATE(dob, '%d %M %Y') FROM ( 
SELECT '36.','Heath Ledger' name ,'Actor, The Dark Knight','4 April 1979' dob,'11 Oct 2010' union
SELECT '37.','Philip Seymour Hoffman','Actor, Capote','23 July 1967','11 Oct 2010' union
SELECT '38.','John Malkovich','Actor, Dangerous Liaisons','9 December 1953','10 Oct 2010' union
SELECT '39.','Christian Bale','Actor, The Dark Knight','30 January 1974','10 Oct 2010' union
SELECT '40.','Richard Dreyfuss','Actor, Jaws','29 October 1947','15 Feb 2011' union
SELECT '41.','Jason Robards','Actor, Once Upon a Time in the West','26 July 1922','19 Feb 2011' union
SELECT '42.','Colin Firth','Actor, The Kings Speech','10 September 1960','16 Feb 2011' union
SELECT '43.','George Clooney','Actor, Gravity','6 May 1961','13 Feb 2011' union
SELECT '44.','Edward Norton','Actor, Fight Club','18 August 1969','16 Feb 2011' union
SELECT '45.','Sean Connery','Actor, Dr. No','25 August 1930','16 Feb 2011' union
SELECT '46.','Yves Montand','Actor, Le salaire de la peur','13 October 1921','14 Feb 2011' union
SELECT '47.','Richard Gere','Actor, Pretty Woman','31 August 1949','13 Feb 2011' union
SELECT '48.','Gary Oldman','Actor, The Dark Knight Rises','21 March 1958','27 Apr 2012' union
SELECT '49.','Harrison Ford','Actor, Star Wars','13 July 1942','13 Feb 2011' union
SELECT '50.','Matt Damon','Actor, The Bourne Identity','8 October 1970','13 Feb 2011' ) AS A;

insert into actor (actor_name, dob) SELECT name, STR_TO_DATE(dob, '%d %M %Y') FROM (
SELECT '51.','John Gielgud' Name,'Actor, Gandhi','14 April 1904' DOB ,'10 Oct 2010' union
SELECT '52.','Joe Pesci','Actor, Goodfellas','9 February 1943','10 Oct 2010' union
SELECT '53.','Paul Newman','Actor, Butch Cassidy and the Sundance Kid','26 January 1925','15 Feb 2011' union
SELECT '54.','Woody Harrelson','Actor, No Country for Old Men','23 July 1961','10 Oct 2010' union
SELECT '55.','John Hurt','Actor, V for Vendetta','22 January 1940','15 Feb 2011' union
SELECT '56.','Sean Penn','Actor, Mystic River','17 August 1960','13 Feb 2011' union
SELECT '57.','Christopher Walken','Actor, Catch Me If You Can','31 March 1943','16 Feb 2011' union
SELECT '58.','Mickey Rourke','Actor, The Wrestler','16 September 1952','10 Oct 2010' union
SELECT '59.','Peter OToole','Actor, Lawrence of Arabia','2 August 1932','10 Oct 2010' union
SELECT '60.','Michael Douglas','Actor, The Game','25 September 1944','11 Oct 2010' union
SELECT '61.','Willem Dafoe','Actor, Spider-Man','22 July 1955','15 Feb 2011' union
SELECT '62.','Charlton Heston','Actor, Ben-Hur','4 October 1923','28 Oct 2011' union
SELECT '63.','Forest Whitaker','Actor, Arrival','15 July 1961','15 Feb 2011' union
SELECT '64.','James Coburn','Actor, Monsters, Inc.','31 August 1928','19 Feb 2011' union
SELECT '65.','Liam Neeson','Actor, Schindlers List','7 June 1952','20 Oct 2010' union
SELECT '66.','Will Smith','Actor, Men in Black','25 September 1968','13 Feb 2011' union
SELECT '67.','Robin Williams','Actor, Good Will Hunting','21 July 1951','14 Feb 2011' union
SELECT '68.','Keanu Reeves','Actor, The Matrix','2 September 1964','10 Oct 2010' union
SELECT '69.','Harvey Keitel','Actor, Reservoir Dogs','13 May 1939','16 Feb 2011' union
SELECT '70.','Michael Madsen','Actor, Reservoir Dogs','25 September 1958','16 Feb 2011' union
SELECT '71.','Kevin Bacon','Actor, Apollo 13','8 July 1958','16 Feb 2011' union
SELECT '72.','Ed Harris','Actor, A Beautiful Mind','28 November 1950','10 Oct 2010' union
SELECT '73.','Alain Delon','Actor, Le samouraï','8 November 1935','14 Feb 2011' union
SELECT '74.','Chris Cooper','Actor, American Beauty','9 July 1951','14 Feb 2011' union
SELECT '75.','Gérard Depardieu','Actor, Life of Pi','27 December 1948','10 Oct 2010' union
SELECT '76.','Justin Theroux','Actor, American Psycho','10 August 1971','28 Oct 2011' union 
SELECT '77.','Nick Nolte' NAME ,'Actor, The Thin Red Line','8 February 1941' dob,'15 Feb 2011' union
SELECT '78.','Val Kilmer','Actor, Heat','31 December 1959','10 Oct 2010' union
SELECT '79.','Joaquin Phoenix','Actor, Gladiator','28 October 1974','10 Oct 2010' union
SELECT '80.','Jared Leto','Actor, Requiem for a Dream','26 December 1971','28 Nov 2011' union
SELECT '81.','Laurence Fishburne','Actor, The Matrix','30 July 1961','10 Oct 2010' union
SELECT '82.','Antonio Banderas','Actor, Desperado','10 August 1960','13 Feb 2011' union
SELECT '83.','John Travolta','Actor, Pulp Fiction','18 February 1954','10 Oct 2010' union
SELECT '84.','John Goodman','Actor, Monsters, Inc.','20 June 1952','11 Oct 2010' union
SELECT '85.','Arnold Schwarzenegger','Actor, Terminator','30 July 1947','16 Feb 2011' union
SELECT '86.','Adrien Brody','Actor, The Pianist','14 April 1973','10 Oct 2010' union
SELECT '87.','Michael Keaton','Actor, Birdman or (The Unexpected Virtue of Ignorance)','5 September 1951','13 Feb 2011' union
SELECT '88.','Billy Bob Thornton','Actor, Armageddon','4 August 1955','11 Oct 2010' union
SELECT '89.','Hugo Weaving','Actor, The Matrix','4 April 1960','15 Feb 2011' union
SELECT '90.','Sam Shepard','Actor, Black Hawk Down','5 November 1943','13 Feb 2011' union
SELECT '91.','Jude Law','Actor, Sherlock Holmes','29 December 1972','10 Oct 2010' union
SELECT '92.','Geoffrey Rush','Actor, Pirates of the Caribbean: The Curse of the Black Pearl','6 July 1951','16 Feb 2011' union
SELECT '93.','Roberto Benigni','Actor, Life Is Beautiful','27 October 1952','13 Feb 2011' union
SELECT '94.','Jürgen Prochnow','Actor, Das Boot','10 June 1941','10 Oct 2010' union
SELECT '95.','Alec Baldwin','Actor, Beetlejuice','3 April 1958','13 Feb 2011' union
SELECT '96.','Joseph Fiennes','Actor, Shakespeare in Love','27 May 1970','13 Feb 2011'  ) as A;


insert into movie(movie_name, release_date) select distinct  movie_name , max(STR_TO_DATE(rel_date, '%d %M %Y')) from raw_data group by movie_name;

insert into movie_cast(movie_id, actor_id) select movie_id, actor_id from raw_data r join movie m on  m.movie_name = r.movie_name join actor a on   a.actor_name = r.actor_name;

