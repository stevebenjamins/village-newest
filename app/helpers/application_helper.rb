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

end
