bandaokeApp.service('AllSongsService', ['$http', function($http) {
  var self = this;

  self.getAllSongs = function() {
    return $http.get('/songs')
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
