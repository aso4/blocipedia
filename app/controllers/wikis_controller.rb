require 'custom_logger'

class WikisController < ApplicationController
    def index
        # @wikis = Wiki.all
        @wikis = policy_scope(Wiki.all)
    end

    def create
        @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
        @wiki.user = current_user

        if @wiki.save
            flash[:notice] = 'Wiki was saved.'
            redirect_to @wiki
        else
            flash.now[:alert] = 'There was an error saving the wiki. Please try again.'
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
        if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :private))
            flash[:notice] = 'Wiki article was updated.'
            redirect_to @wiki
        else
            flash[:error] = 'There was an error saving the wiki. Please try again.'
            render :edit
        end
    end

    def destroy
        @wiki = Wiki.find(params[:id])
        authorize @wiki

        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to @wiki
        else
            flash[:error] = 'There was an error deleting the wiki.'
            render :show
        end
    end
end
