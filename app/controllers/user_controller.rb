class UserController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # display the user
  def show
    user = User.find_by(id: params[:id])
    render json: user,status: :ok
  end
  def create
    user = User.create!(user_params)
    token = encode_token(user_id: user.id)
    # user_data = current_user# Call the method without overwriting it
    render json: { user: UserSerializer.new(user), jwt: token }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {}, status: 204
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end
  def render_not_found_response
    render json: {error: "User not found"}, status: 404
  end
end
