// Created by Bob Freeman, PhD
//      5-Feb-2015

// PURPOSE:
//
//

// ASSUMPTIONS:

// CHANGES:

// TO FIX:


mdebug = 0;

if (mdebug) { print("Before setting threads"); }
run("Memory & Threads...", "parallel=4");
if (mdebug) { print("After setting threads"); }


print ("Process folder resize macro!");
print (" ");

if (mdebug) { print("Parsing arguments"); }

// get user parameters 
if (! mdebug) {
    parameter_string = getArgument();
} else {
    //parameter_string = "enter|params|here|with|pipe|separator";
    parameter_string = "/n/home_rc/bfreeman/classes/tips_imagej/samples/batchin/|/n/home_rc/bfreeman/classes/tips_imagej/samples/batchout/|128";
    // File.separator function is good for placing \ or / depending on OS
}

// "inputfolder|outputfolder|size"
args = split(parameter_string, "|");
inputFolder     = args[0];
outputFolder    = args[1];
resize          = parseInt(args[2]);
//someFloat     = parseFloat(args[3]);

// debug!!
if (1) {
    print ("Params...");
    print ("inputFolder: " + inputFolder);
    print ("outputFolder: " + outputFolder);
    print ("resize: " + resize);
}

// Create markers for elapsed time.
if (mdebug) { print ("Creating time markers"); }
absoluteStart = getTime();

// run multi-view fusion for single channel
if (mdebug) { print ("Starting resize function"); }
setBatchMode(true);

/// INSERT FUNCTION HERE!!

// manage elapsed time
totalTime = (getTime() - absoluteStart) / (1000 * 60);
print ("ALL DONE! It took " + d2s(totalTime,0) + " minutes.");

// Save the log file.
selectWindow("Log");
thisFile = outputFolder + File.separator + "process_folder_resize.headless.log";
saveAs("text", thisFile);	

run("Quit");

