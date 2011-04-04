class Admin::UsersController < Admin::AdminController
  respond_to :html
  expose(:users) { User.all }
  expose(:user)

  def index

  end

  def new

  end

  def create
    user = User.new(params[:user])
    flash[:notice] = 'Tenemos participante!' if user.save
    respond_with user, :location => admin_users_path
  end
end
