class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    # -- This is all mostly for Super Admin Dashboard
    if user_signed_in? and current_user.has_role?(:moderator, :any)
      @dealership = Dealership.with_role(:moderator, current_user).first
      @customers = @dealership.users
      puts "In user singed in and has role moderator"
    elsif user_signed_in? and current_user.has_role?(:admin)
      @moderators = User.with_role(:moderator, :any)
      @sales_reps = User.with_role(:sales_rep, :any)
      @service_reps = User.with_role(:service_rep, :any)
      @customers = User.all
      puts "Im signed in as a admin"
    end
  end
end
