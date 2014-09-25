@vosco = {}

# Extra
# -----

vosco.refresh = (callback) ->
  runCallback = _.after 4, ->
    if typeof callback is 'function' then callback null
  vosco.isInstalled runCallback
  vosco.getStatus runCallback
  vosco.getHistory runCallback
  vosco.getBranches runCallback

vosco.refresh = _.throttle vosco.refresh, 1000


# Setup
# -----

vosco.install = (callback) ->
  if Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'install', (err, res) ->
      if typeof callback is 'function' then callback res

vosco.uninstall = (callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'uninstall', (err, res) ->
      if typeof callback is 'function' then callback res

vosco.isInstalled = (callback) ->
  Meteor.call 'vosco', 'isInstalled', (err, res) ->
    Session.set 'is-installed', res[1]
    if typeof callback is 'function' then callback res

# Repository

vosco.getStatus = (callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'getStatus', (err, res) ->
      Session.set 'repo-status', res[1]
      if typeof callback is 'function' then callback res

vosco.getHistory = (callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'getHistory', (err, res) ->
      Session.set 'repo-history', res[1]
      if typeof callback is 'function' then callback res

vosco.getContentHistory = (paths, callback) ->

# Snapshot

vosco.previewSnapshot = (hash, callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'previewSnapshot', [hash], (err, res) ->
      if typeof callback is 'function' then callback res

vosco.createSnapshot = (message, callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'createSnapshot', [message], (err, res) ->
      if typeof callback is 'function' then callback res

vosco.rollbackToSnapshot = (hash, callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'rollbackToSnapshot', [hash], (err, res) ->
      if typeof callback is 'function' then callback res

# Branch

vosco.getBranches = (callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'getBranches', (err, res) ->
      Session.set 'repo-branches', res[1]
      Session.set 'repo-current-branch', res[2]
      if typeof callback is 'function' then callback res

vosco.createBranch = (branch, callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'createBranch', [branch], (err, res) ->
      if typeof callback is 'function' then callback res

vosco.selectBranch = (branch, callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'selectBranch', [branch], (err, res) ->
      if typeof callback is 'function' then callback res

vosco.deleteBranch = (branch, callback) ->
  unless Session.get 'is-installed'
    if typeof callback is 'function' then callback null
  else
    Meteor.call 'vosco', 'deleteBranch', [branch], (err, res) ->
      if typeof callback is 'function' then callback res
