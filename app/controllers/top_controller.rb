class TopController < ApplicationController

	def react_index
		@photos = Photo.all
	end


  def index
  	@photo = Photo.all
  	@photos = Photo.order('created_at DESC').where(created_at:Time.new(2014, 11, 28, 1, 1, 0, "+09:00")..(Time.now))
  end

  def update_photos
    if !params[:category].blank?
      category = Category.where(name: params[:category]).first
      if params[:season].to_i == 0
        @photos = Photo.where(category_id: category.id)
      else
        @photos = Photo.where(season: params[:season]).where(category_id: category.id)
      end
    else
      if params[:season].to_i == 0
        @photos = Photo.all
      else
        @photos = Photo.where(season: params[:season])
      end
    end

    respond_to do |format|
      format.js {render 'update_photos'}
      # format.html {render 'index'}
    end
  end


  def my_page
  	@photos = User.find(current_user.id).photos
  	
  	season_category = []
  	for season in 1..4 do
  		for category_id in 2..4 do
  			season_category.push(@photos.where(season:season).where(category_id:category_id).count)
  		end
  	end
  	num = season_category.index(season_category.max)
  	case num
  	when 0 then
  		recommend = [1, 2]
  	when 1 then
  		recommend = [1, 3]
  	when 1 then
  		recommend = [1, 4]
  	when 0 then
  		recommend = [2, 2]
  	when 1 then
  		recommend = [2, 3]
  	when 1 then
  		recommend = [2, 4]
  	when 0 then
  		recommend = [3, 2]
  	when 1 then
  		recommend = [3, 3]
  	when 1 then
  		recommend = [3, 4]
  	when 0 then
  		recommend = [4, 2]
  	when 1 then
  		recommend = [4, 3]
  	when 1 then
  		recommend = [4, 4]
  	else
  		recommend = []
  	end

  	unless recommend.empty?
  		@recommend_photos = Photo.where(season: recommend[0], category_id:recommend[1]).reverse
  		if @recommend_photos.count < 3
  			@recommend_photos = Photo.order("created_at DESC")
  		end
  	end

  end

end
