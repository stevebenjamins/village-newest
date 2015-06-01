module ApplicationHelper

  def newsfeed_date(day)
    if day == Date.today.strftime("%A, %b %d")
      "Today"
    elsif day == Date.yesterday.strftime("%A, %b %d")
      "Yesterday"
    else
      day
    end
  end
  
  def get_host_without_www(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end
  
  def weekend_sign
    today = Date.today
    content_tag(:p, "New posts Mon - Fri.") if today.wday == 0 or today.wday == 6 or today.wday == 7
  end

end
