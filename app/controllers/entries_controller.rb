class EntriesController < ApplicationController
   before_action :signed_in_user, only: [:create,:destroy]
   before_action :correct_user,   only: [:destroy]
  def index
  	
  end
  
  def show
        @entry=Entry.find([:id])
  end

  def create
  	 @entry = current_user.entrys.build(entries_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items=[]
      render 'static_pages/home'
    end
  end

  def destroy
    @entry.destroy
    redirect_to root_url
  end

  private

    def entries_params
      params.require(:entry).permit(:title,:body)
    end
    def correct_user
      @entry = current_user.entrys.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end
