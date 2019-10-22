class Users::RegistrationsController < Devise::RegistrationsController
  # uid=nil防止のため、ユーザー登録（deviseのcreateアクション）で使用するメソッドを上書き
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      user_path(current_user.id)
    end
end
