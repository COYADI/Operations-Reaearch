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

var Onuclear{j in 1..3} binary;
var Ocoal{j in 1..6} binary;
var Ogas{j in 1..12} binary;
var Ooil{j in 1..2} binary;
var Owater{j in 1..27} binary;
var Opump{j in 1..2} binary;
var Owind{j in 1..28} binary;
var Osolar{j in 1..26} binary;
var Ogaselec binary;

minimize cost :
	Cnuclear * sum{j in 1..3}(Gnuclear[j] * Onuclear[j]) 
	+ Ccoal * sum{j in 1..6}(Gcoal[j] * Ocoal[j])
	+ Cgas * sum{j in 1..12}(Ggas[j] * Ogas[j])
	+ Coil * sum{j in 1..2}(Goil[j] * Ooil[j])
	+ Cwater * sum{j in 1..27}(Gwater[j] * Owater[j])
	+ Cpump * sum{j in 1..2}(Gpump[j] * Opump[j])
	+ Cwind * sum{j in 1..28}(Gwind[j] * Owind[j])
	+ Csolar * sum{j in 1..26}(Gsolar[j] * Osolar[j])
	+ Cgaselec * Ggaselec * Ogaselec;

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

subject to operatingnuclear{j in 1..3}:
	Gnuclear[j] <= UBnuclear[j] * Onuclear[j];
subject to operatingcoal{j in 1..6}:
	Gcoal[j] <= UBcoal[j] * Ocoal[j];
subject to operatinggas{j in 1..12}:
	Ggas[j] <= UBgas[j] * Ogas[j];
subject to operatingoil{j in 1..2}:
	Goil[j] <= UBoil[j] * Ooil[j];
subject to operatingwater{j in 1..27}:
	Gwater[j] <= UBwater[j] * Owater[j];
subject to operatingpump{j in 1..2}:
	Gpump[j] <= UBpump[j] * Opump[j];
subject to operatingwind{j in 1..28}:
	Gwind[j] <= UBwind[j] * Owind[j];
subject to operatingsolar{j in 1..26}:
	Gsolar[j] <= UBsolar[j] * Osolar[j];
subject to operatinggaselec:
	Ggaselec <= UBgaselec * Ogaselec;

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
