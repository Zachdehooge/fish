function cmbuild
    set -l mode debug
    if set -q argv[1]
        set mode $argv[1]
    end
    cmake -B "build-$mode" -DBUILD_MODE=$mode; and cmake --build "build-$mode"
end
