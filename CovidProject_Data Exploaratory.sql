Select *
From [Portfolio project]..['owid-covid-data$']
order by 3,4

Select *
From [Portfolio project]..['owid-covid-data$']
Order by 3, 4 

--Select data that we are going to be using

Select Location, date, total_cases, total_deaths, population
From [Portfolio project]..['owid-covid-data$']

--Looking at Total Cases vs Total Deaths

Select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS death_percentage
From [Portfolio project]..['owid-covid-data$']
Where location like '%state%'
order by total_cases DESC

--Look at Total Cases vs Population 
--Shows what percentage of population got Covid
Select Location, total_cases, population, (total_cases/population)*100 As case_percentage

From [Portfolio project]..['owid-covid-data$']

--Where location like '%state%'
Order by total_cases DESC

--Looking at countries with Highest Infection Rate compared to Population
Select location,  population, MAX(total_cases) as Highest_Infection_Count, MAX((total_cases/population))*100 as Highest_Percent_Infection

From [Portfolio project]..['owid-covid-data$']

--Where location like '%state%'
Group by location, population
Order by Highest_Percent_Infection DESC

--Showing Countires with Highest Death Count per population 
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount 

From [Portfolio project]..['owid-covid-data$']
Where continent is not null
Group by location
Order by TotalDeathCount DESC

--Breaking data by Continent
Select location, date, MAX(cast(total_deaths as int)) as TotalDeathCount

From [Portfolio project]..['owid-covid-data$']

Where continent is  null
Group by location , date
Order by TotalDeathCount desc



