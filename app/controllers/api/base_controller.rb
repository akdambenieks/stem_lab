class Api::BaseController < ApplicationController
  # protect_from_forgery with: :null_session

  # before_action :authenticate, except: [:index, :show]
  #
  # private
  #
  # def authenticate
  #   @user = User.find_by_api_key params[:api_key]
  #   head :unauthorized unless @user.present?
  # end
end
