import matplotlib.pyplot as plt
import numpy as np

# Define parameters
G = 6.5  # gravity of the robot
l_S1S2 = 44.18
F_n_max = 25.8
F_s_max = 41.3
F_d_max = 30.3 # slipping
F_d = 17.7
a_O2PS1 = 21.37 * np.pi / 180
L_PS1 = 60.61
gamma = np.linspace(0, 2*np.pi, 1000)
gamma_star = a_O2PS1
F_M = F_n_max - G
G_x = G * abs( np.sin(gamma))
G_y = G * np.cos(gamma)
mu = 0.3
F_m = F_d_max - F_d

# Define L

conditions_L = [(gamma >= gamma_star) & (gamma <= np.pi), (gamma > np.pi) & (gamma <= 2 * np.pi - gamma_star)]
functions_L = [L_PS1 * abs(np.sin(gamma - gamma_star)), L_PS1 * abs(np.sin(gamma + gamma_star))]
L = np.select(conditions_L, functions_L)

# Define TORR

conditions_TORR = [(gamma < gamma_star) & (gamma > 2 * np.pi - gamma_star), (gamma >= gamma_star) & (gamma <= 2 * np.pi - gamma_star)]
functions_TORR = [0, 2 * G * L / (l_S1S2 * F_n_max)]
TORR = np.select(conditions_TORR, functions_TORR)

# Define SPRR
SPRR = ((G + F_M) * mu - (G_y + F_M) * mu + G_x) / F_s_max
SPRR = np.where(SPRR < 0, 0, SPRR)

#Define RERR
conditions_RERR = [gamma <= np.pi, gamma > np.pi]
functions_RERR = [(F_m - G * np.sin(gamma)) / F_d_max, (F_m - G * np.sin(gamma)) / F_d_max]
RERR = np.select(conditions_RERR, functions_RERR)

print(max(TORR), max(SPRR), max(RERR))

print(min(TORR), min(SPRR), min(RERR))

# Generate functions
y1 = TORR
y2 = SPRR
y3 = RERR

# Create a new figure
plt.figure()

# Plot data
plt.plot(gamma, y1, label='TORR', color='#FAAF42')
plt.plot(gamma, y2, label='SPRR', color='#0FA14A')
plt.plot(gamma, y3, label='RERR', color='#C24553')

# Set labels
plt.xlabel('gamma')
plt.ylabel('Risk ratio')

# Set the x-axis limits
plt.xlim([0, 2*np.pi])
plt.ylim(0, 1)

plt.xticks([0, np.pi/2, np.pi, 3*np.pi/2, 2*np.pi], ['0', 'π/2', 'π', '3π/2', '2π'], fontname='Times New Roman')
plt.yticks(fontname='Times New Roman')

# Set title
plt.title('Three Curves Plot')

# Add a legend
plt.legend(prop={'family': 'Times New Roman'})
plt.grid(color = 'black', linestyle = '--', linewidth = 0.2, zorder = 0)
# Display the plot
plt.savefig("three risk ratio.png")
plt.show()

