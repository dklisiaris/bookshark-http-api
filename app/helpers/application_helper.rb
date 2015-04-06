module ApplicationHelper
  def controller?(*controller)    
    controller.include?(params[:controller])
  end

  def action?(*action)    
    action.include?(params[:action])
  end  

  def nav_link(title, path, active=false)  
    link_class = "pure-menu-link"
    link_class << " pure-menu-active" if active

    content_tag(:li, class: "pure-menu-item") do
      link_to title, path, class: link_class
    end  
  end  
end
