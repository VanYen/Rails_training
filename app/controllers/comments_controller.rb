class CommentsController < ApplicationController
	
  def new
		@comment=Comment.new
	end

	def create
      @comment = Comment.create(comment_params)
      if @comment.save
        flash[:success] = "Comment created!"
        redirect_to :back
      else
        render 'static_pages/home'
      end
  end

  private

    def comment_params
      params.require(:comment).permit(:content,:user_id,:entry_id)
    end
end
