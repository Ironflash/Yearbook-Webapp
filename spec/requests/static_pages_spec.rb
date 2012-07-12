require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Texas A&M Yearbook'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text=> "Texas A&M Yearbook")
    end

    it "should have the base title" do
    	visit '/static_pages/home'
    	page.should have_selector('title', :text=>"Texas A&M Yearbook")
    end

    it "should not have a custom title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text=>" | Home")
    end
  end

  describe "Help page" do

  	it "should have the h1 'Help'" do 
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text=>"Help")
  	end

  	it "should have the base title" do
  		visit '/static_pages/help'
  		page.should have_selector('title', :text=> "Texas A&M Yearbook")
  	end

    it "should not have a custom title" do
      visit '/static_pages/help'
      page.should_not have_selector('title', :text=>" | Help")
    end
  end

  describe "About Page" do

  	it "should have the h1 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text=>"About Us")
  	end

  	it "should have the base title" do 
  		visit '/static_pages/about'
  		page.should have_selector('title', :text=>"Texas A&M Yearbook")
  	end

    it "should not have a custom title" do
      visit '/static_pages/about'
      page.should_not have_selector('title', :text=>" | About Us")
    end
  end

  describe "Contact Page" do

  	it "should have the h1 'Contact Us'" do
  		visit '/static_pages/contact'
  		page.should have_selector('h1', :text=>"Contact Us")
  	end

  	it "should have the base title" do
  		visit '/static_pages/contact'
  		page.should have_selector('title', :text=>"Texas A&M Yearbook")
  	end

    it "should not have a custom title" do
      visit '/static_pages/contact'
      page.should_not have_selector('title', :text=>" | Contact")
    end
  end
end