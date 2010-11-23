class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_timezone

  layout 'application'

  def set_timezone
    Time.zone = current_user && current_user.timezone ? current_user.timezone : "UTC"
  end
end
