
def get_vid_length(filename, error_if_vid_not_exist = True, return_type = "sec_float", time_str_sep = "_"):
    ''' return_type = "min_sec_str", "sec_float" '''

    result = sp....run(["ffprobe", "-v", "error", "-show_entries", "format=duration", "-of","default=noprint_wrappers=1:nokey=1", str(Path(filename))], stdout=sp.PIPE, stderr=sp.STDOUT)

    sec_float = float(result.stdout)
    
    if return_type == "sec_float":
        return sec_float

    min_int, sec_int = divmod(int(sec_float), 60)
    min_int_str_zfill = f"{str(min_int).zfill(2)}"
    sec_int_str_zfill = f"{str(sec_int).zfill(2)}"

    if return_type == "min_sec_str":
        return f"{min_int_str_zfill}{time_str_sep}{sec_int_str_zfill}"

    raise ValueError(f"Invalid {return_type=}")
