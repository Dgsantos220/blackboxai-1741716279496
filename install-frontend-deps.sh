#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Installing frontend dependencies...${NC}"

# Navigate to frontend directory
cd frontend || exit 1

# Install dependencies
echo -e "${YELLOW}Installing core dependencies...${NC}"
yarn add @emotion/react @emotion/styled \
    @mui/material @mui/icons-material @mui/x-data-grid @mui/x-date-pickers \
    axios date-fns notistack react react-dom react-router-dom recharts

echo -e "${YELLOW}Installing development dependencies...${NC}"
yarn add -D @testing-library/jest-dom @testing-library/react @testing-library/user-event \
    @types/node @types/react @types/react-dom @types/testing-library__jest-dom \
    @typescript-eslint/eslint-plugin @typescript-eslint/parser \
    @vitejs/plugin-react @vitest/coverage-v8 @vitest/ui \
    eslint eslint-config-prettier eslint-plugin-import eslint-plugin-jsx-a11y \
    eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks \
    jsdom prettier typescript vite vitest vite-tsconfig-paths

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Dependencies installed successfully!${NC}"
    
    # Run type checking to verify setup
    echo -e "${YELLOW}Running type checking...${NC}"
    yarn type-check
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}TypeScript setup verified successfully!${NC}"
    else
        echo -e "${RED}TypeScript verification failed. Please check the errors above.${NC}"
    fi
else
    echo -e "${RED}Failed to install dependencies. Please check the errors above.${NC}"
    exit 1
fi
