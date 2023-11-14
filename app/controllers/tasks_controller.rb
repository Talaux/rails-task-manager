# This shiny device
class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(params[:tasks])
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

private

def task_params
  params.require(:task).permit(:title, :details)
end

end
