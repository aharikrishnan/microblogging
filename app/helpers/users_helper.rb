module UsersHelper
  
  def gravatar_for user, hash={size:50}
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}.png"
    if !(hash[:size].nil?) and hash[:size].kind_of? Integer
      image_tag(gravatar_url, alt: user.name, class: "gravatar", size:  hash[:size].to_s+"x"+ hash[:size].to_s)
    else
    image_tag(gravatar_url, alt: user.name, class: "gravatar", size: "50x50")  
    end
    
  end
    
end
