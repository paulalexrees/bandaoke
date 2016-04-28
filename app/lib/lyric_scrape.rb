class LyricScrape

  def self.scrape(link)
    page = HTTParty.get(link)
    lyrics_from page
  end


  private

  def self.lyrics_from page
    parse_page = Nokogiri::HTML(page)
    parse_page.css('.lyrics').text
  end
end
