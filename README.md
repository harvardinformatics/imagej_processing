# imagej_processing
Demo files for ImageJ (headless) macro processing and SLURM scripts for Office Hours/Tips at 12 

Image Processing with ImageJ and automation on Odyssey
Bob Freeman, PhD
robertfreeman [at] g.harvard.edu


- Launching an interactive NoMachineX session for image processing
    install NoMachineX client
    launch client & login
    grab interactive session
    launch Fiji

- Doing a simple processing step
    Open
    Image > Adjust > Size
    
    Run plug-in or macro
    
- Recording a macro for repeat processing
    Plugins > Macro > Record
    Now do your necessary steps

- Processing a whole folder
    New > Script > Template
    copy/paste in the macro steps
    adjust where names/paths are hard-coded
    
- Turning that macro into a command-line driven sbatch script
    template macro file
        insert process_folder_resize code & adjust
        switch to debug mode
        switch out of debug mode & test at command line
    template slurm file
        check and make changes as necessary
        export MACRO_DEBUG=1
        export MACRO_PROCESSING_HOME=$PWD
        unset MACRO_DEBUG
        
- Testing!!
    run macro interactively
    run macro in batch
    run fiji interactively
    run fiji in batch via executable SLURM script
    run slurm script under sbatch
    

    
    
Sample images at
    http://imagej.nih.gov/ij/download/sample-images.zip

Tips:
- For recording macros, must use explicit steps (no shortcuts). For example, you must save and then close; you cannot close and save as a part of this as save won't be recorded
- use ImageJ BBEdit plugin for syntax coloring

Questions:
- with r/o fiji, is memory spec honored?
- with r/o fiji, is # cores spec honored?

