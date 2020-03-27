param N;
param I{i in 1..N};
param W{i in 1..N};
var x{i in 1..N} integer;

maximize ans:
	sum{i in 1..N}I[i]*x[i];
subject to weight:
	sum{i in 1..N}W[i]*x[i]<=20;
subject to nonneg{i in 1..N}:
	x[i]>=0;