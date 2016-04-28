var mock = require('protractor-http-mock');

mock([{
          request: {
            path: "/search/songs/layla/eric",
            method: 'GET'
          },
          response: {
            data: [{"song": "fake-song", "artist": "fake-artist"},
                   {"song": "fake-song2", "artist": "fake-artist2"}]
          }
        }
]);

describe('Adding songs', function() {
  it('has a song seach box', function() {
    browser.get('/#/songs/new');
    var song_field = $('#song-search');
    var artist_field = $('#artist-search');
    var button = $('#search-submit');
    expect(song_field.isPresent()).toBeTruthy();
    expect(artist_field.isPresent()).toBeTruthy();
    expect(button.isPresent()).toBeTruthy();
  });

  it('it returns a list of matched songs', function () {
    browser.get('/#/songs/new');
    $('#song-search').sendKeys('layla');
    $('#artist-search').sendKeys('eric');
    $('#search-submit').click();
    var songs = $$('#songs .song');
    expect(songs.first().getText()).toEqual('fake-song - fake-artist');
    expect(songs.last().getText()).toEqual('fake-song2 - fake-artist2');
  });
});
