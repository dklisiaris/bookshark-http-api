module ApplicationHelper
  def controller?(*controller)    
    controller.include?(params[:controller])
  end

  def action?(*action)    
    action.include?(params[:action])
  end  

  def nav_link(title, path, active = false)  
    link_class = "pure-menu-link"
    link_class << " pure-menu-active" if active

    content_tag(:li, class: "pure-menu-item") do
      link_to title, path, class: link_class
    end  
  end 

  def alert_box(msg, contextual_class = 'notice')
    if msg
      content_tag(:div, class: "alert-box "+contextual_class) do
        content_tag(:span, contextual_class + ': ') +
        msg
      end
    end
  end

end
