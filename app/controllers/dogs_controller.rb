class DogsController < ApplicationController
    def index
      @dogs = Dog.all # Returns the list of all dogs
    end

    def new
      @dog = Dog.new #Creates a dog
    end

    def create
      @dog = Dog.create(user_params)
      if @dog.save
        redirect_to @dog #Go to the show view of the dog
      else
        render "new" #Go to the new view for the dog
      end
    end

    def show
      @dog = Dog.find(params[:id]) # What id the ID

    private

    def dog_params
      params.require(:dog, :age)
    end
end
