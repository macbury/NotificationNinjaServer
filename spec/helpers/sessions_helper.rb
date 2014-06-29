module SessionsHelper

  def get_with_provider(provider, auth_hash)
    request.env["omniauth.auth"] = build(auth_hash)
    get 'create', provider: provider.to_s
  end

end
