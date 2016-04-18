# Economic impacts from climate change (damage)

    
In the WITCH model a set of regional reduced-form damage functions ($\Omega$) link the global temperature increase above pre-industrial levels to changes in regional gross domestic product (Y):

\begin{equation}
    Y(t,n) =  \frac{  tfp_0(n)
                      \left( \alpha(n)
                        \left( tfp_y(t,n) K_C(t,n)^{\beta(n)}l(t,n)^{(1-\beta(n))}
                        \right)^{\rho} + 
                        (1-\alpha(n)) ES^{\rho}(t,n)
                      \right)^{\frac{1}{\rho}}
                    }{\Omega(t,n)},
\end{equation}
 
Adaptation reduces the extent to which temperature increase affects output:

$$
    \Omega(t,n) = 1+ \frac{\Big(\omega_{1,n}^-T(t,n) + \omega_{2,n}^-T(t,n)^{\omega_{3,n}^-}+\omega_{4,n}^-\Big)}{1+Q(ADA,t,n)^{\epsilon(n)}}
    + \Big(\omega_{1,n}^+T(t,n) + \omega_{2,n}^+T(t,n)^{\omega_{3,n}^+}+\omega_{4,n}^+\Big)
$$	
    

 | Symbol           | Definition                                                  | GAMS                      | Unit     | 
 | ------           | ----------                                                  | ----                      | ----     | 
 | $\Omega(t,n)$    | Damage coefficient                                          | ''%%OMEGA(t,n)%%''        | unitless | 
 | $\omega_{i,n}^-$ | coefficients with negative impact                           | ''%%comega_neg(n,i)  %%'' | unitless | 
 | $\omega_{i,n}^+$ | coefficients with positive impact                           | ''%%comega_pos(n,i)  %%'' | unitless | 
 | $T(t,n)$         | atmospheric temperature increase from pre-industrial levels | ''%%TEMP('atm',t,n) %%''  | degrees  | 
 | $Q(ADA,t,n)$     | Adaptation factor                                           | ''%%Q('ADA',t,n) %%''     |          | 

To compute the economic damages measured as percentage of GDP, they can be computed from $\Omega(t,n)$ readily as 

$$
Damages(\%\ of\ GDP) = 1 - \frac{1}{\Omega(t,n)}
$$


# Calibration

The main data sources are the FP7 ClimateCost  project (Bosello et al. 2012) and Nordhaus (2007). The details are described in Bosello and De Cian (2014).

Market impact estimates are from the FP7 ClimateCost project (Bosello et al. 2012). We consider the economic impacts of climate change on the rise in sea-level, energy demand, and agricultural productivity as estimated by the recursive-dynamic computable general equilibrium (CGE) model ICES (Bosello et al. 2012). Therefore, the market damage component is net of the autonomous adaptation and the $\omega_{i,n}$ coefficients account for autonomous adaptation to market impacts. 

The non-market damage component includes ecosystem losses, non-market health impacts, and catastrophic damages. Damage estimates for health and catastrophic damage are from Nordhaus (2007). Only for Europe do health impacts also include the impacts on labour productivity estimated in ClimateCost by Kovats and Lloyd (2011). Nordhaus and Boyer (2000) cite unpublished estimates of the capital value of climate-sensitive human settlements and natural ecosystems in each sub-region, and estimate that each sub-region has an annual WTP of 1% of the capital value of the vulnerable system for a 2.5°C temperature increase (0.1% of GDP in the USA).  They  adjust the willingness to pay for income levels. Bosello and De Cian (2014) replace Nordhaus and Boyer’s estimates with updated calculations of the WTP following the approach used in the MERGE model (Manne et al. 2005). Bosello and De Cian (2014) follow a similar approach, but as proxy for the WTP they use the EU expenditure on environmental protection, which gives a value equal to 0.6% of EU25 GDP, or equal to 120 euros per capita . A s-shaped relationship between per-capita income and WTP is used to compute the WTP in the different model regions.

The Figure below decomposes regional climate impacts at the calibration point by impact category.

{{ :impacts.png?nolink | Climate change impacts at calibration point}}

# References


*  Bosello F, De Cian E. (2014). Documentation on the development of damage functions and adaptation module in the WITCH model, http://www.witchmodel.org/pag/publications.html

*  Bosello F, Eboli F, Pierfederici R (2012). Assessing the Economic Impacts of Climate Change. An Updated CGE Point of View. FEEM Note di Lavoro, No. 2.2012.

*  Nordhaus WD, Boyer JG (2000). Warming the World: the Economics of the Greenhouse Effect. The MIT Press

*  Manne A, Richels R (2005). MERGE: An Integrated Assessment Model for Global Climate Change. Energy and Environment, 175-189.
