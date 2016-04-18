# Adaptation

This module introduces adaptation
to climate change damages in the WITCH model. 

At the core of the adaptation module introduced in the WITCH model there are three control variables that broadly represent different forms of adaptation strategies. For the sake of simplicity, the numerous adaptive responses that are actually available in the real world have been aggregated into three categories: building specific adaptive capacity, anticipatory adaptation, and reactive adaptation: 

{{ :ada_tree.png?nolink | Adaptation strategies}}

Regional reduced-form damage functions ($\Omega$) link the global temperature increase above pre-industrial levels to changes in regional gross domestic product (Y):

\begin{align*}
    Y(t,n) = & \frac{  tfp0(n)
                      \left( \alpha(n)
                        \left( tfpy(t,n) K_{FG}(t,n)^{\beta(n)}l(t,n)^{(1-\beta(n))}
                        \right)^{\rho} + 
                        (1-\alpha(n)) ES^{\rho}(t,n)
                      \right)^{\frac{1}{\rho}}
                    }{\Omega(t,n)} \\
              &-  \sum_f C_f(t,n)\\
              &- \sum_j C_j(t,n)\\
              &- \sum_e C_e(t,n)\\
              &- \sum_{ghg} C_{ghg}(t,n),
\end{align*}


`<todo @decian80>` Link all'economy module ed eventuale aggiunta delle voci di costo (come per l'economic impacts) `</todo>`

Adaptation reduces the extent to which temperature increase affects output:

$$
    \Omega(t,n) = 1+ \frac{\Big(\omega_{1,n}^-T(t,n) + \omega_{2,n}^-T(t,n)^{\omega_{3,n}^-}+\omega_{4,n}^-\Big)}{1+Q(ADA,t,n)^{\epsilon(n)}}
    + \Big(\omega_{1,n}^+T(t,n) + \omega_{2,n}^+T(t,n)^{\omega_{3,n}^+}+\omega_{4,n}^+\Big)
$$	

The top nest of the adaptation tree describes the how activities (ACT) and capacity (CAP) are combined to produce adaptation services:

$$ 
    Q(ADA,t,n)= (\omega_{act(n)}Q(ACT,t,n)^{\rho_{ada}}+ (1-\omega_{act(n)})Q(CAP,t,n)^{\rho_{ada}})^{\frac{1}{\rho_{ada}}}
$$

Adaptation activities can take the form of reactive adaptation (RADA) and proactive adaptation (PRADA):

$$
    Q(ACT,t,n)= \omega_{eff(n)}(\omega_{rada(n)}I(RADA,t,n)^{\rho_{act}}+ (1-\omega_{rada(n)})K(PRADA,t,n)^{\rho_{act}})^{\frac{1}{\rho_{act}}}
$$

Proactive adaptation describes measures requiring that a stock of defensive capital be operational before damage materializes, such as the construction of dikes. Reactive adaptation are actions implemented when or right after climatic impacts effectively occur, for the purpose of dealing with any residual damages that anticipatory adaptation or mitigation has been unable to obviate. Examples of these strategies include change in the use of air conditioning or hospitalization and use of health services 

Adaptation capacity depends on generic capacity (GCAP) and specific capacity (SCAP):

$$
    Q(CAP,t,n)= \omega_{eff(n)}(\omega_{gcap(n)}Q(GCAP,t,n)^{\rho_{cap}}+ (1-\omega_{gcap(n)})K(SCAP,t,n)^{\rho_{cap}})^{\frac{1}{\rho_{cap}}}
$$

Generic capacity is exogenous and grows at the growth rate of total factor productivity, $tfp_y(t,n)$.
The initial level is given by the 2005 average stock of knowledge (R&D) and human capital (EDU):

$$
    Q(GCAP,t,n)= \frac{K(R\&D,t,n)+K(EDU,t,n)}{2}tfp_y(t,n)
$$
`<todo @decian80>` Is R&D linked to the [Research and Development](mod_knowledge)?`</todo>`

The human capital and R&D stock are exogenous and have been computed using the expenditure in total R&D (or education) from the World Development Indicators (2008). The R&D stock is not linked to the energy R&D investments, which instead are endogenous. 

Specific adaptive capacity accounts for the investments dedicated to facilitate adaptation activities, such as improvement of meteorological services, early warning systems, the development of climate modelling and impact assessments. Specific capacity and proactive adaptation are stocks that accumulate following the standard perpetual rule:

$$ 
    K(SCAP,t,n+1) = K(SCAP,t,n+1)(1-\delta_{SCAP})^{\Delta_{\text{t}}} +\Delta_{\text{t}} I(SCAP,t,n)
$$

$$
    K(PRADA,t,n+1) = K(PRADA,t,n+1)(1-\delta_{PRADA})^{\Delta_{\text{t}}} + \Delta_{\text{t}} I(PRADA,t,n)
$$

`<todo @decian80>` Definire I e delta `</todo>`
							
All forms of adaptation expenditure reduce the resources available for other uses and are subtracted from the budget constraint (see [Economy module](mod_economy)):

\begin{align*}
    C(t,n) = & Y(t,n) \\
             & - I_{FG}(t,n) \\
             & - \sum_j\left( I_{RD,j}(t,n) + I_j(t,n) + (oem_j(t,n)*K_j(t,n)) \right) \\
             & - \sum_f \left( I_{OUT,f}(t,n) +  (oem\_ex_f*Q_{OUT,f}(t,n)) \right) \\
             & - I_{GRID}(t,n) \\
             & - I(PRADA,t,n) - I(SCAP,t,n) - I(RADA,t,n) \\
\end{align*}


The table below defines the main variables of the adaptation module.


 | Symbol           | Definition                                 | GAMS                   | Unit       | 
 | ------           | ----------                                 | ----                   | ----       | 
 | $I_{PRADA}(t,n)$ | Investment in proactive adaptation         | ''%%I('PRADA',t,n)%%'' | Trillion $ | 
 | $I_{SCAP}(t,n)$  | Investment in specific ad. capacity        | ''%%I('SCAP',t,n)%%''  | Trillion $ | 
 | $I_{RADA}(t,n)$  | Investment in active adaptation            | ''%%I('RADA',t,n)%%''  | Trillion $ | 
 | $I_{RADA}(t,n)$  | Investment in active adaptation            | ''%%I('RADA',t,n)%%''  | Trillion $ | 
 | $\delta_{PRADA}$ | Depreciation rate - proactive adaptation   | $\delta_{PRADA}$       | $0.1$      | 
 | $\delta_{SCAP}$  | Depreciation rate  - specific ad. capacity | $\delta_{SCAP}$        | $0.03$     | 

# Calibration of adaptation costs 

The calibration process of adaptation costs is described in detail in Agrawala et al. (2010, 2011) and has been updated in Bosello and De Cian (2014). Costs of adaptation actions and their effectiveness in the sectors considered in the reduced-form damage function have been collected and grouped into the three categories of proactive,  reactive,  and specific capacity. In the following sectors proactive adaptation is considered: 

*  Agriculture

*  Sea-level rise (SLR)

*  Ecosystems and settlements

In the following sectors reactive adaptation is considered: 

*  Energy

*  Health

Specific capacity includes

*  Expenditure needed to eliminate the infrastructure gap identified  

*  Expenditure needed to empower women through education 

*  Early warning systems 

*  R&D expenditure  in the agriculture sector 

The tables below summarize the adaptation costs and the protection levels at the calibration point, which is when temperature increases by 2.5 degree Celsius above pre-industrial levels. 

{{ adap_costs.png:?nolink         | Adaptation costs at the calibration point}}

Adaptation effectiveness for the three strategies has also been calibrated using various sources from the literature described in Bosello and De Cian (2014). The table below summarizes the resulting figures used for calibration:

{{ protection_level.png:?nolink         | Adaptation costs at the calibration point}}

## References 


*  Agrawala S, Bosello F, Carraro C, De Cian E, Lanzi E, de Bruin K, Dellink R (2010). PLAN or REACT? Analysis of adaptation costs and benefits Using Integrated Assessment Models. OECD Environment Working Papers, No. 23, OECD Publishing. doi: 10.1787/5km975m3d5hb-en

*  Agrawala S, Bosello F, Carraro C, De Cian E, Lanzi E, de Bruin K, Dellink R Dellink (2011). PLAN or REACT? Analysis of adaptation costs and benefits Using Integrated Assessment Models. Climate Change Economics, Vol.2 (3), 1-36.

*  Bosello F, De Cian E. 2014. Documentation on the development of damage functions and adaptation module in the WITCH model, http://www.witchmodel.org/pag/publications.html


