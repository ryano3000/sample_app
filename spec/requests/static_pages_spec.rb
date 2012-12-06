require 'spec_helper'

describe "Static pages" do

  describe "Homie page" do

    it "should have content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end

  describe "Help page" do

    it "should have content 'help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end
  end




end