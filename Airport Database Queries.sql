--Displays flights which arrive between March 21 and March 23 in ascending order

SELECT flightNo, startLocation, destination, arrivalDate
FROM Flight
WHERE arrivalDate BETWEEN '2022-03-21' AND '2022-03-23'
ORDER BY arrivalDate;

--Displays planes with a model beginning with '737' or a capacity of over 100
SELECT planeID, model, capacity
FROM Plane
WHERE model LIKE '737%' OR capacity > 100;


--Displays the average capacity of each plane model
SELECT planeID, model, AVG(capacity) AS avgCapacity
FROM Plane
GROUP BY model
ORDER BY model;

--Displays crew members with pilot certification from AeroGuard Flight Training
SELECT memberID, name
FROM CrewMember
WHERE memberID IN 
	(SELECT pMemberID
	FROM pilotCertification
	WHERE certification = 'AeroGuard Flight Training';

--For each airline with more than 1 plane, count the number of models
SELECT airlineID, COUNT(model) AS countModel
FROM Plane
GROUP BY airlineID
HAVING COUNT(model) > 1
ORDER BY airlineID;
