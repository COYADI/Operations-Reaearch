param N;
param M;
param T;

param Productivity{i in 1..N};
param Demand{j in 1..M};
param Price{i in 1..N, j in 1..M};
param Added{i in 1..N};

var x{i in 1..N, j in 1..M};
var y{i in 1..N};
var z{i in 1..N, j in 1..M};

maximize profit:
	10 * (sum{i in 1..N, j in 1..M} (Price[i, j] * x[i, j])) - (sum{i in 1..N} (Added[i] * y[i])) + T * (sum{i in 1..N, j in 1..M} (Price[i, j] * z[i, j]));

subject to productCapacity{i in 1..N}:
	sum{j in 1..M} x[i, j] <= Productivity[i];
subject to addedCapacity{i in 1..N}:
	sum{j in 1..M} z[i, j] <= y[i];
subject to demand{j in 1..M}:
	sum{i in 1..N} x[i, j] + sum{i in 1..N} z[i, j] <= Demand[j];
subject to nonnegX{i in 1..N, j in 1..M}:
	x[i, j] >=0;
subject to nonnegY{i in 1..N}:
	y[i] >=0;
subject to nonnegZ{i in 1..N, j in 1..M}:
	z[i, j] >=0;