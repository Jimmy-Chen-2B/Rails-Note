class UsersController < ApplicationController
  def sign_up
    @users = User.new
  end

  def sign_in; end

  def profile; end
end
