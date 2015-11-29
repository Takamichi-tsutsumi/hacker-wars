class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(params[:id])
    photos = @organization.photos
    @images = {}
    Category.all.each do |category|
    	@images[category.name.to_s] = photos.where(category_id: category.id).first
    end
  end
end
