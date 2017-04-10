class BookmarksController < ApplicationController

  def create
    bookmark_params = params.require(:bookmark).permit(:user_id, :experiment_id)
    experiment = Experiment.find_by_id(bookmark_params[:experiment_id])
    if experiment.approved == true
      @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        redirect_to experiment_path(@bookmark.experiment_id), notice: 'Experiment added to your list'
      else
        redirect_to experiment_path(@bookmark.experiment_id), alert: 'There was an error in adding this experiment to your list'
      end
    else
      flash.now[:alert] = 'Sorry, this experiment is in development and can\'t be added to your list yet'
      render experiment_path(bookmark_params[:experiment_id])
    end
  end

  def destroy
    user_bookmark = Bookmark.find_by_id(params[:id])
    if user_bookmark.destroy
      redirect_to experiment_path(user_bookmark.experiment_id), notice: 'Experiment removed from your list'
    else
      redirect_to experiment_path(user_bookmark.experiment_id), alert: 'There was an error in removing this experiment to your list'
    end
  end

end
