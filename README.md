# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Creating articles feature test
- Write feature test and build features to make test pass one by one.
Listing articles feature test
- List the two articles and expect both articles to be present
- Show the article title and details

Articles belongs to users
Users own articles
one user can have many articles
an article can only belong to one user
foreign key of user_id in the article table

Steps:
- Create the spec

- Hide the "New Article" button from non-signed in users
- Hide the "Edit" and "Delete" buttons from non-owners of the article
- Permit the owners to edit or delete their own articles

Do the same restrict access (controller) for delete

Comments feature
- create a branch
- spec
- building the functionality