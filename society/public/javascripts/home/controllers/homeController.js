define([
    'angular'
],function(){
    angular.module("societyApp.home",[])
        .controller('homeController',['$scope','$timeout','$location',function($scope,$timeout,$location){
            $timeout(function(){
                $location.url('/admin-login');
            },3000);
    }]);
});