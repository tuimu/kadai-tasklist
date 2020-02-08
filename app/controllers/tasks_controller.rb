class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new(content: 'preset task')
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
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        if @task.save
            flash[:success] = 'Todo is updated!'
            redirect_to @task
        else
            flash.now[:danger] = 'Todo is remained...'
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = 'Todo is destroyed!'
        redirect_to tasks_url
    end
    
    private
    
    def task_params
        params.require(:task).permit(:content)
    end
    
end