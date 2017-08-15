
--1
SELECT * FROM Programs
--2
SELECT developer FROM Programs
--3
SELECT name FROM Categories , Ads
WHERE Ads.categoryID = Categories.ID AND Categories.name = 'daneshjooyi'
--4
SELECT name FROM Categories
Join
	SELECT COUNT(programAdID) countViews FROM Views JOIN ProgramAds
	WHERE countViews>100 AND ProgramAds.programAdID = Views.programAdID
--5
SELECT Programs.name FROM
Ads, Categories, Programs
WHERE Categories.name = 'farhangi' AND Programs.ID = Ads.ProgramID AND Categories.ID = Ads.categoryID
( SUM(clickPrice) + SUM(visitPrice) + SUM(downloadPrice) )>1000000;
--6
SELECT (SUM(clickPrice) + SUM(visitPrice) + SUM(downloadPrice)) as totalIncome
FROM Ads, Programs
where name = 'khoroos jangi'
--7
SELECT name
FROM Programs, programAdID
where ProgramID = AdID;
--8
SELECT  name ,SUM(visitPrice) as visitIncome
FROM Ads,Programs
GROUP BY name
--9
SELECT name ,SUM(clickPrice) as clickIncome
FROM Ads,Programs
GROUP BY name
--10
SELECT name ,SUM(downloadPrice) as downloadIncome
FROM Ads,Programs
GROUP BY name
--11
SELECT  name ,( SUM(visitPrice) + SUM(clickPrice) + SUM(downloadPrice))as totalIncome
FROM Ads,Programs
--12
SELECT name,SUM(visitPrice) as visitIncome
FROM Ads,Programs
where Ads.ID = 1
GROUP BY name
--13
SELECT name,SUM(clickPrice) as clickIncome
FROM Ads,Programs
where Ads.ID = 1
GROUP BY name
--14
SELECT name,SUM(downloadPrice) as downloadIncome
FROM Ads,Programs
where Ads.ID = 1
GROUP BY name
--15
SELECT name
FROM ProgramsAds, Ads, Programs
where Ad.ID = 1, ProgramID = Programs.ID
--16
SELECT ProgramID
FROM Ads JOIN SELECT * FROM ProgramAds where ProgramID = 1
--17
SELECT  name ,( SUM(visitPrice) + SUM(clickPrice) + SUM(downloadPrice))as totalIncome
FROM Ads,Programs,ProgramAds
WHERE ProgramAds.ProgramID != Programs.ID
--18
SELECT MAX(visitCount) From
	SELECT COUNT(Views.ID) as visitCount
	FROM Views
	GROUP BY programAdID
--19
SELECT MAX(clickCount) From
	SELECT COUNT(Clicks.ID) as clickCount
	FROM Clicks
	GROUP BY programAdID
--20
SELECT MAX(downloadCount) From
	SELECT COUNT(Downloads.ID) as downloadCount
	FROM Downloads
	GROUP BY programAdID
--21
SELECT MAX(visitCount)
FROM [table]
where visitCount < ( 
	SELECT MAX(downloadCount) From
		SELECT COUNT (Downloads.ID) as downloadCount
		FROM Downloads
		GROUP BY programAdID
	)
--22
SELECT MAX(clickCount)
FROM [table]
where clickCount < ( 
	SELECT MAX(clickCount) From
		SELECT COUNT(Clicks.ID) as clickCount
		FROM Clicks
		GROUP BY programAdID
	)
--23
SELECT MAX(downloadCount)
FROM [table]
where downloadCount < (
	SELECT MAX(downloadCount) From
		SELECT COUNT(Downloads.ID) as downloadCount
		FROM Downloads
		GROUP BY programAdID
	)
	
--24
SELECT AdID
FROM ProgramID JOIN
	SELECT COUNT (Clicks.ID) as clickCount
	FROM Clicks
	GROUP BY programAdID
ORDER BY clickCount DESC LIMIT 5
--25
SELECT ProgramID
FROM ProgramID JOIN
	SELECT COUNT (Clicks.ID) as clickCount
	FROM Clicks
	GROUP BY programAdID
ORDER BY clickCount DESC LIMIT 5
--26
SELECT MAX(totalIncome) FROM
	SELECT  name ,( SUM(visitPrice) + SUM(clickPrice) + SUM(downloadPrice))as totalIncome
	FROM Ads,Programs
--27
SELECT MAX(cost) FROM
	SELECT ProgramID ,SUM(visitPrice)+SUM(clickPrice)+SUM(downloadPrice) as cost
	GROUP BY ProgramID
	
--28
SELECT COUNT(Views.ID) as visitCount
FROM Views
GROUP BY programAdID
--29
SELECT COUNT(Clicks.ID) as clickCount
FROM Clicks
GROUP BY programAdID
--30
SELECT COUNT(Downloads.ID) as downloadCount
FROM Downloads
GROUP BY programAdID
--31
SELECT COUNT(Views.ID) as visitCount
FROM Views
--32
SELECT COUNT(Clicks.ID) as clickCount
FROM Clicks
--33
SELECT COUNT(Downloads.ID) as downloadCount
FROM Downloads
--34
SELECT COUNT(Views.ID) as clickCount
FROM Views
WHERE date_ = MIN(date_)
GROUP BY Views.ProgramID
--35
SELECT MAX(clickCount) FROM
	SELECT COUNT(Views.ID) as clickCount
	FROM Views
	WHERE date_ = MIN(date_)
	GROUP BY Views.ProgramID
--36
SELECT COUNT(Clicks.ID) as visitCount
FROM Clicks
WHERE date_ = MIN(date_)
GROUP BY Clicks.ProgramID
--37
SELECT MAX(visitCount) FROM
	SELECT COUNT(Clicks.ID) as visitCount
	FROM Clicks
	WHERE date_ = MIN(date_)
	GROUP BY Clicks.ProgramID
--38
SELECT COUNT(Downloads.ID) as downloadCount
FROM Downloads
WHERE date_ = MIN(date_)
GROUP BY Downloads.ProgramID
--39
SELECT MAX(downloadCount) FROM
	SELECT COUNT(Downloads.ID) as downloadCount
	FROM Downloads
	WHERE date_ = MIN(date_)
	GROUP BY Downloads.ProgramID