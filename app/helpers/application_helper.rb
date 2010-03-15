# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def is_active?(action_name, controller_name)
    puts " ============================ #{action_name}  #{params[:action]} -- #{params[:controller]} "
    puts " ===================== #{(params[:action] == action_name) and (params[:controller] == controller_name)}"
    "active" if (params[:action] == action_name) and (params[:controller] == controller_name)
  end
end
