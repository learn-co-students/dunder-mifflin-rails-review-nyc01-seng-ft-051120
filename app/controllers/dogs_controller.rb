class DogsController < ApplicationController
    def index
        # @dogs = Dog.all
        @dogs = Dog.ordered_by_humans_number

    end
    def show
        @dog = Dog.find(params[:id])
    end
end
