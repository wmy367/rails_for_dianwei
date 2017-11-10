class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,only:[:edit,:update,:crop,:crop_update]
  before_action :correct_user,only:[:edit,:update,:crop,:crop_update]
  before_action :correct_admin,only: :destroy

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
      @user = User.find(params[:id])
      @uitems = @user.items.paginate(page: params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    #   render :crop
  end

  def crop
      @user = User.find(params[:id])
    # #   @fileimsize = @user.avatar
    #   render :crop
  end

  def crop_update
    if params[:user].nil? || user_avatar_param.nil?
        @user = User.find(params[:id])
        render :crop
        return
    end
    @user = User.find(params[:id])
    if @user.update_attribute(:avatar,params[:user][:avatar])
    # if @user.update_attribute(:avatar,user_avatar_param)
        redirect_to @user, notice: '头像变更完成'
    else
        @user = User.find(params[:id])
        render :crop
    end
    #   redirect_to "crop"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    # respond_to do |format|
      if @user.save
        #   if params[:user][:avatar].present?
            sign_in @user
              render :crop
        #   else
            #   redirect_to @user, notice: 'User was successfully created.'
            #   format.html { redirect_to @user, notice: 'User was successfully created.' }
            #   format.json { render :show, status: :created, location: @user }
        #   end
      else
          render :new
        # format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # respond_to do |format|
      if params[:user] && @user.update(user_params)
        #   if params[:user][:avatar].present?
        #       flash.now[:success] = '更新头像'
        #       render :crop
        #     # redirect_to action: 'crop',notice:'更新头像'
        #   else
            redirect_to @user, notice: '信息变更完成'
            #   format.html { redirect_to @user, notice: 'User was successfully updated.' }
            #   format.json { render :show, status: :ok, location: @user }
        #   end
      else
          render :edit
        # format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
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
      params.require(:user).permit(:name, :email,:school_serial,:phone,:avatar,:gender,:curr_localtion,:password,:password_confirmation)
    end

    def user_avatar_param
        params.require(:user).permit(:avatar)
    end

    def correct_user
        user = User.find(params[:id])
        unless current_user?(user) || curr_admin?
            redirect_to root_path
        end
    end

    def correct_admin
        unless curr_admin?
            redirect_to root_path
        end
    end

end
