require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "first stuff" do
    user = User.new(email: 'ph@tickettoaster.de')
    assert_not user.save
    user.password = 'lkhgkjgkfgfgk'
    assert_not user.save
    user.name = 'Peter'
    assert user.save
  end

  test "email uniqueness" do
    user = User.create!(email: 'ph@tickettoaster.de', name: 'Peter', password: "sdasdsada")
    user2 = User.new(email: 'ph@tickettoaster.de', name: 'Christopf', password: "sdasdsada")
    assert_not user2.save
    assert_equal user2.errors.map(&:attribute), [:email]
  end

  test "fancy computations" do
    user = User.create!(email: 'ph@tickettoaster.de', name: 'Peter', password: "sdasdsada")
    assert_equal user.compute_fancy(1,2), 3
    assert_equal user.compute_fancy(6,9), 15
  end

  test "raises on missing email" do
    user = User.create(name: 'Peter', password: "sdasdsada")
    assert_raises(ActiveRecord::RecordInvalid) { user.save! }
  end

  test "using fixtures" do
    user = users(:diffdoff)
    assert_equal user.name, 'Christoph'
  end
end
