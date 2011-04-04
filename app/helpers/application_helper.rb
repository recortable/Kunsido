module ApplicationHelper
  def title(text)
    content_for(:title) { text }
    content_tag(:h1, text)
  end

  def render_body(model)
    RDiscount.new(model.body).to_html.html_safe
  end

  def avatar_url(user, size = 48)
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=retro"
  end


end
