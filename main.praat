
# For reproducibility
writeInfoLine: "Praat Version: " + praatVersion$
appendInfoLine: "Date: " + date$()

include utils/cpran/selection.proc
include utils/insert_silence.proc
include utils/iter.proc

form Add silence at a fixed location to all sounds in a folder
    sentence input_directory wavs/input/
    sentence output_directory wavs/
    real silence_amount 0.020
    real silence_location 1.280
endform

source_dir$ = input_directory$
out_dir$ = output_directory$

out_dir$ = "wavs/" + string$(silence_amount * 1000) + "/"
createDirectory(out_dir$)

# Initialize a file-list iterator
Create Strings as file list: "fileList", source_dir$ + "/*.wav"
@strings_iter: "fileList", "initialize"

# FYI to user
file_count = Get number of strings
appendInfoLine: "..." + string$(file_count) + " files found"

# Create and save silence-added version of each file in the iterator
while strings_iter.fileList.has_next
    @strings_iter("fileList", "next")

    file$ = source_dir$ + strings_iter.fileList.next$
    Read from file: file$

    @insert_silence: selected$(), silence_location, silence_amount

    selectObject(insert_silence.combined_obj_no)

    @extract_name_of_sound: selected$()

    file_out$ = out_dir$ + extract_name_of_sound.name$ + ".wav"
    appendInfoLine: "Writing: ", file_out$ 
    Save as WAV file: file_out$
endwhile

appendInfoLine: ""