class PagesController < ApplicationController
  def home
  	@title = "Home"
    @micropost = Micropost.new if signed_in?
  end

  def contacts
  	@title = "Contacts"
  end

  def about
  	@title = "About"
  end

  def team
  	@title = "Team"
  end

  def help
  	@title = "Help"
  end

end
