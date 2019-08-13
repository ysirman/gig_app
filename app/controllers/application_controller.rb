class ApplicationController < ActionController::Base

    # deviseコントローラーにストロングパラメータを追加     
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
    def configure_permitted_parameters
        added_attrs = [:login_name, :name, :region, :profile, :men_num, :women_num]
        # サインアップ時のストロングパラメータ
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        # アカウント編集時のストロングパラメータ
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
