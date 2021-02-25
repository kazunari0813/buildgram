class FavoritesController < ApplicationController

	def create
		build = Build.find(params[:build_id])
		favorite = current_user.favorites.new(build_id: build.id)
		favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		build = Build.find(params[:build_id])
		favorite = current_user.favorites.find_by(build_id: build.id)
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end
