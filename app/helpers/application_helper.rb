module ApplicationHelper
  def sortable(column, join = nil, title = nil)
    title ||= column.titleize
    if ([join, column] <=> sort_join_column) == 0
      title
    else
      link_to title, {join: join, sort: column}
    end
  end
end
