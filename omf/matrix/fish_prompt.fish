# Harleen's layout in the Matrix palette.

function fish_prompt
  test $status -ne 0;
    and set -l last_status_colors 0b6b26 159a38 ff3b3b
    or set -l last_status_colors 0b6b26 159a38 00ff41

  set -l color_bracket (set_color -o 159a38)
  set -l color_path    (set_color -o 7dffa0)
  set -l color_branch  (set_color -o e0ffe8)
  set -l color_dirty   (set_color -o ffb000)
  set -l color_stash   (set_color -o 4dff88)
  set -l color_ahead   (set_color -o 00ff41)
  set -l color_off     (set_color normal)

  if git_is_repo
    set -l root_folder (command git rev-parse --show-toplevel 2>/dev/null)
    set -l parent_root_folder (dirname $root_folder)
    set -l cwd (string replace "$parent_root_folder/" "" $PWD)
    echo -n -s $color_bracket "(" $color_path $cwd $color_bracket ")" $color_off " "

    git_is_stashed; and echo -n -s $color_stash "^" $color_off

    echo -n -s $color_bracket "(" $color_off
    if git_is_touched
      echo -n -s $color_dirty "*" $color_off " "
    else
      echo -n " "
    end
    echo -n -s $color_branch (git_branch_name) $color_off " "
    echo -n -s $color_ahead (git_ahead "↑" "↓" "⥄ " "") $color_off
    echo -n -s $color_bracket ")" $color_off " "
  else
    echo -n -s $color_bracket "(" $color_path (basename (prompt_pwd)) $color_bracket ")" $color_off " "
  end

  for color in $last_status_colors
    echo -n (set_color -o $color)">"
  end
  echo -n -s " " $color_off
end
