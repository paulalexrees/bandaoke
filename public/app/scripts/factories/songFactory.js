bandaokeApp.factory('SongFactory', function() {

  var Song = function(title, artist, lyric_url, id, roles) {
    this.title = title;
    this.artist = artist;
    this.lyric_url = lyric_url;
    this.id = id;
    this.roles = roles;
  };

  return Song;
});
