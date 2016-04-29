class SongSearch

  SEARCH_URI = 'http://api.genius.com/search'
  API_KEY = ENV['GENIUS_TOKEN']

  def self.find_songs(terms)
    uri = URI.parse("#{SEARCH_URI}?q=#{terms}&access_token=#{API_KEY}")
    prepare_result(Net::HTTP.get_response(uri).body)
  end

  private

  def self.parse_response(response)
    JSON.parse(response)
  end

  def self.prepare_result(response)
    hits = JSON.parse(response)['response']['hits']
    hits = extract_songs(hits) unless hits.empty?
    hits.to_json
  end

  def self.extract_songs(hits)
    songs = hits.map{ |hit| hit['result']}
    songs.map do |song|
      { title: song['title'],
        artist: song['primary_artist']['name'],
        link: song['url']}
    end
  end
end
