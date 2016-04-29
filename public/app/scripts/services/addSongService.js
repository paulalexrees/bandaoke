bandaokeApp.service('AddSongService', ['$http', function($http) {
  var self = this;

  self.saveSong = function(title, artist, link) {
    var params = "title=" + title + "&artist=" + artist + "&lyric_url=" + link;
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
