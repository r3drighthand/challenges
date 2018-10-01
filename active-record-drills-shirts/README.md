# AR Associations Drill: Shirts

## Summary
This challenge is a drill to work with Active Record associations. We'll practice breaking Active Record conventions and passing options like `:class_name`, `:foreign_key`, `:through`, and `:source` when declaring associations.

![database schema](shirts-schema.png)

*Figure 1*. Schema design for this challenge.

We'll focus on writing associations in this challenge, but let's imagine that we're building a full application that allows users to submit their own t-shirts designs, like [Threadless](https://www.threadless.com). Those designs are then available for purchase.

When our associations have been written, we'll be able to answer the following questions.

*For a Purchase ...*

1. Which user made the purchase?
2. Which shirt was purchased?

*For a Shirt ...*

1. Which user designed the shirt?
2. In which purchases was the shirt sold?
3. Which users have purchased the shirt?

*For a User ...*

1. Which shirts did the user design?
2. Which purchases were made by the user?
3. Which shirts has the user purchased?
4. In which purchases was a shirt designed by the user sold?
5. Which users have purchased shirts designed by the user?
6. Which users designed shirts purchased by the user?


### Roles and Associations
When using a model as a through model, it will be important for us to understand the roles represented by its associations.  In this challenge, our `User` model will behave in two different roles. It will be a shirt designer and a shirt purchaser. When we define associations between `User` and our other models, we'll define them based on these roles. For example, a shirt has a *designer* and also *purchasers* — both of which are really users. If we want to get to users through the `Shirt` model, do we want to get to designers or purchasers?


## Conclusion
In this challenge our goal was to write some advanced Active Record associations—in particular, defining has many through associations. We should be sure that we understand how the `:source` option works in a has many through association. When do we need to specify a source association? How can we identify the possible values for source?


[belongs_to]: http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/belongs_to
[has_many]: http://apidock.com/rails/v4.2.1/ActiveRecord/Associations/ClassMethods/has_many
[RailsGuides Associations]: http://guides.rubyonrails.org/association_basics.html
[RailsGuides belongs_to]: http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
[RailsGuides has_many]: http://guides.rubyonrails.org/association_basics.html#the-has-many-association
[RailsGuides has_many through]: http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association
[StackOverflow on source]: http://stackoverflow.com/questions/4632408/need-help-to-understand-source-option-of-has-one-has-many-through-of-rails