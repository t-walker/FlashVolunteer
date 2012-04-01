module ApplicationHelper

def photo_link(entity, image, url)
    link_to url do
        image_tag entity.url(image), :class=>"photo-#{image}"
    end 
end

def original_user_logged_in
    session[:original_user]
end

def store_original_user_logged_in(other)
    session[:original_user] = other.id
end

end
