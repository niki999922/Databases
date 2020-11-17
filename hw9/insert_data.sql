INSERT INTO Flights(FlightId, FligtTime, PlaneId)
	VALUES (1, '2021-06-22 19:10:25-07', 1),
		   (2, '2021-06-22 20:10:25-07', 2),
		   (3, '2021-11-17 05:50:25-07', 1);

INSERT INTO Seats(PlaneId, SeatNo)
	VALUES (1, 20),
		   (2, 30);

INSERT INTO Users(UserId, UserPassword)
	VALUES  (1, '123haha'),
			(2, 'WhatDoThink'),
			(3, '657KAT');

INSERT INTO BoughtSeats(FlightId, SeatNo)
	VALUES  (1, 3),
			(2, 4),
			(1, 6);

INSERT INTO ReservedSeats(FlightId, SeatNo, UserId, ReservedTime)
	VALUES  (1, 2, 1, '2016-06-22 12:10:25-07'),
			(2, 7, 1, '2016-06-22 19:10:25-07'),
			(1, 9, 2, '2016-06-22 18:10:25-07');



SELECT * FROM Flights;
SELECT * FROM Seats;
SELECT * FROM Users;
SELECT * FROM BoughtSeats;
SELECT * FROM ReservedSeats;
