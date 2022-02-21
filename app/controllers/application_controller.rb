class ApplicationController < ActionController::Base
    helper_method :file_size_verbose
    before_action :configure_permitted_parameters, if: :devise_controller?

    def file_size_verbose(byte)
        @kb = byte / 1024
        if @kb < 1024
            return "#{@kb} KB"
        end
        @mb = @kb / 1024
        if @mb < 1024
            return "#{@mb} MB"
        end
        @gb = @mb / 1024
        return "#{@gb} GB"
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,
        keys: [:username, :fullname, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in,
        keys: [:login, :password])
        devise_parameter_sanitizer.permit(:account_update,
        keys: [:username, :email, :password_confirmation, :current_password])
    end
end
