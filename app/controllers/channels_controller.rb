class ChannelsController < ApplicationController
  before_action :login_required!

  def index
    @channels = current_account.channels
  end

  def create
    @channel = current_account.channels.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.json { render :create, status: :created, location: @channel }
      else
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @channel = current_account.channels.find(params.require(:id))
    @channel.destroy

    head :no_content
  end

  private
    def channel_params
      params.require(:channel).permit(:name)
    end
end
