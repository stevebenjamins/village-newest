xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "<a href='#{@featured_post.url}' class='featured'>#{@featured_post.headline}</a> <a href='#{link_comments_url(@featured_post.id)}'><span>#{pluralize(@featured_post.comments.count, "Comment")}</span></a>"
    xml.description @featured_post.image.url(:large) 
    xml.link 
    xml.comments "Comment"
    
    for post in @posts
      xml.item do
        xml.title post.headline
        xml.content_text link_comments_url(post.id)
        xml.category pluralize(post.comments.count, "Comment")
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post.url
      end
    end
  end
end