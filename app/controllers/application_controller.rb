class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :name])
        devise_parameter_sanitizer.permit(:edit, keys: [:avatar, :name])
    end

    def admin?
        current_user.admin == true
    end
end
