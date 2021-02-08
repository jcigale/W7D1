class UsersController < ApplicationController
    def new
        # dummy 
        @user = User.new
    end
    
    def user_params

    end

    def create
        @user = User.new(user_params)   
    end




end