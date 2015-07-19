'use strict'

###*
 # @ngdoc function
 # @name itaxiOfficeApp.controller:DashboardCtrl
 # @description
 # # DashboardCtrl
 # Controller of the itaxiOfficeApp
###
angular.module 'iApp.Controllers'

.controller 'DashboardCtrl',
  ['$scope', '$rootScope', '$state', '$meteor', 'notificationService', 'dialogs', 'toastr',
  ($scope, $rootScope, $state, $meteor, notificationService, dialogs, toastr) ->
    $scope.loading = true
    $scope.$meteorSubscribe('requests').then (handle) ->
      $scope.loading = false
      $scope.requests = $meteor.collection(Requests, false)

    $scope.remove = (request) ->
      dialogs.confirm('Внимание!', 'Вы действительно хотите удалить выбранную заявку?').result.then (btn) ->
        $meteor.call('remove-request', request._id).then (res) ->
          notificationService.success 'Заявка удалена!'
        .catch (error) ->
          notificationService.error error.message

    $scope.takeRequest = (request) ->
      $meteor.call('take-request', request._id).then (res) ->
        notificationService.success 'Теперь это ваша заявка'
      .catch (error) ->
        notificationService.error error.message

    $scope.call = (request) ->
      document.location.href = "tel:#{request.phoneNumber}"

    $scope.getSite = (request) ->
      $meteor.object(Sites, request.site._id, false)

    $scope.getManager = (request) ->
      return {} if not request.manager
      $meteor.object(Meteor.users, request.manager._id, false)

    $scope.requestClassOptions = (request) ->
      status = request.status

      'label-danger': status is 'new'
      'label-info': status is 'in-work'

    $scope.testToastr = ->
      toastr.success 'Hello world!', 'Toastr fun!'

    $scope.play = (tgt) ->
      #uri = "http://ipod.free.fr/itrafik.mp4"
      #uri = 'http://localhost:8888/ihome/v1.mp4'
      uri = 'rtp://192.168.1.77:1234'
      video = document.getElementById('video1')
      video.playlist.add(uri,uri, "")
      video.playlist.play()

      uri = 'http://192.168.1.67:1234'
      video = document.getElementById('video2')
      video.playlist.add(uri,uri, "")
      video.playlist.play()

      uri = 'http://192.168.1.73:1234'
      video = document.getElementById('video3')
      video.playlist.add(uri,uri, "")
      video.playlist.play()

    $scope.stop = ->
      video = document.getElementById('video1')
      video.playlist.stop()
]
