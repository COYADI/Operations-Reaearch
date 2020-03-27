param J;

param p{j in 1..J};
param r{j in 1..J};
param d{j in 1..J};

var T{j in 1..J} integer;
var C{j in 1..J} integer;
var z{i in 1..J, j in 1..J} binary;
var M integer;

minimize tardiness:
	sum{j in 1..J} T[j];

subject to Ts{j in 1..J}:
	T[j] >= C[j] - d[j];
subject to CfirstCase{i in 1..J, j in 1..J}:
	C[i] + p[j] - C[j] <= M * z[i, j];
subject to CsecondCase{i in 1..J, j in 1..J}:
	C[j] + p[i] - C[i] <= M * (1 - z[i, j]);
subject to Cs{j in 1..J}:
	C[j] >= p[j] + r[j];
subject to nonnegT{j in 1..J}:
	T[j] >= 0;
subject to nonnegC{j in 1..J}:
	C[j] >= 0;
subject to Ms:
	M = sum{j in 1..J} (p[j] + r[j]);
subject to z1{i in 1..J, j in 1..J}:
	z[i, j] <= 1;
subject to z2{i in 1..J, j in 1..J}:
	z[i, j] >= 0;