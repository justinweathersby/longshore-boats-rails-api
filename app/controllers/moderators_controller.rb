class ModeratorsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource :class => false

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    @dealership = Dealership.find(params[:dealership_id])
    if @user.valid? and @dealership.present?
        @user.add_role :moderator, @dealership
        @user.dealership_id = @dealership.id
        if @user.save
          redirect_to root_url, notice: 'Moderator was successfully created.'
        else
          render :new, notice: @user.errors
        end
    else
      render :new, notice: @user.errors
    end
  end

  def edit
      @moderator = User.find(params[:id])
  end
  # def show
  #   @user = current_user
  # end

  def update
  	@moderator = User.find(params[:id])
    respond_to do |format|
    	if @moderator.update_attributes(update_params)
        format.html do
          redirect_to root_url, notice: 'Moderator was successfully edited'
        end
    	else
        format.html { render :edit}
        flash[:notice] = @moderator.errors
      end
  	end
  end

  # def reset_password
  #   @user = User.find_by_email(params[:user][:email])
  #   if @user.present?
  #     # @user.send_reset_password_instructions
  #     # render json: { "result" => "Email with reset instructions has been sent"}, status: :ok
  #   else
  #    render json: { "errors" => "Email not found"}, status: 422
  #   end
  # end

  private

  def sign_up_params
    params[:moderator].permit(:name, :email, :password, :password_confirmation, :dealership_id, :image)
    # params.permit(:first_name,:last_name,:company_name,:organization_name ,:officer_name,:email, :password, :password_confirmation)
  end

  def update_params
    params[:user].permit(:name, :email, :password, :password_confirmation, :dealership_id, :image)
  end
end
