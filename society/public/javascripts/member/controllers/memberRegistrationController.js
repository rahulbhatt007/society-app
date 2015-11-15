define([
    'angular'
],function(){
    angular.module("societyApp.member",[])
        .controller('memberRegistrationController',['$scope',function($scope){
            $scope.dob = '';
            $scope.maxDate = new Date();
            $scope.open = function($event) {
                $scope.status.opened = true;
            };
            $scope.dateOptions = {
                formatYear: 'yy',
                startingDay: 1
            };

            $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
            $scope.format = $scope.formats[0];
            $scope.status = {
                opened: false
            };

        }]);
});




