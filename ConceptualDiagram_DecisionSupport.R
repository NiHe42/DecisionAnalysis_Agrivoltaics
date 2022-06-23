library(decisionSupport)
library(DiagrammeR)



DiagrammeR('graph LR
           B(net_benefits)-->A(result)
           C(total_benefits)-->B
           D(av_int_cost)-->B
           E(av_crop_yield)-->C
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
           newD(Irrigation)-->I
           newE(Labour costs)-->D
           newF(Annual labour)-->newE
           newG(AV labour reduction)-->newF
           newH(AV irrigation)-->newC
           newH-->newD
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
           style newD fill:green, stroke:#333,stroke-width:2px;
           style newB fill:green, stroke:#333,stroke-width:2px;
           style newC fill:green, stroke:#333,stroke-width:2px;
           style PVM fill:gray, stroke:#333,stroke-width:2px;
           style PVN fill:gray, stroke:#333,stroke-width:2px;
           style newE fill:green, stroke:#333,stroke-width:2px;
           style newF fill:green, stroke:#333,stroke-width:2px;
           style newG fill:green, stroke:#333,stroke-width:2px;
           style newH fill:green, stroke:#333,stroke-width:2px;
           style newI fill:green, stroke:#333,stroke-width:2px;')

