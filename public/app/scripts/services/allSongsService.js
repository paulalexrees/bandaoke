bandaokeApp.service('AllSongsService', ['$http','SongFactory', 'RoleFactory',
 function($http, SongFactory, RoleFactory) {
  var self = this;

  self.getAllSongs = function() {
    return $http.get('/songs')
      .then(_handleResponseFromAPI, _errorCallback);
  };

  function _handleResponseFromAPI (response) {
    songsData = response.data;
    return songsData.map(function (song) {
      return _createSong(song.song);
    });
  }

  function _errorCallback(error) {
    return error;
  }

  function _createSong(song) {
    song.roles = _createRoles(song);
    return new SongFactory(song.title, song.artist, song.lyric_url, song.id, song.roles)
  }

  function _createRoles(song) {
    return song.roles.map(function (role) {
      var roleObj = role.role;
      return new RoleFactory(roleObj.instrument, roleObj.player);
    });
  }
}]);
