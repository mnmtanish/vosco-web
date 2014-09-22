
Session.set 'is-installed', null

UI.registerHelper 'isInstalled', ->
  Session.get 'is-installed'

UI.registerHelper 'checkInstalled', ->
  unless Session.get 'is-installed'
    Router.go '/settings/install'

UI.registerHelper 'checkFirstTime', ->
  if Session.get 'is-installed'
    Router.go '/'

@setContentHeight = ->
  chromeHeight = 78 + 41 + 40
  $pageContents = $ '#page-content'
  $pageContents.height window.innerHeight - chromeHeight
  window.onresize = -> $pageContents.height window.innerHeight - chromeHeight
