import pandas
import matplotlib.pyplot as plt

fig, axs = plt.subplots()
axs.set_title("OMP (12 Threads) vs SERIAL")

input = pandas.read_csv("./omp_table.dat")
particles = input["no_particles"].tolist()
time = input["time_taken"].tolist()
axs.plot(particles, time, c="r", label="omp", marker="+")


input = pandas.read_csv("./serial_table.dat")
particles = input["no_particles"].tolist()
time = input["time_taken"].tolist()
axs.plot(particles, time, c="b", label="serial", marker="+")

axs.set_xlabel("Number of particles")
axs.set_ylabel("Time in ms")
axs.legend()
plt.savefig("ompvsserial.pdf")
plt.show()
