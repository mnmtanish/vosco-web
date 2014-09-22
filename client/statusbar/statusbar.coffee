Template.statusbar.has_status = ->
  if Session.get 'is-installed'
    status = Session.get 'repo-status'
    status && !!status.length

Template.statusbar.status = ->
  if Session.get 'is-installed'
    status = Session.get 'repo-status'
    status = _.groupBy status, (file) -> file.type
    for type, files of status
      {type: type, count: files.length}

Template.statusbar.message_icon = (type) ->
  _statusIcons[type]

_statusIcons =
  modified : 'black text file'
  untracked: 'green file'
