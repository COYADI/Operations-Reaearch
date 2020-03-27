param N; # number of district

param Distance{i in 1..N, j in 1..N}; # the distance

param weight{i in 1..N};

var x{i in 1..N} binary; # allocate ambulance
var y{i in 1..N, j in 1..N} binary; # assign jobs

minimize cost: 
	sum {i in 1..N, j in 1..N} x[i]*y[i, j]*weight[i]*Distance[i,j]/2;
subject to ambulance:
	sum {i in 1..N}	x[i]<=2;
subject to assign{j in 1..N}:
	sum {i in 1..N} x[i]*y[i,j] >= 1;

