class WelcomeController < ApplicationController
require 'nokogiri'
require 'open-uri'
  
  def index
  	if params[:search]
	  url = "http://www.alexa.com/siteinfo/#{params[:search]}"
	  doc = Nokogiri::HTML(open(url))
	  @my_value = Array.new
	  @my_value <<  { global_rank: doc.css('strong.metrics-data.align-vmiddle').children[2].text.strip.to_i }
	  @my_value <<  { india_rank:   doc.css('strong.metrics-data.align-vmiddle').children[3].text.strip.to_i }
    else
    	@my_value = Array.new
    end  
  end
end
