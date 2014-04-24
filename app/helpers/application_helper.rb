module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
    name="authenticity_token"
    value="#{form_authenticity_token}">
    HTML
  end


  def num_notifications
    current_user.notifications.where(status: "UNREAD").length
  end



end
