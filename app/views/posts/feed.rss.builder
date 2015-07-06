xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{@featured_post.headline} <span>#{get_host_without_www(@featured_post.url)}</span>"
    xml.description @featured_post.image.url(:large)
    xml.link @featured_post.url
    xml.comments "Comment"
    
    for post in @posts
      xml.item do
        xml.title post.headline
        xml.comments_url link_comments_url(post.id)
        xml.category pluralize(post.comments.count, "Comment")
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post.url
      end
    end
  end
end