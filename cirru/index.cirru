
doctype
html
  head
    title $ = OSX fonts
    script
      :defer
      :src build/build.js
    link
      :rel stylesheet
      :type text/css
      :href css/style.css
  body
    @partial view.cirru