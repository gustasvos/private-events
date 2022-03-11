class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        # byebug
        @event = Event.new(event_params)
        @event.admin_id = current_admin.id

        if @event.save
            redirect_to root_url
        else
            render 'new'
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def destroy
        
    end

    private
        def event_params
            params.require(:event).permit(:title, :location, :date)
        end
end
