Package.describe({
    name: 'documents',
    version: '0.0.1',
    // Brief, one-line summary of the package.
    summary: '',
    // URL to the Git repository containing the source code for this package.
    git: 'https://boomfly@bitbucket.org/boomfly/imanager-documents-package.git',
    // By default, Meteor will default to using README.md for documentation.
    // To avoid submitting documentation, set this field to null.
    documentation: 'README.md'
});

Package.onUse(function (api) {
    api.versionsFrom('1.1.0.2');
    api.use([
        'coffeescript',
        'underscore',
        'mongo',
        'cfs:standard-packages'
    ], ['client', 'server']);

    api.export([
        'Schema',

        'Users',
        'UserDevices',

        'Category',
        'Product',
        'Image'
    ], ['client', 'server']);

    api.addFiles([
        'lib/common.coffee',
        'lib/user.coffee',
        'lib/user-device.coffee',

        'lib/category.coffee',
        'lib/product.coffee',
        'lib/image.coffee'
    ], ['client', 'server']);
});

Package.onTest(function (api) {
    api.use('tinytest');
    api.use('documents');
});
