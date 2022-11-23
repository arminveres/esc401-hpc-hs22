# Exercise 9

## Openstack

```bash
ubuntu@averes-ubuntu18:~$ cowsay Hello there.
 ______________
< Hello there. >
 --------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

### steps

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install cowsay -y
cowsay
cowsay Hello there.
git clone https://github.com/jbucko/hpc_esc_401
cd hpc_esc_401/exercise_session_09/poisson_solver_serial/
sudo apt install g++
sudo apt install make
make
./main
sudo apt install -q python3-pip
cd output/
python3 plot.py
pip3 install numpy
python3 plot.py
pip3 install numpy matplotlib
pip3 install pip
pip3 install pip setuptools wheel
pip3 install numpy matplotlib
python3 plot.py
la
pip3 install --upgrade pip setuptools wheel
pip3 install tk
sudo apt install python3-tk
```

### Poisson OMP
In order to run OMP, I just had to change CC to g++.
