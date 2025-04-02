#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Global variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR=""
CONFIG_SOURCE_DIR="$SCRIPT_DIR"

# Print usage information
function print_usage() {
    echo -e "${CYAN}Usage:${NC} $0 [options]"
    echo
    echo "Options:"
    echo "  -h, --help         Show this help message"
    echo "  -p, --path PATH    Path to your project (required)"
    echo
    echo "Example:"
    echo "  $0 --path /path/to/your/project"
}

# Print a section header
function print_header() {
    echo -e "\n${BLUE}==== $1 ====${NC}"
}

# Print success message
function print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Print error message
function print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Print warning message
function print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Setup environment variables
function setup_env() {
    print_header "Setting up environment variables"
    
    echo "PYTHONPATH=$TARGET_DIR" > "$TARGET_DIR/.env"
    print_success "Created .env file with PYTHONPATH=$TARGET_DIR"
}

# Create required directories
function create_directories() {
    print_header "Creating required directories"
    
    mkdir -p "$TARGET_DIR/.vscode"
    mkdir -p "$TARGET_DIR/.cursor/rules"
    
    print_success "Created directory structure"
}

# Copy config files from source to target
function copy_config_files() {
    print_header "Setting up configuration files"
    
    # Copy VS Code configuration files
    if [ -f "$CONFIG_SOURCE_DIR/.vscode/settings.json" ]; then
        cp "$CONFIG_SOURCE_DIR/.vscode/settings.json" "$TARGET_DIR/.vscode/"
        print_success "Copied settings.json"
    else
        print_warning "settings.json not found in source directory"
    fi
    
    if [ -f "$CONFIG_SOURCE_DIR/.vscode/extensions.json" ]; then
        cp "$CONFIG_SOURCE_DIR/.vscode/extensions.json" "$TARGET_DIR/.vscode/"
        print_success "Copied extensions.json"
    else
        print_warning "extensions.json not found in source directory"
    fi
    
    if [ -f "$CONFIG_SOURCE_DIR/.vscode/launch.json" ]; then
        cp "$CONFIG_SOURCE_DIR/.vscode/launch.json" "$TARGET_DIR/.vscode/"
        print_success "Copied launch.json"
    else
        print_warning "launch.json not found in source directory"
    fi
    
    # Copy Cursor rules
    if [ -f "$CONFIG_SOURCE_DIR/.cursor/rules/python_rules.mcd" ]; then
        cp "$CONFIG_SOURCE_DIR/.cursor/rules/python_rules.mcd" "$TARGET_DIR/.cursor/rules/"
        print_success "Copied python_rules.mcd"
    else
        print_warning "python_rules.mcd not found in source directory"
    fi
}

# Validate the setup
function validate_setup() {
    print_header "Validating setup"
    
    # Check environment file
    if [ -f "$TARGET_DIR/.env" ]; then
        print_success ".env file exists"
    else
        print_error ".env file missing"
    fi
    
    # Check VS Code configuration
    if [ -d "$TARGET_DIR/.vscode" ]; then
        print_success ".vscode directory exists"
        
        if [ -f "$TARGET_DIR/.vscode/settings.json" ]; then
            print_success "settings.json exists"
        else
            print_error "settings.json missing"
        fi
        
        if [ -f "$TARGET_DIR/.vscode/extensions.json" ]; then
            print_success "extensions.json exists"
        else
            print_error "extensions.json missing"
        fi
        
        if [ -f "$TARGET_DIR/.vscode/launch.json" ]; then
            print_success "launch.json exists"
        else
            print_error "launch.json missing"
        fi
    else
        print_error ".vscode directory missing"
    fi
    
    # Check Cursor rules
    if [ -d "$TARGET_DIR/.cursor" ] && [ -d "$TARGET_DIR/.cursor/rules" ]; then
        print_success ".cursor/rules directory exists"
        
        if [ -f "$TARGET_DIR/.cursor/rules/python_rules.mcd" ]; then
            print_success "python_rules.mcd exists"
        else
            print_error "python_rules.mcd missing"
        fi
    else
        print_error ".cursor/rules directory missing"
    fi
}

# Display next steps
function show_next_steps() {
    print_header "Setup Complete"
    
    echo -e "Next steps:"
    echo -e "1. Open Extensions panel (${CYAN}Ctrl+Shift+X${NC})"
    echo -e "2. Type ${CYAN}@recommended${NC} in the search bar"
    echo -e "3. Click ${CYAN}Install All${NC} to install recommended extensions"
    echo -e "4. Restart Cursor IDE"
    echo -e "5. Follow extra minir configurations on ${CYAN}README.md${NC}"
    echo
    echo -e "${GREEN}Enjoy your JetBrains-like experience in Cursor!${NC}"
}

# Main setup function
function main() {
    echo -e "${CYAN}Setting up Cursor IDE environment for Python development...${NC}"
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                print_usage
                exit 0
                ;;
            -p|--path)
                if [[ -z "$2" || "$2" == -* ]]; then
                    print_error "The --path option requires a non-empty value."
                    print_usage
                    exit 1
                fi
                TARGET_DIR="$2"
                shift 2
                ;;
            *)
                print_error "Invalid argument: $1"
                print_usage
                exit 1
                ;;
        esac
    done
    
    # Check if target directory is specified
    if [ -z "$TARGET_DIR" ]; then
        print_error "Target directory is required. Use --path option."
        print_usage
        exit 1
    fi
    
    # Ensure target directory exists
    if [ ! -d "$TARGET_DIR" ]; then
        print_error "Target directory does not exist: $TARGET_DIR"
        exit 1
    fi
    
    echo "Setting up Cursor environment in: $TARGET_DIR"
    
    # Run setup steps
    create_directories
    setup_env
    copy_config_files
    validate_setup
    show_next_steps
}

# Run the main function with all arguments
main "$@" 