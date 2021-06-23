from matplotlib import pyplot as plt
import seaborn as sns
import numpy as np

plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})
# for Palatino and other serif fonts use:
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "serif",
    "font.serif": ["Palatino"],
})

#plt.style.use(seaborn-dark)


sns.set_theme(style='whitegrid')
dev_x = np.linspace(0, 0.5, 10)

rl = 22

ua = np.array([0.52, 1.04, 1.57, 2.09, 2.62, 3.14, 3.66, 4.18, 4.66, 5.00])
ub = 15
ic1 = np.array([0.024, 0.0475, 0.0708, 0.0942, 0.1176,
       0.1409, 0.1640, 0.1872, 0.2095, 0.2303])

ic2 = np.array([0.425, 0.814, 1.1425, 1.419, 1.635, 1.80, 1.91, 1.975, 1.983, 1.922])


pa = np.square(ua) / 22
pb = (np.add(ic1, ic2)) * ub 
pv = pb-pa
eta = pa/pb

print(pa)
print(pb)
print(pv)


palin = np.linspace(pa[0], pa[pa.size-1], 10)
pblin = np.linspace(pb[0], pb[pb.size-1], 10)
pvlin = np.linspace(pv[0], pv[pv.size-1], 10)
etalin = np.linspace(eta[0], eta[eta.size-1], 10)

plt.figure(0)

plt.plot(dev_x, pa, marker='.')
plt.plot(dev_x, pb, marker='.')
plt.plot(dev_x, pv, marker='.')

plt.xlabel("$P$ in $W$")
plt.ylabel("$U_e$ in $V$")
plt.title("$P_A$, $P_B$ und $P_V$")
plt.legend(["$P_A$", "$P_B$", "$P_V$"])

plt.savefig("plotPower.png")

plt.figure(1)
plt.plot(dev_x, eta, marker='.')
plt.xlabel("$U_e$ in $V$")
plt.ylabel("$\eta$")
plt.title("Wirkungsgrad")

plt.savefig("plotEff.png")

plt.grid(True)

plt.show()
