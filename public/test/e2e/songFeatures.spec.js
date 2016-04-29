var mock = require('protractor-http-mock');
var songsResponse = [{"song":{"id":1,"title":"fake-song","artist":"fake-artist","lyric_url":null,"roles":[{"role":{"instrument":"vocals","player":null}},{"role":{"instrument":"vocals","player":null}}]}},
                {"song":{"id":2,"title":"fake-song2","artist":"fake-artist2","lyric_url":null,"roles":[{"role":{"instrument":"vocals","player":null}},{"role":{"instrument":"vocals","player":null}}]}}];
mock([{
          request: {
            path: "/search/songs/layla",
            method: 'GET'
          },
          response: {
            data: [{"song":{'title': 'fake-song', 'artist': 'fake-artist'}},
                            {"song":{'title': 'fake-song2', 'artist': 'fake-artist2'}}]
          }
        },
        {
                  request: {
                    path: "/songs",
                    method: 'GET'
                  },
                  response: {
                    data: songsResponse
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
    var firstSongTitle = songs.first().element(by.css(".title"));
    expect(firstSongTitle.getText()).toMatch('fake-song');
    var secondSongTitle = songs.last().element(by.css(".title"));

    expect(secondSongTitle.getText()).toMatch('fake-song2');
  });

  it('adds a song to the songs database', function () {
  var firstSong = $$('#songs .song').first();
  firstSong.click();
  });


});

describe('Viewing all songs', function () {

  it('shows a list of all songs', function () {
      browser.get('/');
      var songs = $$('#song-list .tile');
      var firstSongTitle = songs.first().element(by.css(".title"));
      expect(firstSongTitle.getText()).toMatch('fake-song');
      var secondSongTitle = songs.last().element(by.css(".title"));
      expect(secondSongTitle.getText()).toMatch('fake-song2');
  });
});

afterAll(function(){
  mock.teardown();
});
