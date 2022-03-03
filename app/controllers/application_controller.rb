class ApplicationController < ActionController::Base
  before_action :set_locale
  skip_before_action :verify_authenticity_token
  def set_locale
    if user_signed_in? && current_user.locale == 'en'
      I18n.locale = :en
    else
      I18n.locale = :vi
    end
  end
end
