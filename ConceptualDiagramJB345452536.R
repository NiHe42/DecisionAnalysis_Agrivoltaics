library(DiagrammeR)


grViz("
digraph dot {
graph [layout = dot
       rankdir = LR
       fontname = Helvetica
       compound = true
       splines = polyline   #ortho (auch interessant)
       nodesep=0.2
       #ordering = in
       ]

node [fontname = Helvetica
      shape = box]
INT [label = 'Intervention']
a [label = 'NPV', fontsize = 30, shape = doublecircle]
b [label = 'Discount', fontsize = 20, color=gray1, fontcolor = gray1, shape = diamond]
c [label = 'Total benefits', shape = box, color=black, fontcolor = black]
d [label = 'Total costs', shape = box, color=grey0, fontcolor = grey0]
e [label = 'Crop yield', color=black, fontcolor = black]
f [label = 'Energy yield', color=black, fontcolor = black]
g [label = 'Setup costs', color=grey0, fontcolor = grey0]
h [label = 'Planning costs', color=grey0, fontcolor = grey0]
i [label = 'Maintenance Costs', color=grey0, fontcolor = grey0]
j [label = 'Costs for photovoltaic panels', color=grey0, fontcolor = grey0]
k [label = 'Costs for ground preparation', color=grey0, fontcolor = grey0]
l [label = 'Costs for installation', color=grey0, fontcolor = grey0]
m [label = 'Costs for training staff', color=grey0, fontcolor = grey0]
n [label = 'Reparation Costs', color=grey0, fontcolor = grey0]
o [label = 'Costs for searching for photovoltaic panels', color=grey0, fontcolor = grey0]
p [label = 'Costs for searching for location', color=grey0, fontcolor = grey0]
q [label = 'Energy production [kWh/ha]', color=black, fontcolor = black]
r [label = 'Area for Energy [ha]', color=black, fontcolor = black]
s [label = 'Energy Price [€/kWh]', color=black, fontcolor = black]
t [label = 'Crop production[t/ha]', color=black, fontcolor = black]
u [label = 'Area for Crops [ha]', color=black, fontcolor = black]
v [label = 'Crop market price[€/t]', color=black, fontcolor = black]
w [label = 'Risk of wrong Installation', color=gray1, fontcolor = gray1]
x [label = 'Risk of wrong/no Maintenance', color=gray1, fontcolor = gray1]
#y [label = 'Risk of bad training', color=gray1, fontcolor = gray1]
z [label = 'Risk of bad ground preparation/bad location', color=gray1, fontcolor = gray1]
a1 [label = 'Risk of natural hazard', color=gray1, fontcolor = gray1]
b1 [label = 'Risk of political interference', color=gray1, fontcolor = gray1]
c1 [label = 'Risk of drought', color=gray1, fontcolor = gray1]
d1 [label = 'Risk of no involvement by communities', color=gray1, fontcolor = gray1]
e1 [label = 'Risk of no involvement by institution', color=gray1, fontcolor = gray1]
f1 [label = 'Risk of bad design', color=gray1, fontcolor = gray1]
g1 [label = 'Climate change effects', fillcolor=red]
h1 [label = 'Risk of low quality photovoltaic panels', color=gray1, fontcolor = gray1]
i1 [label = 'Ex-ante risks', shape = box]
j1 [label = 'Ex-post risks', shape = box]
k1 [label = 'Irrigation']
l1 [label = 'Cost for pump']
m1 [label = 'Other energy consume']
n1

b -> a
[minlen=1]
c -> a
[minlen=3]
d -> a
[minlen=3]


subgraph crop {
rank = same
e
t
u
}

subgraph costs {
label = 'Costs'
style = invis
fontsize = 30
{g,h,i} -> d
{j,k,l,m} -> g
{o,p} -> h
n -> i
w -> l
x -> i
z -> {k,p}
h1 -> {j}

}

subgraph benefits {
label = 'Benefits'
style = invis
fontsize = 30
{e,f} -> c
{t,u,v} -> e
{q,r,s} -> f
f -> {k1, m1}
k1 -> e
l1 -> k1
c1 -> t
g1 -> {t,q}}


subgraph intervention {

style = invis
  subgraph exante {

  {d1,e1} -> i1
  }
  subgraph expost {
  rank = same
  {b1,a1,f1} ->j1 [minlen=6]
  }
  
i1 -> INT
INT ->j1
j1 ->  c
}
}




}")


grViz("
digraph dot {
graph [layout = dot
       rankdir = LR
       fontname = Helvetica]

node [fontname = Helvetica]
a [label = 'NPV', fontsize = 30]
b [label = 'Discount', fontsize = 20, style=filled, color=yellow]
c [label = 'Total benefits']
d [label = 'Total costs']
e [label = 'Crop yield']
f [label = 'Energy yield']
g [label = 'Setup costs']
h [label = 'Planning costs']
i [label = 'Maintenance Costs']
j [label = 'Costs for photovoltaic panels']
k [label = 'Costs for ground preparation']
l [label = 'Costs for installation']
m [label = 'Costs for training staff']
n [label = 'Reparation Costs']
o [label = 'Costs for searching for photovoltaic panels']
p [label = 'Costs for searching for location']
q [label = 'Energy production [kWh/ha]']
r [label = 'Area for Energy [ha]']
s [label = 'Energy Price [€/kWh]']
t [label = 'Crop production[t/ha]']
u [label = 'Area for Crops [ha]']
v [label = 'Crop market price[€/t]']

b -> a
[minlen=1]
c -> a
[minlen=3]
d -> a
[minlen=3]

subgraph cluster_1 {
style=filled
color=lightcoral
{g,h,i} -> d
{j,k,l,m} -> g
{o,p} -> h
n -> i
label = 'Costs'
fontsize = 30
}
subgraph cluster_0 {
style=filled
color=yellowgreen
{e,f} -> c
{t,u,v} -> e
{q,r,s} -> f
label = 'Benefits'
fontsize = 30
}
}")

grViz("
digraph dot {
graph [layout = dot
       rankdir = LR
       fontname = Helvetica]

# node definitions with substituted label text
node [fontname = Helvetica]
a [label = 'NPV', fontname = Helvetica, fontcolor = red]
b [label = 'Total Costs']
c [label = 'Establishment Costs']
d [label = 'Maintenance Costs']
e [label = 'Revenue']
f [label = 'Water harvesting']
g [label = 'Crop yield']
h [label = 'Energy yield/savings']
i [label = 'Prices']
j [label = 'Crop']
k [label = 'Water']
l [label = 'Energy']
#m [label = 'Agrivoltaics']
n [label = 'Climate change']



      {b e} -> {a}
      {f g h} -> e
      i -> e
      #m -> {f g h c d}
      n -> {h f g}
      {j k l} -> i
      {c d} -> {b}
      
subgraph test {

o [label ='Increased demand in energy' shape=box fontcolor=grey]
p [label ='Effects of changed schedule' shape=box fontcolor=grey]
q [label ='Corruption' shape=box fontcolor=grey]
}


}")

grViz("
digraph dot {
graph [layout = dot
       rankdir = LR
       fontname = Helvetica]

# node definitions with substituted label text
node [fontname = Helvetica]
a [label = 'NPV', fontname = Helvetica, fontcolor = red]
b [label = 'Total Costs']
c [label = 'Establishment Costs']
d [label = 'Maintenance Costs']
e [label = 'Revenue']
f [label = 'Water harvesting']
g [label = 'Crop yield']
h [label = 'Energy yield/savings']
i [label = 'Prices']
j [label = 'Crop']
k [label = 'Water']
l [label = 'Energy']
m [label = 'Agrivoltaics']
n [label = 'Climate change']

subgraph cluster_0 {
      style=filled;
      color=lightgrey;
      node [style=filled,color=white];
      {c d} -> {b}
      label = 'process #1';
}
subgraph cluster_1 {
      style=filled;
      color=lightgrey;
      node [style=filled,color=white];
      {b e} -> {a}
      {f g h} -> e
      i -> e
      m -> {f g h c d}
      label = 'process 0';
}

subgraph cluster_2 {
      style=filled;
      color=red;
      node [style=filled,color=white];
      {j k l} -> i
      label = 'process 4';
}

subgraph cluster_6 {
      style=filled;
      color=red;
      node [style=filled,color=white];
      n -> {h f g}
      label = 'process 3';
}}")


grViz("
digraph dot {
graph [layout = dot
       rankdir = LR
       fontsize = 10
       fontname = Helvetica
       compound = true]
        
      a [label = 'NPV']
      e [label = 'Revenue']
       
      subgraph dFdf {
      b [label = 'Total Costs']
      c [label = 'Establishment Costs']
      d [label = 'Maintenance Costs']
      {c d} -> {b}}
      
      subgraph cluster_1 {
      f [label = 'Water harvesting']
      g [label = 'Crop yield']
      h [label = 'Energy yield/savings']}
      
      subgraph cluster_3 {
      a [label = 'NPV']}
      
      subgraph intervention_AV {
      e [label = 'Revenue']}
      
      subgraph cluster_4 {
      j [label = 'Crop']
      k [label = 'Water']
      l [label = 'Energy']
      i [label = 'Prices']
      {j k l} -> i}
    
    
      
      b -> a [ltail=cluster_0 lhead=cluster_2, weight=10];

      e -> a [ltail=intervention_AV lhead=cluster_3, weight=10];
      i -> e [lhead=cluster_3, weight=1];

      }")


grViz("
      digraph dot{
            subgraph cluster_3 {
            e [label = 'Revenue']}
            
            subgraph cluster_1 {
            g [label = 'Crop yield']}
            
            g -> e [lhead=cluster_3, weight=1];
      }
      
      ")

grViz('
digraph top {
  node [shape=record ,penwidth = 2,fontsize=25];
  graph [labeljust=l]
  ratio="fill";
  

    subgraph cluster_2 {
      label = "Box 2";
      fontsize=38
      

a
  }}
}
')




Diagramme kombinieren
Stakeholder Liste + Graph
Kontakt zu Experten
Experten in der Uni finden
Interview mit "Kalibrierfragen"
Model austesten
Model erweitern

