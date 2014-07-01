module SessionsHelper

  def get_with_provider(provider, auth_hash)
    request.env["omniauth.auth"] = build(auth_hash)
    get 'create', provider: provider.to_s
  end

  def login_as(account)
    allow(controller).to receive(:current_account).and_return(account)
  end

  def login!
    login_as(create(:account))
  end

  def logout!
    allow(controller).to receive(:current_account).and_return(nil)
  end

end
