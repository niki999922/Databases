create table BoatKind
(
    BoatKindId int primary key,
    Name varchar(30) not null,
    BoatKindDescrption text
);

create table Boat
(
    BoatId int primary key,
    BoatKindId int not null references BoatKind (BoatKindId),
    BoatCapacity int not null constraint correctBoatCapacity check (BoatCapacity >= 1),
    Price int not null constraint correctPrice check (Price >= 0),
    BoatDescrption text
);

create table Fish
(
    FishId int primary key,
    FishName varchar(50) not null
);

create table Fisherman
(
    FishermanId int primary key,
    FishermanName varchar(50) not null,
    Age int not null constraint correctAge check (Age >= 0),
    Email varchar(60) unique not null
);

create table FishingPermit
(
    FishermanId int references Fisherman (FishermanId),
    FishId int references Fish (FishId),
    FishingPermitDeadline timestamp not null,
    primary key (FishermanId, FishId)
);

create table BoatRent
(
    FishermanId int references Fisherman (FishermanId),
    BoatId int references Boat (BoatId),
    BoatRentDeadline timestamp not null,
    State char not null constraint correctState check (State = 'a' or State = 'c'),
    primary key (FishermanId, BoatId)
);

create table Island
(
    IslandId int primary key,
    IslandName varchar(100) not null,
    Longitude real not null,
    Latitude real not null,
    IslandCapacity int not null constraint correctIslandCapacity check (IslandCapacity >= 1),
    unique (Longitude, Latitude)
);

create table FishermanIsland
(
    FishermanId int primary key references Fisherman (FishermanId),
    IslandId int not null references Island (IslandId)
);


create table Habitability
(
    IslandId int references Island (IslandId),
    FishId int references Fish (FishId),
    Chance real not null constraint correctChance check (Chance >= 0 and  Chance <= 1),
    primary key (IslandId, FishId)
);

-- Verification that the fisherman who wants to rent a boat has reached a certain age 18+
create or replace function checkAge() returns trigger 
as 
$checkAge$
begin
    if (
        select 
            Age
        from 
            Fisherman
        where
            Fisherman.FishermanId = new.FishermanId
        ) < 18 
    then 
        raise exception 'Age have to be >= 18';
    else
        return new;
    end if;
end;
$checkAge$ language plpgsql;


create trigger checkAgeForRent
    before insert
    on BoatRent
    for each row
execute procedure checkAge();

-- Checking that the rented boat is not yet busy
create or replace function checkFreeBoat() returns trigger 
as 
$checkFreeBoat$
begin
    if (select 
            State
        from 
            BoatRent
        where
            BoatRent.BoatId = new.BoatId
        ) = 'a'
    then 
        raise exception 'Boat are not free';
    else
        return new;
    end if;
end;
$checkFreeBoat$ language plpgsql;


create trigger checkFreeBoatForRent
    before insert
    on BoatRent
    for each row
execute procedure checkFreeBoat();


-- Checking that the boat will not be handed over to us with the status of surrendered ("c"), first there must be a lease ("a").
create or replace function checkBoatInsertOnlyA() returns trigger 
as 
$checkBoatInsertOnlyA$
begin
    if new.State= 'c'
    then 
        raise exception 'Boat can be arended for start only';
    else
        return new;
    end if;
end;
$checkBoatInsertOnlyA$ language plpgsql;


create trigger checkBoatInsertOnlyAForRen
    before insert
    on BoatRent
    for each row
execute procedure checkBoatInsertOnlyA();


-- Check free space in island and move fisher to them if can. If no place, say choose better free island.
create or replace function checkFreeSpaceInIsland() returns trigger 
as 
$checkFreeSpaceInIsland$
begin
    if (select IslandCapacity from Island where Island.IslandId = new.IslandId) - (select count(FishermanId) from FishermanIsland where FishermanIsland.IslandId = new.IslandId) <= 0 
    then
        raise exception 'There are no vacant places on the island, choose another';
    else
        delete from FishermanIsland where FishermanIsland.FishermanId = new.FishermanId;
        return new;
    end if;
end;
$checkFreeSpaceInIsland$ language plpgsql;


create trigger checkFreeSpaceInIslandForStay
    before insert
    on FishermanIsland
    for each row
execute procedure checkFreeSpaceInIsland();


-- checks the addition of a new license, if one already exists, it will simply create a new one
create or replace function checkLicense() returns trigger 
as 
$checkLicense$
begin
    delete from FishingPermit where FishingPermit.FishermanId = new.FishermanId and FishingPermit.FishId = new.FishId;
    return new;
end;
$checkLicense$ language plpgsql;


create trigger checkLicenseForPermit
    before insert
    on FishingPermit
    for each row
execute procedure checkLicense();

-- index on requests to pull information about the boat model
create index on Boat using hash (BoatKindId);

-- index for requests to get information about the island on which the fisherman stopped
create index on FishermanIsland using hash (IslandId);





























