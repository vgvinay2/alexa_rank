class LoggerJob 
 include SuckerPunch::Job
 require 'nokogiri'
 require 'open-uri' 
  def perform
    SiteUrl.all.each  do  |site|
      url = "http://www.alexa.com/siteinfo/#{site.site_name}"
	    doc = Nokogiri::HTML(open(url))
	    global_rank = { global_rank: doc.css('strong.metrics-data.align-vmiddle').children[2].text.strip.to_i }
	    local_rank = { local_rank:   doc.css('strong.metrics-data.align-vmiddle').children[3].text.strip.to_i }
	    rank = global_rank .merge(local_rank)
       ite.ranks.create rank if site.ranks.exists_rank.blank? 
    end
  end
end