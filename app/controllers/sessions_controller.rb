require 'digest'

class SessionsController < ApplicationController
  def create
    pw = user_parama[:password]
    salt_pw = "xzy#{pw}"

    hashed_pw = Digest::SHA1.hexdigest(salt_pw)
    user = User.find_by(email: user_parama[:email],
                        password: hashed_pw)

    if user
      session[:ooxx] = user.id
      render html: 'OK'
    else
      redirect_to 'users/sign_in'
    end
  end

  private

  def user_parama
    params.require(:user).permit(:email, :password)
  end
end


