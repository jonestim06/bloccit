class AdvertisementController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisment = Advertisement.new
  end

  def create
    @advertisment = Advertisement.new
    @advertisment.title = params[:advertisement][:title]
    @advertisment.body = params[:advertisement][:body]
    @advertisment.price = params[:advertisement][:price]

    if @advertisment.save
      flash[:notice] = "Advertisement was saved"
      redirect_to @advertisment
    else
      flash[:error] = "There was an error. Please try again"
      render :new
    end
  end
end
