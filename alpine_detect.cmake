# Detect Alpine Linux and enable static C++ library linking
cmake_minimum_required(VERSION 3.10)

# Function to check if the current system is Alpine Linux
function(is_alpine_linux RESULT)
  if(UNIX AND NOT APPLE)
    # Read the contents of /etc/os-release if it exists
    if(EXISTS "/etc/os-release")
      file(READ "/etc/os-release" OS_RELEASE_CONTENTS)
      
      # Check if the contents contain "Alpine Linux"
      string(FIND "${OS_RELEASE_CONTENTS}" "Alpine Linux" ALPINE_FOUND)
      
      if(ALPINE_FOUND GREATER -1)
        set(${RESULT} TRUE PARENT_SCOPE)
      else()
        set(${RESULT} FALSE PARENT_SCOPE)
      endif()
    else()
      set(${RESULT} FALSE PARENT_SCOPE)
    endif()
  else()
    set(${RESULT} FALSE PARENT_SCOPE)
  endif()
endfunction()


# Check if the current system is Alpine Linux and print
is_alpine_linux(IS_ALPINE_LINUX)
message(STATUS "Is Alpine Linux: ${IS_ALPINE_LINUX}")