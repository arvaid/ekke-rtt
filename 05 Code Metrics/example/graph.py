import networkx as nx
import matplotlib.pyplot as plt

D = nx.DiGraph()
for i in range(1,11):
    D.add_node(i)

print(f'Csomópontok száma: {D.number_of_nodes()}')

D.add_edge(1, 2)
D.add_edge(2, 3)
D.add_edge(2, 4)
D.add_edge(3, 5)
D.add_edge(3, 6)
D.add_edge(4, 7)
D.add_edge(5, 8)
D.add_edge(6, 8)
D.add_edge(7, 9)
D.add_edge(8, 10)
D.add_edge(9, 10)
D.add_edge(10, 2)
D.add_edge(8, 3)

# Ciklomatikus komplexitás 
# https://hu.wikipedia.org/wiki/Ciklomatikus_komplexit%C3%A1s
# M = E - N + 2P
# SCC - Strongly Connected Components
E = D.number_of_edges()
N = D.number_of_nodes()
P = nx.number_strongly_connected_components(D)
M = E - N + 2 * P
print(f'Ciklomatikus komplexitás {M}')

nx.draw(D, with_labels=True)
plt.show()

# -----------------------------------------------------------

Dd = nx.DiGraph()
for i in range(1,7):
    Dd.add_node(i)

Dd.add_edge(1, 2)
Dd.add_edge(2, 3)
Dd.add_edge(3, 4)
Dd.add_edge(3, 5)
Dd.add_edge(4, 6)
Dd.add_edge(5, 6)
Dd.add_edge(6, 2)

E = Dd.number_of_edges()
N = Dd.number_of_nodes()
P = nx.number_strongly_connected_components(Dd)
M = E - N + 2
print(f'Ciklomatikus komplexitás {M}')

nx.draw(Dd, with_labels=True)
plt.show()
