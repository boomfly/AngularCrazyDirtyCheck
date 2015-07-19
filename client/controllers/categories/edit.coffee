'use strict'

###*
 # @ngdoc function
 # @name itaxiOfficeApp.controller:DashboardCtrl
 # @description
 # # DashboardCtrl
 # Controller of the itaxiOfficeApp
###
angular.module 'iApp.Controllers'

.controller 'CategoriesEditCtrl',
  ['$scope', '$rootScope', '$state', '$stateParams', '$meteor', 'toastr', 'FileUploader',
  ($scope, $rootScope, $state, $stateParams, $meteor, toastr, FileUploader) ->
    $scope.loading = true
    $scope.category = {}
    $scope.crop = {}
    $scope.uploader = new FileUploader

    $scope.uploader.onAfterAddingFile = (file) ->
      if $scope.uploader.queue.length > 1
        $scope.uploader.queue.splice 0, 1

      return $scope.crop.file = file._file

    $scope.$meteorSubscribe('categories').then (handle) ->
      $scope.loading = false
      $scope.category = $meteor.object(Category, $stateParams.categoryId, false)

    createCategory = ->
      category = _.pick $scope.category, 'title', 'description', 'published'
      $meteor.call('update-category', $scope.category._id, category).then (id) ->
        toastr.success 'Данные сохранены!', 'Отлично'
        #$scope.form.reset()
      .catch (error) ->
        toastr.error error.message

    $scope.update = ->
      if $scope.crop.file
        Image.insert $scope.crop.file, (error, image) ->
          $scope.category.image = image._id
          createCategory()
      else
        createCategory()

    $scope.getImage = (category) ->
      return {} if not category
      if category.image
        $meteor.object(Image, category.image, false)

    $scope.cancelImage = ->
      $scope.crop.file = null
]