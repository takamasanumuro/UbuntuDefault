#CREATE A SIMPLE CMAKE PROJECT ON THE CURRENT DIRECTORY

# Create a CMakeLists.txt file

if [ -f CMakeLists.txt ]; then
    echo "CMakeLists.txt already exists"
    exit 1
fi

cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(myproject)
add_executable(myproject main.cpp)
EOF

if [ ! -f main.cpp ]; then
    cat <<EOF > main.cpp
#include <iostream>
int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
EOF
fi

mkdir -p build
cd build
cmake .. && cmake --build . && ./myproject





