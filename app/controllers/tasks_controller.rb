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
    @tasks = Task.all
    @task = Task.find(params[:id])
  end

  def create
    task_params = params.require(:task).permit(:checked, :task_description)
    @task = Task.new(task_params) 
    @task.checked = false;
    @task.save
    redirect_to root_path
  end

  def update 
    @task = Task.find(params[:id])
    task_params = params.require(:task).permit(:checked, :task_description)
    @task.update(task_params) 
    redirect_to root_path 
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
    redirect_back(fallback_location: root_path)
  end

  def save
    tasks = params[:tasks]

    tasks.each do |task|
      task_status_update = task[0,1]
      task_id = task[1..-1]
      task = Task.find(task_id.to_i)

      if task_status_update == 'c'
        task.update(checked: true)
      else
        task.update(checked: false)
      end

    end

    redirect_to root_path

  end

end
