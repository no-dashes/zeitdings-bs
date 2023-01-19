class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    load_thing
    render layout: false
  end

  # POST /comments or /comments.json
  def create
    load_thing
    @comment = Comment.new(comment_params.merge(commentable: @thing))

    if @comment.save
      render :index, layout: false
      return
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

  def load_thing
    if params[:employee_id] then  @thing = Employee.find(params[:employee_id])
    elsif params[:office_id] then @thing = Office.find(params[:office_id])
    else
      raise "Dunno what to comment on!"
    end
  end

end
