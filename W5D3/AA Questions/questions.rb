require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        * 
      FROM 
        users 
      WHERE 
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        * 
      FROM 
        users 
      WHERE 
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def followed_questions 
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def authored_questions
    raise "#{self} not in database" unless @id
    Question.find_by_author_id(@id)
  end

  def authored_replies
    raise "#{self} not in database" unless @id
    Reply.find_by_user_id(@id)
  end
end

class Question
  attr_accessor :title, :body

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        * 
      FROM 
        questions 
      WHERE 
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def self.find_by_author_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        *
      FROM 
        questions
      WHERE 
       user_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map { |question| Question.new(question) }
  end

  def self.find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        * 
      FROM 
        questions 
      WHERE 
        title = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def followers   
    QuestionFollow.followers_for_question_id(@id)
  end

  def author
    raise "#{self} not in database" unless @id

    name = User.find_by_id(@user_id)
    "Author: #{name.fname} #{name.lname}"
  end

  def replies
    raise "#{self} not in database" unless @id

    Reply.find_by_question_id(@id)
  end
end

class QuestionFollow
  attr_accessor :title, :body

  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        users
      JOIN questions_follows
        ON users.id = questions_follows.user_id
      JOIN questions
        ON questions.id = questions_follows.question_id
      WHERE
        question_id = ? 
    SQL

    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        questions
      JOIN users
        ON users.id = questions.user_id
      JOIN questions_follows
        ON questions_follows.question_id = questions.id
      WHERE
        questions_follows.user_id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        * 
      FROM 
        questions_follows 
      WHERE 
        id = ?
    SQL
    return nil unless question_follow.length > 0

    QuestionFollow.new(question_follow.first)
  end

  def self.find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        * 
      FROM 
        questions 
      WHERE 
        title = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Reply

  def self.find_by_user_id(author_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        *
      FROM 
        replies
      WHERE 
        author_id = ?
    SQL
    return nil unless replies.length > 0

     replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        * 
      FROM 
        replies 
      WHERE 
        id = ?
    SQL
    return nil unless reply.length > 0

   Reply.new(reply.first)
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM 
        replies
      WHERE 
        question_id = ?
    SQL
    return nil unless replies.length > 0

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply = options['parent_reply']
    @author_id = options['author_id']
    @body = options['body']
  end

  def author 
    raise "#{self} not in database" unless @id

    name = User.find_by_id(@author_id)
    "Author: #{name.fname} #{name.lname}"
  end

  def question
    raise "#{self} not in database" unless @id

    Question.find_by_id(@question_id)
  end

  def parent_reply 
    @parent_reply
  end

  def child_replies 
    q_id = @question_id

    replies = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT 
        *
      FROM 
        replies
      WHERE 
        question_id = ? AND parent_reply IS NOT NULL
    SQL
    return nil unless replies.length > 0

    replies.map { |reply| Reply.new(reply) }
  end
end

class Question_likes
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end