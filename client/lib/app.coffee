angular.module 'iApp.Services', ['ng']


onReady = ->
  angular.bootstrap(document, ['iApp'])

if Meteor.isCordova
  angular.element(document).on("deviceready", onReady);
else
  angular.element(document).ready(onReady)

angular
.module 'iApp', [
  'iApp.Services'
  'iApp.Controllers'
  'iApp.Directives'
  'iApp.Routes.default'
  'ngAnimate'
  'angular-meteor'
  'ngCookies'
  'ngStorage'
  'ngSanitize'
  'ngTouch'
  'ui.router'
  'ui.notify'
  'ui.sortable'
  'ui.select'
  'ui.bootstrap'
  'pascalprecht.translate'
  'dialogs.main'
  'mediaPlayer',
  'ncy-angular-breadcrumb'
  'angularUtils.directives.dirPagination'
  'toastr'
  'angularFileUpload'
]

.config ['$stateProvider', '$urlRouterProvider', '$translateProvider', '$httpProvider',
         'uiSelectConfig', '$breadcrumbProvider', 'dialogsProvider', 'toastrConfig',
  ($stateProvider, $urlRouterProvider, $translateProvider, $httpProvider, uiSelectConfig, $breadcrumbProvider, dialogsProvider, toastrConfig) ->
    uiSelectConfig.theme = 'bootstrap'

    $httpProvider.defaults.withCredentials = true

    dialogsProvider.setSize('sm');

    angular.extend toastrConfig,
      progressBar: true
      closeButton: true

    $breadcrumbProvider.setOptions
      templateUrl: 'client/views/breadcrumb.html'

    # Настройка многоязыковости
    $translateProvider.useUrlLoader 'languages/ru.json'
    $translateProvider.preferredLanguage 'ru'

    $urlRouterProvider.otherwise '/dashboard'
]

.run ['$rootScope', '$urlRouter', '$http', '$state', '$stateParams',
  ($rootScope, $urlRouter, $http, $state, $stateParams) ->
    # Необходимо, чтобы можно было использовать в шаблонах
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
]
