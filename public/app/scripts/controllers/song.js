'use strict';

/**
 * @ngdoc function
 * @name bandaokeApp.controller:SongCtrl
 * @description
 * # SongCtrl
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

      self.addSong = function (title, artist, link) {
        AddSongService.saveSong(title, artist,link).then(function () {

        });
      };
  }]);
