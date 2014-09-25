
Router.configure
  layoutTemplate: 'layout'
  yieldTemplates:
    navigation: {to: 'navigation'}
    statusbar: {to: 'statusbar'}
  onBeforeAction: ->
    vosco.refresh()
    setContentHeight()

Router.map ->
  @route 'dashboard', {path: '/'}
  @route 'status', {path: '/status'}
  @route 'history', {path: '/history'}
  @route 'branches', {path: '/branches'}
  @route 'settings', {path: '/settings'}
  @route 'settings_install', {path: '/settings/install'}
