# Working with Break, Next, and Return

## In Loops
### What is the difference between return and break? _Do you even know?_
Both return and break 'stop' the method in some way. Return specifies what the return of the method is going to be (that line). Break ends the loop at whatever point is specified. The operations beyond the loop still continue on the method and the method's return is whatever the implict (or explicit) return is.


### What does next do?
`next ` 'skips' a member of the loop if the condition is true.


### How would we stop a loop from continuing without exiting the method?
Use `break`.


## In Blocks
### What happens when we return within a block?
Whatever the return of the line with the `return` becomes the return of the whole block.


### What does a block return if we call break?
The block returns whatever was at the point the break was invoked.


### What does a block return if we call next?
It's the same return. Certain values meeting the `next` condition would get omitted from being looped on.


### Does ordering affect next, break, and return? If so, how?
If you break out of the loop before the return or next condition is met, neither occurs. If the `next`, `break` or `return` is conditional, the first ones with the condition met run. The outcome depends on the conditional.
