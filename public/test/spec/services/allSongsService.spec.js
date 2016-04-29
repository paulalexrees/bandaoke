'use strict';

describe('AllSongsService', function() {
  beforeEach(module('bandaokeApp'));

  var httpBackend, AllSongsService;

  var songData = [{"id":1,"title":"fake-song","artist":"fake-artist","lyric_url":null,"roles":[{"vocals":null},{"tambourine":"Chris"}]},
                  {"id":2,"title":"fake-song2","artist":"fake-artist2","lyric_url":null,"roles":[{"vocals":'Tobenna'},{"tambourine":null}]}];

  beforeEach(inject(function(_AllSongsService_, $httpBackend) {
    AllSongsService = _AllSongsService_;
    httpBackend = $httpBackend;
  }));

  it('fetches users from songs from backend', function(){
    httpBackend.expectGET('/songs').respond(songData);

    AllSongsService.getAllSongs().then(function (songs) {
      expect(songs).toEqual(songData);
    });
    httpBackend.flush();
  });
});
