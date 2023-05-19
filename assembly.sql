create table Assembly(
id  int not null primary key auto_increment, 
part char(20),
subpart char(20));
insert into Assembly values 
(1,'trike','wheel'),
(2,'trike','frame'),
(3,'frame','seat'),
(4,'frame','pedal'),
(5,'wheel','spoke'),
(6,'wheel','tire'),
(7,'tire','rim'),
(8,'tire','tube');
select * from assembly;