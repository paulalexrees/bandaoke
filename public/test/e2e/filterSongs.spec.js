var mock = require('protractor-http-mock');
var songsResponse = [{"song":{"id":1,"title":"fake-song","artist":"fake-artist","lyric_url":null,"roles":[{"role":{"instrument":"vocals","player":null}},{"role":{"instrument":"vocals","player":null}}]}},
                {"song":{"id":2,"title":"fake-song2","artist":"fake-artist2","lyric_url":null,"roles":[{"role":{"instrument":"vocals","player":null}},{"role":{"instrument":"vocals","player":null}}]}}];
mock([ { request: { path: "/songs",  method: 'GET' }, response: { data: songsResponse }  }]);

describe('Filtering songs', function() {

  beforeAll(function () {
    browser.get('/#/songs');
    $('#filter-box').sendKeys('Tobenna');
    $('#search-submit').click();
  });

  it('returns a list of matched songs', function () {
    var songs = $$('#song-list .tile');
    var firstSongTitle = songs.first().element(by.css(".title"));
    expect(firstSongTitle.getText()).toMatch('Tobenna');
  });
});

afterAll(function(){
  mock.teardown();
});
