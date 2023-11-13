# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;


# Section 2
# Create skills( id, name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    id int not null,
    name varchar(255) not null,
    description varchar(255) not null,
    tag varchar(255) not null,
    url varchar(255),
    time_commitment int,
    primary key(id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment)
VALUES
(1, 'SQL Programming', 'Ability to write and understand SQL queries', 'Skill 1', 'https://example.com/sql', 10),
(2, 'Java Development', 'Expertise in Java programming', 'Skill 2', 'https://example.com/java', 15),
(3, 'Web Design', 'Skills in creating website layouts', 'Skill 3', 'https://example.com/webdesign', 8),
(4, 'Data Analysis', 'Competency in analyzing data sets', 'Skill 4', 'https://example.com/data', 12),
(5, 'Project Management', 'Expertise in managing and leading projects', 'Skill 5', 'https://example.com/project', 20),
(6, 'Python Programming', 'Proficiency in Python for various applications', 'Skill 6', 'https://example.com/python', 10),
(7, 'Graphic Design', 'Ability to create visual concepts', 'Skill 7', 'https://example.com/graphic', 7),
(8, 'Digital Marketing', 'Skills in online marketing strategies', 'Skill 8', 'https://example.com/digital', 15);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int NOT NULL,
    last_name varchar(255) NOT NULL,
    first_name varchar(255),
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(4096),
    date_joined date NOT NULL,
    PRIMARY KEY (id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, last_name, first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES 
(1, 'Person 1', 'John', 'john.smith@email.com', 'https://linkedin.com/in/johnsmith', 'https://example.com/headshot1.jpg', 'johnsmith#1234', 'John is a software engineer.', '2023-01-01'),
(2, 'Person 2', 'Emma', 'emma.johnson@email.com', 'https://linkedin.com/in/emmajohnson', 'https://example.com/headshot2.jpg', 'emmajohnson#5678', 'Emma is a marketing specialist.', '2023-01-02'),
(3, 'Person 3', 'Alex', 'alex.williams@email.com', 'https://linkedin.com/in/alexwilliams', 'https://example.com/headshot3.jpg', 'alexwilliams#9101', 'Alex is a graphic designer.', '2023-01-03'),
(4, 'Person 4', 'Sarah', 'sarah.brown@email.com', 'https://linkedin.com/in/sarahbrown', 'https://example.com/headshot4.jpg', 'sarahbrown#1213', 'Sarah is a project manager.', '2023-01-04'),
(5, 'Person 5', 'James', 'james.davis@email.com', 'https://linkedin.com/in/jamesdavis', 'https://example.com/headshot5.jpg', 'jamesdavis#1314', 'James is an IT consultant.', '2023-01-05'),
(6, 'Person 6', 'Linda', 'linda.miller@email.com', 'https://linkedin.com/in/lindamiller', 'https://example.com/headshot6.jpg', 'lindamiller#1415', 'Linda is a business analyst.', '2023-01-06'),
(7, 'Person 7', 'Michael', 'michael.wilson@email.com', 'https://linkedin.com/in/michaelwilson', 'https://example.com/headshot7.jpg', 'michaelwilson#1516', 'Michael is a human resources manager.', '2023-01-07'),
(8, 'Person 8', 'Alice', 'alice.moore@email.com', 'https://linkedin.com/in/alicemoore', 'https://example.com/headshot8.jpg', 'alicemoore#1617', 'Alice is a digital marketer.', '2023-01-08'),
(9, 'Person 9', 'Robert', 'robert.taylor@email.com', 'https://linkedin.com/in/roberttaylor', 'https://example.com/headshot9.jpg', 'roberttaylor#1718', 'Robert is a financial analyst.', '2023-01-09'),
(10, 'Person 10', 'Emily', 'emily.anderson@email.com', 'https://linkedin.com/in/emilyanderson', 'https://example.com/headshot10.jpg', 'emilyanderson#1819', 'Emily is a web developer.', '2023-01-10');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    id int NOT NULL AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL default (current_date),
    primary key(id),
    foreign key (skills_id) references skills (id) ON DELETE CASCADE,
    foreign key (people_id) references people (id) ON DELETE CASCADE,
    unique (skills_id, people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (people_id, skills_id)
VALUES
(1, 1), (1, 3), (1, 6),
(2, 3), (2, 4), (2, 5),
(3, 1), (3, 5),
(5, 3), (5, 6),
(6, 2), (6, 3), (6, 4),
(7, 3), (7, 5), (7, 6),
(8, 1), (8, 3), (8, 5), (8, 6),
(9, 2), (9, 5), (9, 6),
(10, 1), (10, 4), (10, 5);



# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT,
    name VARCHAR(255),
    sort_priority int,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority)
VALUES 
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT NOT NULL AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people (id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles (id)ON DELETE CASCADE
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned)
VALUES 
(1, 2, '2023-11-01'),
(2, 5, '2023-11-02'),
(2, 6, '2023-11-03'),
(3, 2, '2023-11-04'),
(3, 4, '2023-11-05'),
(4, 3, '2023-11-06'),
(5, 3, '2023-11-07'),
(6, 2, '2023-11-08'),
(6, 1, '2023-11-09'),
(7, 1, '2023-11-10'),
(8, 1, '2023-11-11'),
(8, 4, '2023-11-12'),
(9, 2, '2023-11-13'),
(10, 2, '2023-11-14'), (10, 1, '2023-01-15');
