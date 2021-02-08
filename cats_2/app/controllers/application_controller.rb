class ApplicationController < ActionController::Base
    #current user is not available in view without helper method
    helper_method :current_user
    
    def login!(user)
        user.reset_session_token!
        self.session[:session_token] = user.session_token
    end

    def current_user
        if self.session[:session_token].nil?
            reutrn nil
        end
        @user ||= User.find_by(session_token: self.session[:session_token])
    end

    def logout!
        current_user.try(:reset_session_token)
        self.session[:session_token] = nil
        @current_user = nil
    end


    
end
