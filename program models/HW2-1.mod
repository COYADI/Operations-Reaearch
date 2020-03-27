var y1;
var y2;
var y3;
var y4;
var y5;
var y6;
var y7;
var y8;

minimize result : 20 * y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8;

subject to constraint1 :
	8 * y1 + y2 >= 7;
subject to constraint2 :
	6 * y1 + y2 >= 4;
subject to constraint3 :
	3 * y1 + y2 >= 1;
subject to constraint4 :
	4 * y1 + y2 >= 3;
subject to constraint5 :
	2 * y1 + y2 >= 1;
subject to constraint6 :
	7 * y1 + y2 >= 2;
subject to constraint7 :
	7 * y1 + y2 >= 5;

subject to nonneg1 :
	y1 >= 0;
subject to nonneg2 :
	y2 >= 0;
subject to nonneg3 :
	y3 >= 0;
subject to nonneg4 :
	y4 >= 0;
subject to nonneg5 :
	y5 >= 0;
subject to nonneg6 :
	y6 >= 0;
subject to nonneg7 :
	y7 >= 0;
subject to nonneg8 :
	y8 >= 0;