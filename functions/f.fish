function f
    set -l f (sk)
    if test -z "$f"
        return 1
    end
    if test -d "$f"
        cd "$f"
    else
        cd (dirname "$f")
    end
end
