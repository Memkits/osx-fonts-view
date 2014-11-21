doctype

html
  head
    title "OS X Fonts"
    meta (:charset utf-8)
    link (:rel icon) (:href image/x-icon) (:href img/favicon.ico)
    script(:src build/vendor.min.js)
    @if (@ dev)
      @block
        link (:rel stylesheet) (:href source/main.css)
        script (:defer) (:src build/main.js)
      @block
        link (:rel stylesheet) (:href build/main.min.css)
        script (:defer) (:src build/main.min.js)
  body