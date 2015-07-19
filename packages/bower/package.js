Package.describe({
    name: 'bower',
    version: '0.0.1',
    // Brief, one-line summary of the package.
    summary: '',
    // URL to the Git repository containing the source code for this package.
    git: '',
    // By default, Meteor will default to using README.md for documentation.
    // To avoid submitting documentation, set this field to null.
    documentation: 'README.md'
});
/*
Cordova.depends({
    "com.phonegap.plugins.pushplugin": "2.2.1",
    "org.apache.cordova.camera": "0.3.0",
    "org.apache.cordova.file": "1.3.2",
    "org.apache.cordova.file-transfer": "0.4.8",
    "org.apache.cordova.geolocation": "0.3.11",
    "org.apache.cordova.media": "0.2.15",
    "org.transistorsoft.cordova.background-geolocation": "0.2.0"
});
*/
Package.onUse(function (api) {
    api.versionsFrom('1.0.3.1');

    api.addFiles([
        '../../.meteor/local/bower/fontawesome/css/font-awesome.css',
        '../../.meteor/local/bower/bootstrap/dist/js/bootstrap.js',
        '../../.meteor/local/bower/angular-motion/dist/angular-motion.css',
        '../../.meteor/local/bower/angular-ui-select/dist/select.css'
    ], 'client');

    api.addFiles([
        '../../.meteor/local/bower/angular-resource/angular-resource.js',
        '../../.meteor/local/bower/angular-cookies/angular-cookies.js',
        '../../.meteor/local/bower/angular-sanitize/angular-sanitize.js',
        '../../.meteor/local/bower/angular-animate/angular-animate.js',
        '../../.meteor/local/bower/angular-touch/angular-touch.js',
        '../../.meteor/local/bower/angular-route/angular-route.js',
        '../../.meteor/local/bower/angular-pines-notify/src/pnotify.js',
        '../../.meteor/local/bower/angular-file-upload/angular-file-upload.min.js',
        '../../.meteor/local/bower/angular-bootstrap/ui-bootstrap-tpls.js',
        '../../.meteor/local/bower/angular-translate/angular-translate.js',
        '../../.meteor/local/bower/angular-dialog-service/dist/dialogs.js',
        '../../.meteor/local/bower/angular-dialog-service/dist/dialogs-default-translations.min.js',
        '../../.meteor/local/bower/angular-local-storage/angular-local-storage.js',
        '../../.meteor/local/bower/sip.js/dist/sip.js',
        '../../.meteor/local/bower/angular-translate-loader-url/angular-translate-loader-url.js',
        '../../.meteor/local/bower/angular-strap/dist/angular-strap.js',
        '../../.meteor/local/bower/angular-strap/dist/angular-strap.tpl.js',
        '../../.meteor/local/bower/jquery-ui/jquery-ui.js',
        '../../.meteor/local/bower/angular-ui-sortable/sortable.js',
        '../../.meteor/local/bower/ngstorage/ngStorage.js',
        '../../.meteor/local/bower/angular-ui-select/dist/select.js',
        '../../.meteor/local/bower/angular-media-player/dist/angular-media-player.js',
        '../../.meteor/local/bower/angular-breadcrumb/release/angular-breadcrumb.js',
        '../../.meteor/local/bower/chartjs/Chart.min.js',

        '../../.meteor/local/bower/angular-toastr/dist/angular-toastr.css',
        '../../.meteor/local/bower/angular-toastr/dist/angular-toastr.tpls.js'
    ], 'client');

    api.addFiles([
        '../../.meteor/local/bower/pnotify/pnotify.core.css',
        '../../.meteor/local/bower/pnotify/pnotify.buttons.css',
        '../../.meteor/local/bower/pnotify/pnotify.history.css',

        '../../.meteor/local/bower/pnotify/pnotify.core.js',
        '../../.meteor/local/bower/pnotify/pnotify.buttons.js',
        '../../.meteor/local/bower/pnotify/pnotify.callbacks.js',
        '../../.meteor/local/bower/pnotify/pnotify.confirm.js',
        '../../.meteor/local/bower/pnotify/pnotify.desktop.js',
        '../../.meteor/local/bower/pnotify/pnotify.history.js',
        '../../.meteor/local/bower/pnotify/pnotify.nonblock.js'
    ], 'client');

    api.export(['PNotify'], 'client');

    api.addFiles([
        '../../.meteor/local/bower/datetimepicker/jquery.datetimepicker.js',
        '../../.meteor/local/bower/datetimepicker/jquery.datetimepicker.css',

        '../../.meteor/local/bower/metisMenu/dist/metisMenu.min.js',
        '../../.meteor/local/bower/slimScroll/jquery.slimscroll.min.js',

        '../../.meteor/local/bower/iCheck/icheck.min.js',

        '../../.meteor/local/bower/cropper/dist/cropper.min.css',
        '../../.meteor/local/bower/cropper/dist/cropper.min.js'
    ], 'client');
});

Package.onTest(function (api) {
    api.use('tinytest');
});
