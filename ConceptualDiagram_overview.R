library(decisionSupport)
library(DiagrammeR)



DiagrammeR('graph LR
           B(net_benefits)-->A(result)
           C(total_benefits)-->B
           newP(Total yield)-->C
           D(av_int_cost)-->B
           E(av_crop_yield)-->newP
           F(av_int_execution)-->D
           G(av_int_execution_period)-->F
           H(av_crop_ha vv)-->E
           I(av_crop_yield_t_ha vv)-->E
           J(av_crop_profit_EUR_t vv)-->E
           newI(External energy demand)-->C
           PVA(av_energy_yield)-->newI
           PVC(av_int_cost_reparation vv)-->F
           PVD(av_int_benefit_shade vv)-->F
           PVF(av_int_setup)-.->D
           PVE(av_int_cost_photovoltaic_panels)-->PVF
           PVG(av_int_cost_ground_preparation)-->PVF
           PVH(av_int_cost_installation)-->PVF
           PVI(av_int_cost_training)-->PVF
           PVJ(av_int_planning)-.->D
           PVK(av_int_cost_search_panels)-->PVJ
           PVL(av_int_cost_search_location)-->PVJ
           PVM(RISK wrong installation)-->PVH
           PVN(RISK of low quality AV panels)-->PVA
           newB(Cost for pump)-->PVF
           newC(Energy for pump <= av_energy_yield)-->PVA
           newE(Labour costs)-->D
           newF(Annual labour)-->newE
           newG(AV labour reduction)-->newF
           newH(AV irrigation factor)-->I
           newJ(AV shaded crop yield total)-->newP
           newK(av_shadedcrop_profit)-->newJ
           newL(av_shadedcrop_yield)-->newJ
           newM(av_ha)-->newJ
           newN(RISK drought)-->I
           newO(RISK bad maintenance)-->PVC
           newH-->newN
           style PVA fill:orange, stroke:#333,stroke-width:2px;
           style PVC fill:orange, stroke:#333,stroke-width:2px;
           style PVD fill:orange, stroke:#333,stroke-width:2px;
           style PVE fill:orange, stroke:#333,stroke-width:2px;
           style PVF fill:orange, stroke:#333,stroke-width:2px;
           style PVG fill:orange, stroke:#333,stroke-width:2px;
           style PVH fill:orange, stroke:#333,stroke-width:2px;
           style PVI fill:orange, stroke:#333,stroke-width:2px;
           style PVJ fill:orange, stroke:#333,stroke-width:2px;
           style PVK fill:orange, stroke:#333,stroke-width:2px;
           style PVL fill:orange, stroke:#333,stroke-width:2px;
           style newB fill:green, stroke:#333,stroke-width:2px;
           style newC fill:orange, stroke:#333,stroke-width:2px;
           style PVM fill:gray, stroke:#333,stroke-width:2px;
           style PVN fill:gray, stroke:#333,stroke-width:2px;
           style newG fill:orange, stroke:#333,stroke-width:2px;
           style newH fill:orange, stroke:#333,stroke-width:2px;
           style newI fill:green, stroke:#333,stroke-width:2px;
           style newJ fill:orange, stroke:#333,stroke-width:2px;
           style newK fill:orange, stroke:#333,stroke-width:2px;
           style newL fill:orange, stroke:#333,stroke-width:2px;
           style newM fill:orange, stroke:#333,stroke-width:2px;
           style newN fill:gray, stroke:#333,stroke-width:2px;
           style newO fill:gray, stroke:#333,stroke-width:2px;
           varA(AV variables)
           varB(Standard farm variables)
           varC(Risks)
           varD(not included yet)
           style varA fill:orange, stroke:#333,stroke-width:4px;
           style varB stroke:#333,stroke-width:4px;
           style varC fill:gray, stroke:#333,stroke-width:4px;
           style varD fill:green, stroke:#333,stroke-width:4px;')

