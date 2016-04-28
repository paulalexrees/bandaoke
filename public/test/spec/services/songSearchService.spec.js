'use strict';

describe('SongSearchService', function() {
  beforeEach(module('bandaokeApp'));

  var httpBackend, SongSearchService;

  var songData = [{'song': 'fake-song', 'artist': 'fake-artist'},
                      {'song': 'fake-song2', 'artist': 'fake-artist2'}];

  beforeEach(inject(function(_SongSearchService_, $httpBackend) {
    SongSearchService = _SongSearchService_;
    httpBackend = $httpBackend;
  }));

  it('fetches users from songs from backend', function(){
    httpBackend.expectGET('/search/songs/layla/eric').respond(songData);

    SongSearchService.getSongs('layla', 'eric').then(function (songs) {
      expect(songs).toEqual([{'song': 'fake-song', 'artist': 'fake-artist'},
                          {'song': 'fake-song2', 'artist': 'fake-artist2'}]);
    });
    httpBackend.flush();
  });
});
