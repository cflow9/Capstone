
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Recreation Park Count";
	vbar Park / response=Recreation datalabel;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Total Visits Park Count";
	vbar Park / response=totalvisits datalabel;
	yaxis grid;
run;

ods graphics / reset;
title;
