##Structure of Database##

**[User]**
  id: int
  name: text
  email: text
  role: text

**[projects]**
  id: int
  name: text 
  start_date: date
  end_date: date
  status: text
  created_at: timestamp
  updated_at: timestamp

**[project_parts]**
  id: int
  project_id: int
  part_name: text
  quantity: int
  storage_location: text

**[project_logs]**
  id: int
  project_id: int
  status: text
  log_date: date
  description: text
  created_at: timestamp
  updated_at: timestamp

**[orders]**
  id: int
  order_date: date
  part_name: text
  quantity: int
  supplier: text
  
**[inventory]**
  id: int
  part_name: text
  quantity: int
  storage_location: varchar
