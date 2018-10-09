## Self-Reflection

Self 'points' to whichever object on which the method is being called. If the method was written to be called on a class, then self refers to that particular class object. If the method was designed to be called on an instance of a class, then self points to that specific instance being defined. If a second instance of the same class were created, the methods called on it would point to the latter instance.

It does not always need to be explicitly defined, but self is always present in the background and always points to whatever receiver on which a method has been called.