bandaokeApp.service('SongSearchService', ['$http', function($http) {
  var self = this;

  self.getSongs = function(song, artist) {
    return $http.get('/search/songs/' + song)
      .then(_handleResponseFromAPI, _errorCallback);
  };

  function _handleResponseFromAPI (response) {
    songsData = response.data;
    return songsData;
  }

  function _errorCallback(error) {
    return error;
  }
}]);
