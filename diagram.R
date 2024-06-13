library(DiagrammeR)

grViz("
  digraph process {
    graph [rankdir = LR] # Change the rank direction to Left-to-Right

    # Define node shapes and styles
    node [shape = box, style = filled, color = lightblue]

    # Stage 1
    PooledDataset [label = 'Pooled Dataset']

    # Stage 2
    DataPartition [label = 'Data Partition', shape = plaintext, color = none]

    # Stage 3
    CountryA1 [label = 'Country A Time T(1)']
    CountryA2 [label = 'Country A Time T(2)']
    CountryB1 [label = 'Country B Time T(1)']
    CountryN [label = 'Country N Time T(n)', style = solid]

    # Stage 4
    node [color = lightcoral] # Change background color for _Matrix nodes
    CountryA1_Matrix [label = 'Country A Time T(1)', fill= lightgreen]
    CountryA2_Matrix [label = 'Country A Time T(2)', fill= lightgreen]
    CountryB1_Matrix [label = 'Country B Time T(1)', fill= lightgreen]
    CountryN_Matrix [label = 'Country N Time T(n)', style = solid, fill= lightgreen]

    # Stage 5
    CombinedDataset [label = 'Combined Dataset', shape = box, color = lightcoral]

    # Stage Numbers
    Stage1 [label = '', shape = plaintext, color = none]
    Stage2 [label = '', shape = plaintext, color = none]
    Stage3 [label = 'I: Partition', shape = plaintext, color = none]
    Stage4 [label = 'II: Correlation Matrices & Transformation', shape = plaintext, color = none]
    Stage5 [label = 'III: Merging Data', shape = plaintext, color = none]

    {rank=same; Stage1; PooledDataset}
    {rank=same; Stage2; DataPartition}
    {rank=same; Stage3; CountryA1; CountryA2; CountryB1; CountryN}
    {rank=same; Stage4; CountryA1_Matrix; CountryA2_Matrix; CountryB1_Matrix; CountryN_Matrix}
    {rank=same; Stage5; CombinedDataset}

    # Define edges
    PooledDataset -> DataPartition
    DataPartition -> CountryA1
    DataPartition -> CountryA2
    DataPartition -> CountryB1
    DataPartition -> CountryN

    # Connections within stage 3
    CountryA1 -> CountryA1_Matrix [style = dashed, color = gray30]
    CountryA2 -> CountryA2_Matrix [style = dashed, color = gray30]
    CountryB1 -> CountryB1_Matrix [style = dashed, color = gray30]
    CountryN -> CountryN_Matrix [style = dashed, color = gray30]

    # Dotted vertical connections
    CountryB1 -> CountryN [style = dotted,  arrowhead = none]
    CountryB1_Matrix -> CountryN_Matrix [style = dotted, arrowhead = none]

    # Encompassing Stage 3 box
    subgraph cluster_0 {
      style = rounded; color = lightgreen;
      label = 'Correlation Matrices and Their Transformation';
      CountryA1_Matrix; CountryA2_Matrix; CountryB1_Matrix; CountryN_Matrix;
    }

    # Connections to the final stage
    CountryA1_Matrix -> CombinedDataset
    CountryA2_Matrix -> CombinedDataset
    CountryB1_Matrix -> CombinedDataset
    CountryN_Matrix -> CombinedDataset
  }
")



library(DiagrammeR)

grViz("
  digraph process {
    graph [rankdir = LR] # Change the rank direction to Top-to-Bottom

    # Define node shapes and styles
    node [shape = box, style = filled, color = lightblue, fontsize = 12]

    # Ideological Identity node
    IdeologicalIdentity [label = 'Ideological Identity', color = lightcoral]

    # Policy Attitude nodes
    PolicyAttitude1 [label = 'Policy Attitude 1']
    PolicyAttitude2 [label = 'Policy Attitude 2']
    PolicyAttitude3 [label = 'Policy Attitude 3']
    PolicyAttitude4 [label = 'Policy Attitude 4']
    PolicyAttitudeN [label = 'Policy Attitude n', style = solid]

    # Define edges
    IdeologicalIdentity -> PolicyAttitude1
    IdeologicalIdentity -> PolicyAttitude2
    IdeologicalIdentity -> PolicyAttitude3
    IdeologicalIdentity -> PolicyAttitude4
    IdeologicalIdentity -> PolicyAttitudeN

      {rank=same; PolicyAttitude1; PolicyAttitude2; PolicyAttitude3;
    PolicyAttitude4; PolicyAttitudeN}

    # Dashed grey arrow between Policy Attitude 3 and Policy Attitude n
    PolicyAttitude4 -> PolicyAttitudeN [style = dotted,  arrowhead = none]
  }
")


grViz("
  digraph process {
    graph [rankdir = LR, ranksep = 1.5] # Change the rank direction to Left-to-Right and set rank separation

    # Define node shapes and styles
    node [shape = box, style = filled, fontsize = 12]

    # Left column nodes in lightcoral
    node [color = lightcoral]
    PolicyAttitude1_L [label = 'Policy Attitude n', style = solid]
    PolicyAttitude2_L [label = 'Policy Attitude C']
    PolicyAttitude3_L [label = 'Policy Attitude B']
    PolicyAttitude4_L [label = 'Policy Attitude A']
    PolicyAttitudeN_L [label = 'Policy Attitude D']

    # Right column nodes in lightblue
    node [color = lightblue]
    PolicyAttitude1_R [label = 'Policy Attitude B']
    PolicyAttitude2_R [label = 'Policy Attitude C']
    PolicyAttitude3_R [label = 'Policy Attitude D']
    PolicyAttitude4_R [label = 'Policy Attitude n', style = solid]
    PolicyAttitudeN_R [label = 'Policy Attitude A']

    # Define edges
    PolicyAttitude1_L -> PolicyAttitude1_R [color = \"#80808080\"]
    PolicyAttitude1_L -> PolicyAttitude2_R [color = \"#80808080\"]
    PolicyAttitude1_L -> PolicyAttitude3_R [color = \"#80808080\"]
    PolicyAttitude1_L -> PolicyAttitude4_R [color = \"#80808000\"]
    PolicyAttitude1_L -> PolicyAttitudeN_R [color = \"#80808080\"]

    PolicyAttitude2_L -> PolicyAttitude2_R [color = \"#80808000\"]
    PolicyAttitude2_L -> PolicyAttitude1_R [color = \"#80808080\"]
    PolicyAttitude2_L -> PolicyAttitude3_R [color = \"#80808080\"]
    PolicyAttitude2_L -> PolicyAttitude4_R [color = \"#80808080\"]
    PolicyAttitude2_L -> PolicyAttitudeN_R [color = \"#80808080\"]

    PolicyAttitude3_L -> PolicyAttitude3_R [color = \"#80808080\"]
    PolicyAttitude3_L -> PolicyAttitude1_R [color = \"#80808000\"]
    PolicyAttitude3_L -> PolicyAttitude2_R [color = \"#80808080\"]
    PolicyAttitude3_L -> PolicyAttitude4_R [color = \"#80808080\"]
    PolicyAttitude3_L -> PolicyAttitudeN_R [color = \"#80808080\"]

    PolicyAttitude4_L -> PolicyAttitude4_R  [color = \"#80808080\"]
    PolicyAttitude4_L -> PolicyAttitude1_R  [color = \"#80808080\"]
    PolicyAttitude4_L -> PolicyAttitude2_R [color = \"#80808080\"]
    PolicyAttitude4_L -> PolicyAttitude3_R [color = \"#80808080\"]
    PolicyAttitude4_L -> PolicyAttitudeN_R [color = \"#80808000\"]

    PolicyAttitudeN_L -> PolicyAttitudeN_R [color = \"#80808080\"]
    PolicyAttitudeN_L -> PolicyAttitude1_R [color = \"#80808080\"]
    PolicyAttitudeN_L -> PolicyAttitude2_R [color = \"#80808080\"]
    PolicyAttitudeN_L -> PolicyAttitude3_R [color = \"#80808000\"]
    PolicyAttitudeN_L -> PolicyAttitude4_R [color = \"#80808080\"]

    # Grey edges with no arrowhead between PolicyAttitude4 and PolicyAttitudeN in both columns
    PolicyAttitude4_L -> PolicyAttitude1_L [arrowhead = none, style = dotted]
    PolicyAttitude3_R -> PolicyAttitude4_R [arrowhead = none, style = dotted]

    # Keep columns aligned
    {rank=same; PolicyAttitude1_L; PolicyAttitude2_L; PolicyAttitude3_L; PolicyAttitude4_L; PolicyAttitudeN_L;}
    {rank=same; PolicyAttitudeN_R; PolicyAttitude2_R; PolicyAttitude1_R; PolicyAttitude3_R; PolicyAttitude4_R;}
  }
")

