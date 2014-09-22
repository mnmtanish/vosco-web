@vosco = {}

# Extra
# -----

vosco.refresh = (callback) ->
  vosco.isInstalled ->
    vosco.getStatus ->
      vosco.getHistory ->
        callback && callback()

# Setup
# -----

vosco.install = (callback) ->
  if Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'install', (err, res) ->
    callback && callback res

vosco.uninstall = (callback) ->
  unless Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'uninstall', (err, res) ->
    callback && callback res

vosco.isInstalled = (callback) ->
  Meteor.call 'vosco', 'isInstalled', (err, res) ->
    Session.set 'is-installed', res[1]
    callback && callback res

# Repository

vosco.getStatus = (callback) ->
  unless Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'getStatus', (err, res) ->
    Session.set 'repo-status', res[1]
    callback && callback res

vosco.getHistory = (callback) ->
  unless Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'getHistory', (err, res) ->
    Session.set 'repo-history', res[1]
    callback && callback res

vosco.getContentHistory = (paths, callback) ->

# Snapshot

vosco.previewSnapshot = (hash, callback) ->
  unless Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'previewSnapshot', [hash], (err, res) ->
    callback && callback res

vosco.createSnapshot = (message, callback) ->
  unless Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'createSnapshot', [message], (err, res) ->
    callback && callback res

vosco.rollbackToSnapshot = (hash, callback) ->
  unless Session.get 'is-installed' then callback && callback null
  Meteor.call 'vosco', 'rollbackToSnapshot', [hash], (err, res) ->
    callback && callback res

# Branch

vosco.getBranches = (callback) ->

vosco.createBranch = (branch, callback) ->

vosco.selectBranch = (branch, callback) ->

vosco.deleteBranch = (branch, callback) ->
