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

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to @event
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to root_url
    end

    private
        def event_params
            params.require(:event).permit(:title, :description, :location, :date)
        end
end
