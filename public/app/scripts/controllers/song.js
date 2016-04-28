'use strict';

/**
 * @ngdoc function
 * @name bandaokeApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the bandaokeApp
 */
angular.module('bandaokeApp')

  .controller('SongCtrl', function () {
     var self = this
     self.searchForSong = function(song,artist){
      console.log(song);
    }
    self.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
