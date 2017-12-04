require 'rails_helper'

describe "home page", js: true do
  context "default" do
    it "shows logo and search bar" do
      visit root_path
      #shows doogle logo
      expect(page).to have_css("h1", :text => "Doogle")
      #shows input field
      expect(page).to have_field("search")
    end
  end
  
  describe "page when searching a word" do
    context "word is valid" do
      it "displays the definitions" do
      end
    end
    context "word is not valid" do
      it "displays error" do
      end
    end
  end
end