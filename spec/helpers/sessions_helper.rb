module SessionsHelper

  def get_with_provider(provider, auth_hash)
    request.env["omniauth.auth"] = build(auth_hash)
    get 'create', provider: provider.to_s
  end

  def login_as(account)
    controller.stub(:current_account).with(account)
  end

  def login!
    login_as(create(:account))
  end

  def logout
    controller.stub(:current_account).with(nil)
  end

end
