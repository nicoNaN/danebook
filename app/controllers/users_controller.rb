class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :redirect_if_signed_in, only: :new

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def search
    @users = User.search(params[:search])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(current_user.id)
    @profile = Profile.find(current_user.profile.id)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @new_profile = @user.build_profile(generate_profile)
    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html { redirect_to user_profile_path(@user.id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        User.send_welcome_email(@user).deliver
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :birthday, :gender, :password, :password_confirmation)
    end

    # perform this after user creation using a model callback
    def generate_profile
      { user_id: @user.id,
      college: Faker::Lorem.word.capitalize + ' University',
      hometown: Faker::Address.city + ', ' + Faker::Address.state_abbr,
      residence: Faker::Address.city + ', ' + Faker::Address.state_abbr,
      phone_number: Faker::Number.number(10),
      quotes: Faker::Lorem.sentence,
      about: Faker::Lorem.paragraph }
    end

    def redirect_if_signed_in
      redirect_to user_profile_path(current_user.id) if signed_in_user?
    end
end
