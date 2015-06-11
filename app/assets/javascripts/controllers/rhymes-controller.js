'use strict';

angular.module('rhymebook').controller('RhymesController',['$scope','Restangular',function($scope, Restangular){
      var vm = this;
      vm.rhymes = function(){
        vm.currentSearch = $scope.searchTerm;
        Restangular.all('rhyme_searches').post(
          {'term': vm.currentSearch}
        ).then(function(response){
          vm.rhymes = response['rhymes'];
          console.log('response!: ' + response);
        });
      }
}]);
