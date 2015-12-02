class SessionsController < ApplicationController

  def new
  end

 # サインインの失敗
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーをサインインさせ、ユーザーページ (show) にリダイレクトする。
      sign_in user
      redirect_to user
      
    else
     # そのページのみにエラーメッセージを表示する
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
