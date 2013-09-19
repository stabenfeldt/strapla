module ApplicationHelper
  def nbsp
    "&nbsp;".html_safe
  end

  def body_id
    "#{controller.controller_name}_#{controller.action_name}"
  end
end
