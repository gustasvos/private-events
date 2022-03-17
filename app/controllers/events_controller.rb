class EventsController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit]

    def index
        @events = Event.all
        @attendance = Attendance.new
    end

    def new
        @event = Event.new
    end

    def create
        # byebug
        # @event = Event.new(event_params)
        # @event.admin_id = current_admin.id

        @event = current_admin.created_events.build(event_params)
        if @event.save
            redirect_to root_url
        else
            # p @event.errors
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
