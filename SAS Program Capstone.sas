/*LIBNAME FOR OUTPUT and INPUT FOLDERS*/
LIBNAME Parks '/home/u59841240/Capstone/input';
LIBNAME Results '/home/u59841240/Capstone/output';
/*IMPORT THE EXCEL DATA FILE INTO SAS*/
Options VALIDVARNAME=ANY;
PROC IMPORT datafile='/home/u59841240/Capstone/Data File/Monthly Data 2017_2021.xlsx' dbms=XLSX out=Parks.monthlyData;
RUN;
/*CHECKING THE DATASET WAS IMPORTED*/
PROC PRINT data=parks.monthlydata (obs=1000);
RUN;
/*CHECKING THE VARIABLES*/
PROC contents data=parks.monthlydata;
RUN;
/*CLEANING THE DATA SET*/
data Parks.MonthlySummaryData;
set Parks.monthlydata;
rename RecreationVisits = Recreation;
drop ParkType NonRecreationHours Region State UnitCode RecreationHours;
format RecreationVisits comma15.2 NonRecreationVisits comma15.2 RVCampers comma15.2 TentCampers comma15.2 BackcountryCampers comma15.2 ConcessionerCamping comma15.2 ConcessionerLodging comma15.2 MiscOvernightStays comma15.2 NonRecreationOvernightStays comma15.2;
totalvisits = SUM(of RecreationVisits NonRecreationVisits RVCampers TentCampers BackcountryCampers ConcessionerCamping ConcessionerLodging MiscOvernightStays NonRecreationOvernightStays);
if missing(RecreationVisits) then PUT "Recreation Visits is missing from the data set";
if missing(NonRecreationVisits) then PUT "Non Recreation Visits is missing from the data set";
if missing(RVCampers) then PUT "RV Campers is missing from the data set";
if missing(TentCampers) then PUT "Tent Campers is missing from the data set";
if missing(BackcountryCampers) then PUT "Backcountry Campers is missing from the data set";
if missing(ConcessionerLodging) then PUT "Concessioner Lodging is missing from the data set";
if missing(MiscOvernightStays) then PUT "Misc. Overnight Stays is missing from the data set";
if missing(NonRecreationOvernightStays) then PUT "Non Recreation Overnight Stays is missing from the data set";
if missing(ConcessionerCamping) then PUT "Concessioner Camping is missing from the data set";
RUN;

proc sort data = parks.MonthlySummaryData out=Parks.MonthlySorted nodup;
by Park year Month;
run;

data Parks.MonthlyClean;
set Parks.MonthlySorted;
	drop  NonRecreationVisits RVCampers TentCampers BackcountryCampers ConcessionerCamping ConcessionerLodging MiscOvernightStays NonRecreationOvernightStays;
RUN;

data Results.MonthlyCleanData;
set Parks.MonthlyClean;
RUN;

PROC print data=Results.MonthlyCleanData;
RUN;

DATA Parks.filteredMonthlyData;
set Parks.monthlyClean;
where park IN ('Great Smoky Mountains NP','Yellowstone NP');
run;

PROC PRINT DATA=parks.filteredMonthlyData;
RUN;

data Results.filteredMonthlyData;
set parks.filteredmonthlydata;
Run;

PROC PRINT DATA=Results.filteredMonthlyData;
RUN;

PROC univariate data= parks.filteredmonthlydata;
RUN;

ods graphics on;
title 'Bivariate Data';
proc corr data=Parks.filteredMonthlyData polychoric nomiss plots=matrix(histogram);
   var year recreation totalvisits month;
	by park;
run;