module ApplicationHelper
  def error_list(model)
    return "" unless model.errors.any?
    rvalue = ""
    model.errors.full_messages.each do |m|
      rvalue = "<p class='alert alert-warning' role='alert'>#{m}</p>"
    end
    rvalue
  end
end
