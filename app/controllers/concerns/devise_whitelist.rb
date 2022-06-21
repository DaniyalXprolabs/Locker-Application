module DeviseWhitelist
  extend ActiveSupport::Concern
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys:[:phone_number])
  end
end
