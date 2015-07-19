angular.module 'iApp.Directives'

.directive 'mwsCrop', ['notificationService', (notificationService) ->
  scope:
    mwsCrop: '='
    file: '='
    selection: '='
    options: '='
  link: (scope, element, attrs) ->
    imageWidth = 0
    imageHeight = 0
    instance = null
    crop = scope.mwsCrop

    options = scope.options or {}

    # Наблюдение за изменением источника
    scope.$watch 'file', (file) ->
      if not file?
        cleanUp()
        return

      if not instance?
        instance = jQuery(element).cropper
          aspectRatio: 1 / 1
          zoomable: false
          crop: (data) ->
            scope.$apply ->
              crop.selection = {} if not crop.selection?
              angular.extend crop.selection, data

      # Подгружаем картинку
      reader = new FileReader()
      reader.readAsDataURL(file)
      reader.onload = (event) ->
        instance.cropper 'replace', event.target.result

    scope.$on '$destroy', ->
      cleanUp()

    element.bind 'load', (e) ->
      scope.$apply ->
        return
        #crop.instance.update()

    cleanUp = ->
      if instance?
        instance.cropper 'destroy'
        instance = null
]