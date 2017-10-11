class ItemsController < ApplicationController
  def create
    @task = Task.find(params[ :task_id])
    @item = @task.items.create(item_params)
    redirect_to task_path( @task)
  end
  def destroy
    @task = Task.find(params[ :task_id])
    @item = @task.items.find(params[ :id])
    @item.destroy
    redirect_to task_path( @task)
  end
  private
    def item_params
      params.require( :item).permit(:title)
    end
end
