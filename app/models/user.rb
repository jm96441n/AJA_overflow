class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :questions
  has_many :favorites
  has_many :answers
  has_many :votes

  validates :recovery_first_pet, :recovery_first_street, :recovery_mom_maiden_name, :last_name, :first_name, :password_digest, presence: true
  validates :username, :email, uniqueness: true, presence: true


  def find_by(user_id)
    User.find_by(id: user_id)
  end

  def favorited_answers 
    favorites = Favorite.all
    answers = Answer.all
    answer_array = []
    fav_array = []

    favorites.each do |fav|
      if self.id == fav.user_id && fav.favoritable_type == "Answer"
        fav_array << fav
      end
    end

    fav_array.each do |fav|
      answers.each do |ans|
        if fav.favoritable_id == ans.id
          answer_array << ans
        end
      end
      answer_array
    end
    answer_array
  end

  def favorited_questions 
    favorites = Favorite.all
    question = Question.all
    question_array = []
    fave_array = []

    favorites.each do |fav|
      if self.id == fav.user_id && fav.favoritable_type == "Question"
        fave_array << fav
      end
    end

    fave_array.each do |fav|
      questions.each do |ques|
        if fav.favoritable_id == ques.id
          question_array << ques
        end
      end
      question_array
    end
    question_array
  end

end
