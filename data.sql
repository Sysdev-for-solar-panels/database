CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  status VARCHAR(20) NOT NULL DEFAULT 'NEW',
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE project_parts (
  id SERIAL PRIMARY KEY,
  project_id INTEGER NOT NULL REFERENCES projects(id),
  part_name VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL,
  storage_location VARCHAR(20) NOT NULL,
  CONSTRAINT unique_part_location UNIQUE (project_id, storage_location)
);

CREATE TABLE project_logs (
  id SERIAL PRIMARY KEY,
  project_id INTEGER NOT NULL REFERENCES projects(id),
  status VARCHAR(20) NOT NULL,
  log_date DATE NOT NULL,
  description VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  order_date DATE NOT NULL,
  part_name VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL,
  supplier VARCHAR(50) NOT NULL
);

CREATE TABLE inventory (
  id SERIAL PRIMARY KEY,
  part_name VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL,
  storage_location VARCHAR(20) NOT NULL,
  CONSTRAINT unique_location UNIQUE (part_name, storage_location)
);