file(GLOB_RECURSE SILVERBLUE_BASE_FILES ${SILVERBLUE_SOURCE}/*.c)

add_executable(fentoskrnl ${SILVERBLUE_BASE_FILES})
target_include_directories(fentoskrnl PRIVATE ${SILVERBLUE_SOURCE} ${SILVERBLUE_SOURCE}/include)
target_compile_options(fentoskrnl PRIVATE -ffreestanding -Wall -Wextra -nostdlib -fno-builtin)
target_link_options(fentoskrnl PRIVATE -nostdlib -static -z max-page-size=4096 -Wa,--noexecstack -Wl,--build-id=none -T ${SILVERBLUE_SOURCE}/base/base.ld)