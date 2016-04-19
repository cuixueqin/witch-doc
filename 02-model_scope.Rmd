# Model scope

## Energy Sector

The [energy sector](mod_energy) is fully integrated with the rest of the economy.
It is distinguished in an electric sector, a transportation sector, and an aggregated non-electric (industry, services and residential) sectors.
The following carriers and technologies are included:

 | Primary Energy | Electricity                    | 
 | -------------- | -----------                    | 
 | Coal           | Coal with and without CCS      | 
 | Oil            | Oil without CCS                | 
 | Gas            | Gas with and without CCS       | 
 | Wind           | Wind onshore and offshore      | 
 | Solar          | Solar PV and CSP               | 
 | Uranium        | Nuclear LWR and advanced       | 
 | Bioenergy      | Bioenergy with and without CCS | 
 |                | Hydro power                    | 

Technologies that are subject to endogenous technological change are: advanced biomass, wind, solar, advanced nuclear. Overall energy efficiency is also subject to endogenous technical change.

## Land Use Sector

[Land use](mod_landuse) is linked to WITCH using reduced form equations obtained by a large number of scenarios of the [GLOBIOM](http://www.globiom.org/) land use and forestry model.
[GLOBIOM](http://www.globiom.org/) provides quantities and prices of woody biomass (both residues and plantations) and 
of avoided deforestation and afforestation mitigation options. It also provides the associated land use emissions of CO2 and CH4.
## Greenhouse gases and air pollutants

The model generates the following greenhouse gases, either directly, or assuming exogenous assumptions.
Mitigation can happen through technology substitution or storage, direct abatement via MAC or end of pipe measures via emission factors.

 | GHG     | Source               | Mitigation           | 
 | ---     | ------               | ----------           | 
 | CO2     | Endogenous           | Substitution/Storage | 
 | CH4     | Exogenous            | MAC                  | 
 | N2O     | Exogenous            | MAC                  | 
 | F gases | Exogenous            | MAC                  | 
 | SO2     | Partially Endogenous | Emissions Factors    | 
 | VOC     | Partially Endogenous | Emissions Factors    | 
 | NOx     | Partially Endogenous | Emissions Factors    | 
 | BC      | Partially Endogenous | Emissions Factors    | 
 | OC      | Partially Endogenous | Emissions Factors    | 
 | CO      | Partially Endogenous | Emissions Factors    | 
 | NH3     | Exogenous            | RCP database         | 

## Regions

Countries included within the model are grouped into 13 regions clustered on the basis
of geography, income and the structure of energy demand.


{{ map_witch.png?nolink | WITCH regions}}

The 13 regions are:

 | Region  | Countries                                           | 
 | ------  | ---------                                           | 
 | cajaz   | Canada, Japan, New Zeland                           | 
 | china   | China and Taiwan                                    | 
 | easia   | South East Asia, including Indonesia                | 
 | india   | India                                               | 
 | kosau   | South Korea, South Africa, Australia                | 
 | laca    | Latin America, Mexico and Caribbean                 | 
 | mena    | Middle East and North Africa                        | 
 | neweuro | EU new countries                                    | 
 | oldeuro | EU old countries (EU-15) + EFTA                     | 
 | sasia   | South Asia  (excluding India)                       | 
 | ssa     | Sub Saharan Africa                                  | 
 | te      | Non-EU Eastern European countries, including Russia | 
 | usa     | United States of America                            | 

## Coalitions


WITCH features any regional aggregations in the so-called coalitions.
By default, some coalitions are already defined:


*  no-cooperation : each region is mapped to a coalition containing only this region.

*  full-cooperation: the Grand Coalition containing all the world regions.
    
Coalitions and regions interact with each other because of the presence of economic
(technology, exhaustible natural resources) and environmental global externalities.

For each coalition a forward-looking agent
maximizes its own inter-temporal social welfare function, strategically and
simultaneously to other regions.

The inter-temporal equilibrium is calculated as an open-loop Nash equilibrium, but a
cooperative solution can also be implemented. More precisely, the Nash
equilibrium is the outcome of a non-cooperative, simultaneous, open membership game with full
information. Through the optimization process regions choose the optimal dynamic path of a set of control variables, namely investments, primary energy supply, oil market price and permit market price.

## Temporal process


The base year is 2005. The time horizon is 150 years, with 30 period of 5 year time step. Longer time horizon can also be run until 2300 to avoid any end-of-horizon effect, but 2150 is generally sufficient.
Results are usually reported for the period 2005-2100 and the periods 2005 and 2010 are calibrated to Statistics.

