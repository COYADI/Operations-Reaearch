var x1;
var x2;
var x3;
var x4;
var x5;
var x6;
var x7;

maximize result : 7 * x1 + 4 * x2 + x3 + 3 * x4 + x5 + 2 * x6 + 5 * x7;

subject to constraint1 :
	8 * x1 + 6 * x2 + 3 * x3 + 4 * x4 + 2 * x5 + 7 * x6 + 7 * x7 <= 20;
subject to constraint2 :
	x1 <= 1;
subject to constraint3 :
	x2 <= 1;
subject to constraint4 :
	x3 <= 1;
subject to constraint5 :
	x4 <= 1;
subject to constraint6 :
	x5 <= 1;
subject to constraint7 :
	x6 <= 1;
subject to constraint8 :
	x7 <= 1;

subject to nonneg1 :
	x1 >= 0;
subject to nonneg2 :
	x2 >= 0;
subject to nonneg3 :
	x3 >= 0;
subject to nonneg4 :
	x4 >= 0;
subject to nonneg5 :
	x5 >= 0;
subject to nonneg6 :
	x6 >= 0;
subject to nonneg7 :
	x7 >= 0;
