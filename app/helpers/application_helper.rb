module ApplicationHelper
  def min_password
    @minimum_password_length.to_s + " characters minimum"
  end
end
