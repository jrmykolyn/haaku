class CohortsController < ApplicationController


    def index
        @cohorts = Cohort.all
    end


    def new
        @cohort = Cohort.new
    end


    def create
        @cohort = Cohort.new( cohort_params( params ) )

        if @cohort.save
            redirect_to cohort_path( @cohort )
        else
            render :new
        end
    end


    def show
        @cohort = Cohort.find( params[ :id ] )
    end


    def edit
        @cohort = Cohort.find( params[ :id ] )
    end


    def update
    end


    def destroy
    end

    private
    def cohort_params( params )
        return params.require( :cohort ).permit( :name, :start_date )
    end


end
