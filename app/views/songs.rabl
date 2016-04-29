collection @songs
attributes :id, :title, :artist, :lyric_url
child(:roles) { attributes :instrument, :player}
