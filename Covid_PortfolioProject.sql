
Select *
From PortfolioProject..CovidDeaths
order by 3,4

--select *
--From PortfolioProject..CovidVacinations
--Order by 3,4

-- Select Data that we are going to  be using
Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
order by 1,2



-- Looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract covid in your area
EXEC sp_help 'dbo.CovidDeaths';
Alter Table dbo.CovidVacinations
Alter Column new_vaccinations int

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where location like '%states%'
order by 1,2

-- Looking at Total Cases vs Population
Select Location, date, total_cases, population, (total_cases/population)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where location like '%Nigeria%'
order by 1,2

--Looking at countries with highest infection rate compared to population
Select Location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--where location like '%states%'
Group by location, population
order by PercentPopulationInfected desc

-- Showing Countries with the highest death count per population
Select location, MAX(total_deaths) AS TotalDeathCount, MAX((total_deaths/population))*100 as PercentPopulationDeaths
From PortfolioProject..CovidDeaths
--where location like '%states%'
--where continent is not Null
Group by location
order by PercentPopulationDeaths desc

-- Showing the continents with the highest Death counts
Select continent, MAX(total_deaths) AS TotalDeathCount, MAX((total_deaths/population))*100 as PercentPopulationDeaths
From PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is not Null
Group by continent
order by TotalDeathCount desc


-- Globla Numbers
Select SUM(new_cases) as totalCases, SUM(new_deaths) as totalDeaths, isnull(SUM(new_deaths)/nullif(sum(new_cases),0)*100,0) as DeathPercentage
From PortfolioProject..CovidDeaths
--where location like '%Nigeria%'
where continent is not Null
--group by date
order by 1,2




--Working on Covid Vacination data
Select*
From PortfolioProject..CovidDeaths deaths
join PortfolioProject..CovidVacinations	Vac
	ON deaths.location = vac.location
	and deaths.date = vac.date

-- looking at total population  vs vaccinations

EXEC sp_help "PortfolioProject..CovidVacinations";
Alter Table PortfolioProject..CovidVacinations
Alter column new_vaccinations float
-- USE CTE
with PopvsVac(continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select deaths.continent, deaths.location, deaths.date, deaths.population, Vac.new_vaccinations
,SUM(vac.new_vaccinations) over(partition by deaths.location order by deaths.location,
deaths.date rows unbounded preceding) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths deaths
join PortfolioProject..CovidVacinations	Vac
	ON deaths.location = vac.location
	and deaths.date = vac.date
Where deaths.continent is not Null
and Vac.new_vaccinations is not Null
--order by 2,3
)
Select * , (RollingPeopleVaccinated/Population)*100
from PopvsVac


-- Temp Table
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Locatioin nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select deaths.continent, deaths.location, deaths.date, deaths.population, Vac.new_vaccinations
,SUM(vac.new_vaccinations) over(partition by deaths.location order by deaths.location,
deaths.date rows unbounded preceding) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths deaths
join PortfolioProject..CovidVacinations	Vac
	ON deaths.location = vac.location
	and deaths.date = vac.date
Where deaths.continent is not Null
and Vac.new_vaccinations is not Null
--order by 2,3
Select * , (RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated


-- Creating view to store data for later visualizations

Create View PerecentPopulationVaccinated as
Select deaths.continent, deaths.location, deaths.date, deaths.population, Vac.new_vaccinations
,SUM(vac.new_vaccinations) over(partition by deaths.location order by deaths.location,
deaths.date rows unbounded preceding) as RollingPeopleVaccinated
From PortfolioProject..CovidDeaths deaths
join PortfolioProject..CovidVacinations	Vac
	ON deaths.location = vac.location
	and deaths.date = vac.date
Where deaths.continent is not Null
and Vac.new_vaccinations is not Null
--order by 2,3


Select *
From #PercentPopulationVaccinated
