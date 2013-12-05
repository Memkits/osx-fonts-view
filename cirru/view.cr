
input
  :value {{text}}

#list:num
  div.item
    :on-tap expand
    :style "{{compute(list[num])}}"
    :class "{{at(num, pointer)}}"
    div.text
      = {{text}}
    div.name
      = {{list[num]}}