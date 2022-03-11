module HashtagsHelper
  def text_with_hashtag_links(name)
    name&.gsub(Hashtag::HASHTAG_FORMAT) do |hashtag|
      link_to hashtag, hashtag_path(hashtag.delete('#').downcase)
    end
  end
end
