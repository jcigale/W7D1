class ApplicationController < ActionController::Base
    #current user is not available in view without helper method
    helper_method :current_user, :logged_in?
    
    
    def login!(user)
        user.reset_session_token!
        self.session[:session_token] = user.session_token
    end

    def current_user
        if self.session[:session_token].nil?
            return nil
        end
        @user ||= User.find_by(session_token: self.session[:session_token])
    end

    def logout!
        current_user.try(:reset_session_token)
        self.session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end
    
    def login_user!
        @user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password],
        )
        if @user.nil?
            render :new
        else
            login!(@user)
            redirect_to cats_url
        end
    end

    def require_log_in
        redirect_to new_session_url unless logged_in?
    end

    def require_log_out
        redirect_to cats_url
    end
end
