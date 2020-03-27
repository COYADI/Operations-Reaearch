param A;
param B;

var x;
var y;

minimize profit:
	x + y;

subject to x:
	x = A or x = -B;
subject to y:
	y = -A or y = B;