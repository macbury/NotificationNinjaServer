class ChannelsController < ApplicationController
  before_action :login_required!

  # GET /channels
  # GET /channels.json
  def index
    @channels = current_account.channels.order("name ASC")
  end

  def create
    @channel = current_account.channels.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def channel_params
      params.require(:channel).permit(:name)
    end
end
