# igraph Notes
# - https://www.cheatography.com/trvoldemort/cheat-sheets/igraph/

install.packages("igraph")
library(igraph)

# great example of graph and finding subsets
# source: https://stackoverflow.com/a/40086608/
g <- random.graph.game(10, p.or.m = 3, "gnm") + edge(7,7)
coords <- layout.auto(g)
par(mfrow = c(1,3))
plot(g, layout = coords)                            # All nodes
plot(simplify(g), layout = coords)                  # Rm loops + multiple edges
plot(delete.vertices(simplify(g), degree(g) == 0))  # Also rm isolated nodes
