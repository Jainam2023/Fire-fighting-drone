execute_process(COMMAND "/home/jainam/eigenform_ws/build/drone_package/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/jainam/eigenform_ws/build/drone_package/catkin_generated/python_distutils_install.sh) returned error code ")
endif()