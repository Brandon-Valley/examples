def _set_up_logging(log_file_parent_dir_path: Path, max_old_log_file_age_sec: int = 2628288) -> Path:
    """Returns Path to log file, 2628288 sec ~= 1 month"""
    # Delete any log files older than max_old_log_file_age_sec
    if log_file_parent_dir_path:
        for path_obj in log_file_parent_dir_path.glob("*"):
            num_sec_since_last_modified = int(time.time() - os.path.getmtime(path_obj))
            if max_old_log_file_age_sec < num_sec_since_last_modified:
                os.remove(path_obj)

    if log_file_parent_dir_path:
        log_file_parent_dir_path.mkdir(parents=True, exist_ok=True)

    log_file_name = cfg.PRODUCT_NAME.replace(" ", "_") + "_" + datetime.utcnow().strftime('%Y_%m_%d_%H_%M_%S') + ".log"
    log_file_path = log_file_parent_dir_path / log_file_name

    logging.root.handlers = []
    logging.basicConfig(
        level=logging.INFO,
        # format="%(asctime)s [%(levelname)s] %(message)s",
        format="%(message)s",
        handlers=[logging.FileHandler(log_file_path), logging.StreamHandler(sys.stdout)]
    )
    logging.info(f"Initialized logging for {log_file_path=}...\n")
    return log_file_path
