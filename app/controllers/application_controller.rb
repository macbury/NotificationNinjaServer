class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_account, :signed_in?

  protected

  def current_account
    token              = cookies.signed[:auth_token]
    @current_account ||= token && Account.where(session_key: token).first
  end

  def signed_in?
    !current_account.nil?
  end

  def login_required!
    unless signed_in?
      flash[:error] = I18n.t("auth.login_required")
      redirect_to root_path
    end
  end
end
