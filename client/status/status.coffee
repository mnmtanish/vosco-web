Template.status.has_status = ->
  if Session.get 'is-installed'
    status = Session.get 'repo-status'
    status && !!status.length

Template.status.status = ->
  if Session.get 'is-installed'
    status = Session.get 'repo-status'
    status = _.groupBy status, (file) -> file.type
    for type, files of status
      {type: type, files: files}
