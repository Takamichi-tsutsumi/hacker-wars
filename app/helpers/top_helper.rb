module TopHelper

	def user_favorite_check(user, photo_id)
		if user
			if Favorite.where(user_id:user.id).where(photo_id: photo_id).exists?
				return true
			else
				return false
			end
		else
			return false
		end
	end

	
end
