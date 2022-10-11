set title 'OpenMP Speedup'
set xlabel 'Threads'
set ylabel 'Speedup'
set key top left
plot x t 'Ideal Speedup', "count_keep.dat" u 1:(4.55/$2) w l t 'OpenMP'

set term 'pngcairo'
set output 'speedup.png'
replot                # redo the last plot command
unset output          # clean closing of file
