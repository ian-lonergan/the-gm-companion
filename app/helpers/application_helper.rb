module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column == sort_column
      title
    else
      link_to title, {sort: column}
    end
  end
end
