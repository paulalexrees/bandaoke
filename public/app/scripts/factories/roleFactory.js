bandaokeApp.factory('RoleFactory', function() {

  var Role = function(instrument, player) {
    this.instrument = instrument;
    this.player = player;

  };

  return Role;
});
