set(PS3EYE_ROOT "${CMAKE_CURRENT_LIST_DIR}")
set(LIBUSB_ROOT "${CMAKE_CURRENT_LIST_DIR}/../libusb")

add_library(ps3eye::libusb STATIC IMPORTED
    "${LIBUSB_ROOT}/include/libusb.h")
set_target_properties(ps3eye::libusb PROPERTIES
    IMPORTED_LOCATION_DEBUG "${LIBUSB_ROOT}/lib/Debug/libusb-1.0.lib"
    IMPORTED_LOCATION_RELEASE "${LIBUSB_ROOT}/lib/Release/libusb-1.0.lib")
target_include_directories(ps3eye::libusb SYSTEM INTERFACE
    "${LIBUSB_ROOT}/include")

add_library(ps3eye OBJECT
    "${PS3EYE_ROOT}/src/ps3eye.cpp"
    "${PS3EYE_ROOT}/include/ps3eye.h"

    "${PS3EYE_ROOT}/src/PSEyeVideoCapture.cpp"
    "${PS3EYE_ROOT}/include/PSEyeVideoCapture.h")
target_include_directories(ps3eye SYSTEM PUBLIC
    "${PS3EYE_ROOT}/include")
target_link_libraries(ps3eye PUBLIC ps3eye::libusb)
target_link_libraries(ps3eye PUBLIC ${OpenCV_LIBS})

add_library(ps3eye::ps3eye ALIAS ps3eye)
