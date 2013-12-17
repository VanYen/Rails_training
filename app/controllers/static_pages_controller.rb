class StaticPagesController < ApplicationController
  def home
  	if signed_in?
	  	@entry = current_user.entrys.build if signed_in?
	  	@feed_items = current_user.feed.paginate(page: params[:page])
      @entries=Entry.paginate(page: params[:page])
  	end
  end

  def all
    @entries=Entry.paginate(page: params[:page])
  end
end
