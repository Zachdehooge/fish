function fish_right_prompt
  set -l color_time  (set_color 0b6b26)
  set -l color_colon (set_color 159a38)
  echo -n -s $color_time (date +%H$color_colon:$color_time%M$color_colon:$color_time%S) (set_color normal)
end
