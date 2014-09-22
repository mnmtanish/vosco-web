Template.settings_install.events
  'click [x-install]':(e) ->
    vosco.install ->
      vosco.refresh ->
        Router.go '/'
