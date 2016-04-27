require './app/app.rb'

song = Song.create(title: "Buttons", artist: "Pussy Cat Dolls")
song.roles << Role.create(instrument: "Guitar")
song.roles << Role.create(instrument: "Drums")
song.save
