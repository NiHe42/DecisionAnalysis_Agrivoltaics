library(DiagrammeR)
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

