'use strict';

describe('SongSearchService', function() {
  beforeEach(module('bandaokeApp'));

  var httpBackend, SongSearchService;

  var songData = [{'title': 'fake-song', 'artist': 'fake-artist'},
                      {'title': 'fake-song2', 'artist': 'fake-artist2'}];

  beforeEach(inject(function(_SongSearchService_, $httpBackend) {
    SongSearchService = _SongSearchService_;
    httpBackend = $httpBackend;
  }));

  it('fetches users from songs from backend', function(){
    httpBackend.expectGET('/search/songs/layla').respond(songData);

    SongSearchService.getSongs('layla').then(function (songs) {
      expect(songs).toEqual([{'title': 'fake-song', 'artist': 'fake-artist'},
                          {'title': 'fake-song2', 'artist': 'fake-artist2'}]);
    });
    httpBackend.flush();
  });
});
