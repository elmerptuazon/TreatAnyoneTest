class UsersController < ApplicationController
    def index
    end

    def checkCredentials
        @user = User.where(email: params[:user][:email]).first
        

        if @user.present?
            pw = @user.password_digest == params[:user][:password_digest] ? true : false
            if pw
                redirect_to user_articles_path(@user.id), id: @user.id
            else
                flash[:danger] = 'Incorrect Login Credentials'
                redirect_to root_path
            end
        else
            flash[:danger] = 'Incorrect Login Credentials'
            redirect_to root_path
        end

        # render json: {
        #     data: @user.present?
        # }
    end

    def create
        @user = User.new(user_params)

        @user.save
        flash[:success] = 'Successfully Registered'
        redirect_to root_path
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password_digest)
        end

    private
        def user_email_params
            params.require(:user).permit(:email, :email)
        end
end
