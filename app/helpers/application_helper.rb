module ApplicationHelper
    def gravetar_for(user, options = { size: 80 })
        email_Address = user.email.downcase
        hase = Digest::MD5.hexdigest(email_Address)
        size = options[:size]
        puts size
        puts options
        url = "https://www.gravatar.com/avatar/#{hase}?s=#{size}"
        image_tag(url, alt: user.name, class: "rounded shadow mx-auto d-block")
    end
end
