module ApplicationHelper
  def title(text)
    content_for(:title) {text}
    content_tag(:h1, text)
  end

  def render_body(model)
    RDiscount.new(model.body).to_html.html_safe
  end
end
