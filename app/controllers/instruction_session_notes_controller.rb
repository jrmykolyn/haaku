class InstructionSessionNotesController < ApplicationController
    
    def index
        @notes = InstructionSessionNote.all
    end
    
end
