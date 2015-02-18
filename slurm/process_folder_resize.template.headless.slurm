#!/bin/bash 


if [[ $MACRO_DEBUG ]]
then
    set -x                                              # show all steps
fi

if [ -z $MACRO_PROCESSING_HOME ]
then
    printf "%b" "Error! Exported shell variable MACRO_PROCESSING_HOME must be set to\n" >&2
    printf "%b" "base directory for headless macros and SLURM scripts.\n" >&2
    exit 1
fi

#SBATCH -J process_folder_resize            # To give the job a name (move to command line)
#SBATCH -N 1                                # Number of compute nodes being requested (-nodes)
#SBATCH -n 4                                # Number of CPUs in each compute node (–ntasks-per-node)
#SBATCH -t 0-0:15                           # Runtime in D-HH:mm
#SBATCH -p general,serial_requeue           # Partition to submit to (other option: serial_requeue)
#SBATCH --mem=4000                          # Memory per node in MB (see also --mem-per-cpu) 
#SBATCH -o process_folder_resize_pid%j.out      # Log file of run summary Can be specified in shell
#SBATCH -e process_folder_resize_pid%j.err      #
#SBATCH --mail-type=ALL                     # send me email on all SLURM actions

module load fiji

# Important note: the number of cores request from SLURM must match the number of
#   parallel threads specified inside the macro (currently 4)

# set this bash variable if not already set by module load
#FIJI_HOME=/n/home/bfreeman/apps/fiji-1.49j

# specify macro that is not built-in 
##SLURM_EXEC_DIR=$( cd "$( dirname "$0" )" && pwd )
MACRO_PATH="$MACRO_PROCESSING_HOME/macros"

# macro to be used (modified version in lab folder)
MACRO_NAME="process_folder_resize.headless.ijm"

# check to ensure filepath and outputdir arguments
if (( $# != 4 ))
then
    printf "%b" "Error. Wrong number of arguments.\n" >&2
    printf "%b" "Usage: $0 inputDir outputDir suffix size\n" >&2
    exit 1
fi

# string usage: inputDir|outputDir|suffix|size 
MACRO_PARAM="$1|$2|$3|$4"

# load headless frame image buffer
if [[ ! $MACRO_DEBUG ]]
then
    export DISPLAY=:1                                          # to avoid using display (GUI)
    Xvfb $DISPLAY -auth /dev/null &                            # headless (no display) GUI
fi

# load the fiji paths into java
#JAVA_OPTS="-Djava.library.path=$FIJI_HOME"    now done in fiji bash script
#(
#LD_LIBRARY_PATH=$FIJI_HOME:$LD_LIBRARY_PATH   now done in fiji bash script
# export FIJI_HOME=$FIJI_EXEC_DIR
# export JAVA_OPTS="-Djava.library.path=$FIJI_HOME"
# export PATH=$FIJI_HOME:$PATH
# export LD_LIBRARY_PATH=$FIJI_HOME:$LD_LIBRARY_PATH

#$FIJI_HOME/fiji --memory=4000m -macro $MACRO_PATH/$MACRO_NAME $MACRO_PARAM
fiji --memory=4000m -macro $MACRO_PATH/$MACRO_NAME $MACRO_PARAM


#wait
#)

