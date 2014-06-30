channelManagerApp = angular.module("channelManagerApp", ['ngResource'])
channelManagerApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  $httpProvider.defaults.headers.common['Content-Type'] = 'application/json'

channelManagerApp.factory 'Channel', ($resource) -> $resource('/channels/:id.json', id: '@id')

channelManagerApp.controller "ChannelsController", ['$scope', 'Channel', ($scope, Channel) ->
  $scope.channels = Channel.query()
]

channelManagerApp.controller "ChannelController", ["$scope", ($scope) ->
  $scope.notification = {
    title: "",
    url: "",
    message: ""
  }
]

channelManagerApp.controller "NewChannelController" , ["$scope", ($scope) ->
  $scope.channel = { name: "" }
]

channelManagerApp.filter 'unsafe', ($sce) ->
  return (val) -> $sce.trustAsHtml(val)

channelManagerApp.filter 'param', ($sce) ->
  return (val) -> $.param(val) if val?

channelManagerApp.directive 'channelCodeExamples', ($parse) ->
  restrict: "E",
  template: JST["channel_code_tabs"](),
  controller: ->
    @setTab = (next_tab) -> @currentTab = next_tab
    @getTab = -> @currentTab
    @isTab  = (tab) -> (@currentTab == tab)

    @setTab('bash')
  controllerAs: 'channelCodeTabCtrl'

channelManagerApp.directive 'channelNotificationForm', ($parse) ->
  restrict: "E",
  template: JST["channel_notification_form"]()

channelManagerApp.directive "qrCode", ($parse) -> {
  restrict: "E",
  compile: (element, attrs) ->
    modelAccessor = $parse(attrs.ngModel)
    element.replaceWith($("<div class='qr-code'></div>"))
    return (scope, element, attrs, controller) ->
      qrcode = new QRCode(element[0], "http://jindo.dev.naver.com/collie")
      scope.$watch modelAccessor, (val) ->
        qrcode.clear()
        qrcode.makeCode(val)
}
