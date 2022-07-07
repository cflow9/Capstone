
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Month Park Recreation";
	vbar Park / response=Recreation group=Month groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Month Park Total Visits";
	vbar Park / response=totalvisits group=Month groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Month Park Total Visits";
	vbar Park / response=year group=Month groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;