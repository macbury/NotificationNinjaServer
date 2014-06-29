class HomeController < ApplicationController
  def index
    redirect_to channels_path if signed_in?
  end
end
