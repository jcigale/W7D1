class UsersController < ApplicationController
    def new
        # dummy 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
    end




end