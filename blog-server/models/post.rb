class Post < Sequel::Model
  one_to_many :comments

  def validate
    super
    errors.add(:title, "cannot be empty") if !title || title.empty?
    errors.add(:body, "cannot be empty") if !body || body.empty?
  end
end
