module ApplicationHelper

  def newsfeed_date(day)
    if day.strftime("%A, %b %d") == Date.today.strftime("%A, %b %d")
      "Today"
    elsif day.strftime("%A, %b %d") == Date.yesterday.strftime("%A, %b %d")
      "Yesterday"
    else
      day.strftime("%A, %b %d")
    end
  end
  
  def get_host_without_www(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end
  

end
