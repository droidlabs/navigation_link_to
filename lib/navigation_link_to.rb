require "navigation_link_to/version"

module NavigationLinkTo
  def controller?(*controllers)
    controllers = controllers.map(&:to_sym)
    controllers.include?(controller.controller_name.to_sym)
  end

  def action?(*actions)
    actions = actions.map(&:to_sym)
    actions.include?(controller.action_name.to_sym)
  end

  def navigation_link_to(*args, &block)
    if block_given?
      options      = args.first || {}
      html_options = args.second
      navigation_link_to(capture(&block), options, html_options)
    else
      title        = args[0]
      options      = args[1] || {}
      html_options = args[2] || {}
      url = url_for(options)
      controller = html_options[:controller]
      wrapper = html_options[:wrapper].nil? ? 'li' : html_options[:wrapper]
      is_current_controller = controller && controller?(controller)
      is_current_page = current_page?(url) && !html_options.has_key?(:active)
      is_force_active = html_options[:active]
      if is_current_controller || is_current_page || is_force_active
        html_options[:class] = [html_options[:class], 'active'].compact.join(' ')
        html_options[:wrapper_class] = [html_options[:wrapper_class], 'active'].compact.join(' ')
      end
      if wrapper
        content_tag wrapper, class: html_options[:wrapper_class] do
          badge, badge_class = html_options.delete(:badge), html_options.delete(:badge_class)
          wrapper_content = link_to(title, url, html_options, &block)
          wrapper_content << content_tag(:div, badge, class: badge_class) if badge
          wrapper_content
        end
      else
        link_to(title, options, html_options)
      end
    end
  end
end
ActionView::Base.send :include, NavigationLinkTo
