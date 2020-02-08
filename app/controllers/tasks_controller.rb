class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new(content: 'New Task', status: 'New')
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = 'Todo is created!'
            redirect_to @task
        else
            flash.now[:danger] = 'Todo is missed...'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        
        if @task.save
            flash[:success] = 'Todo is updated!'
            redirect_to @task
        else
            flash.now[:danger] = 'Todo is remained...'
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'Todo is destroyed!'
        redirect_to tasks_url
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
end
