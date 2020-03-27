param n;
param m;
param p{i in 1..n};
param k{j in 1..m};
param a{i in 1..n, j in 1..m};
var x{i in 1..n};

maximize ans:
	sum{i in 1..n}p[i]*x[i];

subject to A{j in 1..m}:
	sum{i in 1..n}a[i,j]*x[i]<=k[j];

subject to noneg{i in 1..n}:
	x[i]>=0;

