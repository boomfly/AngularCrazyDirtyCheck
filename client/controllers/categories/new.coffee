'use strict'

###*
 # @ngdoc function
 # @name itaxiOfficeApp.controller:DashboardCtrl
 # @description
 # # DashboardCtrl
 # Controller of the itaxiOfficeApp
###
angular.module 'iApp.Controllers'

.controller 'CategoriesNewCtrl',
  ['$scope', '$rootScope', '$state', '$meteor', 'toastr', 'FileUploader',
  ($scope, $rootScope, $state, $meteor, toastr, FileUploader) ->
    $scope.loading = true
    $scope.category = {}
    $scope.crop = {}
    $scope.uploader = new FileUploader

    $scope.uploader.onAfterAddingFile = (file) ->
      if $scope.uploader.queue.length > 1
        $scope.uploader.queue.splice 0, 1

      return $scope.crop.file = file._file

    $scope.upload = ->
      Image.insert $scope.crop.file, (error, image) ->
        $scope.category.image = image._id

    createCategory = ->
      $meteor.call('create-category', $scope.category).then (id) ->
        $state.go 'home.admin.goods.categories.edit', categoryId: id
      .catch (error) ->
        toastr.error error.message

    $scope.create = ->
      if $scope.crop.file
        Image.insert $scope.crop.file, (error, image) ->
          $scope.category.image = image._id
          createCategory()
      else
        createCategory()
]
