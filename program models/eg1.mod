var x1;
var x2;

maximize profit: x1 + x2;

subject to resource_1: x1 + 2 * x2 <= 6;
subject to resource_2: 2 * x1 + x2 <= 6;
subject to nonneg_1: x1 >= 0;
subject to nonneg_2: x2 >= 0;