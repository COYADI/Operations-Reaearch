param P{i in 1..8};
param D{i in 1..8, j in 1..8};

var y{i in 1..8, j in 1..8} binary;
var f{j in 1..8} binary;
var w;

minimize time:
	w;

subject to closest{i in 1..8}:
	sum{j in 1..8} y[i, j] = 1;
subject to ambulance:
	sum{j in 1..8} f[j] = 2;
subject to capacity{i in 1..8, j in 1..8}:
	y[i, j] <= f[j];

subject to maxi{i in 1..8}:
	w >= sum{j in 1..8}(D[i, j] * y[i, j] * P[i]);

subject to more1:
	f[2] + f[3] + f[4] >= 1;
subject to more2:
	f[6] <= 1 - f[5];
subject to more3:
	f[1] + f[3] + f[6] + f[8] <= 1;