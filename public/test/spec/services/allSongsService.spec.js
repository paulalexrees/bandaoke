'use strict';

describe('AllSongsService', function() {
  beforeEach(module('bandaokeApp'));

  var httpBackend, AllSongsService;

  var songData = [{"song":{"id":1,"title":"fake-song","artist":"fake-artist","lyric_url":null,"roles":[{"role":{"instrument":"vocals","player":null}},{"role":{"instrument":"vocals","player":null}}]}},
                  {"song":{"id":2,"title":"fake-song2","artist":"fake-artist2","lyric_url":null,"roles":[{"role":{"instrument":"vocals","player":null}},{"role":{"instrument":"vocals","player":null}}]}}];

  beforeEach(inject(function(_AllSongsService_, $httpBackend) {
    AllSongsService = _AllSongsService_;
    httpBackend = $httpBackend;
  }));

  it('fetches users from songs from backend', function(){
    httpBackend.expectGET('/songs').respond(songData);

    AllSongsService.getAllSongs().then(function (songs) {
      expect(songs[0].title).toEqual(songData[0].song.title);
      expect(songs[1].title).toEqual(songData[1].song.title);
    });
    httpBackend.flush();
  });
});
