class SessionController < ApplicationController
  layout 'auth'
  def index
    if current_sign_in.blank?
      redirect_to "/sign_in"
    else
      redirect_to "/users"
    end
  end

  def get_sign_in
    render :template => "session/sign_in"
  end

  def post_sign_in
    sign_user = SignUser.new(params[:email], params[:password])
    if sign_user.auth?
      self.current_sign_in = sign_user
      render :json => {:status => "ok"}
    else
      render :status => 401, :text => 401
    end
  end

  def sign_out
    delete_current_sign_in
    redirect_to "/"
  end

end
