PROC IMPORT OUT= WORK.DATA 
            DATAFILE= "G:\My Drive\Biostats\top2018.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

data data;
set data;
rank = _n_;
run;

proc reg data= data plots(label)=(CooksD RStudentByLeverage);
where ^in(99);
model rank = loudness energy tempo danceability key speechiness / influence vif;
id rank;
title "Regression Diagnostics -- Top Sportify Tracks 2018";
run;
quit;

proc reg data= data plots(label)=(CooksD RStudentByLeverage);
model rank = loudness energy tempo danceability key speechiness / influence vif;
id rank;
title "Regression Diagnostics -- Top Sportify Tracks 2018";
run;
quit;

proc glm data = data;
model rank = loudness energy tempo danceability key speechiness / c1parm;
title "Confidence Intervals";
run;
quit;

proc rsquare data = data adjrsq mse cp;
model rank = loudness energy tempo danceability key speechiness;
title "test";
run;

