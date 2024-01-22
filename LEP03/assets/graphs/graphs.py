import matplotlib.pyplot as plt
from matplotlib import rc
#rc('text', usetex=True)
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
import numpy as np
import pandas as pd
from scipy.optimize import curve_fit

wirk = {'udia': [-320, -240, -160, -80, 0, 80, 160, 240, 320, 400], 'pl': [-2.88, -2.83, -1.2, -0.46, 0.3, 1.1, 1.93, 2.72, 3.5, 4.3]}
wirk_pd = pd.DataFrame(wirk)

y_wirk = wirk_pd.udia
x_wirk = wirk_pd.pl

x_wirk = np.array(x_wirk)
y_wirk = np.array(y_wirk)

schein = {'udia': [-320, -240, -160, -80, 0, 80, 160, 240, 320, 400], 'sl': [5.74, 5.77, 5.89, 5.91, 5.9, 5.94, 5.96, 5.99, 5.97, 6.02]}
schein_pd = pd.DataFrame(schein)

x_schein = schein_pd.udia
y_schein = schein_pd.sl

x_schein = np.array(x_schein)
y_schein = np.array(y_schein)

q1 = {'udia': [-320, -240, -160, -80, 0, 80, 160, 240, 320, 400], 'q1': [4.522, 4.598, 5.3, 5.441, 5.49, 5.421, 5.225, 4.890, 4.42, 3.68]}
q1_pd = pd.DataFrame(q1)

x_q1 = q1_pd.udia
y_q1 = q1_pd.q1

x_q1 = np.array(x_q1)
y_q1 = np.array(y_q1)


fig_wirk = plt.figure()
plt.scatter(x_wirk, y_wirk, marker='x', color='r', label='Messwerte')
plt.plot(x_wirk, y_wirk, color='r', label='Messwerte')

fig_wirk.suptitle('$U_{dia}$/Wirkleistung')
plt.xlabel('$U_{dia}$ Spannung [V]')
plt.ylabel('$P$ Wirkleistung [kW]')
plt.show()

fig_schein = plt.figure()
plt.scatter(x_schein, y_schein, marker='x', color='r', label='Messwerte')
plt.plot(x_schein, y_schein, color='r', label='Messwerte')

fig_schein.suptitle('$U_{dia}$/Scheinleistung')
plt.xlabel('$U_{dia}$ Spannung [V]')
plt.ylabel('$P$ Scheinleistung [kVA]')
plt.show()

fig_q1 = plt.figure()
plt.scatter(x_q1, y_q1, marker='x', color='r', label='Messwerte')
plt.plot(x_q1, y_q1, color='r', label='Messwerte')

fig_schein.suptitle('$U_{dia}$/Verschiebungsblindleistung')
plt.xlabel('$U_{dia}$ Spannung [V]')
plt.ylabel('$Q1$ Verschiebungsblindleistung [kvar]')
plt.show()