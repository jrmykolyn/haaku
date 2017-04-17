class InstructionSessionNotesController < ApplicationController

    def index
        @notes = InstructionSessionNote.all
    end

    def new
        @session = InstructionSession.find( params[ :instruction_session_id ] )
        @note = InstructionSessionNote.new
    end

    def create
        @session = InstructionSession.find( params[ :instruction_session_id ] )
        @note = InstructionSessionNote.new( instruction_session_note_params( params ) )

        if @note.save
            redirect_to instruction_session_instruction_session_note_path( @session, @note )
        else
            render :new
        end
    end

    def show
        @note = InstructionSessionNote.find( params[ :id ] )
    end

    private
    def instruction_session_note_params( params )
        return params.require( :instruction_session_note ).permit( :instruction_session_id, :title, :text )
    end

end
