class HighResolutionImageController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    thumbnails = HighResolutionImage.all
    render json: thumbnails
  end
end
