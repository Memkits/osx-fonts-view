
#app
  .item
    :v-repeat list
    :v-on "click: (at = $index)"
    :v-class "at: (at == $index)"
    :style "{{styleOf($value)}}"
    .text
      :v-model text
    .name
      :v-model "$value"
  input
    :v-model text