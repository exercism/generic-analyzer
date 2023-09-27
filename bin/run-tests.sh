#!/usr/bin/env sh

# Synopsis:
# Test the analyzer by running it against a predefined set of solutions 
# with an expected output.

# Output:
# Outputs the diff of the expected analysis against the actual analysis
# generated by the analyzer.

# Example:
# ./bin/run-tests.sh

exit_code=0

# Iterate over all test directories
for test_dir in tests/*; do
    test_dir_name=$(basename "${test_dir}")
    test_dir_path=$(realpath "${test_dir}")
    analysis_file_path="${test_dir_path}/analysis.json"
    expected_analysis_file_path="${test_dir_path}/expected_analysis.json"

    bin/run.sh "${test_dir_name}" "${test_dir_path}" "${test_dir_path}"

    echo "${test_dir_name}: comparing analysis.json to expected_analysis.json"

    if ! diff "${analysis_file_path}" "${expected_analysis_file_path}"; then
        exit_code=1
    fi
done

exit ${exit_code}