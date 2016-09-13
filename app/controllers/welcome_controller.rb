class WelcomeController < ApplicationController
require 'nokogiri'
require 'open-uri'
  
  def index
    if params[:search] && current_user.site_urls.count < SiteUrl::SITECOUNT 
	    url = "http://www.alexa.com/siteinfo/#{params[:search]}"
	    doc = Nokogiri::HTML(open(url))
	    if doc.css('strong.metrics-data.align-vmiddle').present? 
        current_site_url = current_user.site_urls.find_or_create_by(site_name: params[:search])
	      global_rank = { global_rank: doc.css('strong.metrics-data.align-vmiddle').children[2].text.strip }
	      local_rank = { local_rank:   doc.css('strong.metrics-data.align-vmiddle').children[3].text.strip }
	      rank = global_rank .merge(local_rank)
        current_site_url.ranks.create rank if current_site_url.ranks.exists_rank.blank? 
      else
        flash[:notice] = "Please enter correct domain name" 
      end
    else
      flash[:notice] = "You can check only 3 site rank"
    end  
  end
end
