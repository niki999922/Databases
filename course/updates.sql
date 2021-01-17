-- Зарегистрировать нового рыбака
create or replace function addFisherman(fishermanIdArg int, fishermanNameArg varchar(50), ageArg int, emailArg varchar(60))
returns boolean
as
$$
begin
	insert into Fisherman (FishermanId, FishermanName, Age, Email)
    	values (fishermanIdArg, fishermanNameArg, ageArg, emailArg);
    return true;
end;
$$ language plpgsql;


-- Забронировать лодку
create or replace function rentBoat(fishermanIdArg int, boatIdArg int, boatRentDeadlineArg timestamp)
returns boolean
as
$$
begin
	insert into BoatRent (FishermanId, BoatId, BoatRentDeadline, State)
    	values (fishermanIdArg, boatIdArg, boatRentDeadlineArg, 'a');
    if (select State from BoatRent where FishermanId = fishermanIdArg and BoatId = boatIdArg) = 'a'
    then
    	return true;
    else
    	return false;
    end if;
end;
$$ language plpgsql;


-- Сдать лодку
create or replace function returnTheBoat(fishermanIdArg int, boatIdArg int)
returns boolean
as
$$
begin
	update BoatRent set State = 'c' where FishermanId = fishermanIdArg and BoatId = boatIdArg;
    if (select State from BoatRent where FishermanId = fishermanIdArg and BoatId = boatIdArg) = 'c'
    then
    	return true;
    else
    	return false;
    end if;
end;
$$ language plpgsql;


-- Остановиться жить на острове
create or replace function stayIsland(fishermanIdArg int, islandIdArg int)
returns boolean
as
$$
begin
	insert into FishermanIsland (FishermanId, IslandId)
    	values (fishermanIdArg, islandIdArg);
    return true;
end;
$$ language plpgsql;


-- Получить лицензию
create or replace function buyPermit(fishermanIdArg int, fishIdArg int, fishingPermitDeadlineArg timestamp)
returns boolean
as
$$
begin
	insert into FishingPermit (FishermanId, FishId, FishingPermitDeadline)
    	values (fishermanIdArg, fishIdArg, fishingPermitDeadlineArg);
    return true;
end;
$$ language plpgsql;