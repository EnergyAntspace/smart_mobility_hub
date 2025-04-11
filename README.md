# Smart Mobility Hub

Smart Mobility Hub is a web application built with **Ruby on Rails 8** and **PostgreSQL**. It allows users to easily plan trips and book transportation services. This Minimum Viable Product (MVP) showcases core functionalities and acts as a foundation for future enhancements.

---

## Key Features

### User Authentication
- Users can **sign up**, **log in**, **log out**, and manage their profiles securely with **Devise**.

### Route Management
- Create, view, edit, and delete travel routes.
- Routes include details such as origin, destination, distance, and estimated duration.
- Automatically linked to the logged-in user.

### Booking Management
- Users can create bookings for specific routes.
- Bookings are automatically associated with the current user.

### Feedback Functionality
- Users can submit and edit reviews providing ratings and comments.
- Feedback is connected directly to user accounts.

---

## Installation and Setup

### Prerequisites
Ensure **Ruby**, **Rails**, and **PostgreSQL** are installed.

### Clone the Repository
```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd smart_mobility_hub
```

### Install Dependencies
```bash
bundle install
```

### Set Up the Database
```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

### Start the Server
```bash
bundle exec rails server
```

Visit the application at:
```
http://localhost:3000
```

---

## Application Routes

- **Home Page**: `http://localhost:3000`

**User Authentication:**
- Sign Up: `http://localhost:3000/users/sign_up`
- Sign In: `http://localhost:3000/users/sign_in`

**Routes Management:**
- List Routes: `http://localhost:3000/routes`
- New Route: `http://localhost:3000/routes/new`

**Bookings:**
- List Bookings: `http://localhost:3000/bookings`
- New Booking: `http://localhost:3000/bookings/new`

**Feedback:**
- List Feedbacks: `http://localhost:3000/feedbacks`
- New Feedback: `http://localhost:3000/feedbacks/new`

---

## Running Tests

Ensure `rspec-rails` is added under the `:development, :test` group in your `Gemfile`:

```bash
bundle install
bundle exec rails generate rspec:install
bundle exec rspec
```

---

## Deployment

### Heroku

Create a `Procfile` in your project root:

```Procfile
web: bundle exec rails server -p $PORT -e production
```

Deploy:
```bash
heroku create
git push heroku main
heroku run rails db:migrate
```

### Docker

Create a `Dockerfile`:
```Dockerfile
FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /smart_mobility_hub
COPY Gemfile /smart_mobility_hub/Gemfile
COPY Gemfile.lock /smart_mobility_hub/Gemfile.lock
RUN bundle install
COPY . /smart_mobility_hub
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
```

Create a `docker-compose.yml`:
```yaml
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
```

---

## Final Notes

### Feedback and Iteration
This MVP provides core functionality. Future improvements may include:
- External API integrations (e.g., mapping services).
- Advanced background job processing.

### Contributions
Feel free to contribute by opening issues or suggesting enhancements. Your feedback is highly valued.

---

Enjoy exploring **Smart Mobility Hub**!

