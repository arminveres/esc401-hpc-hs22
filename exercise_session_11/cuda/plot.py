import numpy as np
import matplotlib.pyplot as plt

if __name__ == "__main__":
    mat = []
    x = [60, 120, 180, 240, 300, 360, 420, 600]
    y = [16, 32, 48, 64, 80, 96, 112, 128, 144, 160]
    with open(
        "data.dat",
    ) as file:
        data = file.read().splitlines()
        counter = 0
        curr_arr = []
        for time in data:
            if counter == 10:
                mat.append(curr_arr)
                curr_arr = []
                counter = 0
            curr_arr.append(float(time))
            counter += 1
        mat.append(curr_arr)
        print(np.shape(mat))
        plt.pcolormesh(
            y, x, mat, vmin=np.abs(mat).min(), vmax=np.abs(mat).max(), cmap="magma"
        )
        plt.show()
