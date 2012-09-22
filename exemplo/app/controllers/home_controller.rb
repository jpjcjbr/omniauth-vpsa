class HomeController < ApplicationController
  def index
  	info = session[:omniauth_auth][:info]
  	@id_terceiro = info['id_terceiro']
  end
end
