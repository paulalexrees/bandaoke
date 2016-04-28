// //var mock = require('protractor-http-mock');
//
// mock([{
//           request: {
//             path: "http://api.chartlyrics.com/apiv1.asmx/SearchLyric",
//             method: 'GET'
//           },
//           response: {
//             data: { items: [{"login": "fakey"}] }
//           }
//         }
// ]);

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

  });
});
