# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 15:40:35 2026

@author: DMK
"""

import numpy as np
import matplotlib.pyplot as plt

from fmpy import simulate_fmu

# --------------------------------------------------
# FMU
# --------------------------------------------------

fmu_file = "Akt_gestuft_fin_02.fmu"

# --------------------------------------------------
# Sweep-Parameter
# --------------------------------------------------

torque_values =  [0.2, 0.45, 0.60]
time_constants = [0.0005, 0.001, 0.002]
w_values =       [0, 20, 40, 60]

Akt_Bit1 = True  # Use_Step_3
Akt_Bit0 = True  # Use_w_Dyn

if Akt_Bit1:
    Akt_Stufe = 3
elif Akt_Bit0:
    Akt_Stufe = 2
else:
    Akt_Stufe = 1
    
Trq_Sprung = 0.6

# --------------------------------------------------
# Simulation
# --------------------------------------------------

t_end = 0.055
n_points = 3000

time = np.linspace(0, t_end, n_points)

# Sprung von 0 auf 0.3 Nm bei 10 ms
trq_soll = np.where(time >= 0.01, Trq_Sprung, 0.0)

results = {}

for w in w_values:

    # Eingangssignal erzeugen
    input_data = np.zeros(
        len(time),
        dtype=[
            ("time", np.float64),
            ("Trq_Soll", np.float64),
            ("w_Mot", np.float64),
        ]
    )

    input_data["time"] = time
    input_data["Trq_Soll"] = trq_soll
    input_data["w_Mot"] = w

    for trq_max in torque_values:
        for T1 in time_constants:

            start_values = {
                "Trq_max_St1": trq_max,
                "Trq_max_St2": trq_max,
                "Trq_max_St3": trq_max,
                "T1_St_2": T1,
                "T1_St_3": T1,
                "Use_Step_3":  Akt_Bit1,
                "Use_w_Dyn":  Akt_Bit0 
            }

            sim = simulate_fmu(
                filename=fmu_file,
                start_time=0.0,
                stop_time=t_end,
                input=input_data,
                output=["Trq_Ist"],
                start_values=start_values
            )

            results[(w, trq_max, T1)] = sim

# --------------------------------------------------
# Plot
# --------------------------------------------------

fig, axes = plt.subplots(
    nrows=2,
    ncols=2,
    figsize=(14, 10),
    sharex=True,
    sharey=True 
)
    
axes = axes.flatten()
    
for ax, w in zip(axes, w_values):
    
    for trq_max in torque_values:
        for T1 in time_constants:
    
            sim = results[(w, trq_max, T1)]
    
            ax.plot(
                sim["time"],
                sim["Trq_Ist"],
                label=f"Trq_Nenn={trq_max:.2f}Nm , T_1_Akt={1000*T1:.1f}ms"
                )
    
    ax.set_title(f"w_Mot = {w} rad/s, n_Mot = {w/2/3.14159*60:.0f} rpm  ")
    ax.grid(True)
    ax.set_xlabel("Zeit [s]")
    ax.set_ylabel("Trq_Ist [Nm]")
    
    ax.legend(loc='lower right', fontsize=9)
    
plt.suptitle(
    f"Sprungantwort des Aktuators, Trq_Soll = {Trq_Sprung:.2f} Nm , Aktuator-Stufe={Akt_Stufe}\n"
    "Sweep über Maximalmoment, Zeitkonstante und Drehzahl", fontsize=20
    )
    
plt.tight_layout()
plt.show()