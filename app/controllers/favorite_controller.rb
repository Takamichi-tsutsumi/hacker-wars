class FavoriteController < ApplicationController

  def favorite
  	if !user_signed_in?
  		respond_to do |format|
  			# format.html { render :index }
  			format.js { render :loginless }
  		end
  	else

	  	@favorite = Favorite.create(user_id: current_user.id, photo_id: params[:id])

	  	respond_to do |format|
			format.html { render :layout => false }
			format.js { render :favorite}
	  	end
	end
  end
end
