# Smart Mobility Hub

Smart Mobility Hub is a web application built with Rails 8 and PostgreSQL that enables users to plan trips and book transportation services. This MVP demonstrates the core functionality of the platform and serves as a foundation for further expansion.

## Key Features

- **User Authentication**  
  Users can sign up, log in, log out, and manage their profiles using Devise.

- **Route Management**  
  Users can create, view, edit, and delete routes. Each route contains details such as the origin, destination, distance, and estimated travel duration. Routes are automatically linked to the current user.

- **Booking Management**  
  Users can create bookings for their routes. Bookings are associated automatically with the user who is logged in.

- **Feedback Functionality**  
  Users can submit and edit feedback (reviews) for the service, providing a rating and comments. Feedback is connected to the user’s account.

## Installation and Setup

Follow these steps to set up and run the project locally:

1. **Clone the Repository**

   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd smart_mobility_hub
Install Dependencies

Make sure you have Ruby, Rails, and PostgreSQL installed. Then run:

bash
Copy
bundle install
Set Up the Database

Create and migrate the database by running:

bash
Copy
bundle exec rails db:create
bundle exec rails db:migrate
Start the Server

Launch the Rails server with:

bash
Copy
bundle exec rails server
Your application will be available at http://localhost:3000.

Key Routes
Home Page:
http://localhost:3000/ – The landing page with general information.

User Authentication:

Sign Up: http://localhost:3000/users/sign_up

Sign In: http://localhost:3000/users/sign_in

Routes:

List Routes: http://localhost:3000/routes

Create New Route: http://localhost:3000/routes/new

Bookings:

List Bookings: http://localhost:3000/bookings

Create Booking: http://localhost:3000/bookings/new

Feedbacks:

List Feedbacks: http://localhost:3000/feedbacks

Create Feedback: http://localhost:3000/feedbacks/new

Running Tests
If you wish to run automated tests (using RSpec), follow these steps:

Install RSpec (if not already installed):

Ensure rspec-rails is present in the Gemfile under the :development, :test group and then run:

bash
Copy
bundle install
bundle exec rails generate rspec:install
Run the tests:

bash
Copy
bundle exec rspec
Deployment (Optional)
For Heroku Deployment
Create a Procfile in the project root with the following content:

Procfile
Copy
web: bundle exec rails server -p $PORT -e production
Deploy to Heroku:

bash
Copy
heroku create
git push heroku main
heroku run rails db:migrate
For Docker Deployment
Create a Dockerfile in the project root:

dockerfile
Copy
FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /smart_mobility_hub
COPY Gemfile /smart_mobility_hub/Gemfile
COPY Gemfile.lock /smart_mobility_hub/Gemfile.lock
RUN bundle install
COPY . /smart_mobility_hub
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
Create a docker-compose.yml (if needed):

yaml
Copy
version: '3'
services:
  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: your_password
    volumes:
      - postgres_data:/var/lib/postgresql/data
  web:
    build: .
    command: bundle exec rails server -b 0.0.0.0
    volumes:
      - .:/smart_mobility_hub
    ports:
      - "3000:3000"
    depends_on:
      - db
volumes:
  postgres_data:
Final Notes
Feedback and Iteration:
This project is a minimal viable product (MVP) and serves as a foundation for future enhancements. Features such as external API integrations (e.g., mapping services) and advanced background processing can be implemented later.

Contributions:
Feel free to open issues or contribute improvements. Your feedback is welcome!

Enjoy exploring Smart Mobility Hub!
