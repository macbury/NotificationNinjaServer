channelManagerApp = angular.module("channelManagerApp", ['ngResource'])
channelManagerApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  $httpProvider.defaults.headers.common['Content-Type'] = 'application/json'

channelManagerApp.factory 'Channel', ($resource) -> $resource('/channels/:id.json', id: '@id')

channelManagerApp.controller "ChannelsController", ['$scope', 'Channel', ($scope, Channel) ->
  $scope.channels = Channel.query()

  @formVisible = false
  @toggleForm  = -> @formVisible = !@formVisible

  @remove      = (channel) ->
    angular.forEach $scope.channels, (obj, index) ->
      if (obj.id == channel.id)
        return $scope.channels.splice(index, 1)

  return this
]

channelManagerApp.controller "ChannelController", ["$scope", "Channel", ($scope, Channel) ->
  $scope.notification = {
    title: "",
    url: "",
    message: ""
  }

  @destroy = (channel) ->
    if confirm("Are you sure?")
      $scope.$parent.$parent.channelsCtrl.remove(channel)
      Channel.delete({ id: channel.id }).$promise.then (result) ->
        console.log(result)


  return this
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

channelManagerApp.directive 'channelNewForm', ($parse) ->
  restrict: "E",
  template: JST["channel_new_form"]()
  controllerAs: "form"
  controller: ($scope, Channel) ->
    @reset = -> $scope.channel = { name: "" }
    @reset()
    @createChannel = (channels) =>
      Channel.save($scope.channel).$promise.then( (result) =>
        channels.push(result)
        $scope.channelsCtrl.toggleForm()
        @reset()
      )
    return this

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
