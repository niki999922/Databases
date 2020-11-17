drop table if exists Flights;
drop table if exists Seats;
drop table if exists Users;
drop table if exists BoughtSeats;
drop table if exists ReservedSeats;


create table Flights(
    FlightId int primary key,
    FligtTime timestamp not null,
    PlaneId int not null
);

create table Seats(
    PlaneId int primary key, 
    SeatNo int not null
);


-- users (id and password) which book seats 
create table Users(
    UserId int primary key,
    UserPassword varchar(60) not null
);

-- special table for bought seats (flight id and seat no)
-- here SeatNo - number of seat, but not amount seats in flight
create table BoughtSeats(
    FlightId int not null,
    SeatNo int not null,
    primary key (FlightId, SeatNo)
);

-- special table for reserve seats (flight id and seat no + who (user id) + time, for checking if too old reserve and do extend reservation)
-- here SeatNo - number of seat, but not amount seats in flight
create table ReservedSeats(
    FlightId int not null,
    SeatNo int not null,
    UserId int not null,
    ReservedTime timestamp not null,
    primary key(FlightId, SeatNo)
);
