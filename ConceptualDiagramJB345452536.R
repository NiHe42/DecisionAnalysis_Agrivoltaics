library(DiagrammeR)
mermaid('graph LR
        Y(Yield)-->I(Income); linkStyle 0 stroke:green, stroke-width:1px
        M(Market price)-->I; linkStyle 1 stroke: green, stroke-width:1px
        I-->F(Final result); linkStyle 2 stroke: green, stroke-width:1px
        CL(Labor cost)-->F; linkStyle 3 stroke: red, stroke-width:1px
        CM(Management cost)-->F; linkStyle 4 stroke: red, stroke-width:1px')

mermaid('graph LR
        C(Total Costs)-->N(NPV);
        R(Revenue)-->N;
        E(Establishment Costs)-->C;
        M(Maintenance Costs)-->C;
        V(Energy yield/savings)-->R;
        Y(Cropy yield)-->R;
        W(Water harvesting)-->R;
        A(Agrivoltaics intervention)-->M;
        A-->V;
        A-->Y;
        A-->W;
        P(Prices)-->R;
        Q(Crop)-->P;
        T(Water)-->P;
        Z(Energy)-->P
        
        O(Climate Change)-->Y
        O-->V
        O-->W
        
        ')



grViz('
graph {
  label="Vincent van Gogh Paintings"

  subgraph cluster_self_portraits {
    label="Self-portraits"

    spwgfh [label="Self-Portrait with Grey Felt Hat"]
    spaap [label="Self-Portrait as a Painter"]
  }
  
  subgraph cluster_flowers {
    label="Flowers"

    sf [label="Sunflowers"]
    ab [label="Almond Blossom"]
  }
}
      ')


grViz("
digraph dot {
graph [layout = dot
       rankdir = LR]

# node definitions with substituted label text
node [color = golden]
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

edge [color = black]
      {b e} -> {a}
      {c d} -> {b}
      {f g h} -> e
      {j k l} -> i
      i -> e
      m -> {f g h c d}
      n -> {h f g}
      
}

")