Template.branches.events
  'click [x-select]': (e) ->
    vosco.selectBranch @.toString(), vosco.refresh

  'click [x-delete]': (e) ->
    vosco.deleteBranch @.toString(), vosco.refresh

Template.branches.branches = ->
  Session.get 'repo-branches'

Template.branches.isCurrent = ->
  current = Session.get 'repo-current-branch'
  @.toString() is Session.get 'repo-current-branch'
