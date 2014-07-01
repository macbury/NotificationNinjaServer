module Api
  module V1
    class DeviceController < ApplicationController
      respond_to :json

      def register
        @device = Device.create(device_params)
      end

      protected

      def device_params
        params.require(:device).permit(:system, :registration_id)
      end
    end
  end
end
