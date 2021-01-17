create or replace view freeBoats as 
(select 
    BoatId, BoatCapacity, Price, BoatDescrption
from
    Boat
where BoatId not in (
    select
        BoatId
    from
        BoatRent
    )    
);


create or replace view freeIslandsPlaces as 
(select 
    IslandId, IslandName, (IslandCapacity - busy) as free
from
    (select
        IslandId, IslandName, IslandCapacity, busy
    from
        Island s
        natural join (
            select 
                IslandId, count(FishermanId) as busy
            from 
                FishermanIsland 
            group by 
                IslandId
            ) sq1
    where
        (select 
            IslandCapacity
        from 
            Island s1 
        where 
            s1.IslandId = s.IslandId
        ) - (
        select 
            count(FishermanId) 
        from 
            FishermanIsland 
        where 
            FishermanIsland.IslandId = s.IslandId
        ) > 0) sq2
);


create or replace view allPermits as 
(select
    FishermanId, FishermanName, FishingPermitDeadline
from
    FishingPermit
    natural join Fisherman
);


create or replace view allRentsFisherBoat as 
(select
    FishermanId, FishermanName, BoatRentDeadline
from
    Fisherman
    natural join BoatRent
where
    State = 'a'
);


-- Свободные лодки для аренды
select 
    BoatId, BoatCapacity, Price, BoatDescrption
from
    freeBoats;


-- Описание модели лодки
select
    Name, BoatKindDescrption
from
    BoatKind
where
    BoatKindId = 1;


-- Список свободных островов с хотя бы 1 человеком и колличество мест
select
    IslandId, IslandName, free
from
    freeIslandsPlaces;


-- Список рыб на острове
select
    FishName
from
    Fish
where FishId in (
    select
        FishId
    from 
        Habitability
    where
        IslandId = 3
    );


-- Вероятность поймать рыбу на всех островах, где она есть
select
    IslandId, IslandName, Chance
from
    Island
    natural join Habitability
where 
    FishId = 3;
    

-- Лицензии у рыбаков
select
    FishermanId, FishermanName, FishingPermitDeadline
from
    allPermits;


-- Остаток аренды лодок у рыбаков
select
    FishermanId, FishermanName, BoatRentDeadline
from 
    allRentsFisherBoat;




















