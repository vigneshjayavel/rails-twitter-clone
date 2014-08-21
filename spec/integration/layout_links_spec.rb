require 'spec_helper'

describe "LayoutLinks" do

  it "should have Home page at /" do
    get '/'
    response.should render_template("pages/home")
  end

  it "should have About page at /about" do
    get '/about'
    response.should render_template("pages/about")
  end

  it "should have Contacts page at /contacts" do
    get '/contacts'
    response.should render_template("pages/contacts")
  end

  it "should have Help page at /help" do
    get '/help'
    response.should render_template("pages/help")
  end

  it "should have Team page at /team" do
    get '/team'
    response.should render_template("pages/team")
  end

  it "should have Signup page at /signup" do
  	get 'signup'
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should render_template('pages/about')
    click_link "Help"
    response.should render_template ('pages/help')
    click_link "Contacts"
    response.should render_template ('pages/contacts')
    click_link "Home"
    response.should render_template ('pages/home')
    click_link "Sign up now!"
    response.should render_template ('users/new')
  end

end
