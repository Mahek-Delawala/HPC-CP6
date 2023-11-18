#!/bin/bash -l
#SBATCH --constraint=cpu
#SBATCH --nodes=4
#SBATCH --time=00:30:00

export input="../data/zebra-gray-int8-4x"
export xsize=7112
export ysize=5146

for P in 4 9 16 25 36 49 64 81
   do
   for decomp in 1 2 3
      do
      echo " srun -n $P ./mpi_2dmesh -i $input -x $xsize -y $ysize -g $decomp  "
      srun -n $P ./mpi_2dmesh -i $input -x $xsize -y $ysize -g $decomp 
      done
   done
