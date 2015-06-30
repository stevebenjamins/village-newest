xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @featured_post.headline
    xml.description @featured_post.image.url(:large)
    xml.link @featured_post.url
    
    for post in @posts
      xml.item do
        xml.title post.headline
        xml.category get_host_without_www(post.url)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post.url
      end
    end
  end
end