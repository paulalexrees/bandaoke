var mock = require('protractor-http-mock');

mock([{
          request: {
            path: "/search/songs/layla",
            method: 'GET'
          },
          response: {
            data: [{"title": "fake-song", "artist": "fake-artist"},
                   {"title": "fake-song2", "artist": "fake-artist2"}]
          }
        }
]);

describe('Adding songs', function() {

  beforeAll(function () {
    browser.get('/#/songs/new');
    $('#song-search').sendKeys('layla');
    $('#search-submit').click();
  });

  it('returns a list of matched songs', function () {
    var songs = $$('#songs .song');
    firstSongTitle = songs.first().element(by.css(".title"));
    expect(firstSongTitle.getText()).toMatch('fake-song');
    secondSongTitle = songs.last().element(by.css(".title"));

    expect(secondSongTitle.getText()).toMatch('fake-song2');
  });

  it('adds a song to the songs database', function () {
  var firstSong = $$('#songs .song').first();
  firstSong.click();
  });

  afterAll(function(){
    mock.teardown();
  });
});
