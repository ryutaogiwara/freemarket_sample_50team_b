class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :category_set


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :profile_id, :card_info_id, :user_info_id, address_attributes: [:zipcord, :prefecture, :city, :address, :building_name, :phone_number], card_info_attributes: [:number, :month, :year, :security_code]])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def category_set
    @categories = Category.eager_load(children: :children).where(parent_id: 0)
  end

end
