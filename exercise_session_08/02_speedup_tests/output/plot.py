import pandas
import matplotlib.pyplot as plt

CYCLE=4

fig, axs = plt.subplots(2)
axs[0].set_title("OMP")

input = pandas.read_csv("./omp.dat")

# input.sort_values('threads', ascending=True).reset_index(drop=True)
# input.sort('threads', ascending=True)

threads = input["threads"].tolist()
print(threads)
time = input["time"].tolist()
gridsize = input["gridsize"].tolist()
axs[0].scatter(threads[0::4], time[0::4], c="r", label=f"Gridsize:{gridsize[0]}", marker="+")
# axs[0].plot(threads[1::4], time[1::4], c="b", label="omp", marker="+")
axs[0].legend()


axs[1].set_title("MPI")
# input = pandas.read_csv("./serial_table.dat")
# particles = input["no_particles"].tolist()
# time = input["time_taken"].tolist()
# axs.plot(particles, time, c="b", label="serial", marker="+")
#
# axs.set_xlabel("Number of particles")
# axs.set_ylabel("Time in ms")
plt.legend()
plt.savefig("mpivomp.pdf")
plt.show()
