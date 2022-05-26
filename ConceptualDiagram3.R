library(DiagrammeR)


# Every node needs a specific variable (e.g. A) and name (e.g. Yield)
# the number behind linkstyle refers to the line in the diagrammeR code (e.g. if line 9 is 0, line 19 is 10). 
# So if something is changed within the code the linkstyle numbers have to be kept in the correct order


DiagrammeR('graph LR
           A(Yield)-->B(Income); linkStyle 0 stroke-width:2px,fill:none,stroke:green
           C(Market price)-->B; linkStyle 1 stroke-width:2px,fill:none,stroke:green
           D(Total costs)-->B; linkStyle 2 stroke-width:2px,fill:none,stroke:red
           E(Water availability)-->A; linkStyle 3 stroke-width:2px,fill:none,stroke:green
           F(Agrivoltaic implementation)-->G(Establishment costs); linkStyle 4 stroke-width:2px,fill:none,stroke:green
           F-->H(Maintenance costs); linkStyle 5 stroke-width:2px,fill:none,stroke:green
           G-->D; linkStyle 6 stroke-width:2px,fill:none,stroke:green
           H-->D; linkStyle 7 stroke-width:2px,fill:none,stroke:green
           I(Shading)-->E; linkStyle 8 stroke-width:2px,fill:none,stroke:green
           J(Water reservoir)-->E; linkStyle 9 stroke-width:2px,fill:none,stroke:green
           F-->J; linkStyle 10 stroke-width:2px,fill:none,stroke:green
           F-->I; linkStyle 11 stroke-width:2px,fill:none,stroke:green
           F-.->Z(Other benefits)
           Z-.->N(Monetary?)
           N-.->B
           Z-.->K(Social/Economic)
           Z-.->L(Ecological?)
           F-.->M(Downsides?)
           K-.->O(Accessibility, Jobs, Health, <br> Food Security, Value Chains)
           P(Climate)-.->A
           L-.->Q(Climate change, efficient land use)
           I-.->R(Photosynthesis)
           R-.->A
           style O fill:lightgreen, stroke:#333,stroke-width:2px;
           style B fill:lightgreen, stroke:#333,stroke-width:2px;
           style Q fill:lightgreen, stroke:#333,stroke-width:2px;
           style F stroke:#333,stroke-width:2px')
