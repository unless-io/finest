module CanEditHelper

  def can_edit?(user)
    user_signed_in? && current_user == user
  end
end
