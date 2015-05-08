# Movies To Watch: Associations

In this project, we will build a database of movies, and eventually allow users to keep track of which movies they want to watch. A movie wishlist, essentially.

I have already generated the `movies`, `actors` and `directors` resource with the following commands:

    rails g starter:resource movie title year:integer duration:integer description:text image_url director_id:integer

    rails g starter:resource actor name image_url bio:text dob

    rails g starter:resource director name image_url bio:text dob

("string" is the default datatype if you don't specify one)

and set up the project with Bootstrap using:

    rails g starter:style default

To actually create these tables, you need to:

    rake db:migrate

Next, to save you the trouble of adding a bunch of rows through `rails console`, I have included some seed data. Run this command:

    rake db:seed

This will auto-prepopulate a bunch of rows for you so that we can get down to work.

---


Suppose we wanted to display a list of actors on the movies show page. We would first need to figure out the relationship between actors and movies.

Can an actor be associated with only one movie or can it be associated with many movies? Many makes the most sense.

But then, can a movie be associated with only one actor, or can it be associated with many actors? Many makes the most sense in this case too.

This is a completely new kind of relationship: **many-to-many**.  Actors have many movies and movies have many actors. Unfortunately, our database can't handle a many-to-many relationship -we've got to break them down into multiple one-to-many relationships. In this case, we have to create a separate table that has the main job of describing the connection between one movie and one actor. A good name for this table might be `roles`. Since a role holds information about one actor and one movie, it would need to hold a foreign key for each of those tables. It should probably also contain information about the role, like a charater name. You can generate the table using:

    rails g starter:resource role actor_id:integer movie_id:integer character_name

Then uncomment the last part of `seeds.rb` and run

    rake db:seed

to populate the database with roles.

### Part 1

First, lets take care of the some general cleanup:

1. Clean up the movies views
 - Index and Show
   - Card heading: show movie title and year instead of ID
   - Show images instead of raw image URLs
   - Images should be clickable links to show pages
   - Replace director names instead of IDs
   - Display links instead of plain text for the director name
 - New and Edit
   - Replace the director_id text field with a dropdown

2. Clean up the actors views
 - Index and Show
   - Card heading: show actor name instead of ID
   - Show images instead of raw image URLs
   - Images should be clickable links to show pages

3. Clean up the directors views
 - Index and Show
   - Card heading: show director name instead of ID
   - Show images instead of raw image URLs
   - Images should be clickable links to show pages
 - Show only
   - display a list of associated movies in a Bootstrap list group
   - each movie should be a clickable link

4. Clean up the roles views
 - Index and Show
   - Card heading: show character name instead of ID
   - Replace movie_id with a clickable link to a movie's show page
   - Replace actor_id with a clickable link to an actor's show page
 - New and Edit
   - Replace the actor_id and movie_id text fields with dropdowns

### Part 2

1. On the actors show page:
 - Display a list of associated roles and movies in a Bootstrap list group
 - Create clickable links for each role and movie

2. On the movies show page:
 - Display a list of associated actors and roles in a Bootstrap list group
 - Create clickable links for each actors and role

### Part 3

1. Create an instance method for an `actor` object called `.movies` that returns a list of associated movies
2. Create an instance method for a `movie` object called `.actors` that returns a list of associated actors




