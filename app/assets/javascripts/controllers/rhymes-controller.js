'use strict';

angular.module('rhymebook').controller('RhymesController',function($scope, Restangular){
      var vm = this;
      vm.rhymes = function(term){
        Restangular.all('rhymes/' + term).getList().then(function(response){
          vm.rhymes = response;
          console.log('response!: ' + response);
        });
      }
});
