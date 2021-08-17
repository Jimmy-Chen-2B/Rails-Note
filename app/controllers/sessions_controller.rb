require 'digest'

class SessionsController < ApplicationController
  def create
    pw = user_params[:password]
    salted_pw = "xyz#{pw}34553522#{pw}02309"
    hashed_pw = Digest::SHA1.hexdigest(salted_pw)
    user = User.find_by(email: user_params[:email],
                        password: hashed_pw)

    if user
      session[:youget] = user.id
      redirect_to '/'
    else
      redirect_to '/users/sign_in'
    end
  end

  def destroy
    session[:youget] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end


