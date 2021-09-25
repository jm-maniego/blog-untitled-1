class Comment < Sequel::Model
  many_to_one :post

  def validate
    super
    errors.add(:name, "cannot be empty") if !name || name.empty?
    errors.add(:body, "cannot be empty") if !body || body.empty?
  end
end
