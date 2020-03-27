param N;
param a{i in 1..N};
param b{i in 1..N};
var x{i in 1..N} integer;

maximize ans:
	sum{i in 1..N}a[i]*x[i];
subject to cons:
	sum{i in 1..N}b[i]*x[i]<=13;
subject to noneg{i in 1..N}:
	x[i]>=0;
subject to  two {i in 1..N}:
	x[i]<=2;