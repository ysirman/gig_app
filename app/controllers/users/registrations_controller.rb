class Users::RegistrationsController < Devise::RegistrationsController
  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      user_path(current_user.id)
    end
end
