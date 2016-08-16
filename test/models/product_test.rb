# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attachment  :string
#  is_hidden   :boolean          default(TRUE)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
