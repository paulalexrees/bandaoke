var mock = require('protractor-http-mock');
var songsResponse = [{"id":1,"title":"Fake","artist":"Fake","lyric_url":null,"roles":[{"vocals":null},{"tambourine":"Chris"}]},
                    {"id":2,"title":"Tobenna","artist":"Tobenna","lyric_url":null,"roles":[{"vocals":'Tobenna'},{"tambourine":null}]}]
mock([ { request: { path: "/songs",  method: 'GET' }, response: { data: songsResponse }  }]);

describe('Filtering songs', function() {

  beforeAll(function () {
    browser.get('/#/songs');
    $('#filter-box').sendKeys('Tobenna');
    $('#search').click();
  });

  it('returns a list of matched songs', function () {
    var songs = $$('#songs .song');
    var firstSongTitle = songs.first().element(by.css(".title"));
    expect(firstSongTitle.getText()).toMatch('Tobenna');
  });
});

afterAll(function(){
  mock.teardown();
});
