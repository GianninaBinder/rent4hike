class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @tools = policy_scope(Tool).where(category: params[:query].capitalize)
    else
      @tools = policy_scope(Tool).all
    end
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def edit
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tool_url(@tool), notice: "Tool was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @tool
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_url, notice: "Tool was successfully destroyed."
    authorize @tool
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :category, :description, :price, :photo)
  end
end
