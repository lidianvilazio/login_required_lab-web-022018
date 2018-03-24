class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def show

  end

  def index
  end

  def new
  end

  def create
    if params[:name] && :name && params[:name].empty? == false
      session[:name] = params[:name]
      redirect_to controller: 'secrets', action: 'show'
    else
      redirect_to controller:'sessions', action:'new'
    end
  end

  def destroy
    session.delete :name
    redirect_to controller: 'application', action: 'hello'
  end
  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
