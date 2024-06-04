#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/jainam/eigenform_ws/src/drone_package"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/jainam/eigenform_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/jainam/eigenform_ws/install/lib/python3/dist-packages:/home/jainam/eigenform_ws/build/drone_package/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/jainam/eigenform_ws/build/drone_package" \
    "/usr/bin/python3" \
    "/home/jainam/eigenform_ws/src/drone_package/setup.py" \
    egg_info --egg-base /home/jainam/eigenform_ws/build/drone_package \
    build --build-base "/home/jainam/eigenform_ws/build/drone_package" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/jainam/eigenform_ws/install" --install-scripts="/home/jainam/eigenform_ws/install/bin"
