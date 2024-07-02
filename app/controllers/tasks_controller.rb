class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.all
  end

  def new
    @tasks = Task.all
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task_params = params.require(:task).permit(:checked, :task_description)
    @task = Task.new(task_params) 
    @task.save
    redirect_to root_path
  end

  def update 
    @task = Task.find(params[:id])
    task_params = params.require(:task).permit(:checked, :task_description)
    @task.update(task_params) 
    redirect_to @task  
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
    redirect_back(fallback_location: root_path)
  end

end
