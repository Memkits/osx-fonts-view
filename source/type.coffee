
exports.guessStyle = (name) ->
  style = {}

  if name[0] is '.'
    name = name[1..]

  if name.match /Bold/i
    style.fontWeight = 'bold'
    name = name.replace /Bold/i, ''

  if name.match /Light/i
    style.fontWeight = 'lighter'
    name = name.replace /Light/i, ''

  if name.match /Italic/i
    style.fontStyle = 'italic'
    name = name.replace /Italic/i, ''

  if name.replace /Regular/i, ''
    name = name.replace /Regular/i, ''

  name = name.trim()

  style.fontFamily = name

  style