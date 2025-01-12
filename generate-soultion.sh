#!/bin/bash

PROJECT_PATH="./Scripts/GenerateSolution"
BINARY_PATH="$PROJECT_PATH/.build/release/GenerateSolution"
BUILD_OPTION=false

# Looking for a `build` option
for ARG in "$@"
do
    case $ARG in
        -b|--build-script)
            BUILD_OPTION=true
            break
            ;;
    esac
done

# If we need to build or if the binary doesn't exist, trigger build
if [[ "$BUILD_OPTION" == "true" || ! -f "$BINARY_PATH" ]]; then
    swift build -c release --package-path "$PROJECT_PATH"
    # If arguments == 1 exit
    if [[ "$#" -eq 1 ]]; then
        exit 0
    fi
fi

# Print help if something went wrong and we don't have script binary.
# Help message is taken from the generate-solution script.
if [[ ! -f "$BINARY_PATH" ]]; then
    echo "OVERVIEW: A command to generate a new LeetCode solution subpackage."
    echo ""
    echo "USAGE: generate-solution <solution-name> [--override] [--build-script]"
    echo ""
    echo "ARGUMENTS:"
    echo "  <solution-name>         The name of the solution to generate."
    echo ""
    echo "OPTIONS:"
    echo "  -o, --override          Override the solution if it already exists."
    echo "  -b, --build-script      Build script for generating LeetCode solution subpackages."
    echo "  -h, --help              Show help information."
fi

# Run the binary
"$BINARY_PATH" "$@"
