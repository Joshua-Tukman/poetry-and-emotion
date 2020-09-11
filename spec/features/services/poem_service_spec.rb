require 'rails_helper'

RSpec.describe PoemService do 
    it "it can be created" do
      service = PoemService.new

      expect(service).to be_a(PoemService)
    end
  
end