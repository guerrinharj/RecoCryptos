module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to title, sort: column, direction: direction
  end

  def limit_navfooter
    params[:action] == "home" || params[:controller] == "devise/sessions" && params[:action] == "new" || params[:controller] == "devise/registrations" && params[:action] == "new" || params[:controller] == "devise/passwords"
  end
end
