Meteor.publishComposite 'categories',
  find: ->
    Category.find()

  children: [
    {
      find: (category) ->
        Image.find {_id: category.image}, {limit: 1}
    }
  ]