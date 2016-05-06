## Fragmented scenarios

`<todo @jack>` To include reference to the LIMITS scenarios `</todo>`

The fragmented scenarios take up existing commitments and pledges – mostly specified until
2020 – and extrapolate the level of stringency reflected in the commitments until the end of the century. They involve a domestic climate mitigation effort, without any emissions trading or other international climate policy mechanisms. Two variations are considered, a reference (ref) and a stringent (str) case, representing a low and a higher level of ambition in the interpretation of the pledges.

These two fragmented policy cases include GHG emissions reductions targets, renewable energy shares in power generation or final energy, and renewable and nuclear capacity installation targets for 26 world regions. They have been developed in the AMPERE project based on a collection of national targets and Copenhagen pledges for 2020 and beyond, which are reported at the end of this page.


`<todo @jack>` To report them at the end of the page`</todo>`



### Implementation in WITCH

#### GHG emissions reductions in 2020

For each of the 26 subregions of the LIMITS protocol((USA, JPN, EU15, EU12, RUS, MEA, CHN, IND, SSA, LAM, SEA, SAS, KOR, EEU, TUR, TWN, AUZN, CAN, SAF, CAS, PAK, EFTA, NAF, IDN, MEX, BRA)) $N$, we find the emission target for year 2020 $e_{2020}$, which is equal to:

*  the baseline emission in 2020 $b_{2020}$,`<todo @jack>` $b_{2020}$ has been already defined in [Energy module](mod_energy) as "emi_baseline. To name it with the same name and to put a link"`</todo>`
 calculated downscaling the WITCH business-as-usual results into the 26 subregions((We assume that the subregions emissions shares are the same in 2005 and 2020)), if no pledges are declared

*  the pledged emissions target, calculated as a percentage reduction $r$ from baseline emissions, either in 2005 or 2020, when such a percentage is given and only if the target implies less emissions than in the baseline  $e_{2020} = \min(b_{2020}, (1-r)*b_{2005,2020})$

*  the pledged emissions target, calculated as a percentage reduction $r$ in carbon intensity $c=e/g$, either in 2005 or in 2020, when such percentage is given and only if the target implies less emissions than in the baseline $e_{2020} = \min(b_{2020}, g_{2020} (1-r)*c_{2005,2020})$

`<todo @jack>`To define $e$ and $g$ `</todo>`

Let us introduce the following symbols:

*  $n$: one of the 13 native regions of WITCH (usa, oldeuro, neweuro, kosau, cajaz, te, mena, ssa, sasia, china, easia, laca, india)

*  $N$: one of the 26 subregions of the LIMITS protocol 

*  $map_{n,N}$: the set of $N$ inside $n$  (see [#Table A1](#Table A1))


## Appendix

### Table A1

 | $N$       | $n$             | 
 | ---       | ---             | 
 | usa       | USA             | 
 | oldeuro   | EU15,EFTA       | 
 | neweuro   | EU12            | 
 | kosau     | AUZN,KOR,SAF    | 
 | cajaz     | JPN,CAN         | 
 | te        | EEU,RUS,TUR,CAS | 
 | mena      | MEA,NAF         | 
 | ssa       | SSA             | 
 | sasia     | PAK,SAS         | 
 | china     | CHN,TWN         | 
 | easia     | SEA             | 
 | laca      | LAM,MEX,BRA     | 
 | india     | IND             | 
 | indonesia | IDN             | 


##### GHG emissions reductions in 2020

`<todo @jack>` To include the equation "emi_cop_2020"`</todo>`

`<todo @jack>` To include the table to explain each variable as in the [Economy module](mod_economy)`</todo>`

`<todo @jack>` To include the "References" section at the end of the page `</todo>`

