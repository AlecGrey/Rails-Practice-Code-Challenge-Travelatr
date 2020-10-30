class BloggersController < ApplicationController

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(sanitized_params)

        if @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render new_blogger_path
        end
    end

    private

    def sanitized_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end