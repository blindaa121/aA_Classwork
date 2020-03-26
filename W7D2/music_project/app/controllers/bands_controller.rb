class BandsController < ApplicationController
    def index 
        @bands = Band.all 
    end 

    def create 
        band = Band.create(new_band_params)
        if band.save 
            redirect_to band_url(band)
        else   
            render :new
        end
    end 

    def new 
        @band = Band.new
        render :new
    end 

    def edit 
        @band = Band.find(params[:id])
        render :edit
    end 

    def show 
        @band = Band.find(params[:id])
        render :show
    end 

    def update 
        @band = Band.find(params[:id])
        if @band.update_attributes(new_band_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end 

    def destroy
        band = Band.find(params[:id])
        band.destroy
        redirect_to bands_url
    end

    private 

    def new_band_params
        params.require(:band).permit(:name)
    end 
end
