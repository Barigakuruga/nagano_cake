class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :customer
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :telephone_number])
  end

  def authenticate_customer!
    if customer_signed_in?
      super
    else
      redirect_to new_customer_session_path, alert: "指定のページを表示するには、ログインが必要です。"
    end
  end

  def authenticate_admin!
    if admin_signed_in?
      super
    else
      redirect_to new_admin_session_path, alert: "指定のページを表示するには、管理者ログインが必要です。"
    end
  end

end
