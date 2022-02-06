#!/usr/bin/env bash
set -eu

SOURCE_CSV_PATH="${1}"
LINES_PER_FILE="${2}"
DEST_PREFIX_NAME="${3}"

split_files() {
  local source_csv_path="${1}"
  local lines_per_file="${2}"
  local dest_prefix_name="${3}"

  echo "source_csv_path: ${source_csv_path}"
  local dest_prefix_path="$(pwd)/output/${dest_prefix_name}"
  echo "dest_prefix_path: ${dest_prefix_path}"

  local headline=$(awk "NR==1" "${source_csv_path}")
  local file_no=0
  
  mkdir -p "$(dirname ${dest_prefix_path})"

  local lines_in_files=$(wc -l "${source_csv_path}" | awk '{print $1}')
  local files_to_create=$(((lines_in_files-1)/lines_per_file))
  echo "There is ${lines_in_files} lines in file. I'll create ${files_to_create} files per ${lines_per_file} (Last file may have less)"

  for (( start_line=1; start_line<=lines_in_files; )); do
    last_line=$((start_line+lines_per_file))
    file_no=$((file_no+1))
    local file_path="${dest_prefix_path}$(printf "%06d" ${file_no}).csv"
    echo "Creating file ${file_path} with lines [${start_line};${last_line}]"

    echo "${headline}" > "${file_path}"
    awk "NR>${start_line} && NR<=${last_line}" "${source_csv_path}" >> "${file_path}"

    start_line=$last_line
  done
}

split_files "${SOURCE_CSV_PATH}" "${LINES_PER_FILE}" "${DEST_PREFIX_NAME}"