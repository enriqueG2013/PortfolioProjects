select * from dbo.covid_deaths;


--1. Data Visulization 1
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as Total_deaths, sum(cast(new_deaths as int)) / sum(new_cases) * 100 as DeathPercentage
from covid_deaths
where continent is not null
order by 1,2;


--2. Data Visualization 2
select location, sum(cast(new_deaths as int)) as TotalDeathCount
from covid_deaths
where continent is null
and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount desc;

--3. Data Visialization 3
select location, population, max(total_cases) as HighestInfectionRate, max(total_cases/population) * 100 as PercentPopulationInfected
from covid_deaths
group by location, population
order by PercentPopulationInfected desc;

--4. Data Visualization 4
select location, population, date, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths
group by location, population, date
order by PercentPopulationInfected;

