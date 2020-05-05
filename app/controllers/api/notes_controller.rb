class Api::NotesController < ApplicationRecord
    skip_before_action :verify_authenticity_token


    def all_notes
        @notes = Note.all
        render json:{
			      response_code: 200,
			      response_message: "OK",
			      notes: @notes
	    	}
    end

    def create_note
        @notes = Note.new(note_params)
        @notes.save
        render json:{
                response_code: 200,
                response_message: "OK" }
    end

    def update
        @notes = Note.find(params[:id])
        @notes.update(note_params)
        render json: {
        status: 200,
        response_message: "OK"
        }
    end

    def find_note
        @notes = Note.find(params[:id])
        render json: {
        status: 200,
        note: @notes
        }
    end

    def destroy
        @notes = Note.find(params[:id])
        @notes.delete
        render json: {
        status: 200,
        response_message: "OK"
        }
    end

    protected

	def note_params
	  params.permit(:note_title,:note_details)      
	end

end