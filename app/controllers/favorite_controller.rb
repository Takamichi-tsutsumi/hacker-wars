class FavoriteController < ApplicationController
  def favorite
  	@favorite = Favorite.create(user_id: 1, photo_id: params[:id])

  	respond_to do |format|
		format.html { render :layout => false }
		format.js { render :favorite}
  	end
  end
end
