# Advanced bio-fuels

Advanced biofuel represents a new generation of fuel coming from the conversion of
woody biomass into biofuel.
This conversion is subject to a learning by researching curve and represent a backstop technology.
Advanced biofuels is a substitute to oil in the non-electrical sector.   


## Constraint on non-electric backstop

[Eq. **eqq_en_lim_nelback**] 
New production capacity of "non-electric backstop" technologies are bounded by the potential in advanced bio-fuels, following a logistic curve over time.

$$
    NEL_{nelback}(t+1,n) - NEL_{nelback}(t,n) \le
    \left( 1 - \frac{NEL_{nelback}(t+1,n)}{advbiofuel\_pot(n)} \right) \times
    NEL_{nelback}(t+1,n)
$$

 | Notation             | Variable                       | GAMS                         | Unit | 
 | --------             | --------                       | ----                         | ---- | 
 | $NEL_{nelback}(t,n)$ | Non-electric backstop capacity | ''%%Q_PES('backnel',t,n)%%'' | TWh  | 

