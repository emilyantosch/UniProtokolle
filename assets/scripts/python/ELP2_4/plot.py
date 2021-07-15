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
dev_x = np.linspace(0, 0.75, 15)

rl = 22

ua = np.array([0.516, 1.03, 1.54, 2.07, 2.53, 2.79, 3.6, 4.15, 4.67, 5.2, 5.7, 6.22, 6.74, 7.27, 8.1])
ub = 15
ic = np.array([12.74, 25.63, 38.6, 51.5, 61.3, 58.9, 89.9, 102, 115, 128, 141, 153, 166, 180, 200])



pa = np.square(ua) / 22
pb = (np.add(ic1, ic1)/1000) * ub 
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
