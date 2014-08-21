require 'spec_helper'

describe PagesController do
  integrate_views


  describe "GET 'random_page'" do
    it "should not be successful" do
      get 'random_page'
      response.should_not be_success
    end
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "has correct title" do
      get 'home'
      response.should have_tag("title",
        "Ruby on Rails Sample Application | Home")
    end
  end

  describe "GET 'contacts'" do
    it "should be successful" do
      get 'contacts'
      response.should be_success
    end

    it "has correct title" do
      get 'contacts'
      response.should have_tag("title",
        "Ruby on Rails Sample Application | Contacts")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "has correct title" do
      get 'about'
      response.should have_tag("title",
        "Ruby on Rails Sample Application | About")
    end
  end

  describe "GET 'team'" do
    it "should be successful" do
      get 'team'
      response.should be_success
    end

    it "has correct title" do
      get 'team'
      response.should have_tag("title",
        "Ruby on Rails Sample Application | Team")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "has correct title" do
      get 'help'
      response.should have_tag("title",
        "Ruby on Rails Sample Application | Help")
    end
  end


end
