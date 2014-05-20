# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #return a title on per-page basis
  def title
    base_title = "Ruby on Rails Sample Application"
    if @title.nil?
      base_title
    else
    	#html escape the title 
    	#title can contain malicious code as it initially was a user input
      "#{base_title} | #{h(@title)}"
    end
  end

  #return logo url
  def logo
  	image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
