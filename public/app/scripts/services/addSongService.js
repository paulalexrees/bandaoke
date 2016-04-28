bandaokeApp.service('AddSongService', ['$http', function($http) {
  var self = this;

  self.saveSong = function(title, artist) {
    var params = "title=" + title + "&artist=" + artist;
    var config = {"headers": {'Content-Type': 'application/x-www-form-urlencoded'}};
    return $http.post('/songs', params, config)
      .then(_handleResponseFromAPI, _errorCallback);
  };

  function _handleResponseFromAPI (response) {
    songsData = response.data;
    return songsData['status'];
  }

  function _errorCallback(error) {
    return error;
  }
}]);
