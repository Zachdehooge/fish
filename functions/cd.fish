function cd
    # No args? Go home.
    if test (count $argv) -eq 0
        builtin cd
        return
    end

    # If it's a valid directory path, use normal cd
    if test -d $argv[1]
        builtin cd $argv
        return
    end

    # If __zoxide_z is a function, use it
    if functions -q __zoxide_z
        __zoxide_z $argv
    # Or fallback to z if defined
    else if functions -q z
        z $argv
    else
        echo "zoxide not available"
    end
end
