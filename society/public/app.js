/**
 * Created by Deepak.Pundir on 11/1/2015.
 */
define([
    'angular',
    'bootstrap',
    'angular-resource',
    'angular-route'
], function(angular) {
    var app = angular.module("societyApp", [
        'ngResource',
        "ngRoute"
    ])
        .config(function ($routeProvider, $provide) {
            $provide.value('$context', {});
            $provide.value('$serverPath', window.location.origin);

            $routeProvider.when('/member', {
                'templateUrl' : 'javascripts/member/partials/member.html'
            }).when('/society', {
                'templateUrl': 'javascripts/society/partials/society.html'
            }).when('/home', {
                'templateUrl': 'javascripts/home/partials/home.html'
            }).otherwise({
                'redirectTo': '/home'
            });

        }).controller("appController", function($rootScope, $scope) {
            $scope.heading = 'Application Heading';
            $scope.ngViewPlaceholder = 'NG View Placeholder';
            $scope.footer = 'Footer';
        });

    angular.bootstrap(document, ["societyApp"]);
});