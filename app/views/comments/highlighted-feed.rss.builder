xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    if @comments.count != 0
    xml.title "<div class='heading'><h4>Recent Comments</h4><hr></div>"
    else 
    xml.title ""
    end
    
    for comment in @comments
      xml.item do
	    xml.title comment.comment
	    xml.category link_comments_url(comment.post.id)
      end
    end
  end
end