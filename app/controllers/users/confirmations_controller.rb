class Devise::ConfirmationsController < DeviseController
  prepend_before_action :require_no_authentication, only: [:new, :create, :show]
  prepend_before_action :authenticate_scope!, only: [:edit, :update]

  # POST /users/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /users/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :confirmed : :already_confirmed
      set_flash_message!(:notice, flash_message)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  protected

  def after_resending_confirmation_instructions_path_for(resource_name)
    new_session_path(resource_name) if is_navigational_format?
  end

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      signed_in_root_path(resource)
    else
      new_session_path(resource_name)
    end
  end
end
