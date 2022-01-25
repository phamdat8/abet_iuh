class ApplicationController < ActionController::Base
  before_action :set_locale
  def set_locale
    if user_signed_in? && current_user.locale == 'en'
      I18n.locale = :en
    else
      I18n.locale = :vi
    end
  end
end
