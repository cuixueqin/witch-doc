# Carbon capture and storage

This module introduces the Carbon capture and storage (**CCS**) in the model.

For CCS, supply costs of injection and sequestration reflect sites’
availability at the regional level,
as well as energy penalty, capture and leakage rates.

IGCC with CCS competes with traditional coal which is replaced for
a sufficiently high carbon price signal.
For nuclear power, waste management costs are also modeled,
but no exogenous constraint is assumed.
Hydroelectric power is assumed to evolve exogenously to reflect
limited site availability. 

## Emission storage

[Eq. **eqq_emi_ccs**]

$$
    Q_{CCS} = \sum_{f,j} Q_{f,j}(t,n) \times ccs\_capture\_rate_f
$$

[Eq. **eqcum_emi_ccs_t0**][Eq. **eqcum_emi_ccs**]

$$
    M_{CCS}(t,n) = \sum_{t'<t} \Delta_{t'} \times Q_{CCS}(t',n)
$$

 | Notation       | Variable                | GAMS                       | Unit   | 
 | --------       | --------                | ----                       | ----   | 
 | $Q_{CCS}(t,n)$ | CCS emissions           | ''%%Q_EMI('ccs',t,n)%%''   | GtC-eq | 
 | $M_{CCS}(t)$   | CCS cumulated emissions | ''%%CUM_EMI('ccs',t,n)%%'' | GtC-eq | 

## Emission cost

[Eq. **eqmcost_emi_ccs**]
CCS transport and storage is function of the cumulative sequestrated emissions. 

$$
    C_{CCS}(n,t) = a_{CCS}(n) e^{\alpha_{CCS}(n) \times M_{CCS}(t,n)^{\beta_{CCS}(n)}}
$$

 | Notation       | Variable  | GAMS                         | Unit       | 
 | --------       | --------  | ----                         | ----       | 
 | $C_{CCS}(n,t)$ | CCS costs | ''%%MCOST_EMI('ccs',t,n)%%'' | Trillion $ | 

