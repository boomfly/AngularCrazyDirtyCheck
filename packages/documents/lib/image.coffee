Image = new FS.Collection 'images',
  stores: [new FS.Store.FileSystem("images")]

Image.allow
  insert: (userId, fileObj) -> true
  update: (userId, fileObj) -> true
  download: (userId, fileObj) -> true