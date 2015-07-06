xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Village Comments"
    
    for comment in @comments
      xml.item do
        xml.entrycontent comment.comment
        xml.author comment.user.name
        xml.url link_comments_url(comment.post.id)
      end
    end
  end
end