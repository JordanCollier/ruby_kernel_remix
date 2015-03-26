Ruby Kernel Remix
===========================

In this exercise, you will be re-implementing some of the functionality of some
built in Ruby objects.  Run `rspec` to run the tests. Make them pass.


Array Instructions
---------------------------

### Restrictions

 *  The class that you create must not inherit from `Array`, or mix in
    `Enumerable`.
 *  The tests expect most of the methods to return normal Ruby `Array`
    objects.  However, you can only use the `[]`, `size`, and `<<` methods on
    the array object.  Maybe you can draw some inspiration from Javascript:

        ```javascript
        // 'i++' here has the same effect as 'i += 1'
        for(var i = 0; i < array.length(); i++) {
          array[i].something();
        }
        ```

### Tips

When implementing `OurArray.new`, you can use the `block_given?` method to see
if the user gave you a block when calling the method.  The given block may be
called from inside your method definition by using the `yield` statement.

For iteration, you could use a `for` loop, or use `.times`.  Just remember, the
only methods you're allowed to call on the internal array object are `[]`,
`size`, and `<<`.
