class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :password_verify, only: [:update]
  before_action :set_user

  def edit
  end

  def update
    if @user.update(params_user)
      sign_in(@user, bypass: true)
      redirect_to users_backoffice_profile_path, notice: 'Usuário atualizado com sucesso...'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def password_verify
    params[:user].extract!(:password, :password_confirmation) if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  end
end
