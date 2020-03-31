class SubsController < ApplicationController
    before_action :is_moderator?, only: [:edit]

    def index 
        @subs = Sub.all
        render :index
    end

    def edit 
        self.title = params[:title]
        self.description = params[:description]

    end 

    def is_moderator?
        return false if current_user.nil?
        current_user.id == self.moderator_id
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    private 

    def sub_params
        params.require(:sub).permit(:title, :description)
    end 

end
