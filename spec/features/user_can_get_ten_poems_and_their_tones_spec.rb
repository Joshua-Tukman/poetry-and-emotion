require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I search for poems by 'Emily' I should be on the search page" do
    it "there I see a list of 10 poems and their information including tones" do
      visit '/'
      
      fill_in "author", with: "Emily"
      click_on "Get Poems"
      save_and_open_page
      expect(current_path).to eq('/search')
      expect(page).to have_content('10 Poems Matching Your Search Criteria')
      expect(page).to have_css('.poem', count: 10)
      within(first('.poem')) do 
        expect(page).to have_css('.title')
        expect(page).to have_css('.author')
        expect(page).to have_css('.text')
        poem = find('.text').text
        expect(poem).to_not be_empty
      end 
    end
  end
end
# As a user
# When I visit "/"
# And I fill in "Emily" in the textfield(Note: Use the existing search form)
# And I click "Get Poems"
# Then I should be on page "/search"
# Then I should see a list of the first 10 poems.

# For each poem I should see
# - Title
# - Author
# - The poem(as a single string)

# I should also see:
# - The tone or tones for each poem