require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do

  describe "as logged in user" do
    let(:account) { create(:account) }
    let(:channel) { account.channels.create(attributes_for(:example_channel)) }
    before { login_as(account) }

    describe "GET index" do
      it "assigns all channels as @channels" do
        get :index
        expect(response).to be_success
        expect(assigns(:channels)).to eq([channel])
      end

      it "responds to html" do
        get :index, format: :html
        expect(response).to be_success
      end

      it "responds to json" do
        get :index, format: :json
        expect(response).to be_success
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested channel" do
        channel = account.channels.create(attributes_for(:example_channel))
        expect {
          delete :destroy, {:id => channel.to_param}
        }.to change(Channel, :count).by(-1)
      end
    end
  end

  describe "as guest" do
    before { logout! }

    describe "redirect to root path if not logged in" do
      it "for GET index" do
        get :index
        expect(response).to redirect_to(root_path)
      end

      it "for DELETE destroy" do
        delete :destroy, id: -1
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
