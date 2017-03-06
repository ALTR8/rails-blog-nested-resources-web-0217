class CommentsController < ApplicationController

	def index
	end

	def create
    	@comment = Comment.new(comment_params)
    	@comment.save
    	respond_to do |format|
      		if @comment.save
        		format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        		format.json { render action: 'show', status: :created, location: @comment }
      		else
        		format.html { render action: 'new' }
        		format.json { render json: @comment.errors, status: :unprocessable_entity }
      		end
      	end
    end


	private

		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end
end
