doctype

html
  head
    title Todolist
    meta (:charset utf-8)
    link (:rel stylesheet) (:href css/style.css)
    link (:rel icon) (:href image/x-icon) (:href img/favicon.ico)
    @if (@ inDev)
      script (:src bower_components/react/react.js)
    @if (@ inBuild)
      script (:src http://cdn.staticfile.org/react/0.10.0/react.min.js)
    script (:defer) (:src build/main.js)

  body