module QuestionsHelper

  def question_header(resources)

    if resources.persisted?
      "Edit #{resources.test.title} Question"
    else
      "Create New #{resources.test.title} Question"
    end
  end
end
