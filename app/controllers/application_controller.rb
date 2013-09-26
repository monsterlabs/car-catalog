class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :restrict_access

  private
  def is_api_namespace?
    self.class.name.split("::").first == "Api"
  end

  def restrict_access
    if is_api_namespace?
      api_key = "hKfxHddtln1XPWw1bIwVefodA2p9MROequn/oEG"
      head :unauthorized unless api_key == request.headers["X-API-TOKEN"]
    end
  end
end
