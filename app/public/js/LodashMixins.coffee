_ = if module?.exports? then require('lodash') else window._

_.mixin

  # Code from:
  # [stackoverflow](http://stackoverflow.com/questions/105034/how-to-create-a-guid-uuid-in-javascript),
  uuid : ->
    now = Date.now()
    'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace /[xy]/g, (c) ->
      r   = (now + Math.random() * 16) % 16 | 0
      now = Math.floor now / 16
      ((if c is "x" then r else (r & 0x7 | 0x8))).toString 16