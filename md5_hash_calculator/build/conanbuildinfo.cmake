include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAMES ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  POCO
#################
set(CONAN_POCO_ROOT "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c")
set(CONAN_INCLUDE_DIRS_POCO "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c/include")
set(CONAN_LIB_DIRS_POCO "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c/lib")
set(CONAN_BIN_DIRS_POCO )
set(CONAN_RES_DIRS_POCO )
set(CONAN_SRC_DIRS_POCO )
set(CONAN_BUILD_DIRS_POCO "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c/")
set(CONAN_FRAMEWORK_DIRS_POCO )
set(CONAN_LIBS_POCO PocoDataMySQL PocoDataPostgreSQL PocoDataSQLite PocoEncodings PocoJWT PocoMongoDB PocoNetSSL PocoCrypto PocoRedis PocoNet PocoZip PocoUtil PocoJSON PocoXML PocoActiveRecord PocoData PocoFoundation)
set(CONAN_PKG_LIBS_POCO PocoDataMySQL PocoDataPostgreSQL PocoDataSQLite PocoEncodings PocoJWT PocoMongoDB PocoNetSSL PocoCrypto PocoRedis PocoNet PocoZip PocoUtil PocoJSON PocoXML PocoActiveRecord PocoData PocoFoundation)
set(CONAN_SYSTEM_LIBS_POCO pthread dl rt)
set(CONAN_FRAMEWORKS_POCO )
set(CONAN_FRAMEWORKS_FOUND_POCO "")  # Will be filled later
set(CONAN_DEFINES_POCO "-DPOCO_STATIC=ON"
			"-DPOCO_UNBUNDLED")
set(CONAN_BUILD_MODULES_PATHS_POCO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_POCO "POCO_STATIC=ON"
			"POCO_UNBUNDLED")

set(CONAN_C_FLAGS_POCO "")
set(CONAN_CXX_FLAGS_POCO "")
set(CONAN_SHARED_LINKER_FLAGS_POCO "")
set(CONAN_EXE_LINKER_FLAGS_POCO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_POCO_LIST "")
set(CONAN_CXX_FLAGS_POCO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_POCO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_POCO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_POCO "${CONAN_FRAMEWORKS_POCO}" "_POCO" "")
# Append to aggregated values variable
set(CONAN_LIBS_POCO ${CONAN_PKG_LIBS_POCO} ${CONAN_SYSTEM_LIBS_POCO} ${CONAN_FRAMEWORKS_FOUND_POCO})


#################
###  PCRE2
#################
set(CONAN_PCRE2_ROOT "/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11")
set(CONAN_INCLUDE_DIRS_PCRE2 "/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11/include")
set(CONAN_LIB_DIRS_PCRE2 "/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11/lib")
set(CONAN_BIN_DIRS_PCRE2 "/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11/bin")
set(CONAN_RES_DIRS_PCRE2 )
set(CONAN_SRC_DIRS_PCRE2 )
set(CONAN_BUILD_DIRS_PCRE2 )
set(CONAN_FRAMEWORK_DIRS_PCRE2 )
set(CONAN_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_PKG_LIBS_PCRE2 pcre2-posix pcre2-8 pcre2-16 pcre2-32)
set(CONAN_SYSTEM_LIBS_PCRE2 )
set(CONAN_FRAMEWORKS_PCRE2 )
set(CONAN_FRAMEWORKS_FOUND_PCRE2 "")  # Will be filled later
set(CONAN_DEFINES_PCRE2 "-DPCRE2_STATIC")
set(CONAN_BUILD_MODULES_PATHS_PCRE2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PCRE2 "PCRE2_STATIC")

set(CONAN_C_FLAGS_PCRE2 "")
set(CONAN_CXX_FLAGS_PCRE2 "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2 "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PCRE2_LIST "")
set(CONAN_CXX_FLAGS_PCRE2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PCRE2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PCRE2 "${CONAN_FRAMEWORKS_PCRE2}" "_PCRE2" "")
# Append to aggregated values variable
set(CONAN_LIBS_PCRE2 ${CONAN_PKG_LIBS_PCRE2} ${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2})


#################
###  EXPAT
#################
set(CONAN_EXPAT_ROOT "/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f")
set(CONAN_INCLUDE_DIRS_EXPAT "/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f/include")
set(CONAN_LIB_DIRS_EXPAT "/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f/lib")
set(CONAN_BIN_DIRS_EXPAT )
set(CONAN_RES_DIRS_EXPAT )
set(CONAN_SRC_DIRS_EXPAT )
set(CONAN_BUILD_DIRS_EXPAT "/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f/")
set(CONAN_FRAMEWORK_DIRS_EXPAT )
set(CONAN_LIBS_EXPAT expat)
set(CONAN_PKG_LIBS_EXPAT expat)
set(CONAN_SYSTEM_LIBS_EXPAT )
set(CONAN_FRAMEWORKS_EXPAT )
set(CONAN_FRAMEWORKS_FOUND_EXPAT "")  # Will be filled later
set(CONAN_DEFINES_EXPAT "-DXML_STATIC")
set(CONAN_BUILD_MODULES_PATHS_EXPAT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_EXPAT "XML_STATIC")

set(CONAN_C_FLAGS_EXPAT "")
set(CONAN_CXX_FLAGS_EXPAT "")
set(CONAN_SHARED_LINKER_FLAGS_EXPAT "")
set(CONAN_EXE_LINKER_FLAGS_EXPAT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_EXPAT_LIST "")
set(CONAN_CXX_FLAGS_EXPAT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_EXPAT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_EXPAT "${CONAN_FRAMEWORKS_EXPAT}" "_EXPAT" "")
# Append to aggregated values variable
set(CONAN_LIBS_EXPAT ${CONAN_PKG_LIBS_EXPAT} ${CONAN_SYSTEM_LIBS_EXPAT} ${CONAN_FRAMEWORKS_FOUND_EXPAT})


#################
###  SQLITE3
#################
set(CONAN_SQLITE3_ROOT "/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8")
set(CONAN_INCLUDE_DIRS_SQLITE3 "/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8/include")
set(CONAN_LIB_DIRS_SQLITE3 "/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8/lib")
set(CONAN_BIN_DIRS_SQLITE3 "/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8/bin")
set(CONAN_RES_DIRS_SQLITE3 )
set(CONAN_SRC_DIRS_SQLITE3 )
set(CONAN_BUILD_DIRS_SQLITE3 )
set(CONAN_FRAMEWORK_DIRS_SQLITE3 )
set(CONAN_LIBS_SQLITE3 sqlite3)
set(CONAN_PKG_LIBS_SQLITE3 sqlite3)
set(CONAN_SYSTEM_LIBS_SQLITE3 pthread dl m)
set(CONAN_FRAMEWORKS_SQLITE3 )
set(CONAN_FRAMEWORKS_FOUND_SQLITE3 "")  # Will be filled later
set(CONAN_DEFINES_SQLITE3 )
set(CONAN_BUILD_MODULES_PATHS_SQLITE3 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SQLITE3 )

set(CONAN_C_FLAGS_SQLITE3 "")
set(CONAN_CXX_FLAGS_SQLITE3 "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3 "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SQLITE3_LIST "")
set(CONAN_CXX_FLAGS_SQLITE3_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SQLITE3 "${CONAN_FRAMEWORKS_SQLITE3}" "_SQLITE3" "")
# Append to aggregated values variable
set(CONAN_LIBS_SQLITE3 ${CONAN_PKG_LIBS_SQLITE3} ${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3})


#################
###  LIBPQ
#################
set(CONAN_LIBPQ_ROOT "/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646")
set(CONAN_INCLUDE_DIRS_LIBPQ "/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include")
set(CONAN_LIB_DIRS_LIBPQ "/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib")
set(CONAN_BIN_DIRS_LIBPQ "/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/bin")
set(CONAN_RES_DIRS_LIBPQ )
set(CONAN_SRC_DIRS_LIBPQ )
set(CONAN_BUILD_DIRS_LIBPQ "/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/")
set(CONAN_FRAMEWORK_DIRS_LIBPQ )
set(CONAN_LIBS_LIBPQ pq pgcommon pgcommon_shlib pgport pgport_shlib)
set(CONAN_PKG_LIBS_LIBPQ pq pgcommon pgcommon_shlib pgport pgport_shlib)
set(CONAN_SYSTEM_LIBS_LIBPQ pthread)
set(CONAN_FRAMEWORKS_LIBPQ )
set(CONAN_FRAMEWORKS_FOUND_LIBPQ "")  # Will be filled later
set(CONAN_DEFINES_LIBPQ )
set(CONAN_BUILD_MODULES_PATHS_LIBPQ )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBPQ )

set(CONAN_C_FLAGS_LIBPQ "")
set(CONAN_CXX_FLAGS_LIBPQ "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBPQ_LIST "")
set(CONAN_CXX_FLAGS_LIBPQ_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBPQ "${CONAN_FRAMEWORKS_LIBPQ}" "_LIBPQ" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBPQ ${CONAN_PKG_LIBS_LIBPQ} ${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ})


#################
###  LIBMYSQLCLIENT
#################
set(CONAN_LIBMYSQLCLIENT_ROOT "/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a")
set(CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT "/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/include")
set(CONAN_LIB_DIRS_LIBMYSQLCLIENT "/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/lib")
set(CONAN_BIN_DIRS_LIBMYSQLCLIENT "/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/bin")
set(CONAN_RES_DIRS_LIBMYSQLCLIENT )
set(CONAN_SRC_DIRS_LIBMYSQLCLIENT )
set(CONAN_BUILD_DIRS_LIBMYSQLCLIENT "/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/")
set(CONAN_FRAMEWORK_DIRS_LIBMYSQLCLIENT )
set(CONAN_LIBS_LIBMYSQLCLIENT mysqlclient)
set(CONAN_PKG_LIBS_LIBMYSQLCLIENT mysqlclient)
set(CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT stdc++ m resolv)
set(CONAN_FRAMEWORKS_LIBMYSQLCLIENT )
set(CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT "")  # Will be filled later
set(CONAN_DEFINES_LIBMYSQLCLIENT )
set(CONAN_BUILD_MODULES_PATHS_LIBMYSQLCLIENT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT )

set(CONAN_C_FLAGS_LIBMYSQLCLIENT "")
set(CONAN_CXX_FLAGS_LIBMYSQLCLIENT "")
set(CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT "")
set(CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LIBMYSQLCLIENT_LIST "")
set(CONAN_CXX_FLAGS_LIBMYSQLCLIENT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT "${CONAN_FRAMEWORKS_LIBMYSQLCLIENT}" "_LIBMYSQLCLIENT" "")
# Append to aggregated values variable
set(CONAN_LIBS_LIBMYSQLCLIENT ${CONAN_PKG_LIBS_LIBMYSQLCLIENT} ${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646")
set(CONAN_INCLUDE_DIRS_ZLIB "/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include")
set(CONAN_LIB_DIRS_ZLIB "/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e")
set(CONAN_INCLUDE_DIRS_BZIP2 "/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/include")
set(CONAN_LIB_DIRS_BZIP2 "/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib")
set(CONAN_BIN_DIRS_BZIP2 "/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


#################
###  OPENSSL
#################
set(CONAN_OPENSSL_ROOT "/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646")
set(CONAN_INCLUDE_DIRS_OPENSSL "/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include")
set(CONAN_LIB_DIRS_OPENSSL "/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib")
set(CONAN_BIN_DIRS_OPENSSL "/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/bin")
set(CONAN_RES_DIRS_OPENSSL )
set(CONAN_SRC_DIRS_OPENSSL )
set(CONAN_BUILD_DIRS_OPENSSL "/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/")
set(CONAN_FRAMEWORK_DIRS_OPENSSL )
set(CONAN_LIBS_OPENSSL ssl crypto)
set(CONAN_PKG_LIBS_OPENSSL ssl crypto)
set(CONAN_SYSTEM_LIBS_OPENSSL dl pthread rt)
set(CONAN_FRAMEWORKS_OPENSSL )
set(CONAN_FRAMEWORKS_FOUND_OPENSSL "")  # Will be filled later
set(CONAN_DEFINES_OPENSSL )
set(CONAN_BUILD_MODULES_PATHS_OPENSSL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENSSL )

set(CONAN_C_FLAGS_OPENSSL "")
set(CONAN_CXX_FLAGS_OPENSSL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENSSL_LIST "")
set(CONAN_CXX_FLAGS_OPENSSL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENSSL "${CONAN_FRAMEWORKS_OPENSSL}" "_OPENSSL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENSSL ${CONAN_PKG_LIBS_OPENSSL} ${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL})


#################
###  ZSTD
#################
set(CONAN_ZSTD_ROOT "/home/rachit/.conan/data/zstd/1.5.2/_/_/package/1e8f95ed1a9a9ef594f731500716088f6eb8bee6")
set(CONAN_INCLUDE_DIRS_ZSTD "/home/rachit/.conan/data/zstd/1.5.2/_/_/package/1e8f95ed1a9a9ef594f731500716088f6eb8bee6/include")
set(CONAN_LIB_DIRS_ZSTD "/home/rachit/.conan/data/zstd/1.5.2/_/_/package/1e8f95ed1a9a9ef594f731500716088f6eb8bee6/lib")
set(CONAN_BIN_DIRS_ZSTD )
set(CONAN_RES_DIRS_ZSTD )
set(CONAN_SRC_DIRS_ZSTD )
set(CONAN_BUILD_DIRS_ZSTD )
set(CONAN_FRAMEWORK_DIRS_ZSTD )
set(CONAN_LIBS_ZSTD zstd)
set(CONAN_PKG_LIBS_ZSTD zstd)
set(CONAN_SYSTEM_LIBS_ZSTD pthread)
set(CONAN_FRAMEWORKS_ZSTD )
set(CONAN_FRAMEWORKS_FOUND_ZSTD "")  # Will be filled later
set(CONAN_DEFINES_ZSTD )
set(CONAN_BUILD_MODULES_PATHS_ZSTD )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZSTD )

set(CONAN_C_FLAGS_ZSTD "")
set(CONAN_CXX_FLAGS_ZSTD "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZSTD_LIST "")
set(CONAN_CXX_FLAGS_ZSTD_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZSTD_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZSTD "${CONAN_FRAMEWORKS_ZSTD}" "_ZSTD" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZSTD ${CONAN_PKG_LIBS_ZSTD} ${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD})


#################
###  LZ4
#################
set(CONAN_LZ4_ROOT "/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646")
set(CONAN_INCLUDE_DIRS_LZ4 "/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include")
set(CONAN_LIB_DIRS_LZ4 "/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib")
set(CONAN_BIN_DIRS_LZ4 )
set(CONAN_RES_DIRS_LZ4 )
set(CONAN_SRC_DIRS_LZ4 )
set(CONAN_BUILD_DIRS_LZ4 "/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/")
set(CONAN_FRAMEWORK_DIRS_LZ4 )
set(CONAN_LIBS_LZ4 lz4)
set(CONAN_PKG_LIBS_LZ4 lz4)
set(CONAN_SYSTEM_LIBS_LZ4 )
set(CONAN_FRAMEWORKS_LZ4 )
set(CONAN_FRAMEWORKS_FOUND_LZ4 "")  # Will be filled later
set(CONAN_DEFINES_LZ4 )
set(CONAN_BUILD_MODULES_PATHS_LZ4 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_LZ4 )

set(CONAN_C_FLAGS_LZ4 "")
set(CONAN_CXX_FLAGS_LZ4 "")
set(CONAN_SHARED_LINKER_FLAGS_LZ4 "")
set(CONAN_EXE_LINKER_FLAGS_LZ4 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_LZ4_LIST "")
set(CONAN_CXX_FLAGS_LZ4_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_LZ4_LIST "")
set(CONAN_EXE_LINKER_FLAGS_LZ4_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_LZ4 "${CONAN_FRAMEWORKS_LZ4}" "_LZ4" "")
# Append to aggregated values variable
set(CONAN_LIBS_LZ4 ${CONAN_PKG_LIBS_LZ4} ${CONAN_SYSTEM_LIBS_LZ4} ${CONAN_FRAMEWORKS_FOUND_LZ4})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "gcc")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libstdc++11")
set(CONAN_SETTINGS_COMPILER_VERSION "11")
set(CONAN_SETTINGS_OS "Linux")
set(CONAN_SETTINGS_OS_BUILD "Linux")

set(CONAN_DEPENDENCIES poco pcre2 expat sqlite3 libpq libmysqlclient zlib bzip2 openssl zstd lz4)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c/include"
			"/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11/include"
			"/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f/include"
			"/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8/include"
			"/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include"
			"/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/include"
			"/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include"
			"/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/include"
			"/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include"
			"/home/rachit/.conan/data/zstd/1.5.2/_/_/package/1e8f95ed1a9a9ef594f731500716088f6eb8bee6/include"
			"/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c/lib"
			"/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11/lib"
			"/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f/lib"
			"/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8/lib"
			"/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib"
			"/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/lib"
			"/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib"
			"/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib"
			"/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib"
			"/home/rachit/.conan/data/zstd/1.5.2/_/_/package/1e8f95ed1a9a9ef594f731500716088f6eb8bee6/lib"
			"/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/home/rachit/.conan/data/pcre2/10.40/_/_/package/1dfef2d0e403379e1d4f34660b435fba4caeec11/bin"
			"/home/rachit/.conan/data/sqlite3/3.39.2/_/_/package/8fc930bdbf940331d9f322f454eac3dd06fd27e8/bin"
			"/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/bin"
			"/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/bin"
			"/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/bin"
			"/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS  ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS PocoDataMySQL PocoDataPostgreSQL PocoDataSQLite PocoEncodings PocoJWT PocoMongoDB PocoNetSSL PocoCrypto PocoRedis PocoNet PocoZip PocoUtil PocoJSON PocoXML PocoActiveRecord PocoData PocoFoundation pcre2-posix pcre2-8 pcre2-16 pcre2-32 expat sqlite3 pq pgcommon pgcommon_shlib pgport pgport_shlib mysqlclient z bz2 ssl crypto zstd lz4 ${CONAN_LIBS})
set(CONAN_PKG_LIBS PocoDataMySQL PocoDataPostgreSQL PocoDataSQLite PocoEncodings PocoJWT PocoMongoDB PocoNetSSL PocoCrypto PocoRedis PocoNet PocoZip PocoUtil PocoJSON PocoXML PocoActiveRecord PocoData PocoFoundation pcre2-posix pcre2-8 pcre2-16 pcre2-32 expat sqlite3 pq pgcommon pgcommon_shlib pgport pgport_shlib mysqlclient z bz2 ssl crypto zstd lz4 ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS stdc++ m resolv dl rt pthread ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DXML_STATIC"
			"-DPCRE2_STATIC"
			"-DPOCO_STATIC=ON"
			"-DPOCO_UNBUNDLED" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/home/rachit/.conan/data/poco/1.12.2/_/_/package/1e6fb57c93b6b3c8a3147d7c537eb19271c4f94c/"
			"/home/rachit/.conan/data/expat/2.4.8/_/_/package/2bf99ee01cda593d5986afc64acf262ad576354f/"
			"/home/rachit/.conan/data/libpq/14.2/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/"
			"/home/rachit/.conan/data/libmysqlclient/8.0.29/_/_/package/10848b249ccabb0a421bfcefc95f4304292a608a/"
			"/home/rachit/.conan/data/zlib/1.2.12/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/"
			"/home/rachit/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/"
			"/home/rachit/.conan/data/openssl/1.1.1q/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/"
			"/home/rachit/.conan/data/lz4/1.9.3/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_POCO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_POCO} ${CONAN_FRAMEWORKS_FOUND_POCO} CONAN_PKG::pcre2 CONAN_PKG::zlib CONAN_PKG::expat CONAN_PKG::sqlite3 CONAN_PKG::openssl CONAN_PKG::libpq CONAN_PKG::libmysqlclient")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POCO_DEPENDENCIES "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POCO}" "${CONAN_LIB_DIRS_POCO}"
                                  CONAN_PACKAGE_TARGETS_POCO "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES}"
                                  "" poco)
    set(_CONAN_PKG_LIBS_POCO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_POCO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_POCO_DEBUG} CONAN_PKG::pcre2 CONAN_PKG::zlib CONAN_PKG::expat CONAN_PKG::sqlite3 CONAN_PKG::openssl CONAN_PKG::libpq CONAN_PKG::libmysqlclient")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POCO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POCO_DEBUG}" "${CONAN_LIB_DIRS_POCO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_POCO_DEBUG "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_DEBUG}"
                                  "debug" poco)
    set(_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_POCO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_POCO_RELEASE} CONAN_PKG::pcre2 CONAN_PKG::zlib CONAN_PKG::expat CONAN_PKG::sqlite3 CONAN_PKG::openssl CONAN_PKG::libpq CONAN_PKG::libmysqlclient")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POCO_RELEASE}" "${CONAN_LIB_DIRS_POCO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_POCO_RELEASE "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELEASE}"
                                  "release" poco)
    set(_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_POCO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_POCO_RELWITHDEBINFO} CONAN_PKG::pcre2 CONAN_PKG::zlib CONAN_PKG::expat CONAN_PKG::sqlite3 CONAN_PKG::openssl CONAN_PKG::libpq CONAN_PKG::libmysqlclient")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POCO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_POCO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_POCO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" poco)
    set(_CONAN_PKG_LIBS_POCO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_POCO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_POCO_MINSIZEREL} CONAN_PKG::pcre2 CONAN_PKG::zlib CONAN_PKG::expat CONAN_PKG::sqlite3 CONAN_PKG::openssl CONAN_PKG::libpq CONAN_PKG::libmysqlclient")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POCO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POCO_MINSIZEREL}" "${CONAN_LIB_DIRS_POCO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_POCO_MINSIZEREL "${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" poco)

    add_library(CONAN_PKG::poco INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::poco PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_POCO} ${_CONAN_PKG_LIBS_POCO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POCO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_POCO_RELEASE} ${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POCO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_POCO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POCO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_POCO_MINSIZEREL} ${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POCO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_POCO_DEBUG} ${_CONAN_PKG_LIBS_POCO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POCO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POCO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::poco PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_POCO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_POCO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_POCO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_POCO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_POCO_DEBUG}>)
    set_property(TARGET CONAN_PKG::poco PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_POCO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_POCO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_POCO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_POCO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_POCO_DEBUG}>)
    set_property(TARGET CONAN_PKG::poco PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_POCO_LIST} ${CONAN_CXX_FLAGS_POCO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_POCO_RELEASE_LIST} ${CONAN_CXX_FLAGS_POCO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_POCO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_POCO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_POCO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_POCO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_POCO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_POCO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PCRE2} ${CONAN_FRAMEWORKS_FOUND_PCRE2} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2}" "${CONAN_LIB_DIRS_PCRE2}"
                                  CONAN_PACKAGE_TARGETS_PCRE2 "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}"
                                  "" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PCRE2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PCRE2_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_DEBUG}" "${CONAN_LIB_DIRS_PCRE2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_DEBUG "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}"
                                  "debug" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PCRE2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELEASE}" "${CONAN_LIB_DIRS_PCRE2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELEASE "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}"
                                  "release" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PCRE2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PCRE2_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PCRE2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pcre2)
    set(_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PCRE2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PCRE2_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PCRE2_MINSIZEREL}" "${CONAN_LIB_DIRS_PCRE2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL "${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pcre2)

    add_library(CONAN_PKG::pcre2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PCRE2} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PCRE2_RELEASE} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PCRE2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PCRE2_MINSIZEREL} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PCRE2_DEBUG} ${_CONAN_PKG_LIBS_PCRE2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PCRE2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PCRE2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PCRE2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PCRE2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PCRE2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PCRE2_DEBUG}>)
    set_property(TARGET CONAN_PKG::pcre2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PCRE2_LIST} ${CONAN_CXX_FLAGS_PCRE2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PCRE2_RELEASE_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PCRE2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PCRE2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PCRE2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PCRE2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PCRE2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PCRE2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_EXPAT} ${CONAN_FRAMEWORKS_FOUND_EXPAT} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT}" "${CONAN_LIB_DIRS_EXPAT}"
                                  CONAN_PACKAGE_TARGETS_EXPAT "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}"
                                  "" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_EXPAT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_EXPAT_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_DEBUG}" "${CONAN_LIB_DIRS_EXPAT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_DEBUG "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}"
                                  "debug" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_EXPAT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_EXPAT_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_RELEASE}" "${CONAN_LIB_DIRS_EXPAT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_RELEASE "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}"
                                  "release" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_EXPAT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_EXPAT_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_EXPAT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" expat)
    set(_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_EXPAT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_EXPAT_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPAT_MINSIZEREL}" "${CONAN_LIB_DIRS_EXPAT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_EXPAT_MINSIZEREL "${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" expat)

    add_library(CONAN_PKG::expat INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_EXPAT} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_EXPAT_RELEASE} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_EXPAT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_EXPAT_MINSIZEREL} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_EXPAT_DEBUG} ${_CONAN_PKG_LIBS_EXPAT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPAT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPAT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_EXPAT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_EXPAT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_EXPAT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_EXPAT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_EXPAT_DEBUG}>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_EXPAT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_EXPAT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_EXPAT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_EXPAT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_EXPAT_DEBUG}>)
    set_property(TARGET CONAN_PKG::expat PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_EXPAT_LIST} ${CONAN_CXX_FLAGS_EXPAT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_EXPAT_RELEASE_LIST} ${CONAN_CXX_FLAGS_EXPAT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_EXPAT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_EXPAT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_EXPAT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_EXPAT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_EXPAT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_EXPAT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SQLITE3} ${CONAN_FRAMEWORKS_FOUND_SQLITE3} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3}" "${CONAN_LIB_DIRS_SQLITE3}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3 "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}"
                                  "" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SQLITE3_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_DEBUG}" "${CONAN_LIB_DIRS_SQLITE3_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}"
                                  "debug" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SQLITE3_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELEASE}" "${CONAN_LIB_DIRS_SQLITE3_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}"
                                  "release" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SQLITE3_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SQLITE3_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" sqlite3)
    set(_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SQLITE3_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SQLITE3_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SQLITE3_MINSIZEREL}" "${CONAN_LIB_DIRS_SQLITE3_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL "${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" sqlite3)

    add_library(CONAN_PKG::sqlite3 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SQLITE3} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELEASE} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SQLITE3_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SQLITE3_MINSIZEREL} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SQLITE3_DEBUG} ${_CONAN_PKG_LIBS_SQLITE3_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SQLITE3_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SQLITE3}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SQLITE3_DEBUG}>)
    set_property(TARGET CONAN_PKG::sqlite3 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SQLITE3_LIST} ${CONAN_CXX_FLAGS_SQLITE3_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SQLITE3_RELEASE_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SQLITE3_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SQLITE3_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SQLITE3_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SQLITE3_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SQLITE3_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SQLITE3_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBPQ} ${CONAN_FRAMEWORKS_FOUND_LIBPQ} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ}" "${CONAN_LIB_DIRS_LIBPQ}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}"
                                  "" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBPQ_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_DEBUG}" "${CONAN_LIB_DIRS_LIBPQ_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}"
                                  "debug" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBPQ_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELEASE}" "${CONAN_LIB_DIRS_LIBPQ_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}"
                                  "release" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBPQ_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBPQ_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libpq)
    set(_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBPQ_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBPQ_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBPQ_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBPQ_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL "${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libpq)

    add_library(CONAN_PKG::libpq INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBPQ} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELEASE} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBPQ_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBPQ_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBPQ_DEBUG} ${_CONAN_PKG_LIBS_LIBPQ_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBPQ_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBPQ}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBPQ_DEBUG}>)
    set_property(TARGET CONAN_PKG::libpq PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBPQ_LIST} ${CONAN_CXX_FLAGS_LIBPQ_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBPQ_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBPQ_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBPQ_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBPQ_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBPQ_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBPQ_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBPQ_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT} CONAN_PKG::openssl CONAN_PKG::zlib CONAN_PKG::zstd CONAN_PKG::lz4")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES}"
                                  "" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_DEBUG} CONAN_PKG::openssl CONAN_PKG::zlib CONAN_PKG::zstd CONAN_PKG::lz4")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEBUG}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_DEBUG "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG}"
                                  "debug" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_RELEASE} CONAN_PKG::openssl CONAN_PKG::zlib CONAN_PKG::zstd CONAN_PKG::lz4")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_RELEASE}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELEASE "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE}"
                                  "release" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_RELWITHDEBINFO} CONAN_PKG::openssl CONAN_PKG::zlib CONAN_PKG::zstd CONAN_PKG::lz4")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" libmysqlclient)
    set(_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LIBMYSQLCLIENT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LIBMYSQLCLIENT_MINSIZEREL} CONAN_PKG::openssl CONAN_PKG::zlib CONAN_PKG::zstd CONAN_PKG::lz4")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LIBMYSQLCLIENT_MINSIZEREL}" "${CONAN_LIB_DIRS_LIBMYSQLCLIENT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_MINSIZEREL "${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" libmysqlclient)

    add_library(CONAN_PKG::libmysqlclient INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELEASE} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_MINSIZEREL} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LIBMYSQLCLIENT_DEBUG} ${_CONAN_PKG_LIBS_LIBMYSQLCLIENT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LIBMYSQLCLIENT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LIBMYSQLCLIENT_DEBUG}>)
    set_property(TARGET CONAN_PKG::libmysqlclient PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LIBMYSQLCLIENT_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LIBMYSQLCLIENT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENSSL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL}" "${CONAN_LIB_DIRS_OPENSSL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}"
                                  "" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENSSL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_DEBUG}" "${CONAN_LIB_DIRS_OPENSSL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}"
                                  "debug" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENSSL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELEASE}" "${CONAN_LIB_DIRS_OPENSSL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}"
                                  "release" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENSSL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENSSL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" openssl)
    set(_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENSSL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENSSL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENSSL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENSSL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" openssl)

    add_library(CONAN_PKG::openssl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENSSL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELEASE} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENSSL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENSSL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENSSL_DEBUG} ${_CONAN_PKG_LIBS_OPENSSL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENSSL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENSSL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENSSL_DEBUG}>)
    set_property(TARGET CONAN_PKG::openssl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENSSL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENSSL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENSSL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENSSL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENSSL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENSSL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENSSL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENSSL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZSTD} ${CONAN_FRAMEWORKS_FOUND_ZSTD} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD}" "${CONAN_LIB_DIRS_ZSTD}"
                                  CONAN_PACKAGE_TARGETS_ZSTD "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}"
                                  "" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZSTD_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZSTD_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_DEBUG}" "${CONAN_LIB_DIRS_ZSTD_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_DEBUG "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}"
                                  "debug" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZSTD_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELEASE}" "${CONAN_LIB_DIRS_ZSTD_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELEASE "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}"
                                  "release" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZSTD_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZSTD_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZSTD_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zstd)
    set(_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZSTD_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZSTD_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZSTD_MINSIZEREL}" "${CONAN_LIB_DIRS_ZSTD_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL "${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zstd)

    add_library(CONAN_PKG::zstd INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZSTD} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZSTD_RELEASE} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZSTD_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZSTD_MINSIZEREL} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZSTD_DEBUG} ${_CONAN_PKG_LIBS_ZSTD_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZSTD_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZSTD_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZSTD}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZSTD_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZSTD_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZSTD_DEBUG}>)
    set_property(TARGET CONAN_PKG::zstd PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZSTD_LIST} ${CONAN_CXX_FLAGS_ZSTD_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZSTD_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZSTD_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZSTD_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZSTD_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZSTD_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZSTD_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZSTD_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_LZ4_DEPENDENCIES "${CONAN_SYSTEM_LIBS_LZ4} ${CONAN_FRAMEWORKS_FOUND_LZ4} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LZ4_DEPENDENCIES "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LZ4}" "${CONAN_LIB_DIRS_LZ4}"
                                  CONAN_PACKAGE_TARGETS_LZ4 "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES}"
                                  "" lz4)
    set(_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_LZ4_DEBUG} ${CONAN_FRAMEWORKS_FOUND_LZ4_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LZ4_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LZ4_DEBUG}" "${CONAN_LIB_DIRS_LZ4_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_LZ4_DEBUG "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_DEBUG}"
                                  "debug" lz4)
    set(_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_LZ4_RELEASE} ${CONAN_FRAMEWORKS_FOUND_LZ4_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LZ4_RELEASE}" "${CONAN_LIB_DIRS_LZ4_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_LZ4_RELEASE "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELEASE}"
                                  "release" lz4)
    set(_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_LZ4_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_LZ4_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LZ4_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_LZ4_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_LZ4_RELWITHDEBINFO "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" lz4)
    set(_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_LZ4_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_LZ4_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_LZ4_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_LZ4_MINSIZEREL}" "${CONAN_LIB_DIRS_LZ4_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_LZ4_MINSIZEREL "${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" lz4)

    add_library(CONAN_PKG::lz4 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::lz4 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_LZ4} ${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LZ4_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_LZ4_RELEASE} ${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LZ4_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_LZ4_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LZ4_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_LZ4_MINSIZEREL} ${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LZ4_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_LZ4_DEBUG} ${_CONAN_PKG_LIBS_LZ4_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_LZ4_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_LZ4_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::lz4 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_LZ4}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_LZ4_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_LZ4_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_LZ4_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_LZ4_DEBUG}>)
    set_property(TARGET CONAN_PKG::lz4 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_LZ4}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_LZ4_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_LZ4_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_LZ4_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_LZ4_DEBUG}>)
    set_property(TARGET CONAN_PKG::lz4 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_LZ4_LIST} ${CONAN_CXX_FLAGS_LZ4_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_LZ4_RELEASE_LIST} ${CONAN_CXX_FLAGS_LZ4_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_LZ4_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_LZ4_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_LZ4_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_LZ4_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_LZ4_DEBUG_LIST}  ${CONAN_CXX_FLAGS_LZ4_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::poco CONAN_PKG::pcre2 CONAN_PKG::expat CONAN_PKG::sqlite3 CONAN_PKG::libpq CONAN_PKG::libmysqlclient CONAN_PKG::zlib CONAN_PKG::bzip2 CONAN_PKG::openssl CONAN_PKG::zstd CONAN_PKG::lz4)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAMES ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT((MSVC_VERSION EQUAL 1930) OR (MSVC_VERSION GREATER 1930))) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(${CONAN_COMPILER_MAJOR} VERSION_GREATER_EQUAL "13" AND "${CONAN_COMPILER_MINOR}" STREQUAL "" AND ${CONAN_COMPILER_MAJOR} VERSION_EQUAL ${VERSION_MAJOR})
           # This is correct,  13.X is considered 13
        elseif(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

