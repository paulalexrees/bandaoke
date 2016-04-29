'use strict';

describe('AddSongService', function() {
  beforeEach(module('bandaokeApp'));

  var httpBackend, AddSongService;

  var songData = [{'title': 'fake-song', 'artist': 'fake-artist'},
                      {'title': 'fake-song2', 'artist': 'fake-artist2'}];

  beforeEach(inject(function(_AddSongService_, $httpBackend) {
    AddSongService = _AddSongService_;
    httpBackend = $httpBackend;
  }));

  it('fetches users from songs from backend', function(){
    httpBackend.expectPOST('/songs').respond({'status': 'success'});

    AddSongService.saveSong().then(function (response) {
      expect(response).toEqual('success');
    });
    httpBackend.flush();
  });
});
