class PoemService

  def get_poems(author)
    get_json("/author/#{author}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://poetrydb.org") 
  end
end 