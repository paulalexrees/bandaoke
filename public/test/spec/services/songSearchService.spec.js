'use strict';

describe('SongSearchService', function() {
  beforeEach(module('bandaokeApp'));

  var httpBackend, SongSearchService;

  var songData = [{"song":{'title': 'fake-song', 'artist': 'fake-artist'}},
                  {"song":{'title': 'fake-song2', 'artist': 'fake-artist2'}}];

  beforeEach(inject(function(_SongSearchService_, $httpBackend) {
    SongSearchService = _SongSearchService_;
    httpBackend = $httpBackend;
  }));

  it('fetches users from songs from backend', function(){
    httpBackend.expectGET('/search/songs/layla').respond(songData);

    SongSearchService.getSongs('layla').then(function (songs) {
      expect(songs[0].title).toEqual(songData[0].song.title);
    });
    httpBackend.flush();
  });
});
