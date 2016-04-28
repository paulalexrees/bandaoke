class Bandaoke < Sinatra::Base

  SEARCH_URI = 'http://api.chartlyrics.com/apiv1.asmx/SearchLyric'


  get '/songs' do
    @songs = Song.all
    erb :'songs/all'
  end


  get '/search/songs/:song/:artist' do
    song = params[:song]
    artist = params[:artist]
    response = Net::HTTP.get_response(URI.parse("#{SEARCH_URI}?song=#{song}&artist=#{artist}")).body
    parse_xml(response)
  end

  post '/songs/new' do
    title = params[:title]
    artist = params[:artist]
    Song.add_with_roles(title: title, artist: artist)
    redirect '/songs'
  end

  def parse_xml(string)
    get_song_details(Hash.from_xml(string))
  end

  def get_song_details(hash)
    results = []
    hash["ArrayOfSearchLyricResult"]["SearchLyricResult"].each do |song|
      results << { song: song["Song"], artist: song["Artist"] }
    end
    results.to_json
  end
end
