Template.history.events
  'click [x-preview]': (e) ->
    e.preventDefault()
    vosco.previewSnapshot @hash, (res) ->
      content = res[1]
      $('[x-preview-content]').html content
      $('[x-preview-modal]').modal 'show'

  'click [x-rollback]': (e) ->
    e.preventDefault()
    vosco.rollbackToSnapshot @hash, vosco.refresh

Template.history.has_status = ->
  if Session.get 'is-installed'
    status = Session.get 'repo-status'
    status && !!status.length

Template.history.history = ->
  if Session.get 'is-installed'
    history = Session.get 'repo-history'
    history = _.map history, _formatCommit

_formatCommit = (commit) ->
  commit.short_hash = commit.hash.substr 0, 7
  commit.date_string = new Date(commit.date).toDateString()
  return commit
