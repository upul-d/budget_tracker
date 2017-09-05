# Budget Tracker
This was my first project at CodeClan: a web app to manage a budget and log transactions.

Built using: Sinatra; Ruby; PostgreSQL; HTML5; CSS

This app first met, then exceeded the MVP specificiations.

# The MVP Requirements: 

1.  Users should be able to create new transactions & view transaction history
2.  Transactions should include a merchant name, a value, and a tag (purchase type) 
3.  The app should be able to track total expenditure and display it in a view

# Additional Features Achieved:
These focused on incorporating complete CRUD actions while applying safety constraints (e.g. deleting merchants/tags is not allowed as transactions reference them). 
The added functionality means that users can:

1.  Edit and delete transactions
2.  View transactions by 
3.  Edit merchants
4.  Edit tags
5.  Add and edit a budget
6.  View transactions by tag

# Setup instructions:

After cloning/downloading the repository, please go to its root directory in your terminal. Then, please type the following commands:

```createdb money_cashboard```

```psql -d money_cashboard -f db/money_cashboard.sql```

```ruby app.rb```

Then, in your browser, please go to:
```http://localhost:4567/```

After exploring the app, please type ```ctrl + d``` in your terminal to quit the Sinatra server process.

You may also want to drop the database from your machine using the following terminal command:

```dropdb money_cashboard```
