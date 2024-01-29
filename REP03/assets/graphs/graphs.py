import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math
#plt.style.use('~/.matplotlib/stylelib/rose-pine-dawn.mplstyle')


drehmoment_drehzahl = pd.DataFrame({'vwind5': [5.9, 5.8, 5.4, 4.3, 3.1, 2.2, 1.2, 0.95, 1, 1, 1],
                                      'vwind9': [6.5, 9.3, 12.7, 14.5, 16, 17.4, 17.5, 17, 16.5, 15, 14],
                                      'vwind13': [2, 4.6, 8.6, 12.5, 17, 21, 24, 26, 28, 29, 30],
                                      'vwind17': [1, 1.5, 3.4, 7, 11.5, 16, 20, 25, 28, 30, 31],
                                      'n': [650, 750, 850, 950, 1050, 1150, 1250, 1350, 1450, 1550, 1650]})


pel_direkt = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                           'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200],
                           'n': [1498, 1498, 1498, 1503, 1510, 1515, 1520, 1526, 1530, 1530, 1535, 1535, 1535, 1535],
                           'M': [-1.5, -1.5, -0.55, 3.5, 8.5, 13.5, 19.5, 23, 26.5, 29, 30, 30, 30, 30]})


pel_umrichter = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                              'pel': [0, 15, 30, 550, 1050, 1750, 2450, 3000, 3650, 4200, 4200, 4200, 4200, 4200],
                              'n': [800, 800, 830, 1102, 1260, 1425, 1530, 1570, 1610, 1650, 1535, 1535, 1535],
                              'M': })



pel_doppel = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                           'pel': [10, 25, 50, 400, 950, 1620, 2500, 3300, 4190, 4200, 4200, 4200, 4200, 4200],
                           'n': [1045, 1050, 1053, 1135, 1290, 1460, 1545, 1595, 1655, 1655, 1655, 1655, 1655, 1535],
                           'M': [6, 6.16, 6.16, 8.9, 11.9, 15.5, 20.2, 25.2, 28.2, 29.1, 29.1, 29.1, 29.1, 29.1]})




pr = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                   'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200]})
ps = pd.DataFrame({'vwind': [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
                   'pel': [-840, -750, -660, 20, 800, 1550, 2300, 3100, 3600, 4050, 4200, 4200, 4200, 4200]})

vwind = np.array(pel_direkt.vwind)

fig_Mn = plt.figure()
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind5, '-x', label="$v_{wind} = 5$")
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind9, '-x', label="$v_{wind} = 9$")
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind13, '-x', label= "$v_{wind} = 13$")
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind17, '-x', label= "$v_{wind} = 17$")
plt.legend(loc="best")
plt.grid()
plt.xlabel("Drehzahl n in $min^{-1}$")
plt.ylabel("Drehmoment M in Nm")
plt.title("Drehzahl-Drehmoment-Kennlinie")
plt.savefig('drehmoment_drehzahl.png')

drehmoment_drehzahl['vwind5_pmech'] = drehmoment_drehzahl.n * drehmoment_drehzahl.vwind5 * math.pi * 2 * (1/60)
drehmoment_drehzahl['vwind9_pmech'] = drehmoment_drehzahl.n * drehmoment_drehzahl.vwind9 * math.pi * 2 * (1/60)
drehmoment_drehzahl['vwind13_pmech'] = drehmoment_drehzahl.n * drehmoment_drehzahl.vwind13* math.pi * 2 * (1/60)
drehmoment_drehzahl['vwind17_pmech'] = drehmoment_drehzahl.n * drehmoment_drehzahl.vwind17 * math.pi * 2 * (1/60)

fig_npmech = plt.figure()
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind5_pmech, '-x', label="$v_{wind} = 5$")
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind9_pmech, '-x', label="$v_{wind} = 9$")
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind13_pmech, '-x', label= "$v_{wind} = 13$")
plt.plot(drehmoment_drehzahl.n, drehmoment_drehzahl.vwind17_pmech, '-x', label= "$v_{wind} = 17$")
plt.legend(loc="best")
plt.grid()
plt.xlabel("Drehzahl n in $min^{-1}$")
plt.ylabel("Leistung $P_{mech}$ in W")
plt.title("Drehzahl-Leistungs-Kennlinie")
plt.savefig('leistung_drehzahl.png')

fig_direkt = plt.figure()
plt.plot(vwind, pel_direkt.pel, '-x')
plt.grid()
plt.xlabel("Windstärke $v_{wind}$ in $m/s$")
plt.ylabel("Elektrische Leistung $P_{el}$ in W")
plt.title("Windgeschwindigkeit-Leistungs-Kennlinie")
plt.savefig('direkt_leistung.png')
fig_umrichter = plt.figure()
plt.plot(vwind, pel_umrichter.pel, '-x')
plt.grid()
plt.xlabel("Windstärke $v_{wind}$ in $m/s$")
plt.ylabel("Elektrische Leistung $P_{el}$ in W")
plt.title("Windgeschwindigkeit-Leistungs-Kennlinie")
plt.savefig('umrichter_leistung.png')
fig_doppel = plt.figure()
plt.plot(vwind, pel_doppel.pel, '-x')
plt.grid()
plt.xlabel("Windstärke $v_{wind}$ in $m/s$")
plt.ylabel("Elektrische Leistung $P_{el}$ in W")
plt.title("Windgeschwindigkeit-Leistungs-Kennlinie")
plt.savefig('doppel_leistung.png')
fig_alle = plt.figure()
plt.plot(vwind, pel_direkt.pel, '-x', label="Netzkopplung")
plt.grid()
plt.plot(vwind, pel_umrichter.pel, '-x', label="Umrichter")
plt.plot(vwind, pel_doppel.pel, '-x', label="Doppelt gespeist")
plt.xlabel("Windstärke $v_{wind}$ in $m/s$")
plt.ylabel("Elektrische Leistung $P_{el}$ in W")
plt.title("Windgeschwindigkeit-Leistungs-Kennlinie")
plt.legend(loc="best")
plt.savefig('alle_leistung.png')



pel_direkt['pmech'] = pel_direkt.n * pel_direkt.M * 2 * math.pi * (1/60)
pel_direkt['eta'] = pel_direkt.pel/pel_direkt.pmech

pel_umrichter['pmech'] = pel_umrichter.n * pel_umrichter.M * 2 * math.pi * (1/60)
pel_umrichter['eta'] = pel_umrichter.pel/pel_umrichter.pmech

pel_doppel['pmech'] = pel_doppel.n * pel_doppel.M * 2 * math.pi * (1/60)
pel_doppel['eta'] = pel_doppel.pel/pel_doppel.pmech
