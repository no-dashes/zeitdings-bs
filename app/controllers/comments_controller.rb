class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # POST /comments or /comments.json
  def create
    if params[:employee_id] then  @thing = Employee.find(params[:employee_id])
    elsif params[:office_id] then @thing = Office.find(params[:office_id])
    else
      raise "Dunno what to comment on!"
    end
    @comment = Comment.new(comment_params.merge(commentable: @thing))

    if @comment.save
      redirect_to(@thing,
        notice: "Comment was successfully created."
      )
    else
      flash[:danger] = "Comment could not be created."
      redirect_to(@thing)
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
