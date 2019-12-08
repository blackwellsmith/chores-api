class Api::V1::ChoresController < ApplicationController

    def index 
        @chores = Chore.all
        render json: @chores, status: 200
    end

    def show
       @chore = Chore.find(params[:id])
       render json: @chore, status: 200
    end
# if statements are needed for create and update render error for invalid 
    def create
        #binding.pry
       @chore = Chore.create(chore_params)
       render jsoan: @chore, status: 200 
    end

    def update
        @chore = Chore.find(params[:id])
        @chore.update(chore_params)
        render json: @chore, status: 200
    end

    def destroy
        @chore = Chore.find(params[:id]) 
        @chore.delete
        render json: {choreId: @chore.id}
    end
        

    private

    def chore_params
        params.require(:chore).permit(:name,:description)
    end
end
