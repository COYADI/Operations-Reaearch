param n;
param m;
param P{j in 1..n};
param A{i in 1..m, j in 1..n};
param K{i in 1..m};

var q{j in 1..n};

maximize profit:
	sum{j in 1..n} (P[j] * q[j]);

subject to capacity{i in 1..m}:
	sum{j in 1..n} (A[i, j] * q[j]) <= K[i];
subject to nonnegQ{j in 1..n}:
	q[j] >= 0;