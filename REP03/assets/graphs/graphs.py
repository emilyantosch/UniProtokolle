import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import math
plt.style.use('~/.matplotlib/stylelib/rose-pine-dawn.mplstyle')


pel_direkt = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                           'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200],
                           'n': [1498, 1498, 1498, 1503, 1510, 1515, 1520, 1526, 1530, 1530, 1535, 1535, 1535, 1535],
                           'M': [-1.5, -1.5, -0.55, 3.5, 8.5, 13.5, 19.5, 23, 26.5, 29, 30, 30, 30, 30]})


pel_umrichter = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                              'pel': [0, 15, 30, 550, 1050, 1750, 2450, 3000, 3650, 4200, 4200, 4200, 4200, 4200]})
pel_doppel = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                           'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200]})
pr = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                   'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200]})
ps = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                   'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200]})

vwind = np.array(pel_direkt.vwind)

# fig_direkt = plt.figure()
# plt.plot(vwind, pel_direkt.pel, '-x')
# fig_umrichter = plt.figure()
# plt.plot(vwind, pel_umrichter.pel, '-x')
# fig_doppel = plt.figure()
# plt.plot(vwind, pel_doppel.pel, '-x')
# fig_alle = plt.figure()
# plt.plot(vwind, pel_direkt.pel, '-x')
# plt.plot(vwind, pel_umrichter.pel, '-x')
# plt.plot(vwind, pel_doppel.pel, '-x')

arr = []
for i,j in zip(pel_direkt.n, pel_direkt.M):
    print(i, j)
    arr.append(i * j * math.pi * 2 * (1/60))
print(arr)
pel_direkt['pmech'] = arr
pel_direkt['eta'] = pel_direkt.pel/pel_direkt.pmech
print(pel_direkt)
# arr = []
# for i,j in pel_umrichter.n, pel_umrichter.M:
#     arr.append(i * j * math.pi * 2 * (1/60))
# pel_umrichter = pel_umrichter.append(dict(zip(pel_umrichter.columns, arr)), ignore_index=True)

# arr = []
# for i,j in pel_direkt.n, pel_direkt.M:
#     arr.append(i * j * math.pi * 2 * (1/60))
# pel_doppel = pel_direkt.append(dict(zip(pel_direkt.columns, arr)), ignore_index=True)

plt.show()
