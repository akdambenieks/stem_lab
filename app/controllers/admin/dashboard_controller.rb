class Admin::DashboardController < Admin::BaseController

  before_action :find_user, only: [:show, :approve_user]


  def index
    @users = User.order(id: :asc)
  end


  def approve_user
    if @user.update(approved: true)
      flash[:notice] = 'User verified and approved'
      redirect_to admin_dashboard_index_path
    end
  end

  def show
  end

  private

  def find_user
    @user = User.find_by_id params[:id]
  end

end
