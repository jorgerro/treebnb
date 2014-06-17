module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
    name="authenticity_token"
    value="#{form_authenticity_token}">
    HTML
  end


  def num_notifications
    current_user.notifications.unread.count
  end

  def format_time(time)
    time.strftime "%A, %b %d %Y"
  end

  def format_last_message(time)
    time.strftime "%b %d"
  end

  def format_member_since(time)
    time.strftime "%B %Y"
  end

  def to_ms(date)
    # date.to_time.to_i * 1000
    p date
    p "********************************************************"
    date.strftime('%Q')
  end

end
