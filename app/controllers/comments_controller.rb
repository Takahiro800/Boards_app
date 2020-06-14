class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = @board.comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'コメントを投稿しました' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @comment, notice: 'コメントを投稿出来ませんでした><' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:board_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :name)
    end
end
