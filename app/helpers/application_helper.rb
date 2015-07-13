module ApplicationHelper

  def newsfeed_date(day)
    if day.strftime("%A, %b %d") == Date.today.strftime("%A, %b %d")
      "Today in Toronto"
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

  def poll_time(poll)
    if poll.voting_closes.past?
      "Voting finished #{poll.voting_closes.strftime("%b %d %Y")}"
    else
      "#{distance_of_time_in_words(poll.voting_closes.in_time_zone('Eastern Time (US & Canada)') - Time.now.in_time_zone('Eastern Time (US & Canada)'))} left to vote"
    end
  end


end
