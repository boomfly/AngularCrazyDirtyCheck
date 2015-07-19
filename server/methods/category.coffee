Meteor.methods
  'create-category': (options) ->
    category = _.extend {}, _.pick(options, 'title', 'description', 'image', 'published')
    category = _.extend category,
      createdAt: new Date()
      updatedAt: new Date()

    _id = Category.insert category

    _id

  'update-category': (id, options) ->
    category = _.extend {}, _.pick(options, 'title', 'description', 'image', 'published')
    category = _.extend category,
      updatedAt: new Date()

    _id = Category.update {_id: id}, $set: category

    _id

  'remove-category': (id) ->
    category = Category.findOne id

    throw new Meteor.Error 404, 'Нет такой категории!' unless category

    Image.remove _id: category.image if category.image

    Category.remove _id: category._id