Template.settings.events
  'click [x-uninstall]':(e) ->
    vosco.uninstall ->
      vosco.refresh ->
        Router.go '/'

