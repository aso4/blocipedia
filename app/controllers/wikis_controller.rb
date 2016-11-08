require "custom_logger"

class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def create
    #Rails.logger.info "We're starting the controller #{current_user.inspect}"
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user
    #Rails.logger.warn(params)

    if @wiki.save
      flash[:notice] = "wiki was saved."
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
  end
end
