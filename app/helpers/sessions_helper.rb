module SessionsHelper
  # サインインメソッド
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  # 現在サインイン状態かの確認
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  # cokkieのユーザー情報を確認する。
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  # Sessionsヘルパーモジュールのsign_outメソッド
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
end
