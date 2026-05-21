Create Database Digital_Transformations_Index;
Use Digital_Transformations_Index;

-- ERD Creation

Create table Dim_Country (
Country_Key int identity (1,1) primary key,
Country_Code varchar(50),
Country varchar(50)
);


Create table Dim_Year (
Year_Key int primary key,
Year int
);

Create table Dim_Indicators (
Indicator_Key int identity (1,1) primary key,
Indicators varchar(100)
);

Create table Fact_DTI(
Fact_DTI_Key int identity (1,1) primary key,
Code_ID varchar(50),
Country_Key int,
Year_Key int,
Indicator_Key int,
OBS_Values decimal (10,3),


Foreign Key (Country_Key) References Dim_Country (Country_Key),
Foreign Key (Year_Key) References Dim_Year (Year_Key),
Foreign Key (Indicator_Key) References Dim_Indicators (Indicator_Key)
);

-- DDL--

Insert Into Dim_Country (Country_Code, Country)
select distinct Country_Code, Country
from Digital_Transformations_Index ;

Insert into Dim_Year (Year_Key, Year)
select distinct 
Year as Year_Key, Year
from Digital_Transformations_Index;

Insert into Dim_Indicators(Indicators)
select distinct Indicators
from Digital_Transformations_Index;

Insert into Fact_DTI (
Code_ID,
Country_Key,
Year_Key,
Indicator_Key,
OBS_Values
)

select
Digital_Transformations_Index.Code_ID,
Dim_Country.Country_Key,
Dim_Year.Year_Key,
Dim_Indicators.Indicator_Key,
Digital_Transformations_Index.OBS_Values

from Digital_Transformations_Index

join Dim_Country on Dim_Country.Country_Code = Digital_Transformations_Index.Country_Code
and Dim_Country.Country = Digital_Transformations_Index.Country

Join Dim_Year on Dim_Year.Year = Digital_Transformations_Index.Year

Join Dim_Indicators on Dim_Indicators.Indicators = Digital_Transformations_Index.Indicators;


Select count(*) from Fact_DTI;

select * from Fact_DTI;

select * from Fact_DTI
where OBS_Values is null;

-- Digital_Transformations_Index Analysis--

-- 1- Digital Transformation And Financial Inclusion Overview-- 

									-- KPI`s--

						--1- Financial_Inclusion_Level--

Select 
Dim_Country.Country_Code,
AVG(Coalesce(Fact_DTI.OBS_Values,0)) As Financial_Inclusion_Level
From Fact_DTI
join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
where Dim_Indicators.Indicators = 'FI_Index' 
And Dim_Country.Country_Code in ('EGY','IND','SAU','ARE','GBR')
Group by Dim_Country.Country_Code;



						--2- E-Government Level--

Select 
Dim_Country.Country_Code,
AVG(Coalesce(Fact_DTI.OBS_Values,0)) As E_Government_Level
From Fact_DTI
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
where Dim_Indicators.Indicators = 'E-GOV_Index'
and Dim_Country.Country_Code in ('EGY', 'ARE', 'IND', 'SAU', 'GBR')
Group by Dim_Country.Country_Code;


						--3- Internet Penetration Level--

Select 
Dim_Country.Country_Code,
AVG(Coalesce(Fact_DTI.OBS_Values,0)) As Internet_Penetration_Level
from Fact_DTI
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
where Dim_Indicators.Indicators = 'Internet_Index'
and Dim_Country.Country_Code in ('EGY', 'ARE', 'IND','SAU','GBR')
Group by Dim_Country.Country_Code;


						--4- Digital Payments Level--

Select Dim_Country.Country_Code,
Round(AVG(coalesce(Fact_DTI.OBS_Values,0)) ,1) As Digital_Payments_Level
from Fact_DTI
join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
where Dim_Indicators.Indicators = 'Digital_Payments_Index'
and Dim_Country.Country_Code in ('ARE', 'EGY', 'SAU', 'GBR', 'IND')
Group by Dim_Country.Country_Code;


									-- Analysis--		

						--1- E-GOV Development Trend Over Time--

Select Dim_Year.Year,
Dim_Country.Country_Code,
ROUND(AVG(coalesce(Fact_DTI.OBS_Values,0)), 3) As E_GOV_Trend_Over_Time
From Fact_DTI
Join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
where Dim_Indicators.Indicators = 'E-GOV_Index'
and Dim_Country.Country_Code in ('ARE', 'EGY', 'SAU', 'IND','GBR')
Group by Dim_Year.Year,
Dim_Country.Country_Code
order by E_GOV_Trend_Over_Time DESC;

					--2- Internet Penetration Trend Over Time--

Select Dim_Year.Year,
Dim_Country.Country_Code,
Round(Avg(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Internet_Penetration_Trend_Over_Time
From Fact_DTI
Join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
where Dim_Indicators.Indicators = 'Internet_Index'
And Dim_Country.Country_Code in ('GBR', 'ARE', 'EGY', 'IND', 'SAU')
Group by Dim_Year.Year,
Dim_Country.Country_Code
Order by Internet_Penetration_Trend_Over_Time DESC;


						--3- Digital_Payments Trend Over Time--
Select Dim_Year.Year,
Dim_Country.Country_Code,
Round(AVG(coalesce(Fact_DTI.OBS_Values,0)), 3) As Digital_Payments_Trend_Over_Time
From Fact_DTI
Join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
Join Dim_Country on Dim_Country.Country_Key =  Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
where Dim_Indicators.Indicators = 'Digital_Payments_Index'
And Dim_Country.Country_Code in ('ARE', 'GBR', 'SAU', 'IND', 'EGY')
Group by Dim_Year.Year,
Dim_Country.Country_Code
Order by Digital_Payments_Trend_Over_Time DESC;

							--4- Financial Inclusion Trend Over Time--
Select Dim_Year.Year,
Dim_Country.Country_Code,
Round(AVG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Financial_Inclusion_Trend_Over_Time
From Fact_DTI
join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
where Dim_Indicators.Indicators = 'FI_Index'
And Dim_Country.Country_Code in ('ARE', 'GBR', 'SAU', 'EGY', 'IND')
Group by Dim_Year.Year,
Dim_Country.Country_Code
Order by Financial_Inclusion_Trend_Over_Time DESC;


-- 2- Digital Transformation Indicators Analysis Across Countries--

											-- KPI`s--
									--1- E-Government Level--
Select Dim_Country.Country_Code,
Round(AvG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As E_GOV_Level
From Fact_DTI
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Where Dim_Indicators.Indicators = 'E-GOV_Index'
And Dim_Country.Country_Code in ('ARE', 'GBR', 'IND', 'SAU', 'EGY')
Group by Dim_Country.Country_Code;


								--2- Internet Penetration Level--
Select Dim_Country.Country_Code,
Round(AVG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Internet_Penetration_Level
From Fact_DTI
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Where Dim_Indicators.Indicators = 'Internet_Index'
And Dim_Country.Country_Code in ('ARE', 'IND', 'EGY', 'GBR', 'SAU')
Group by Dim_Country.Country_Code;


									--3- Digital Payments Level--
Select Dim_Country.Country_Code,
Round(Avg(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Digital_Payments_Level
From Fact_DTI
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
where Dim_Indicators.Indicators = 'Digital_Payments_Index'
And Dim_Country.Country_Code in ('GBR', 'SAU', 'IND', 'ARE', 'EGY')
Group by Dim_Country.Country_Code;



												-- Analysis--	
								--E-Government Performance Across Countries--
Select Dim_Country.Country_Code,
Round(AVG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As E_Government_Performance_Across_Countries
From Fact_DTI
join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Where Dim_Indicators.Indicators = 'E-GOV_Index'
And Dim_Country.Country_Code in ('GBR', 'ARE', 'SAU', 'IND', 'EGY')
Group by Dim_Country.Country_Code
Order by E_Government_Performance_Across_Countries DESC;


								--2- Internet Penetration Across Countries--
Select Dim_Country.Country_Code,
Round(AVG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Internet_Penetration_Across_Countries
From Fact_DTI
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Where Dim_Indicators.Indicators = 'Internet_Index'
And Dim_Country.Country_Code in ('EGY', 'IND', 'GBR', 'SAU', 'ARE')
Group by Dim_Country.Country_Code
Order by Internet_Penetration_Across_Countries DESC;


								--3- Digital Payments Adoption Across Countries--
Select Dim_Country.Country_Code,
ROUND(AVG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Digital_Payments_Adoption_Across_Countries
From Fact_DTI
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Where Dim_Indicators.Indicators = 'Digital_Payments_Index'
And Dim_Country.Country_Code in ('IND', 'EGY', 'GBR', 'SAU', 'ARE')
Group by Dim_Country.Country_Code
Order by Digital_Payments_Adoption_Across_Countries DESC;


									-- 4- Overall Digital Transformation Ranking--
Select Dim_Country.Country_Code,
Round(AVG(Coalesce(Fact_DTI.OBS_Values, 0)), 3) As Overall_Digital_Transformation_Ranking
From Fact_DTI
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Where Dim_Indicators.Indicators = 'Digital_Transformation_Index'
And Dim_Country.Country_Code in ('EGY', 'GBR', 'IND', 'ARE', 'SAU')
Group by Dim_Country.Country_Code
Order by Overall_Digital_Transformation_Ranking DESC;


-- 3- Impact Of Digital Transformation on Financial Inclusion--

										  -- KPI`s--
								--1- Digital Transformation Level--

Select Dim_Country.Country_Code,
ROUND(AVG(Coalesce(Fact_DTI.OBS_Values,0)), 3) As Digital_Transformation_Level
From Fact_DTI
Join Dim_Country on Dim_Country.Country_Key =Fact_DTI.Country_Key
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Where Dim_Indicators.Indicators = 'Digital_Transformation_Index'
And Dim_Country.Country_Code in ('IND', 'EGY', 'ARE', 'GBR', 'SAU')
Group by Dim_Country.Country_Code
Order by Digital_Transformation_Level DESC;

								--2- Financial Inclusion Level--
Select Dim_Country.Country_Code,
Round(AVG(Coalesce(Fact_DTI. OBS_Values,0)), 3) As Financial_Inclusion_Level
From Fact_DTI
Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
Where Dim_Indicators.Indicators = 'FI_Index'
And Dim_Country.Country_Code in ('IND', 'ARE', 'EGY', 'SAU', 'GBR')
Group by Dim_Country.Country_Code
Order by Financial_Inclusion_Level DESC;

							
							   		--3- Digital Transformation Growth--

--Create a temporary table named Period--

WITH periods AS (
    SELECT
        Dim_Country.Country_Code,
		Dim_Year.Year,
		Dim_Indicators.Indicators,
		Fact_DTI.OBS_Values,

        CASE 
            WHEN Dim_Year.Year BETWEEN 2015 AND 2018 THEN 'First'
            WHEN Dim_Year.Year BETWEEN 2021 AND 2024 THEN 'Last'
        END AS Period_Type

    From Fact_DTI
	Join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
	Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
	Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
	Where Dim_Indicators.Indicators = 'Digital_Transformation_Index'
)

SELECT 
    Country_Code,

    AVG(CASE WHEN Period_Type = 'First' THEN OBS_Values END) AS Avg_First_Period,

    AVG(CASE WHEN Period_Type = 'Last' THEN OBS_Values END) AS Avg_Last_Period,

    (
        AVG(CASE WHEN Period_Type = 'Last' THEN OBS_Values END)
        -
        AVG(CASE WHEN Period_Type = 'First' THEN OBS_Values END)
    ) AS Digital_Transformation_Growth

FROM periods
GROUP BY Country_Code
Order by Digital_Transformation_Growth DESC;

	 
										 --4- Financial Inclusion Growth--

With Period As (
	Select 
		Dim_Year.Year,
		Dim_Country.Country_Code,
		Fact_DTI.OBS_Values
		
	From Fact_DTI
	join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
	Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
	Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
	Where Dim_Indicators.Indicators = 'FI_Index'
	),
	Calculated As (
		Select Country_Code,
			Max(Case When Year = 2017 Then OBS_Values End) As First_Year,
			Coalesce(
				MAX(Case When Year = 2024 Then OBS_Values End),
				MAx(Case When Year = 2021 Then OBS_Values End)
		) As Last_Year
		
		From Period
		Group By Country_Code
	)
	Select
		Country_Code,
		(Last_Year - First_Year) As Financial_Inclusion_Growth
	From Calculated
	Order by Financial_Inclusion_Growth DESC;

								
								--5- Main Driver of Financial--

SELECT 
    Dim_Indicators.Indicators AS Driver,
    AVG(Fact_DTI.OBS_Values) AS Driver_Score,
	
    (SELECT AVG(Fact_DTI.OBS_Values)
     FROM Fact_DTI 
     JOIN Dim_Indicators  
        ON Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
     WHERE Dim_Indicators.Indicators = 'FI_Index'
    ) AS FI_Level

FROM Fact_DTI 
JOIN Dim_Indicators  
    ON Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key

WHERE Dim_Indicators.Indicators IN 
('E-GOV_Index','Internet_Index','Digital_Payments_Index')

GROUP BY Dim_Indicators.Indicators;







Select Indicators
from Dim_Indicators;

Select 
	Dim_Year.Year,
	Dim_Country.Country_Code,
	Dim_Indicators.Indicators,
	Fact_DTI.OBS_Values

From Fact_DTI
	Join Dim_Country on Dim_Country.Country_Key = Fact_DTI.Country_Key
	Join Dim_Year on Dim_Year.Year_Key = Fact_DTI.Year_Key
	Join Dim_Indicators on Dim_Indicators.Indicator_Key = Fact_DTI.Indicator_Key
	Where Dim_Indicators.Indicators = 'Fi_Index'
	Order by Dim_Year.Year DESC;

