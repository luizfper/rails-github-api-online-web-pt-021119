class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private

	def authenticate_user
		git_hub_oauth = 'https://github.com/login/oauth/authorize'
		client_id = ENV['CLIENT_ID']
		client_secret = ENV['CLIENT_SECRET']
		redirect_uri = 'http://localhost:3000/auth'
		redirect_to "#{git_hub_oauth}?client_id=#{client_id}" unless logged_in?
  end

	def logged_in?
		!!session[:token]
  end
end
