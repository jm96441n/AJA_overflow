post "/tag_questions/new" do
	@tag_question = TagQuestion.new(question_id: session["quest_id"], tag_id: params["tag_id"].to_i)
	if @tag_question.save
		if request.xhr?
			return true
		end
	end
end