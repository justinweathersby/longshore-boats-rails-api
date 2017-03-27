class ServiceRepsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  # authorize_resource :class => false

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    @dealership = Dealership.find(params[:dealership_id])
    if @user.valid? and @dealership.present?
        @user.add_role :service_rep, @dealership
        @user.dealership_id = @dealership.id
        if @user.save
          redirect_to root_url, notice: 'Service Representative was successfully created.'
        else
          render :new, notice: @user.errors
        end
    else
      render :new, notice: @user.errors
    end
  end

  def edit
    @rep = User.find(params[:id])
  end

  def update
    @rep = User.find(params[:id])
    respond_to do |format|
      if @rep.update_attributes(update_params)
        format.html do
          redirect_to root_url, notice: 'Service Representative was successfully edited'
        end
      else
        format.html { render :edit}
        flash[:notice] = @rep.errors
      end
    end
  end

  private

  def sign_up_params
    params[:service_rep].permit(:name, :email, :password, :password_confirmation, :dealership_id, :image)
    # params.permit(:first_name,:last_name,:company_name,:organization_name ,:officer_name,:email, :password, :password_confirmation)
  end

  def update_params
    params[:user].permit(:name, :email, :password, :password_confirmation, :dealership_id, :image)
  end
end
