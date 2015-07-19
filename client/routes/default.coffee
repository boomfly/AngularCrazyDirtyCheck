angular.module 'iApp.Routes.default', ['ui.router']

.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state 'home',
    abstract: true,
    url: '/',
    templateUrl: 'client/views/home.html',
    controller: 'HomeCtrl'

  .state 'home.dashboard',
    url: 'dashboard'
    templateUrl: 'client/views/dashboard.html',
    controller: 'DashboardCtrl'

  .state 'home.categories',
    url: 'categories',
    templateUrl: 'client/views/categories/list.html',
    controller: 'CategoriesListCtrl'

  .state 'home.categories.new',
    url: '/new',
    views:
      '@home':
        templateUrl: 'client/views/categories/new.html',
        controller: 'CategoriesNewCtrl'

  .state 'home.categories.edit',
    url: '/:categoryId/edit',
    views:
      '@home':
        templateUrl: 'client/views/categories/edit.html',
        controller: 'CategoriesEditCtrl'

]