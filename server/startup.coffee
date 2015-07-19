Meteor.startup ->
  if Meteor.users.find().count() is 0
    Accounts.createUser
      username: 'admin'
      password: '1'
      profile:
        firstName: 'John'
        lastName: 'Smith'
    Roles.addUsersToRoles id, ['admin']
