param N;
param M;

param x;
param y{i in 1..N};
param z{j in 1..M};
param R{i in 1..N, j in 1..M};
param w{i in 1..N};

var b{i in 1..N} binary;
var S{i in 1..N, j in 1..M} binary;
var P{i in 1..N} integer;

minimize cost:
	sum{i in 1..N} (b[i] * w[i]) + sum{i in 1..N, j in 1..M} (6 * 2 * S[i, j] * R[i, j] * z[j]);

subject to companyCapacity{i in 1..N}:
	P[i] <= y[i];
subject to employee:
	sum{i in 1..N} P[i] >= x;
subject to workloadCapacity{i in 1..N}:
	sum{j in 1..M} (z[j] * S[i, j]) <= 1600 * P[i];
subject to operating{i in 1..N}:
	b[i] = 0 ==> sum{j in 1..M} S[i, j] <= 1600;
subject to distance{i in 1..N, j in 1..M}:
	R[i, j] > 90 ==> S[i, j] = 0;
subject to operating1{i in 1..N}:
	b[i] = 0 ==> P[i] <= 1;
subject to customer{j in 1..M}:
	sum{i in 1..N} S[i, j] = 1;
subject to nonnegS{i in 1..N, j in 1..M}:
	S[i, j] >= 0;
subject to nonnegP{i in 1..N}:
	P[i] >= 0;