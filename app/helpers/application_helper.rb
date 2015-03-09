module ApplicationHelper
  def current_sign_in=(sign_user)
    cookies.permanent.signed[:current_sign_in] = sign_user.email
  end

  def current_sign_in
    SignUser.find_by_email(cookies.signed[:current_sign_in])
  end

  def delete_current_sign_in
    cookies.permanent.signed[:current_sign_in] = nil
  end
end
