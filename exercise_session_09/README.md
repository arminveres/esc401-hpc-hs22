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

### Docker

I had to use bionic, as trusty had some weird errors when installing with trusty:
```
init.cpp: In function 'void readParameters(const char*, params*)':
init.cpp:11:10: error: 'fopen' is not a member of 'std'
     fp = std::fopen(file_name, "r");
          ^
init.cpp:13:47: error: 'perror' was not declared in this scope
     if (fp==NULL) perror ("Error opening file");
                                               ^
init.cpp:16:35: error: 'printf' was not declared in this scope
     printf("Reading parameters:\n");
                                   ^
init.cpp:17:40: error: 'fgets' was not declared in this scope
     while (fgets(line, sizeof(line), fp)) {
                                        ^
init.cpp:18:47: error: 'sscanf' was not declared in this scope
         if (sscanf(line, "nx=%d\n", &param->nx)) 
                                               ^
init.cpp:20:47: error: 'sscanf' was not declared in this scope
         if (sscanf(line, "ny=%d\n", &param->ny))
                                               ^
init.cpp:22:57: error: 'sscanf' was not declared in this scope
         if (sscanf(line, "foutput=%d\n", &param->foutput))
                                                         ^
init.cpp:24:61: error: 'sscanf' was not declared in this scope
         if (sscanf(line, "nstep_max=%d\n", &param->nstep_max))
                                                             ^
init.cpp:26:56: error: 'sscanf' was not declared in this scope
         if (sscanf(line, "tolerance=%lg\n", &param->tol))
                                                        ^
init.cpp:28:67: error: 'sscanf' was not declared in this scope
         if (sscanf(line, "rhs_function=%d\n", &param->rhs_function))
                                                                   ^
init.cpp:31:14: error: 'fclose' was not declared in this scope
     fclose(fp);
              ^
make: *** [init.o] Error 1
```

To run with a mount:
```bash
docker run -v `pwd`/output:/poisson/output arminveres/poisson
```
