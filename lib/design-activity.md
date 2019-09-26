1) What classes does each implementation include? Are the lists the same?
  In Implementation A & B, they both have classes for ClassEntry, ShoppingCart, and Order. However, the lists are not the same. Inside of the classes, each implementation has a few differences in which methods it uses in which class.

2) Write down a sentence to describe each class.
  -The CartEntry class is responsible for creating CartEntry objects which know a unit's price and quantity.
  -The ShoppingCart is in charge of knowing a list of all of the entries of a consumer's cart.
  -In the Order class, the price of all of the entries is calculated to a sum that accounts for sales tax.

3) How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  The ShoppingCart class contains many instances of CartEntry, all contained inside of an array, the @entries instance variable.
  Then, the Order class consists of one instance of the ShoppingCart class, which is seen in the @cart instance variable.

4) What data does each class store? How (if at all) does this differ between the two implementations?
  In CartEntry, each instance stores that unit's price and quantity. In Implementation B, it also stores the price if that method is called.

  For ShoppingCart, it holds CartEntry objects. Implementation B again does a price method, which when called, will know the total sum of all of the entry's prices.

  For Order, it stores information for the price of Sales Tax, as well as an instance of ShoppingCart. Implementation A calculates the total sum here by looping through each entry in the ShoppingCart entries array. In Implementation B, Order calls the sum method already placed in ShoppingCart and adds sales tax to it for the subtotal.

5) What methods does each class have? How (if at all) does this differ between the two implementations?
  -Implementation A only has initialization methods in each class except for in the Order class, which calculates the sum with sales tax added.
  -Implementation B has a method to find the price in each class, whether it's the individual CartEntry price or the sum of the ShoppingCart.

6) Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
Does total_price directly manipulate the instance variables of other classes?
  ~In Implementation A: 
    -The only place where price calculations are happening are in the Order class. 
    -The total_price method is using the @entries instance variable from cart, and each entry's unit price and quantity. It is using them in the loop and then in multiplication.
  ~In Implementation B:
    -The logic to compute price is delegated to lower level classes. It is calling the price method in ShoppingCart to calculate the sum and then add the tax.
    -In this implementation it does not manipulate the instance variables of the other classes.
    
7) If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  I think Implementation A is easier to modify. If the quantity of items affects the price, then once you are doing price calculations in order, you can set it up in that class to modify it based of the quantity.
  In Implementation B, I think that it would be more complex. As it is currently set up (without redesigning responsibility), you would have to alter the price method in ShoppingCart based on the quantity which just seems unnecessary and not its responsibility.

8) Which implementation better adheres to the single responsibility principle?
  I'd argue Implementation A is better because it seems clear to me what each class is doing, and what it exists for. Some classes exist to store data, some exist to store lists of that data, and finally there is a class which does the computation.

9) Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
  Both implementations are creating a new instance of ShoppingCart in the Order class. There is some coupling which exists in both. Implementation A is more loosely coupled. It is only calling on ShoppingCart so that it can iterate through all of the entries, and find the sum. However, in Implementation B, the total_price method is calling a whole method from ShoppingCart as well. Then, in that price method, it is calling CartEntry's price method. The dependency there runs more deep. 