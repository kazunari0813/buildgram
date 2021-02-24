class BuildsController < ApplicationController
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
  	@build.save
  	redirect_to build_path(@build)
  end

  def edit
  	@build = Build.find(params[:id])
  end

  def update
  	@build = Build.find(params[:id])
  	@build.update(build_params)
  	redirect_to build_path(@build)
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
