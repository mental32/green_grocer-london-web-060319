CART = [
  {"AVOCADO" => {:price => 3.00, :clearance => true}},
  {"KALE" => {:price => 3.00, :clearance => false}},
  {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
  {"ALMONDS" => {:price => 9.00, :clearance => false}},
  {"TEMPEH" => {:price => 3.00, :clearance => true}},
  {"CHEESE" => {:price => 6.50, :clearance => false}},
  {"BEER" => {:price => 13.00, :clearance => false}},
  {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
  {"BEETS" => {:price => 2.50, :clearance => false}}
]

COUPONS = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
]

def consolidate_cart(cart)
  cart.uniq.map { |e| e.merge({:count => cart.count(e)}) }
end

def apply_coupons(cart, coupons)
  for coupon in COUPONS do
    item = coupon[:item]
    num = coupon[:num]

    if cart.include? item
      count = cart[item][:count]

      if count > num
        cart[item][:count] -= coupon[:num]
      elsif count == num
        cart.delete(item)
      end
    end
  end

  cart
end
