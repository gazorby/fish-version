function fish_version_test
    if test (count $argv) = 2
        if test -n "$version"
            set operand_a "$version"
        else
            set operand_a "$FISH_VERSION"
        end
        set op "$argv[1]"
        set operand_b "$argv[2]"
    else if test (count $argv) = 3
        set operand_a "$argv[1]"
        set op "$argv[2]"
        set operand_b "$argv[3]"
    else
        echo "fish_version_test can be called in two forms:"
        echo "fish_version_test -op version"
        echo "fish_version_test version_a -op version_b"
        exit 1
    end

    set -l arg_1 (string replace --regex --all '[^\d]' '' -- "$operand_a")
    set -l arg_2 (string replace --regex --all '[^\d]' '' -- "$operand_b")


    set -l v_diff (math (string length -- $arg_1) - (string length -- $arg_2))

    # Ensure both versions are the same length
    if test $v_diff -gt 0
        set arg_2 (string join '' -- "$arg_2" (string repeat -N -n $v_diff '0'))
    else if test $v_diff -lt 0
        set v_diff (math abs $v_diff)
        set arg_1 (string join '' -- "$arg_1" (string repeat -N -n $v_diff '0'))
    end

    set -l cmd (string collect -- "test " "$arg_1" " $op " "$arg_2")
    eval $cmd
end
