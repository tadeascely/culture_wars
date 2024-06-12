library(DiagrammeR)

library(DiagrammeR)

library(DiagrammeR)

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
    CountryA1_Matrix [label = 'Country A Time T(1)']
    CountryA2_Matrix [label = 'Country A Time T(2)']
    CountryB1_Matrix [label = 'Country B Time T(1)']
    CountryN_Matrix [label = 'Country N Time T(n)', style = solid]

    # Stage 5
    CombinedDataset [label = 'Combined Dataset', shape = box, color = lightblue]

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

    # Encompassing Stage 3 box
    subgraph cluster_0 {
      style = rounded; color = lightgrey;
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



