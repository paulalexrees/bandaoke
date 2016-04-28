'use strict';

/**
 * @ngdoc function
 * @name bandaokeApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the bandaokeApp
 */
bandaokeApp.controller('SongCtrl',['SongSearchService', function (SongSearchService) {
     var self = this;
     self.searchResults = [];
     self.searchForSong = function(song){
      self.searchResults = [];
      SongSearchService.getSongs(song).then(function (result) {
        self.searchResults = result;
      });
      };
  }]);
