class UsersController < ApplicationController
    def login
        
    end
    
    
    def register
        
    end
    
    def login_fail
        
    end
    
    def wrong_input
        
    end
    
    def confirm
        @user = User.find_by user_name: params[:user][:user_name]
        if @user && @user.user_pass == params[:user][:user_pass]
            redirect_to @user
        else
            redirect_to login_fail_path
        end
    end
    
    def feedback
        if User.find_by user_name: params[:user][:user_name]
            redirect_to wrong_input_path
        elsif params[:user][:user_pas] != params[:user][:user_pass_confirm]
            redirect_to wrong_input_path
        else
            @user = User.new(user_params)
            if @user.save
                redirect_to @user
            else
                render 'login'
            end
        end
    end
    
    def profile
        
    end
    
    def conf_web
        @user = User.find(params[:user_id])
    end
    
    def conf
        @user = User.find(params[:user_id])
        if @user
            @user.update(user_pass: params[:user][:user_pass])
            redirect_to @user
        end
    end
    
    def show
        @user = User.find(params[:user_id])
    end
    
    def index
        @users = User.all
    end
    
    private
    def user_params
        params.require(:user).permit(:user_name, :user_pass, :user_pass_confirm)
    end
end
