class Poem
  attr_reader :author, :title, :text, :tone
  def initialize(info)
    @author = info[:author]
    @title = info[:title]
    @text = poem_formatted(info[:lines])
    @tone = get_tone(@text)
  end

  def poem_formatted(poem)
    acc = poem.map{|line| line.delete("--")}
    acc.join(" ")
  end 

  def get_tone(text)
    ToneService.new.tone(text)
  end 
end 