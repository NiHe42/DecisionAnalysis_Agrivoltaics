library(DiagrammeR)


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
#w [label = '']

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
       
      subgraph cluster_0 {
      b [label = 'Total Costs']
      c [label = 'Establishment Costs']
      d [label = 'Maintenance Costs']
      {c d} -> {b}}
      
      subgraph cluster_1 {
      f [label = 'Water harvesting']
      g [label = 'Crop yield']
      h [label = 'Energy yield/savings']}
      
      subgraph cluster_2 {
      a [label = 'NPV']}
      
      subgraph cluster_3 {
      e [label = 'Revenue']}
      
      subgraph cluster_4 {
      j [label = 'Crop']
      k [label = 'Water']
      l [label = 'Energy']
      i [label = 'Prices']
      {j k l} -> i}
    
    
      
      b -> a [ltail=cluster_0 lhead=cluster_2, weight=10];
      {g f h} -> e [lhead=cluster_3, weight=1];
      e -> a [ltail=cluster_3 lhead=cluster_2, weight=10];
      i -> e [lhead=cluster_3, weight=1];

      }")

Diagramme kombinieren
Stakeholder Liste + Graph
Kontakt zu Experten
Experten in der Uni finden
Interview mit "Kalibrierfragen"
Model austesten
Model erweitern

