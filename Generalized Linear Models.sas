ods noproctitle;
ods graphics / imagemap=on;

proc genmod data=PARKS.FILTEREDMONTHLYDATA plots=(predicted resraw(index) 
		stdreschi(index) );
	class Month Park Year totalvisits / param=glm;
	model Recreation=Month Park Year totalvisits / dist=normal;
run;