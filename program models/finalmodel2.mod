param UBnuclear{j in 1..3};
param UBcoal{j in 1..6};
param UBgas{j in 1..12};
param UBoil{j in 1..2};
param UBwater{j in 1..27};
param UBpump{j in 1..2};
param UBwind{j in 1..28};
param UBsolar{j in 1..26};
param UBgaselec;

param DW;
param avgDW;

param Cnuclear;
param Ccoal;
param Cgas;
param Coil;
param Cwater;
param Cpump;
param Cwind;
param Csolar;
param Cgaselec;

var Gnuclear{j in 1..3};
var Gcoal{j in 1..6};
var Ggas{j in 1..12};
var Goil{j in 1..2};
var Gwater{j in 1..27};
var Gpump{j in 1..2};
var Gwind{j in 1..28};
var Gsolar{j in 1..26};
var Ggaselec;

minimize cost :
	Cnuclear * sum{j in 1..3}(Gnuclear[j]) 
	+ Ccoal * sum{j in 1..6}(Gcoal[j])
	+ Cgas * sum{j in 1..12}(Ggas[j])
	+ Coil * sum{j in 1..2}(Goil[j])
	+ Cwater * sum{j in 1..27}(Gwater[j])
	+ Cpump * sum{j in 1..2}(Gpump[j])
	+ Cwind * sum{j in 1..28}(Gwind[j])
	+ Csolar * sum{j in 1..26}(Gsolar[j])
	+ Cgaselec * Ggaselec;

subject to upperboundnuclear{j in 1..3}:
	Gnuclear[j] <= UBnuclear[j];
subject to upperboundcoal{j in 1..6}:
	Gcoal[j] <= UBcoal[j];
subject to upperboundgas{j in 1..12}:
	Ggas[j] <= UBgas[j];
subject to upperboundoil{j in 1..2}:
	Goil[j] <= UBoil[j];
subject to upperboundwater{j in 1..27}:
	Gwater[j] <= UBwater[j];
subject to upperboundpump{j in 1..2}:
	Gpump[j] <= UBpump[j];
subject to upperboundwind{j in 1..28}:
	Gwind[j] <= UBwind[j];
subject to upperboundsolar{j in 1..26}:
	Gsolar[j] <= UBsolar[j];
subject to upperboundgaselec:
	Ggaselec <= UBgaselec;

subject to fulfill:
	sum{j in 1..3}Gnuclear[j]
	+ sum{j in 1..6}Gcoal[j]
	+ sum{j in 1..12}Ggas[j]
	+ sum{j in 1..2}Goil[j]
	+ sum{j in 1..27}Gwater[j]
	+ sum{j in 1..2}Gpump[j]
	+ sum{j in 1..28}Gwind[j]
	+ sum{j in 1..26}Gsolar[j]
	+ Ggaselec >= DW;
	
subject to nuclearfree{j in 1..3}:
	Gnuclear[j] = 0;
subject to target1:
	sum{j in 1..27}Gwater[j] + sum{j in 1..2}Gpump[j] + sum{j in 1..28}Gwind[j] + sum{j in 1..26}Gsolar[j] >= 0.2 * avgDW;
subject to target2:
	sum{j in 1..6}Gcoal[j] >= 0.3 * avgDW;
subject to target3:
	sum{j in 1..12}Ggas[j] + Ggaselec >= 0.5 * avgDW;

subject to operatingnuclear{j in 1..3}:
	Gnuclear[j] <= UBnuclear[j];
subject to operatingcoal{j in 1..6}:
	Gcoal[j] <= UBcoal[j];
subject to operatinggas{j in 1..12}:
	Ggas[j] <= UBgas[j];
subject to operatingoil{j in 1..2}:
	Goil[j] <= UBoil[j];
subject to operatingwater{j in 1..27}:
	Gwater[j] <= 0.27 * UBwater[j];
subject to operatingpump{j in 1..2}:
	Gpump[j] <= 0.27 * UBpump[j];
subject to operatingwind{j in 1..28}:
	Gwind[j] <= 0.29 * UBwind[j];
subject to operatingsolar{j in 1..26}:
	Gsolar[j] <= 0.11 * UBsolar[j];
subject to operatinggaselec:
	Ggaselec <= UBgaselec;

subject to nonnegnuclear{j in 1..3}:
	Gnuclear[j] >= 0;
subject to nonnegcoal{j in 1..6}:
	Gcoal[j] >= 0;
subject to nonneggas{j in 1..12}:
	Ggas[j] >= 0;
subject to nonnegoil{j in 1..2}:
	Goil[j] >= 0;
subject to nonnegwater{j in 1..27}:
	Gwater[j] >= 0;
subject to nonnegpump{j in 1..2}:
	Gpump[j] >= 0;
subject to nonnegwind{j in 1..28}:
	Gwind[j] >= 0;
subject to nonnegsolar{j in 1..26}:
	Gsolar[j] >= 0;
subject to nonneggaselec:
	Ggaselec >= 0;