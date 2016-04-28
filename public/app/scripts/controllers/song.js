'use strict';

/**
 * @ngdoc function
 * @name bandaokeApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the bandaokeApp
 */
bandaokeApp.controller('SongCtrl',['SongSearchService','AddSongService',
    function (SongSearchService, AddSongService) {
     var self = this;
     self.searchResults = [];
     self.searchForSong = function(song){
      self.searchResults = [];
      if(song === '' || typeof song === 'undefined' ) return;
      SongSearchService.getSongs(song).then(function (result) {
        self.searchResults = result;
      });
    };

      self.addSong = function (title, artist) {
        AddSongService.saveSong(title, artist).then(function () {

        });
      };
  }]);
