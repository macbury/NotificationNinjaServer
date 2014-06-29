class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    sign_out
    if Account.respond_to?(auth_method)
      @account = Account.send(auth_method, auth_hash)
      if @account
        sign_in(@account)
        flash[:success] = I18n.t("auth.success")
      else
        flash[:error]   =  I18n.t("auth.error")
      end
    else
      flash[:error] = I18n.t("auth.undefined_provider")
    end

    redirect_to root_path
  end

  def destroy
    sign_out
    flash[:success] = I18n.t("auth.logout")
    redirect_to root_path
  end

  private

    def auth_method
      "auth_with_#{params[:provider]}"
    end

    def sign_in(account)
      cookies.signed[:auth_token] = {
        value: account.generate_session_token!,
        expires: 2.hours.from_now
      }
    end

    def sign_out
      cookies.delete(:auth_token)
    end

    def auth_hash
      request.env['omniauth.auth']
    end
end
