#!/usr/bin/env bash
set -eu

SOURCE_CSV_PATH="${1}"
LINES_PER_FILE="${2}"
DEST_PREFIX_NAME="${3}"
DEBUG="${4:-0}"

split_files() {
  local source_csv_path="${1}"
  local lines_per_file="${2}"
  local dest_prefix_name="${3}"
  local debug="${4}"

  _print_log "source_csv_path: ${source_csv_path}"
  local dest_prefix_path="$(pwd)/output/${dest_prefix_name}"
  _print_log "dest_prefix_path: ${dest_prefix_path}"

  local headline=$(awk "NR==1" "${source_csv_path}")
  local file_no=0
  
  mkdir -p "$(dirname ${dest_prefix_path})"

  local lines_in_files=$(wc -l "${source_csv_path}" | awk '{print $1}')
  local files_to_create=$(((lines_in_files-1)/lines_per_file))
  _print_log "There is ${lines_in_files} lines in file. I will create ${files_to_create} files per ${lines_per_file} (Last file may have less)"

  _print_log "Start processing."

  for (( start_line=1; start_line<=lines_in_files; )); do
    last_line=$((start_line+lines_per_file))
    file_no=$((file_no+1))
    local file_path="${dest_prefix_path}$(printf "%06d" ${file_no}).csv"

    if [ $debug -eq 1 ]; then
      _print_log "Creating file ${file_path} with lines [${start_line};${last_line}]"
    fi

    echo "${headline}" > "${file_path}"
    awk "NR>${start_line} && NR<=${last_line}" "${source_csv_path}" >> "${file_path}"

    start_line=$last_line
  done

  _print_log "Done."
}

_print_log() {
  local log_message="${1}"
  local date_time=$(date "+%Y-%m-%d %H:%M:%S.%3N")
  printf "%s - %s\n" "${date_time}" "${log_message}" >&2
}

split_files "${SOURCE_CSV_PATH}" "${LINES_PER_FILE}" "${DEST_PREFIX_NAME}" "${DEBUG}"