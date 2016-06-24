# InsertSilence

A Praat script to insert silence into a fixed location in every wav file in a 
directory.

## Use case

We use _time-locked_ stimuli for our eyetracking experiments, so that the start
of the target word in a sentence always occurs at a fixed time point in a .wav file. 
This script was created so that I could insert an extra amount of silence before
the target word in every stimulus file in an experiment, as we developed and 
prototyped stimuli for a new experiment.

Conceptually, the script automates the task of loading a sound file, extracting
everything before some time point, extracting everything after some time point,
creating a short window of silence, and concatenating the before-part, silence
and after-part together, and saving the new silence-padded sound, and repeating
these steps on every other file in the same folder.


## Usage

### Interactive

Run the `main.praat` in Praat, enter locations for where to source files and 
where to save files, enter amount of silence to add (in seconds) and when to 
insert the silence (in seconds). 

### On the command line

The script can be automated with the command line.

```
$ Praat --run --ansi "main.praat" "wavs/input/" "wavs/" 0.100 1.280

Praat Version: 6.0.19
Date: Fri Jun 24 13:21:36 2016
...2 files found
Writing: wavs/100/Fin_hi_the_D_Duck_faci_100.wav
Writing: wavs/100/Fin_hi_the_V_Duck_neut_100.wav

```


### Acknowledgements

This repository uses procedures from [the CPrAN plugin_selection package](https://gitlab.com/cpran/plugin_selection).
