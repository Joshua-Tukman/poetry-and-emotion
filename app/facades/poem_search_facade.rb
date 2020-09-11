class PoemSearchFacade
  attr_reader :poems
  def initialize(author)
    @poems = poem_search(author)
  end

  def poem_search(author)
    results = PoemService.new.get_poems(author)[0..9]
    poems = []
    results.each do |poem_info|
      poems << Poem.new(poem_info)
    end
    poems
  end 
end 
