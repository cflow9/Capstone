ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Recreation Park per year";
	vbar Park / response=Recreation group=Year groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Total Visits Park per year";
	vbar Park / response=totalvisits group=Year groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Month Park per year";
	vbar Park / response=month group=Year groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;

ods graphics / reset;
title;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Park per year";
	vbar Park / group=Year groupdisplay=cluster;
	yaxis grid;
run;

ods graphics / reset;
title;