module ApplicationHelper
  SPECIAL_SYMBO_REG = /(,|;|\||，|；|。|、| )/
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def title(page_title)
    content_for(:title){ page_title}
    return page_title
  end
  def meta_keywords(meta_keywords)
    content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
    content_for(:meta_description){ meta_description}
  end
  def content(item_content)
    content_for(:content){ raw item_content }
  end

  def get_date(date)
    return if date.blank?
    date.strftime("%Y-%m-%d")
  end

  def get_short_content(content, count = 120)
    sanitize(strip_tags(content).to_s.truncate(count))
  end

  #session for member
  def get_session(member)
    session[:member] = nil
    session[:member] = member.id
  end
    
  def current_member(sess = session[:member])
    return if sess.nil?
    Member.find(sess)
  end
  
  def current_session
    current_user || current_member
  end
  #user_signed_in? || member login
  def signed_in?
    current_user || current_member
  end

  #judge browser
  #BROWSER = ['Internet Explorer', 'Firefox', 'Chrome']
  def ie_browser?
    user_agent = UserAgent.parse(request.user_agent)
    return true if user_agent.browser =~ /Internet/
    return false
  end
  
end
