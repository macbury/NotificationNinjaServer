require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "should process login with github" do
    it "successful login in for valid hash" do
      get_with_provider(:github, :github_auth_hash)
      expect(response).to redirect_to(root_path)
      expect(assigns(:account)).not_to be_nil
      expect(cookies.signed["auth_token"]).to eq(assigns[:account].session_key)
      expect(flash[:success]).to eq(I18n.t("auth.success"))
    end
  end

  it "should logout" do
    get :destroy
    expect(response).to redirect_to(root_path)
    expect(flash[:success]).to eq(I18n.t("auth.logout"))
    expect(cookies.signed["auth_token"]).to be_nil
  end

end
