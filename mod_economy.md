# Economy module

## Consumption

[Eq. **eqq_cc**]
The single argument of the utility function is per-capita consumption of the representative agent in each region. Total consumption  $C$ is thereby given through the budget constraint from output net of climate impacts and emission costs (see below) $Y$ subtracting the investments in

*  final good $I_{FG}$,

*  research and development (R&D) $I_{RD,j}$,

*  energy technologies $I_j$ and 

*  the extraction sector $I_{OUT,f}$

*  the infrastructure in the electric grid $I_{GRID}$

and less the operation and maintenance costs, which are computed as coefficients of the installed capacity and extraction, respectively, for

*  energy technologies $oem(j)$ and 

*  extraction $oem\_ex(f)$.

\begin{align*}
    C(t,n) = & Y(t,n) \\
             & - I_{FG}(t,n) \\
             & - \sum_j\left( I_{RD,j}(t,n) + I_j(t,n) + (oem_j(t,n)*K_j(t,n)) \right) \\
             & - \sum_f \left( I_{OUT,f}(t,n) +  (oem\_ex_f*Q_{OUT,f}(t,n)) \right) \\
             & - I_{GRID}(t,n) \\
             & - I(PRADA,t,n) - I(SCAP,t,n) - I(RADA,t,n) \\
\end{align*}

where

*  Energy technologies are denoted $j$

*  Fossil fuels are denoted $f$

 | Symbol           | Definition                          | GAMS                   | Unit       | 
 | ------           | ----------                          | ----                   | ----       | 
 | $C(t,n)$         | Consumption                         | ''%%Q('CC',t,n)%%''    | Trillion $ | 
 | $I_{FG}(t,n)$    | Investment in final good            | ''%%I('FG',t,n)%%''    | Trillion $ | 
 | $I_j(t,n)$       | Investment in energy technologies   | ''%%I_EN(jinv,t,n)%%'' | Trillion $ | 
 | $I_{GRID}(t,n)$  | Investment in electric grid         | ''%%I_EN_GRID(t,n)%%'' | Trillion $ | 
 | $I_{OUT,f}(t,n)$ | Investment in extraction            | ''%%I_OUT(f,t,n)%%''   | Trillion $ | 
 | $I_{RD,j}(t,n)$  | Investment in R&D                   | ''%%I_RD(rd,t,n)%%''   | Trillion $ | 
 | $I_{PRADA}(t,n)$ | Investment in proactive adaptation  | ''%%I('PRADA',t,n)%%'' | Trillion $ | 
 | $I_{SCAP}(t,n)$  | Investment in specific ad. capacity | ''%%I('SCAP',t,n)%%''  | Trillion $ | 
 | $I_{RADA}(t,n)$  | Investment in active adaptation     | ''%%I('RADA',t,n)%%''  | Trillion $ | 
 | $Y(t,n)$         | Net Output                          | ''%%Q('Y',t,n)%%''     | Trillion $ | 
 | $oem_j(t,n)$     | O&M costs in energy technologies    | ''%%oem(j,t,n)%%''     | $/TW       | 
 | $oem\_ex_f$      | O&M coefficient in extraction       | ''%%oem_ex(f)%%''      | $/TWh      | 
 | $K_j(t,n)$       | Capital in energy tech.             | ''%%K_EN(j,t,n)%%''    | TW         | 
 | $Q_{OUT,f}(t,n)$ | Total extraction of fuel $f$        | ''%%Q_OUT(f,t,n)%%''   | TWh        | 

## Output

[Eq. **eqq_y**]
Output $Y$ is produced via a nested CES function that combines a capital-labor
aggregate $KL$ and energy services $ES$.
Capital $K$ and labor $L$ are combined using a standard Cobb-Douglas function.
The [climate impacts](mod_damage) $\Omega(t,n)$ affect gross output, so that a certain share of output is lost due to climate change impacts. Moreover, the costs of fossil fuels and costs of emissions including Carbon Capture and Storage (CCS) and the costs of deforestation and degradation (REDD+) are subtracted from gross output. Finally, the carbon tax revenues are paid and redistributed through the budget constraint.
Net output is thus obtained as 

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

where the CES parameters are $\alpha(n)$ and
$\rho$. The parameter $\rho$ is computed
such that $\rho=\frac{\mathcal{s}-1}{\mathcal{s}}$,
where $\mathcal{s}$ is the elasticity of substitution. The parameter $\beta(n)$ represents the Cobb-Douglas coefficient of the capital-labor aggregate.

Total factor productivity $tfpy(t,n)$ is dynamically calibrated and evolves exogenously with time.
Labor $l$ is assumed to be equal to to population, thus assuming no unemployment. Finally, the parameter $tfp0(n)$ is calibrated to match GDP in the base year.

 | Symbol         | Definition                          | GAMS                    | Unit           | 
 | ------         | ----------                          | ----                    | ----           | 
 | $tfp0(n)$      | Initial level of TFP                | ''%%tfp0(n)%%''         | unitless       | 
 | $C_e(t,n)$     | GHG emissions costs                 | ''%%COST_EMI(j,t,n)%%'' | Trillion $     | 
 | $C_f(t,n)$     | Net cost of Primary Energy Supplies | ''%%COST_PES(f,t,n)%%'' | Trillion $     | 
 | $C_j(t,n)$     | Energy technology penalty costs     | ''%%COST_EN(j,t,n)%%''  | Trillion $     | 
 | $ES(t,n)$      | Energy services                     | ''%%Q('FEN',t,n)%%''    | Trillion $     | 
 | $K_{FG}(t,n)$  | Capital in final good               | ''%%K('FG',t,n)%%''     | Trillion $     | 
 | $Q_E(ghg,t,n)$ | Emissions                           | ''%%Q_EMI(ghg,t,n)%%''  | Gt-eqC         | 
 | $tfp_y(t,n)$   | Total factor productivity           | ''%%tfpy(t,n)%%''       | unitless       | 
 | $l(t,n)$       | Population                          | ''%%l(t,n)%%''          | Million people | 

## Capital

 
[Eq. **eqk**]
The capital stock in the final good sector accumulates following the standard perpetual rule.

$$
    K_{FG}(t+1,n) = K_{FG}(t,n)\times(1-\delta_{FG})^{\Delta_{\text{t}}} +
                 \Delta_{\text{t}}\times I_{FG}(t,n)
$$

 | Symbol              | Definition                          | GAMS                    | Unit     | 
 | ------              | ----------                          | ----                    | ----     | 
 | $\delta_{FG}$       | Yearly depreciation rate of capital | ''%%delta('fg',t,n)%%'' | unitless | 
 | $\Delta_{\text{t}}$ | Time step duration                  | ''%%tstep%%''           | years    | 

## Energy Services

[Eq. **eqq_fen**] Energy services $ES$ are provided by a combination of physical energy input
and a stock of energy efficiency knowledge.
This allows for endogenous improvements in energy efficiency.
Energy efficiency can be increased through investments in energy R&D,
which build up the stock of knowledge. The stock of
knowledge can then substitute physical energy
in the production of energy services.
More details on the stock of knowledge are
available in [Research and Development](mod_knowledge).

Energy services $ES$ are an aggregate of the amount of energy consumed, $EN$, and a stock of
knowledge, $HE$, combined within a CES function:

$$
    ES(t,n) = \phi_{ES}(n)\left(
                       \alpha_{ES}(n) HE(t,n)^{\rho_{ES}} +
                       (1-\alpha_{ES}(n)) tfpn(t,n) EN(t,n)^{\rho_{ES}}
                       \right)^{\frac{1}{\rho_{ES}}}
$$

The CES parameters $\phi_{ES}(n)$, $\alpha_{ES}(n)$, and $\rho_{ES}$ are calibrated for each region, see [Static Calibration](static_calibration). The factor productivity of energy $tfpn(t,n)$ is calibrated in the [Dynamic calibration](mod_dynamic_calibration).

 | $EN(t,n)$   | Energy aggregate                 | ''%%Q('en',t,n)%%''    | Trillion $ | 
 | ---------   | ----------------                 | -------------------    | ---------- | 
 | $HE(t,n)$   | R&D Capital in energy efficiency | ''%%K_RD('en',t,n)%%'' | Trillion $ | 
 | $tfpn(t,n)$ | Factor productivity of energy    | ''%%tfpn(t,n)%%''      | unitless   | 

## Energy

[Eq. **eqq_en**]
Energy used in the economy is a combination of electricity and non-electric energy.
Electric energy can be generated using a set of different technology options. Non-electric energy comprises the use of different fuels, namely coal, gas, oil, biomass, and a backstop technology for industry, residential households, and transportation. The aggregation uses a CES function with parameters $\alpha_{EN}(n)$ and $\rho_{EN}$.

$$
    EN(t,n) =   \left(
                       \alpha_{EN}(n) EL(t,n)^{\rho_{EN}} +
                       (1-\alpha_{EN}(n)) NEL(t,n)^{\rho_{EN}}
                \right)^{\frac{1}{\rho_{EN}}}
$$

Each factor is further decomposed into several sub-components. The components are aggregated using CES, linear and Leontief production functions, which is described in detail in the [Energy module](mod_energy).

 | Symbol     | Definition                                    | GAMS                 | Unit       | 
 | ------     | ----------                                    | ----                 | ----       | 
 | $EL(t,n)$  | Energy aggregate from the electric sector     | ''%%Q('el',t,n)%%''  | Trillion $ | 
 | $NEL(t,n)$ | Energy aggregate from the non-electric sector | ''%%Q('nel',t,n)%%'' | Trillion $ | 


