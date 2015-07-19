'use strict'

angular.module 'iApp.Controllers'

.controller 'CategoriesListCtrl',
  ['$scope', '$rootScope', '$state', '$meteor', 'dialogs', 'toastr', '$q', '$timeout'
  ($scope, $rootScope, $state, $meteor, dialogs, toastr, $q, $timeout) ->
    $scope.$meteorSubscribe('categories').then ->
      $scope.categories = $meteor.collection ->
        Category.find()
      , false

    $scope.$meteorSubscribe('images').then ->
      $scope.images = $meteor.collection(Image, false)

    $scope.remove = (category) ->
      dialogs.confirm('Внимание!', 'Вы действительно хотите удалить выбранную категорию?').result.then (btn) ->
        $meteor.call('remove-category', category._id).then (res) ->
          toastr.success 'Категория удалена'
        .catch (error) ->
          toastr.error error.message

    $scope.getCategoryTitle = (category) ->
      #console.log category.title
      category.title

    $scope.getImage = (category) ->
      return {} if not category
      if category.image
        $meteor.object(Image, category.image, false)

    $scope.imageUrl = (image) ->
      image.url()
]
