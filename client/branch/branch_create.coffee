Template.branch_create.events
  'click [x-create]': (e) ->
    e.preventDefault()
    $input = $('[x-name]')
    name = $input.val()
    vosco.createBranch name, ->
      $input.val ''
      vosco.refresh()
