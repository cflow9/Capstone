
ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PARKS.FILTEREDMONTHLYDATA;
	title height=14pt "Year Count";
	vbar Year / datalabel;
	yaxis grid;
run;

ods graphics / reset;
title;