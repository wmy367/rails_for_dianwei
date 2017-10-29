class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email:params[:session][:email].downcase)
        user = User.find_by(name:params[:session][:email]) unless user

        if user
            if user.authenticate(params[:session][:password])
                sign_in user
                redirect_back_or root_path
            else
                flash[:error] = "密码有错"
                render 'new'
            end
        else
            flash[:error] = "错误 没有 #{params[:session][:email]} 用户"
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end
end
