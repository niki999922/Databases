insert into BoatKind (BoatKindId, Name, BoatKindDescrption)
    values (1, 'paddle-3320 Kenia21', 'A boat with a strong hull that allows you to develop fast speed on the wave'),
           (2, 'paddle-2021 Russian-SS', 'The latest Russian development for large capacity, which will conquer you with its appearance, and also conquer the horizons'),
           (3, 'paddle-1979 USSR', 'A limited edition of the Olympic boat from the Soviet Union, because of its age, a rarity that must be handled carefully'),
           (4, 'motor-2010 Russina-SS', 'The newest motor boat on the market with acceleration up to 100 km per hour and with a 15 cc engine. Your hidden cherished dream'),
           (5, 'C7822 Latvia-CST', 'Simple motor boat for 3 cubic meters, for comfortable movement on calm water. It features good stabilization and fashionable color'),
           (6, 'RP12229-307C RSM', 'An experimental development of a crowdfunding project that is powered by solar energy, which allows you to walk endlessly');

insert into Boat (BoatId, BoatKindId, BoatCapacity, Price, BoatDescrption)
    values (1, 1, 8, 300, 'No problems'),
           (2, 2, 4, 1120, 'No problems'),
           (3, 2, 2, 700, 'Can nott stand full fit'),
           (4, 3, 1, 140, 'No problems'),
           (5, 4, 7, 8800, 'Scratched on the side'),
           (6, 4, 7, 130, 'Old pallet'),
           (7, 4, 7, 100, 'Cracked glass'),
           (8, 4, 5, 600, 'The engine was moved'),
           (9, 5, 3, 70880, 'No problems'),
           (10, 5, 3, 1070, 'eats a lot of oil'),
           (11, 6, 2, 2200, 'Rotting material');

insert into Fish (FishId, FishName)
    values (1, 'anchovy'),
           (2, 'barracuda'),
           (3, 'bream'),
           (4, 'burbot'),
           (5, 'carp'),
           (6, 'catfish'),
           (7, 'cisco'),
           (8, 'chum salmon'),
           (9, 'cod'),
           (10, 'crucian carp'),
           (11, 'dorado'),
           (12, 'eel'),
           (13, 'flounder'),
           (14, 'grayling'),
           (15, 'grouper'),
           (16, 'haddock'),
           (17, 'hake'),
           (18, 'halibut'),
           (19, 'herring'),
           (20, 'ide'),
           (21, 'mackerel'),
           (22, 'mullet'),
           (23, 'roach');

insert into Fisherman (FishermanId, FishermanName, Age, Email)
    values (1, 'Ivan Belonogov', 19, 'lala@yandex.ru'),
           (2, 'Evgeny Nemchenko', 55, 'lala1@yandex.ru'), 
           (3, 'Michail Putilin', 13, 'lala2@yandex.ru'), 
           (4, 'Appolinaria Romanova', 34, 'rock@bk.com'), 
           (5, 'Anna Rodionova', 22, 'akar@bk.com'),
           (6, 'Vyacheslav Moklev', 18, 'masking@bk.com'),
           (7, 'Nikita Moklev', 28, 'trop@bk.com'),
           (8, 'Michail Moklev', 15, 'qwerty332@bk.com'),
           (9, 'Evgeny Moklev', 31, 'trrrpa@bk.com'),
           (10, 'Alex Moklev', 84, 'hiseen@bk.com'),
           (11, 'Pavel Moklev', 23, 'bigdearar124@bk.com'),
           (12, 'Mark Romanova', 44, 'qromax@bk.com');


insert into Island (IslandId, IslandName, Longitude, Latitude, IslandCapacity)
    values (1, 'Kernal', 83.38, 46.05, 3),
           (2, 'Gaus', 82.31, 47.23, 7),
           (3, 'Moskov', 83.21, 48.56, 20),
           (4, 'SPB', 84.95, 47.80, 12),
           (5, 'Test small SPB', 82.95, 42.80, 1);

insert into BoatRent (FishermanId, BoatId, BoatRentDeadline, State)
    values (1, 1, '2021-01-26 11:22:12', 'a'),
           (2, 2, '2021-01-25 16:32:42', 'a'),
           (4, 3, '2021-01-28 10:42:02', 'a');

insert into FishingPermit (FishermanId, FishId, FishingPermitDeadline)
    values (1, 1, '2022-01-26 01:11:18'),
           (1, 2, '2023-07-26 19:23:32'),
           (1, 3, '2021-11-26 22:21:44'),
           (1, 4, '2021-11-26 12:11:14'),
           (1, 5, '2021-11-26 22:11:14'),
           (2, 1, '2021-11-26 12:21:54'),
           (2, 2, '2022-04-26 21:11:44'),
           (2, 3, '2023-05-26 22:21:54'),
           (2, 4, '2022-11-26 11:11:54'),
           (2, 5, '2021-11-26 22:21:34'),
           (4, 6, '2022-11-26 23:21:34'),
           (4, 7, '2022-12-26 12:11:24'),
           (4, 8, '2021-12-26 23:21:24'),
           (4, 9, '2021-11-26 12:21:44');


insert into FishermanIsland (FishermanId, IslandId)
    values (1, 1),
           (3, 1),
           (7, 1),
           (2, 2),
           (8, 2),
           (9, 3),
           (4, 3),
           (10, 3);

insert into Habitability (IslandId, FishId, Chance)
    values (1, 1, 0.3417),
           (1, 2, 0.4421),
           (1, 3, 0.5417),
           (1, 4, 0.6421),
           (2, 1, 0.7417),
           (2, 2, 0.8421),
           (2, 3, 0.1417),
           (2, 4, 0.2421),
           (3, 1, 0.3418),
           (3, 2, 0.4421),
           (3, 3, 0.3419),
           (3, 7, 0.4421),
           (4, 8, 0.6414),
           (4, 9, 0.7421),
           (4, 1, 0.1413);




