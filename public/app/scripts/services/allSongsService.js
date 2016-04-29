bandaokeApp.service('AllSongsService', ['$http','SongFactory', 'RoleFactory', function($http, SongFactory, RoleFactory) {
  var self = this;

  self.getAllSongs = function() {
    return $http.get('/songs')
      .then(_handleResponseFromAPI, _errorCallback);
  };

  function _handleResponseFromAPI (response) {
    var songsData = response.data;
    var newRoles = [];
    return songsData.map(function (song) {
      newRoles = [];
      for (var k in song.roles){
        if(song.roles.hasOwnProperty(k)){
          for (var key in song.roles[k]) {
            if (song.roles[k].hasOwnProperty(key)) {
               newRoles.push(new RoleFactory(key, song.roles[k][key]));
            }
          }

        }
      }
      song.roles = newRoles;
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
