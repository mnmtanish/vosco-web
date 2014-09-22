Template.snapshot_create.events
  'click [x-create]': (e) ->
    e.preventDefault()
    $input = $('[x-msg]')
    message = $input.val()
    vosco.createSnapshot message, ->
      $input.val ''
      Router.go '/history'
