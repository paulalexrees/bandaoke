bandaokeApp.service('SongSearchService', ['$http', function($http) {
  var self = this;

  self.getSongs = function(song, artist) {
    return $http.get('/search/songs/' + song + '/' + artist)
      .then(_handleResponseFromAPI, _errorCallback);
  };

  function _handleResponseFromAPI (response) {
    songsData = response.data;
    console.log(songsData);
    return songsData;
  }

  function _errorCallback(error) {
    return error;
  }
}]);
