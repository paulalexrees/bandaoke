bandaokeApp.service('SongSearchService', ['$http', 'SongFactory', function($http, SongFactory) {
  var self = this;

  self.getSongs = function(song, artist) {
    return $http.get('/search/songs/' + song)
      .then(_handleResponseFromAPI, _errorCallback);
  };

  function _handleResponseFromAPI (response) {
    songsData = response.data;
    return songsData.map(function (song) {
      return _createSong(song);
    });
  }

  function _errorCallback(error) {
    return error;
  }

  function _createSong(song) {
    return new SongFactory(song.title, song.artist, song.lyric_url, song.id, song.roles)
  }
}]);
