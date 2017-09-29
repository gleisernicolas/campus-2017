class TasksController < ApplicationController
  def index

    @tasks = Task.all()

  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new
    task.name = params[:task][:name]
    task.done = false
    task.save
    redirect_to root_path
  end

  def update
    task = Task.find(params[:id])
    task.name = params[:task][:name]
    task.save
    redirect_to task
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to root_path
  end
end
