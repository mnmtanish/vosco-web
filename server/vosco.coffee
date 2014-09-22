Future = Npm.require('fibers/future')
VOSCO  = Meteor.npmRequire('vosco')

repo_path = '/tmp/test_repo/'
repo_opts =
  author_name : 'Test User'
  author_email: 'user@localhost'

vosco = new VOSCO repo_path, repo_opts

Meteor.methods
  vosco: (fnName, args) ->
    f = new Future
    args = args or []
    args.push () -> f.return _.toArray(arguments)
    vosco[fnName].apply vosco, args
    return f.wait()
