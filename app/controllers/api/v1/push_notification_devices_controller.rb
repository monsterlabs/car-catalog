class Api::V1::PushNotificationDevicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @push_notification_device = PushNotificationDevice.where(token: params[:token]).first_or_create
    @push_notification_device.update_attributes device_params.merge(ip_address: request.remote_ip)
    respond_to do |format|
      format.json { render json: @push_notification_device }
    end
  end

  private
  def device_params
    params.require(:push_notification_device).permit(:token, :timezone, :badge)
  end
end
