# Late props which must be set after boot_completed
{
    until [[ "$(getprop sys.boot_completed)" == "1" ]]; do
        sleep 1
    done

    settings put global restricted networking mode 0
}&
