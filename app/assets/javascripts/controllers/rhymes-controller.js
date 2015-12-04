'use strict';

angular.module('rhymebook').controller('RhymesController',['$scope','Restangular',function($scope, Restangular){
      var vm = this;
      vm.rhymes = function(){
        vm.currentSearch = $scope.searchTerm;
        if(vm.currentSearch[0] === '?'){
          var searchSpelling = vm.currentSearch.slice(1,vm.currentSearch.length)
          console.log('search term is ' + searchSpelling);
          Restangular.all('word_searches').post(
            {'spelling': searchSpelling}
          ).then(function(response){
            vm.spelling = response;
          });
        }else{
          Restangular.all('rhyme_searches').post(
            {'term': vm.currentSearch}
          ).then(function(response){
            vm.rhymes = response['rhymes'];
            console.log('response!: ' + response);
          });
        }
      }
      Restangular.all('phonemes').getList().then(function(phonemes){
        vm.phonemesByType = _.groupBy(phonemes, function(phoneme){
          return phoneme.type;
        });
      });
}]);
