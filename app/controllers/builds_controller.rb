class BuildsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

  def index
  	@builds = Build.all
  end

  def show
  	@build = Build.find(params[:id])
  end

  def new
  	@build = Build.new
  end

  def create
  	@build = Build.new(build_params)
  	@build.user_id = current_user.id
  	if @build.save
  	redirect_to build_path(@build), notice:'投稿に成功しました'
  	else
  	render :new
  	end
  end

  def edit
  	@build = Build.find(params[:id])
  	if @build.user != current_user
  		redirect_to builds_path, alert: '不正なアクセスです'
  	end
  end

  def update
  	@build = Build.find(params[:id])
  	if @build.update(build_params)
  	redirect_to build_path(@build), notice:'更新に成功しました'
  	else
  	render :edit
  	end
  end

  def destroy
  	build = Build.find(params[:id])
  	build.destroy
  	redirect_to builds_path
  end

  private
  def build_params
  	params.require(:build).permit(:title, :body, :image)

  end
end
