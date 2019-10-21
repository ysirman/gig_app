class Users::RegistrationsController < Devise::RegistrationsController
  # uid=nil防止のため、ユーザー登録（deviseのcreateアクション）で使用するメソッドを上書き
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end
end
