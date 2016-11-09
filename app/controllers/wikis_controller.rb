require "custom_logger"

class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def create
    #Rails.logger.info "We're starting the controller #{current_user.inspect}"
    # @wiki = Wiki.new
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]
    # @wiki.private = params[:wiki][:private]
    # @wiki.user = current_user
    #Rails.logger.warn(params)
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
     flash[:notice] = "Wiki article was updated."
     redirect_to @wiki
    else
     flash[:error] = "There was an error saving the wiki. Please try again."
     render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
     flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
     redirect_to @wiki
    else
     flash[:error] = "There was an error deleting the wiki."
     render :show
   end
  end
end
