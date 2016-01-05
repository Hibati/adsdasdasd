class AuthenticationsController < ApplicationController
  def new
  end

  def create
    Channel.from_omniauth(env["omniauth.auth"])
    redirect_to Channel
  end
 
  def destroy
    Channel.from_omniauth_delete
    redirect_to Channel
  end
end
