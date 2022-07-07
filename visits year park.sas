
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Recreation Year Park";
	vbar Park / response=Year group=Recreation groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Total Visits Visits Year Park";
	vbar Park / response=Year group=totalvisits groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;
